-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.jsutils.printPathArray
local v1 = script.Parent.Parent.Parent
require(v1.LuauPolyfill)
return {
	["printPathArray"] = function(p2) -- name: printPathArray
		local v3 = {}
		for v4 = 1, #p2 do
			local v5 = p2[v4]
			v3[v4] = typeof(v5) == "number" and "[" .. tostring(v5) .. "]" or "." .. v5
		end
		return table.concat(v3, "")
	end
}