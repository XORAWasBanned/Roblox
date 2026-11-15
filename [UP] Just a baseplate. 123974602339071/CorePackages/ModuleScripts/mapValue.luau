-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.jsutils.mapValue
require(script.Parent.ObjMap)
return {
	["mapValue"] = function(p1, p2) -- name: mapValue
		local v3 = {}
		for v4, v5 in pairs(p1) do
			v3[v4] = p2(v5, v4)
		end
		return v3
	end
}