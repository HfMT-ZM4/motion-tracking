
#define NAME "o.cgal.delaunay"
#define DESCRIPTION ""
#define AUTHORS "Rama Gottfried"
#define COPYRIGHT_YEARS "2019"

//#include "delaunay_proc.hpp"

#include <CGAL/Exact_predicates_inexact_constructions_kernel.h>
#include <CGAL/Delaunay_triangulation_3.h>
#include <CGAL/Delaunay_triangulation_cell_base_3.h>
#include <CGAL/Triangulation_vertex_base_with_info_3.h>
#include <CGAL/Polyhedron_3.h>
#include <CGAL/Polygon_mesh_processing/measure.h>
#include <CGAL/linear_least_squares_fitting_3.h>

#include "ext.h"
#include "ext_obex.h"
#include "ext_obex_util.h"
#include "ext_critical.h"

#include "osc.h"
#include "osc_mem.h"
#include "osc_atom_u.h"
#include "osc_error.h"
#include "omax_util.h"
#include "omax_doc.h"
#include "omax_dict.h"
#include "osc_bundle_iterator_s.h"
#include "osc_message_iterator_s.h"

#include "o.h"


typedef CGAL::Exact_predicates_inexact_constructions_kernel         K;
typedef CGAL::Triangulation_vertex_base_with_info_3<unsigned, K>    Vb;
typedef CGAL::Delaunay_triangulation_cell_base_3<K>                 Cb;
typedef CGAL::Triangulation_data_structure_3<Vb, Cb>                Tds;
typedef CGAL::Delaunay_triangulation_3<K, Tds, CGAL::Fast_location> Delaunay; //Use the Fast_location tag. Default or Compact_location works too.
typedef Delaunay::Point                                             Point_3id;
typedef CGAL::Polyhedron_3<K>                                       Polyhedron_3;


t_class *ocgal_delaunay_class;

typedef struct _ocgal_delaunay
{
    t_object ob;

    void * osc_outlet;
    t_critical lock;
    
} t_ocgal_delaunay;


void delaunay_proc( std::vector<double> _x, std::vector<double> _y, std::vector<double> _z, t_osc_bndl_s ** bndl_s )
{
    
    std::vector< std::pair<Point_3id,unsigned> > points;
    
    if( _x.size() == _y.size() && _x.size() == _z.size() )
    {
        for( size_t i = 0; i < _x.size(); ++i )
        {
            points.emplace_back(Point_3id(_x[i], _y[i], _z[i]), i);
        }
    }
    

    Delaunay T(points.begin(), points.end());
    
    
    Polyhedron_3 poly;
    
    t_osc_msg_u * m_del_x = osc_message_u_allocWithAddress((char *)"/delaunay/x");
    t_osc_msg_u * m_del_y = osc_message_u_allocWithAddress((char *)"/delaunay/y");
    t_osc_msg_u * m_del_z = osc_message_u_allocWithAddress((char *)"/delaunay/z");
    t_osc_msg_u * m_del_id = osc_message_u_allocWithAddress((char *)"/delaunay/id");
    t_osc_msg_u * m_del_vol = osc_message_u_allocWithAddress((char *)"/delaunay/volume");

    
    for( auto c : T.finite_cell_handles() )
    {
        
//        std::cout << "tri:" << std::endl;
        for( int i = 0; i < 4; ++i )
        {
            auto v = c->vertex(i);
        //    std::cout << i << " " << v->point() << " (" << v->info() << ") " << std::endl;
            osc_message_u_appendDouble(m_del_x, v->point().x() );
            osc_message_u_appendDouble(m_del_y, v->point().y() );
            osc_message_u_appendDouble(m_del_z, v->point().z() );
            osc_message_u_appendInt32(m_del_id, v->info() );

        }
        
        poly.make_tetrahedron(c->vertex(0)->point(), c->vertex(1)->point(), c->vertex(2)->point(), c->vertex(3)->point());
        
    }
    
    
  /*
    if (!CGAL::is_triangle_mesh(poly)){
        std::cout << "Input geometry is not triangulated." << std::endl;
    }
    
    if( poly.is_closed() )
        std::cout << "true" << std::endl;
    else
        std::cout << "false" << std::endl;
    
   */
    
    //std::cout << "volume " << CGAL::Polygon_mesh_processing::volume(poly) << std::endl;
    
    osc_message_u_appendDouble(m_del_vol, CGAL::Polygon_mesh_processing::volume(poly) );

    
//std::cout << "area " << CGAL::Polygon_mesh_processing::area(poly);
//std::cout << " volume " << CGAL::Polygon_mesh_processing::volume(poly);
//std::cout << " centroid " << CGAL::Polygon_mesh_processing::centroid(poly);
 
        
    osc_bundle_s_appendMessage_b(bndl_s, osc_message_u_serialize(m_del_x));
    osc_bundle_s_appendMessage_b(bndl_s, osc_message_u_serialize(m_del_y));
    osc_bundle_s_appendMessage_b(bndl_s, osc_message_u_serialize(m_del_z));
    osc_bundle_s_appendMessage_b(bndl_s, osc_message_u_serialize(m_del_id));
    osc_bundle_s_appendMessage_b(bndl_s, osc_message_u_serialize(m_del_vol));

    
    osc_message_u_free(m_del_x);
    osc_message_u_free(m_del_y);
    osc_message_u_free(m_del_z);
    osc_message_u_free(m_del_id);
    osc_message_u_free(m_del_vol);

}

void ocgal_delaunay_FullPacket(t_ocgal_delaunay *x, t_symbol *s, long argc, t_atom *argv)
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

    long copylen = len;
    char *copyptr = (char *)osc_mem_alloc(len);
    memcpy(copyptr, ptr, len);
    t_osc_bndl_s *s_bndl = osc_bundle_s_alloc(copylen, copyptr);
    
    delaunay_proc(_x, _y, _z, &s_bndl);
    
    omax_util_outletOSC(x->osc_outlet, osc_bundle_s_getLen(s_bndl), osc_bundle_s_getPtr(s_bndl));
    
    if( s_bndl )
        osc_bundle_s_deepFree(s_bndl);
        
}




void ocgal_delaunay_free(t_ocgal_delaunay *x)
{

}

void *ocgal_delaunay_new(t_symbol* s, short argc, t_atom* argv)
{
    t_ocgal_delaunay *x = (t_ocgal_delaunay *)object_alloc(ocgal_delaunay_class);
    if(x)
    {
        
        x->osc_outlet = outlet_new((t_object *)x, "FullPacket");
    
        critical_new( &x->lock );

    }
    return (void *)x;
}

BEGIN_USING_C_LINKAGE
int C74_EXPORT main(void)
{
    
    t_class *c = class_new("o.cgal.delaunay", (method)ocgal_delaunay_new, (method)ocgal_delaunay_free, sizeof(t_ocgal_delaunay), 0L, A_GIMME, 0);
    
    class_addmethod(c, (method)ocgal_delaunay_FullPacket,  "FullPacket",    A_GIMME,    0);

    class_register(CLASS_BOX, c);
    ocgal_delaunay_class = c;
    
    post("%s by %s.", NAME, AUTHORS);
    post("Copyright (c) " COPYRIGHT_YEARS " Unversity of Music and Theater Hamburg.  All rights reserved.");
}
END_USING_C_LINKAGE
