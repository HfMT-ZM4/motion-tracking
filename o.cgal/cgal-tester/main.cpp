

#include <CGAL/Exact_predicates_inexact_constructions_kernel.h>

#include <CGAL/Delaunay_triangulation_3.h>
#include <CGAL/Delaunay_triangulation_cell_base_3.h>
#include <CGAL/Triangulation_vertex_base_with_info_3.h>

#include <CGAL/Polyhedron_3.h>

#include <CGAL/Polygon_mesh_processing/measure.h>
#include <CGAL/linear_least_squares_fitting_3.h>
#include <CGAL/convex_hull_3.h>


typedef CGAL::Exact_predicates_inexact_constructions_kernel         K;
typedef CGAL::Triangulation_vertex_base_with_info_3<unsigned, K>    Vb;
typedef CGAL::Delaunay_triangulation_cell_base_3<K>                 Cb;
typedef CGAL::Triangulation_data_structure_3<Vb, Cb>                Tds;

//Use the Fast_location tag. Default or Compact_location works too.
typedef CGAL::Delaunay_triangulation_3<K, Tds, CGAL::Fast_location> Delaunay;
typedef Delaunay::Point                                             dPoint;
typedef CGAL::Polyhedron_3<K>                     Polyhedron_3;


int main()
{
    
    std::vector< std::pair<dPoint,unsigned> > points;
    points.push_back( std::make_pair(dPoint(0,0,0),0) );
    points.push_back( std::make_pair(dPoint(1,0,0),1) );
    points.push_back( std::make_pair(dPoint(0,1,0),2) );
    points.push_back( std::make_pair(dPoint(0,0,1),3) );
 //   points.push_back( std::make_pair(dPoint(0,0,0),4) );

    points.push_back( std::make_pair(dPoint(2,2,2),4) );
    points.push_back( std::make_pair(dPoint(-1,0,1),5) );
    points.push_back( std::make_pair(dPoint(-10,0,10),6) );
    points.push_back( std::make_pair(dPoint(0.5,0.5,.5),7) );

    Delaunay T( points.begin(),points.end() );
    
    
    Polyhedron_3 poly, hull;
    
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
        return EXIT_FAILURE;
    }
    
    
    if( poly.is_closed() )
        std::cout << "true" << std::endl;
    else
        std::cout << "false" << std::endl;
    
    std::cout << "volume " << CGAL::Polygon_mesh_processing::volume(poly) << std::endl;
    
    // check that the info was correctly set.
    /*
    for (Delaunay::Vertex_handle v : T.finite_vertex_handles())
    {
        
        if( points[ v->info() ].first != v->point() ){
            std::cerr << "Error different info" << std::endl;
            exit(EXIT_FAILURE);
        }
    }
    */
    std::cout << "OK" << std::endl;
    return 0;
}
