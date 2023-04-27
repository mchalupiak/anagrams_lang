#! /usr/bin/julia

function completeAnagrams(start, ending)
    if length(ending) > 0
        for i in 2:length(ending)
			completeAnagrams(start * ending[i-1], ending[1:i-2] * ending[i:end])
        end
		completeAnagrams(start * ending[end], ending[1:end-1])
    #map(x -> completeAnagrams(start * x, replace(ending, x => "", count=1)), collect(ending))
    else
        #println(start)
    end
end
completeAnagrams("", ARGS[1])
