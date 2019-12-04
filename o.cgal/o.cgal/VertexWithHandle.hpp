#pragma once

#include <CGAL/Delaunay_triangulation_cell_base_3.h>
#include <CGAL/Triangulation_vertex_base_3.h>
#include <CGAL/Triangulation_cell_base_3.h>

template < class GT, class Vb = CGAL::Triangulation_vertex_base_3<GT> >
class VertexWithHandle : public Vb
{
    
public:
  typedef typename Vb::Vertex_handle  _Vertex_handle;
  typedef typename Vb::Cell_handle    _Cell_handle;
  typedef typename Vb::Point          _Point;
    
  template < class TDS2 >
  struct Rebind_TDS {
    typedef typename Vb::template Rebind_TDS<TDS2>::Other   Vb2;
    typedef VertexWithHandle<GT, Vb2>                       Other;
  };
    
  VertexWithHandle() {}
  VertexWithHandle(const _Point& p) : Vb(p) {}
  VertexWithHandle(const _Point& p, _Cell_handle c) : Vb(p, c) {}
  _Vertex_handle   vh;
  _Cell_handle     ch;
};

