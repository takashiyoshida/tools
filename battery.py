#!/usr/bin/env python
# coding=UTF-8
#
# This is Python script that returns battery information from `ioreg`.
# The code was stolen from Steve Losh's blog:
# <http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/>
#
# I separated Steve's script into two parts:
# battery.py - Returns battery information
# prompt-color.py - Adjusts prompt color based on the battery level received 
#   from battery.py script.
#
# This script works on Mac OS X only.
#

import math, subprocess

def battery():
	process = subprocess.Popen(["ioreg", "-rc", "AppleSmartBattery"], stdout=subprocess.PIPE)
	return process.communicate()[0]

def get_battery_info(battery, info):
	data = [l for l in battery.splitlines() if info in l][0]
	return data.rpartition('=')[-1].strip()

def get_battery_capacities():
	batt = battery()
	max_capacity = get_battery_info(batt, 'MaxCapacity')
	cur_capacity = get_battery_info(batt, 'CurrentCapacity')
	
	return float(max_capacity), float(cur_capacity)

if __name__ == '__main__':
	(max_capacity, cur_capacity) = get_battery_capacities()
