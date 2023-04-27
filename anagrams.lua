#! /usr/bin/luajit

function completeAnagrams(start, ending)
    if (string.len(ending) > 0) then
        for i = 2,string.len(ending) do
            completeAnagrams(start .. string.sub(ending, i-1, i-1), string.sub(ending, 1, i-2) .. string.sub(ending, i, string.len(ending)))
        end
        completeAnagrams(start .. string.sub(ending, -1, -1), string.sub(ending, 1, -2))
    else
--        print(start)
    end
end

completeAnagrams("", arg[1])
