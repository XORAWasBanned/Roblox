-- Path: CorePackages.Packages._Index.Dash.Dash.collect
local v1 = script.Parent
require(v1.Types)
return function(p2, p3) -- name: collect
	local v4 = {}
	for v5, v6 in p2 do
		local v7, v8 = p3(v5, v6)
		if v7 == nil then
			continue
		end
		v4[v7] = v8
	end
	return v4
end