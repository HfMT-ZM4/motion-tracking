#pragma once

#include "osc.h"
#include "osc_mem.h"
#include "osc_atom_u.h"
#include "osc_error.h"
#include "omax_util.h"
#include "omax_doc.h"
#include "omax_dict.h"
#include "osc_bundle_iterator_s.h"
#include "osc_message_iterator_s.h"

#include <string>
#include <vector>
#include <numeric>



void delaunay_proc( std::vector<double> _x, std::vector<double> _y, std::vector<double> _z );
