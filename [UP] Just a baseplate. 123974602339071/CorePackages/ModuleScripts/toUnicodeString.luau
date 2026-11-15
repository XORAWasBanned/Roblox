-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.luaUtils.toUnicodeString
local v1 = script.Parent.Parent.Parent
local v_u_2 = require(v1.LuauPolyfill).String
return function(p3)
	-- upvalues: (copy) v_u_2
	local v4 = "0000" .. string.format("%x", p3)
	return "\"\\u" .. v_u_2.slice(v4, -4):upper() .. "\""
end