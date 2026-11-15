-- Path: CorePackages.Packages._Index.Dash.Dash.filter
local v1 = script.Parent
require(v1.Types)
return function(p2, p3) -- name: filter
	local v4 = {}
	for v5, v6 in p2 do
		if not p3(v6, v5) then
			continue
		end
		table.insert(v4, v6)
	end
	return v4
end