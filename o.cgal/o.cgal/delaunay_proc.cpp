#include "delaunay_proc.hpp"

#include <CGAL/Exact_predicates_inexact_constructions_kernel.h>

#include <CGAL/Delaunay_triangulation_3.h>
#include <CGAL/Delaunay_triangulation_cell_base_3.h>
#include <CGAL/Triangulation_vertex_base_with_info_3.h>

#include <CGAL/Polyhedron_3.h>

#include <CGAL/Polygon_mesh_processing/measure.h>
#include <CGAL/linear_least_squares_fitting_3.h>


typedef CGAL::Exact_predicates_inexact_constructions_kernel         K;
typedef CGAL::Triangulation_vertex_base_with_info_3<unsigned, K>    Vb;
typedef CGAL::Delaunay_triangulation_cell_base_3<K>                 Cb;
typedef CGAL::Triangulation_data_structure_3<Vb, Cb>                Tds;

//Use the Fast_location tag. Default or Compact_location works too.
typedef CGAL::Delaunay_triangulation_3<K, Tds, CGAL::Fast_location> Delaunay;
typedef Delaunay::Point                                             Point_3id;

typedef CGAL::Polyhedron_3<K>                                       Polyhedron_3;



void delaunay_proc( std::vector<double> _x, std::vector<double> _y, std::vector<double> _z )
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
        
    for( auto c : T.finite_cell_handles() )
    {
        
        std::cout << "tri:" << std::endl;
        for( int i = 0; i < 4; ++i )
        {
            auto v = c->vertex(i);
            std::cout << i << " " << v->point() << " (" << v->info() << ") " << std::endl;
        }
        
        poly.make_tetrahedron(c->vertex(0)->point(), c->vertex(1)->point(), c->vertex(2)->point(), c->vertex(3)->point());
        
    }
    
    if (!CGAL::is_triangle_mesh(poly)){
        std::cout << "Input geometry is not triangulated." << std::endl;
    }
    
    
    if( poly.is_closed() )
        std::cout << "true" << std::endl;
    else
        std::cout << "false" << std::endl;
    
    std::cout << "volume " << CGAL::Polygon_mesh_processing::volume(poly) << std::endl;
    
    
    
//std::cout << "area " << CGAL::Polygon_mesh_processing::area(poly);
//std::cout << " volume " << CGAL::Polygon_mesh_processing::volume(poly);
//std::cout << " centroid " << CGAL::Polygon_mesh_processing::centroid(poly);
    post("input size %ld triangulated size %ld", points.size(), T.number_of_vertices() );
    
    for( auto p : T.finite_vertex_handles() )
    {
        std::cout <<  p->info() << std::endl;
    }
    
}
