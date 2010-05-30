#!/usr/bin/env python
# coding=UTF-8

import math, subprocess

def get_battery_info():
	p = subprocess.Popen(["ioreg", "-rc", "AppleSmartBattery"], stdout=subprocess.PIPE)
	return p.communicate()[0]
	
def get_battery_level(info, mode):
	foo = [l for l in info.splitlines() if mode in l][0]
	return float(foo.rpartition('=')[-1].strip())

battery_info = get_battery_info()

b_max = get_battery_level(battery_info, 'MaxCapacity')
b_cur = get_battery_level(battery_info, 'CurrentCapacity')

charge = b_cur / b_max
#print charge
charge_threshold = int(math.ceil(10 * charge))

total_slots, slots = 10, []
filled = int(math.ceil(charge_threshold * (total_slots / 10.0))) * u'+'
empty = (total_slots - len(filled)) * u'-'

#out = (filled + empty).encode('utf-8')

import sys

color_green = '%{\x1b[32m%}'
color_yellow = '%{\x1b[1;33m%}'
color_red = '%{\x1b[31m%}'
color_reset = '%{\x1b[00m%}'
#print filled
color_out = (
	color_green if len(filled) > 6
	else color_yellow if len(filled) > 5
	else color_red
)
#print color_out
#out = color_out + out + color_reset
#sys.stdout.write(out)
sys.stdout.write(color_out)