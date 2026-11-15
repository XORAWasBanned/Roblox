-- Path: CorePackages.Packages._Index.Dash.Dash.copy
local v1 = script.Parent
require(v1.Types)
return function(p2) -- name: copy
	return table.clone(p2)
end