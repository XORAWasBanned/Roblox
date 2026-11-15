-- Path: CorePackages.Packages._Index.Dash.Dash.collectSet
local v1 = script.Parent
require(v1.Types)
return function(p2, p3) -- name: collectSet
	local v4 = {}
	for v5, v7 in p2 do
		if p3 ~= nil then
			local v7 = p3(v5, v7)
		end
		if v7 == nil then
			continue
		end
		v4[v7] = true
	end
	return v4
end