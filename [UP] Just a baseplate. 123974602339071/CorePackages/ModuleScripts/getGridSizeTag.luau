-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.getGridSizeTag
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Components.Types)
return function(p2) -- name: getGridSizeTag
	if typeof(p2) == "number" then
		return ("col-%*"):format(p2)
	end
	local v3 = {}
	for v4, v5 in p2 do
		if typeof(v5) ~= "number" then
			continue
		end
		local v6 = ("%*-col-%*"):format(v4, v5)
		table.insert(v3, v6)
	end
	return table.concat(v3, " ")
end