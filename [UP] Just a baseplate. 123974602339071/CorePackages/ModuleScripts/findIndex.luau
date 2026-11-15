-- Path: CorePackages.Packages._Index.Collections.Collections.Array.findIndex
local v1 = script.Parent.Parent.Parent
require(v1.ES7Types)
return function(p2, p3)
	for v4 = 1, #p2 do
		if not p3(p2[v4], v4, p2) then
			continue
		end
		return v4
	end
	return -1
end