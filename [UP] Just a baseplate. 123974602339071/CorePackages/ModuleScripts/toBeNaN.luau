-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.TestMatchers.toBeNaN
local v_u_1 = require(script.Parent.Parent.Parent.LuauPolyfill).Number
return function(p2) -- name: toBeNaN
	-- upvalues: (copy) v_u_1
	local v3 = v_u_1.isNaN(p2)
	return v3 and {
		["pass"] = v3
	} or {
		["pass"] = false,
		["message"] = nil,
		["message"] = ("expected: NaN (number), got: \"%s\" (%s) instead"):format(tostring(p2), (typeof(p2)))
	}
end