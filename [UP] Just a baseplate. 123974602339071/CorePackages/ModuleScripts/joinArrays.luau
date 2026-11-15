-- Path: CorePackages.Packages._Index.Dash.Dash.joinArrays
local v1 = script.Parent
require(v1.Types)
return function(...) -- name: joinArrays
	local v2 = {}
	for _, v3 in { ... } do
		if not v3 then
			continue
		end
		table.move(v3, 1, #v3, #v2 + 1, v2)
	end
	return v2
end