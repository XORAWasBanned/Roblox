-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.TestMatchers.toArrayContains
local v1 = script.Parent.Parent
local v2 = v1.Parent
local v_u_3 = require(v2.LuauPolyfill).util.inspect
local v_u_4 = require(v1.luaUtils.arrayContains)
return function(p5, p6, p7) -- name: toArrayContains
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	local v8 = v_u_4(p5, p6, p7)
	return {
		["pass"] = v8,
		["message"] = v8 and "" or "received tbl: " .. v_u_3(p6) .. " expected item to be in table: " .. v_u_3(p5)
	}
end