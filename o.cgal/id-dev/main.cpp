
#include <iostream>
#include <CGAL/Simple_cartesian.h>
#include <CGAL/Exact_predicates_inexact_constructions_kernel.h>

#include <CGAL/AABB_tree.h>
#include <CGAL/AABB_traits.h>
#include <CGAL/Polyhedron_3.h>
#include <CGAL/AABB_face_graph_triangle_primitive.h>
#include <CGAL/convex_hull_3.h>

//typedef CGAL::Simple_cartesian<double> K;
typedef CGAL::Exact_predicates_inexact_constructions_kernel         K;

typedef K::FT FT;
typedef K::Point_3 _Point;
typedef K::Segment_3 Segment;
typedef CGAL::Polyhedron_3<K> Polyhedron;
typedef CGAL::AABB_face_graph_triangle_primitive<Polyhedron> Primitive;
typedef CGAL::AABB_traits<K, Primitive> Traits;
typedef CGAL::AABB_tree<Traits> Tree;
typedef Tree::Point_and_primitive_id _Point_and_primitive_id;
int main()
{
    _Point p(1.0, 0.0, 0.0);
    _Point q(0.0, 1.0, 0.0);
    _Point r(0.0, 0.0, 1.0);
    _Point s(0.0, 0.0, 0.0);
    
    std::vector<_Point> _Points;
    _Points.push_back(_Point(1.0, 0.0, 0.0));
    _Points.push_back(_Point(0.0, 1.0, 0.0));
    _Points.push_back(_Point(0.0, 0.0, 1.));
    _Points.push_back(_Point(0.0, 0.0, 0.0));
        
    
    Polyhedron polyhedron;
    //polyhedron.make_tetrahedron(p, q, r, s);
    CGAL::convex_hull_3( _Points.begin(), _Points.end(), polyhedron );
    
    
    // constructs AABB tree and computes internal KD-tree
    // data structure to accelerate distance queries
    Tree tree(faces(polyhedron).first, faces(polyhedron).second, polyhedron);
    tree.accelerate_distance_queries();
    
    // query _Point
    _Point query(0.5, 0.5, 0.1);
    
    // computes squared distance from query
    FT sqd = tree.squared_distance(query);
    std::cout << "squared distance: " << sqd << std::endl;
    
    // computes closest _Point
    _Point closest = tree.closest_point(query);
    std::cout << "closest _Point: " << closest << std::endl;
    
    // computes closest _Point and primitive id
    _Point_and_primitive_id pp = tree.closest_point_and_primitive(query);
    _Point closest_point = pp.first;
    Polyhedron::Face_handle f = pp.second; // closest primitive id
    
    std::cout << "closest _Point: " << closest_point << std::endl;
    std::cout << "closest triangle: ( "
    << f->halfedge()->vertex()->point() << " , "
    << f->halfedge()->next()->vertex()->point() << " , "
    << f->halfedge()->next()->next()->vertex()->point()
    << " )" << std::endl;
    return EXIT_SUCCESS;
}

/*

#include <iostream>
#include <list>
#include <CGAL/Simple_cartesian.h>
#include <CGAL/AABB_tree.h>
#include <CGAL/AABB_traits.h>
#include <CGAL/AABB_triangle_primitive.h>
typedef CGAL::Simple_cartesian<double> K;
typedef K::FT FT;
typedef K::Ray_3 Ray;
typedef K::Line_3 Line;
typedef K::Point_3 _Point;
typedef K::Triangle_3 Triangle;
typedef std::list<Triangle>::iterator Iterator;
typedef CGAL::AABB_triangle_primitive<K, Iterator> Primitive;
typedef CGAL::AABB_traits<K, Primitive> AABB_triangle_traits;
typedef CGAL::AABB_tree<AABB_triangle_traits> Tree;
int main()
{
    _Point a(1.0, 0.0, 0.0);
    _Point b(0.0, 1.0, 0.0);
    _Point c(0.0, 0.0, 1.0);
    _Point d(0.0, 0.0, 0.0);
    std::list<Triangle> triangles;
    triangles.push_back(Triangle(a,b,c));
    triangles.push_back(Triangle(a,b,d));
    triangles.push_back(Triangle(a,d,c));
    // constructs AABB tree
    Tree tree(triangles.begin(),triangles.end());
    // counts #intersections
    Ray ray_query(_Point(0.5,0.5,0.5),_Point(0.75,0.75,0.75));
    std::cout << tree.number_of_intersected_primitives(ray_query)
        << " intersections(s) with ray query" << std::endl;
    // compute closest _Point and squared distance
    _Point point_query(0.5, 0.5, 0.5);
    _Point closest_point = tree.closest_point(point_query);
    std::cerr << "closest _Point is: " << closest_point << std::endl;
    FT sqd = tree.squared_distance(point_query);
    std::cout << "squared distance: " << sqd << std::endl;
    return EXIT_SUCCESS;
}
*/
