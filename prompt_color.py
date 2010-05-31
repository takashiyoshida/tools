#!/usr/bin/env python
# coding=UTF-8

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
		else color_yellow if filled > 5
		else color_red
	)


if __name__ == '__main__':
	(max_capacity, cur_capacity) = get_battery_capacities()

	charge = get_charge(cur_capacity, max_capacity)
	filled = get_filled(charge)
	color_code = get_color_code(filled)
	
	sys.stdout.write(color_code)
