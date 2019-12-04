#pragma once

#include <CGAL/Exact_predicates_inexact_constructions_kernel.h>
#include <CGAL/Polyhedron_3.h>
#include <CGAL/Surface_mesh.h>
#include <CGAL/convex_hull_3.h>

#include <CGAL/Delaunay_triangulation_3.h>
#include <CGAL/point_generators_3.h>
#include <vector>
#include <cassert>

typedef CGAL::Exact_predicates_inexact_constructions_kernel		K;
typedef CGAL::Polyhedron_3<K>									Polyhedron_3;
typedef K::Point_3												Point_3;
typedef CGAL::Surface_mesh<Point_3>								Surface_mesh;

typedef CGAL::Delaunay_triangulation_3<K, CGAL::Fast_location>  Delaunay;
typedef Delaunay::Point											Point;
typedef Delaunay::Cell_handle									Cell_handle;
typedef Delaunay::Facet											Facet;
