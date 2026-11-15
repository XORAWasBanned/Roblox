-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.jsutils.toObjMap
require(script.Parent.ObjMap)
return {
	["toObjMap"] = function(p1) -- name: toObjMap
		local v2 = {}
		for v3, v4 in pairs(p1) do
			v2[v3] = v4
		end
		return v2
	end
}