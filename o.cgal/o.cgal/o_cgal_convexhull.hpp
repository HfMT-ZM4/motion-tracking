#pragma once

/*
int main(int argc, char* argv[])
{
  std::ifstream in( (argc>1)? argv[1] : "data/cube.xyz");
  std::vector<Point_3> points;
  Point_3 p;
  while(in >> p){
    points.push_back(p);
  }
  // define polyhedron to hold convex hull
  Polyhedron_3 poly;
  
  // compute convex hull of non-collinear points
  CGAL::convex_hull_3(points.begin(), points.end(), poly);
  std::cout << "The convex hull contains " << poly.size_of_vertices() << " vertices" << std::endl;
  
  Surface_mesh sm;
  CGAL::convex_hull_3(points.begin(), points.end(), sm);
  std::cout << "The convex hull contains " << num_vertices(sm) << " vertices" << std::endl;
  return 0;
}
*/
