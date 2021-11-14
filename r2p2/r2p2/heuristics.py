""" This module implements several heuristics.

They assume the Node class provided with this simulator is being used.

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.
This program is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
You should have received a copy of the GNU General Public License along with
this program. If not, see <http://www.gnu.org/licenses/>.
"""

__author__ = "Mario Cobos Maestre"
__authors__ = ["Mario Cobos Maestre"]
__contact__ = "mario.cobos@edu.uah.es"
__copyright__ = "Copyright 2019, UAH"
__credits__ = ["Mario Cobos Maestre"]
__date__ = "2019/03/29"
__deprecated__ = False
__email__ =  "mario.cobos@edu.uah.es"
__license__ = "GPLv3"
__maintainer__ = "Mario Cobos Maestre"
__status__ = "Development"
__version__ = "0.0.1"


import path_planning as pp
from math import sqrt

def manhattan(point,point2):
    """
        Function that performs Manhattan heuristic.
    """
    dx = abs(point.grid_point[0] - point2.grid_point[0])
    dy = abs(point.grid_point[1] - point2.grid_point[1])
	
    return dx + dy

pp.register_heuristic('manhattan', manhattan)

def naive(point, point2):
    """
        Function that performs a naive heuristic.
    """
    return 1

pp.register_heuristic('naive', naive)

def euclidean(point, point2):
    """
        Function that performs euclidean heuristic.
    """
    dx = (point.grid_point[0] - point2.grid_point[0]) ** 2
    dy = (point.grid_point[1] - point2.grid_point[1]) ** 2
	
    return sqrt(dx + dy)

pp.register_heuristic('euclidean', euclidean)

def octile(point,point2):
    """
        Function that performs octile heuristic.
    """
    dx = abs(point.grid_point[0] - point2.grid_point[0])
    dy = abs(point.grid_point[1] - point2.grid_point[1])
    D = 1
    D2 = sqrt(2)
	
    return D * (dx + dy) + (D2 - 2 * D) * min(dx, dy)
	
pp.register_heuristic('octile', octile)
