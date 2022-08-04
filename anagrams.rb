#! /usr/bin/ruby

#$anagrams = Array.new()

def completeAnagrams(start, ending)
	if ending.size() >= 1
		for i in 1..ending.size()-1 do
			completeAnagrams(start + ending[i-1], ending[0, i-1] + ending[i, ending.size()])
		end
		completeAnagrams(start + ending[(ending.size() - 1)], ending[0, ending.size() - 1])
	else
<<<<<<< HEAD
		# $anagrams.push(start + ending)
=======
	  #puts (start + ending)
#		$anagrams.push(start + ending)
>>>>>>> refs/remotes/origin/main
	end
end
=begin
def removeDups()
	for i in 0..$anagrams.size()-1 do
		currentWord = $anagrams[i]
		for j in i+1..$anagrams.size()-1 do
			if $anagrams[j] == currentWord
				$anagrams.delete_at(j)
			end
		end
	end
end
=end
completeAnagrams("", ARGV[0])
#removeDups()
#puts $anagrams
