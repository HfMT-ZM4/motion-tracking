#include <CGAL/Exact_predicates_inexact_constructions_kernel.h>

#include <CGAL/Delaunay_triangulation_3.h>
#include <CGAL/Delaunay_triangulation_cell_base_3.h>
#include <CGAL/Triangulation_vertex_base_with_info_3.h>

#include <CGAL/Polyhedron_3.h>

#include <CGAL/Polygon_mesh_processing/measure.h>
#include <CGAL/linear_least_squares_fitting_3.h>





#include <CGAL/Simple_cartesian.h>
#include <CGAL/linear_least_squares_fitting_3.h>
#include <vector>
typedef double                      FT;
typedef CGAL::Exact_predicates_inexact_constructions_kernel         K;
//typedef CGAL::Simple_cartesian<FT>  K;
typedef K::Line_3                   Line;
typedef K::Point_3                  _Point;
int main()
{
  std::vector<_Point> points;
  points.push_back(_Point(1.0,2.0,1));
  points.push_back(_Point(3.0,4.0, 0));
  points.push_back(_Point(5.0,6.0,1));
  // fit line
  Line line;
  linear_least_squares_fitting_3(points.begin(),points.end(),line,CGAL::Dimension_tag<0>());
    
    std::cout << line << " | " << line.point(0) << " | " << line.point(1) << std::endl;
  return 0;
}
