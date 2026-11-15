-- Path: CorePackages.Packages._Index.Collections.Collections.Array.find
local v1 = script.Parent.Parent.Parent
require(v1.ES7Types)
return function(p2, p3)
	for v4 = 1, #p2 do
		local v5 = p2[v4]
		if not p3(v5, v4, p2) then
			continue
		end
		return v5
	end
	return nil
end