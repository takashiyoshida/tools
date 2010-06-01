#!/usr/bin/env python
# coding=UTF-8
#
# The code was stolen from Steve Losh's blog:
# <http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/>
#
# I separated Steve's script into two parts:
# battery.py - Returns battery information
# prompt-color.py - Adjusts prompt color based on the battery level received 
#   from battery.py script.
#

import math, sys
from battery import get_battery_capacities

def get_charge(cur_capacity, max_capacity):
	return cur_capacity / max_capacity

def get_filled(charge):
	return int(math.ceil(10 * charge))

def get_color_code(filled):
	color_green = '%{\x1b[32m%}'
	color_yellow = '%{\x1b[1;33m%}'
	color_red = '%{\x1b[00m%}'
	
	return (
		color_green if filled > 6
		else color_yellow if filled > 4
		else color_red
	)

if __name__ == '__main__':
	(max_capacity, cur_capacity) = get_battery_capacities()

	charge = get_charge(cur_capacity, max_capacity)
	filled = get_filled(charge)
	color_code = get_color_code(filled)
	
	sys.stdout.write(color_code)
