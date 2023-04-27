#! /usr/bin/python

import sys

def completeAnagrams(start, end):
	if len(end) >= 1:
		for i in range(1, len(end)):
			#print(start)
			completeAnagrams(start + end[i-1], end[0:i-1] + end[i:len(end)])
		completeAnagrams(start + end[len(end)-1], end[0:len(end) - 1])

completeAnagrams("", sys.argv[1])
