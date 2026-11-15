-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.jsutils.keyMap
local v1 = script.Parent.Parent.Parent
require(v1.LuauPolyfill)
require(script.Parent.ObjMap)
return {
	["keyMap"] = function(p2, p3) -- name: keyMap
		local v4 = {}
		for _, v5 in ipairs(p2) do
			v4[p3(v5)] = v5
		end
		return v4
	end
}