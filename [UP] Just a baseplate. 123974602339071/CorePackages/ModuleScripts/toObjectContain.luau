-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.TestMatchers.toObjectContain
local v1 = script.Parent.Parent.Parent
local v_u_2 = require(v1.LuauPolyfill).util.inspect
local v_u_3 = require(script.Parent.Parent.luaUtils.deepContains)
return function(p4, p5) -- name: toObjectContain
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v6 = v_u_3(p4, p5)
	return {
		["pass"] = v6,
		["message"] = v6 and "" or "received tbl: " .. v_u_2(p5) .. " expected item to be in table: " .. v_u_2(p4)
	}
end