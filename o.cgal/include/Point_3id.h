#pragma once

// this works, kind of but since the polyhedron also needs a point we need to figure out how to make the Polyhedron use *our* point

#include <CGAL/Point_3.h>

template <class K>
class Point_3id : public CGAL::Point_3<K>
{
public:
    int pt_index = -1;
 
    typedef CGAL::Point_3<K> Point_3;

    using Point_3::Point_3;

    Point_3id(double x, double y, double z, int idx) : Point_3(x,y,z), pt_index(idx) {}
    
};

/*
 #include <CGAL/Filtered_kernel.h>
 
 #include "Point_3id.h"
 
 
 
 template < typename FT_ >
 struct MyKernel : public CGAL::Type_equality_wrapper< MyCartesian_base<MyKernel<FT_>, CGAL::Cartesian<FT_> >, MyKernel<FT_> >
 {};
 
 typedef CGAL::Exact_predicates_inexact_constructions_kernel      K;
 typedef Point_3id<K>                                             Point_3;
 typedef CGAL::Polyhedron_3<K>                                    Polyhedron_3;
 
 
 int main()
 {
 
 std::vector< Point_3 > points;
 points.push_back( Point_3(0,0,0, 1) );
 
 points.push_back( Point_3(1,0,0, 2) );
 
 points.push_back( Point_3(0,1,0, 3) );
 points.push_back( Point_3(0,0,1, 4) );
 //   points.push_back( std::make_pair(dPoint(0,0,0),4) );
 
 points.push_back( Point_3(2,2,2, 5) );
 points.push_back( Point_3(-1,0,1, 6) );
 points.push_back( Point_3(-10,0,10, 7) );
 points.push_back( Point_3(0.5,0.5,.5, 8) );
 
 
 // define polyhedron to hold convex hull
 Polyhedron_3 hull;
 
 // compute convex hull of non-collinear points
 CGAL::convex_hull_3(points.begin(), points.end(), hull);
 
 for( auto v = hull.vertices_begin(); v != hull.vertices_end(); ++v )
 {
 std::cout << v->point() << " " << v->point() << std::endl;
 
 }
 }
 */
