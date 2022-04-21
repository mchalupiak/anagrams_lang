#! /usr/bin/python

import sys

anagrams = []

def completeAnagrams(start, end):
	if len(end) >= 1:
		for i in range(1, len(end)):
			#print(start)
			completeAnagrams(start + end[i-1], end[0:i-1] + end[i:len(end)])
		completeAnagrams(start + end[len(end)-1], end[0:len(end) - 1])
	else:
		anagrams.append(start + end)
		#print(start + end)
		#pass
'''
def removeDups():
	for i in range(len(anagrams)):
		currentWord = anagrams[i]
		for j in range(i+1, len(anagrams)):
			if anagrams[j] == currentWord:
				anagrams.remove(j)
'''
completeAnagrams("", sys.argv[1])
#removeDups()
#for i in range(len(anagrams)):
#	print(anagrams[i])
