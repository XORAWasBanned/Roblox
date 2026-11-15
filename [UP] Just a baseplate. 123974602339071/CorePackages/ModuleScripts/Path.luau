-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.jsutils.Path
local v1 = script.Parent.Parent.Parent
local v_u_2 = require(v1.LuauPolyfill).Array
return {
	["addPath"] = function(p3, p4, p5) -- name: addPath
		return {
			["prev"] = p3,
			["key"] = p4,
			["typename"] = p5
		}
	end,
	["pathToArray"] = function(p6) -- name: pathToArray
		-- upvalues: (copy) v_u_2
		local v7 = {}
		while p6 do
			local v8 = p6.key
			table.insert(v7, v8)
			p6 = p6.prev
		end
		return v_u_2.reverse(v7)
	end
}