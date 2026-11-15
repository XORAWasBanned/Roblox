-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.TestMatchers.toEqual
local v_u_1 = require(script.Parent.Parent.luaUtils.deepEqual)
return function(p2, p3) -- name: toEqual
	-- upvalues: (copy) v_u_1
	local v4, v5 = v_u_1(p2, p3)
	local v6
	if v4 then
		v6 = ("expected: not %s\nreceived:     %s"):format(tostring(p3), (tostring(p2)))
	else
		v6 = v5:gsub("{1}", "received"):gsub("{2}", "expected")
	end
	return {
		["pass"] = v4,
		["message"] = v6
	}
end