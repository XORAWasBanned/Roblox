-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.language.location
local v1 = script.Parent.Parent.Parent
local v_u_2 = require(v1.LuauPolyfill).String
require(script.Parent.source)
return {
	["getLocation"] = function(p3, p4) -- name: getLocation
		-- upvalues: (copy) v_u_2
		local v5 = { "\r\n", "\r", "\n" }
		local v6 = v_u_2.findOr(p3.body, v5)
		local v7 = p4
		local v8 = 1
		while v6 ~= nil and v6.index < v7 do
			local v9 = v6.index
			local v10 = v6.match
			local v11 = v9 + string.len(v10)
			v8 = v8 + 1
			p4 = v7 + 1 - v11
			v6 = v_u_2.findOr(p3.body, v5, v11)
		end
		return {
			["line"] = v8,
			["column"] = p4
		}
	end
}