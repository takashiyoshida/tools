#!/usr/bin/env python
# coding=UTF-8

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
