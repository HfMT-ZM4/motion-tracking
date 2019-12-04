
#define NAME "o.cgal.convexhull"
#define DESCRIPTION ""
#define AUTHORS "Rama Gottfried"
#define COPYRIGHT_YEARS "2019"

#include <CGAL/Exact_predicates_inexact_constructions_kernel.h>
#include <CGAL/Polyhedron_3.h>

#include <CGAL/convex_hull_3.h>
#include <CGAL/Polygon_mesh_processing/measure.h>
#include <CGAL/linear_least_squares_fitting_3.h>

#include <CGAL/Extreme_points_traits_adapter_3.h>
#include <boost/iterator/counting_iterator.hpp>

#include <CGAL/AABB_tree.h>
#include <CGAL/AABB_traits.h>
#include <CGAL/AABB_face_graph_triangle_primitive.h>

#include <vector>
#include <fstream>


#include "ext.h"
#include "ext_obex.h"
#include "ext_obex_util.h"
#include "ext_critical.h"

#include "osc.h"
#include "osc_atom_u.h"
#include "omax_util.h"
#include "omax_doc.h"
#include "omax_dict.h"
#include "osc_bundle_iterator_s.h"
#include "osc_message_iterator_s.h"

#include "o.h"


typedef CGAL::Exact_predicates_inexact_constructions_kernel     K;
typedef CGAL::Polyhedron_3<K>                                   Polyhedron_3;
typedef K::Point_3                                              Point_3;
typedef K::Line_3                                               Line;
typedef CGAL::AABB_face_graph_triangle_primitive<Polyhedron_3> Primitive;
typedef CGAL::AABB_traits<K, Primitive> Traits;
typedef CGAL::AABB_tree<Traits> Tree;

t_class *ocgal_convexhull_class;

typedef struct _ocgal_convexhull
{
    t_object ob;

    void * osc_outlet;
    //t_critical lock;
    
} t_ocgal_convexhull;


void hull_proc( std::vector<double>& _x, std::vector<double>& _y, std::vector<double>& _z, t_osc_bndl_u ** bndl )
{
    if( _x.size() != _y.size() || _x.size() != _z.size() )
    {
        // error here
        return;
    }
    
    std::vector< Point_3 > points;
    
    for( size_t i = 0; i < _x.size(); ++i )
    {
        points.emplace_back( _x[i], _y[i], _z[i] );
    }
    
    
    // the id is the same as dist 0.
    //t_osc_msg_u * m_id = osc_message_u_allocWithAddress((char *)"/hull/id");

    t_osc_msg_u * m_dist = osc_message_u_allocWithAddress((char *)"/hull/dist");

    t_osc_msg_u * m_vol = osc_message_u_allocWithAddress((char *)"/hull/stats/volume");

    t_osc_msg_u * m_centroid_x = osc_message_u_allocWithAddress((char *)"/hull/stats/centroid/x");
    t_osc_msg_u * m_centroid_y = osc_message_u_allocWithAddress((char *)"/hull/stats/centroid/y");
    t_osc_msg_u * m_centroid_z = osc_message_u_allocWithAddress((char *)"/hull/stats/centroid/z");
    
    t_osc_msg_u * m_line_x = osc_message_u_allocWithAddress((char *)"/hull/stats/fit/line/x");
    t_osc_msg_u * m_line_y = osc_message_u_allocWithAddress((char *)"/hull/stats/fit/line/y");
    t_osc_msg_u * m_line_z = osc_message_u_allocWithAddress((char *)"/hull/stats/fit/line/z");
    
    /*
    std::vector<std::size_t> extreme_point_indices;
    //call the function with the traits adapter for vertices
    CGAL::extreme_points_3(CGAL::make_range(boost::counting_iterator<std::size_t>(0),
                                            boost::counting_iterator<std::size_t>(points.size())),
                           std::back_inserter(extreme_point_indices),
                           CGAL::make_extreme_points_traits_adapter(CGAL::make_property_map(points)));
    //print the number of extreme vertices
    // std::cout << "Indices of points on the convex hull are:\n";
    //std::copy(extreme_point_indices.begin(), extreme_point_indices.end(), std::ostream_iterator<std::size_t>(std::cout, " "));
    
    for( auto i : extreme_point_indices )
    {
        osc_message_u_appendInt32(m_id, (int)i );
    }
    */
    
    Polyhedron_3 hull;
    CGAL::convex_hull_3(points.begin(), points.end(), hull);
    
    // constructs AABB tree and computes internal KD-tree
    // data structure to accelerate distance queries
    Tree tree( faces(hull).first, faces(hull).second, hull );
    
    if( !tree.empty() )
    {
        tree.accelerate_distance_queries();
        
        for( auto& p : points )
        {
            //double f = tree.squared_distance(p);
            osc_message_u_appendDouble(m_dist, tree.squared_distance(p) );
        }
    }
    
    if( hull.is_closed() ){
        osc_message_u_appendDouble(m_vol, CGAL::Polygon_mesh_processing::volume(hull) );
        
        auto centroid = CGAL::Polygon_mesh_processing::centroid(hull);
        osc_message_u_appendDouble(m_centroid_x, centroid.x() );
        osc_message_u_appendDouble(m_centroid_y, centroid.y() );
        osc_message_u_appendDouble(m_centroid_z, centroid.z() );

    }
        
    
    
    Line line;
    Point_3 cen;
    linear_least_squares_fitting_3( points.begin(), points.end(), line, cen, CGAL::Dimension_tag<0>() );

    osc_message_u_appendDouble(m_line_x, line.point(0).x());
    osc_message_u_appendDouble(m_line_x, line.point(1).x());
    
    osc_message_u_appendDouble(m_line_y, line.point(0).y());
    osc_message_u_appendDouble(m_line_y, line.point(1).y());
    
    osc_message_u_appendDouble(m_line_z, line.point(0).z());
    osc_message_u_appendDouble(m_line_z, line.point(1).z());
    
    //std::cout << "area " << CGAL::Polygon_mesh_processing::area(poly);
    //std::cout << " volume " << CGAL::Polygon_mesh_processing::volume(poly);
    //std::cout << " centroid " << CGAL::Polygon_mesh_processing::centroid(poly);
    
    osc_bundle_u_addMsg(*bndl, m_centroid_x);
    osc_bundle_u_addMsg(*bndl, m_centroid_y);
    osc_bundle_u_addMsg(*bndl, m_centroid_z);

    osc_bundle_u_addMsg(*bndl, m_line_x);
    osc_bundle_u_addMsg(*bndl, m_line_y);
    osc_bundle_u_addMsg(*bndl, m_line_z);
    
    osc_bundle_u_addMsg(*bndl, m_vol);
    osc_bundle_u_addMsg(*bndl, m_dist);
    
}

void ocgal_convexhull_FullPacket(t_ocgal_convexhull *x, t_symbol *s, long argc, t_atom *argv)
{
    OMAX_UTIL_GET_LEN_AND_PTR
    
    // ======================= wrap_naked_osc
    // from wrap_naked... alloca was a problem in C++
    if(ptr && len >= 8){
        if(strncmp("#bundle\0", (char *)(ptr), 8)){
            char *oldptr = (char *)ptr;
            long oldlen = len;
            len += 4 + OSC_HEADER_SIZE;
            ptr = (char *)alloca(len);
            char alloc = 0;
            osc_bundle_s_wrapMessage(oldlen, oldptr, &len, (char **)(&ptr), &alloc);
        }
    }
    
    if(len == OSC_HEADER_SIZE){
        return;
    }
    // ==========================
    
    

    std::vector<double> _x, _y, _z;
    
    auto it = osc_bndl_it_s_get(len, ptr);
    while(osc_bndl_it_s_hasNext(it))
    {
        t_osc_msg_s *m = osc_bndl_it_s_next(it);
        std::string addr = osc_message_s_getAddress(m);
        
        if( addr == "/x" )
        {
            _x.reserve( osc_message_s_getArgCount(m) );
         
            t_osc_msg_it_s *it = osc_msg_it_s_get(m);
            while(osc_msg_it_s_hasNext(it)){
                t_osc_atom_s *a = osc_msg_it_s_next(it);
                _x.emplace_back(osc_atom_s_getDouble(a));
            }
            osc_msg_it_s_destroy(it);
            
        }
        else if (  addr == "/y" )
        {
            _y.reserve( osc_message_s_getArgCount(m) );
                  
            t_osc_msg_it_s *it = osc_msg_it_s_get(m);
            while(osc_msg_it_s_hasNext(it)){
                t_osc_atom_s *a = osc_msg_it_s_next(it);
                _y.emplace_back(osc_atom_s_getDouble(a));
            }
            osc_msg_it_s_destroy(it);
        }
        else if (  addr == "/z" )
        {
            _z.reserve( osc_message_s_getArgCount(m) );
                  
            t_osc_msg_it_s *it = osc_msg_it_s_get(m);
            while(osc_msg_it_s_hasNext(it)){
                t_osc_atom_s *a = osc_msg_it_s_next(it);
                _z.emplace_back(osc_atom_s_getDouble(a));
            }
            osc_msg_it_s_destroy(it);
        }
        
    }
    osc_bndl_it_s_destroy(it);


    t_osc_bndl_u *u_bndl = osc_bundle_s_deserialize(len, ptr);
    
    hull_proc(_x, _y, _z, &u_bndl);
    
    t_osc_bndl_s *s_bndl = osc_bundle_u_serialize(u_bndl);
    
    omax_util_outletOSC(x->osc_outlet, osc_bundle_s_getLen(s_bndl), osc_bundle_s_getPtr(s_bndl));
    
    osc_bundle_s_deepFree(s_bndl);
    osc_bundle_u_free(u_bndl);
        
}




void ocgal_convexhull_free(t_ocgal_convexhull *x)
{

}

void *ocgal_convexhull_new(t_symbol* s, short argc, t_atom* argv)
{
    t_ocgal_convexhull *x = (t_ocgal_convexhull *)object_alloc(ocgal_convexhull_class);
    if(x)
    {
        
        x->osc_outlet = outlet_new((t_object *)x, "FullPacket");
    
//        critical_new( &x->lock );

    }
    return (void *)x;
}

BEGIN_USING_C_LINKAGE
int C74_EXPORT main(void)
{
    
    t_class *c = class_new("o.cgal.convexhull", (method)ocgal_convexhull_new, (method)ocgal_convexhull_free, sizeof(t_ocgal_convexhull), 0L, A_GIMME, 0);
    
    class_addmethod(c, (method)ocgal_convexhull_FullPacket,  "FullPacket",    A_GIMME,    0);

    class_register(CLASS_BOX, c);
    ocgal_convexhull_class = c;
    
    post("%s by %s.", NAME, AUTHORS);
    post("Copyright (c) " COPYRIGHT_YEARS " Unversity of Music and Theater Hamburg.  All rights reserved.");
}
END_USING_C_LINKAGE
