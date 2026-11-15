-- Path: CorePackages.Packages._Index.Dash.Dash.Symbol
local v1 = script.Parent
local v3 = require(v1.class)("Symbol", function(p2)
	return {
		["name"] = p2
	}
end)
function v3.toString(p4) -- name: toString
	return ("Symbol(%s)"):format(p4.name)
end
return v3