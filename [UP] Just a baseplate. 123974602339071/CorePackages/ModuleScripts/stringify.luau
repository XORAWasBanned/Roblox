-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.luaUtils.stringify
local v_u_1 = game:GetService("HttpService")
local v_u_2 = v_u_1:JSONEncode((require(script.Parent.null)))
return function(p3) -- name: stringify
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	return v_u_1:JSONEncode(p3):gsub(v_u_2, "null")
end