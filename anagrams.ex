defmodule Mod do
  def completeAnagrams(start, ending) do
    if length(ending) > 0 do
      Enum.map(ending, fn x -> completeAnagrams(List.insert_at(start, 0, x), List.delete(ending, x)) end)
    end
  end
end
Mod.completeAnagrams('', to_charlist(List.first(System.argv)))
