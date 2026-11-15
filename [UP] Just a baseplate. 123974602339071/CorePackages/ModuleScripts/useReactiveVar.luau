-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.react.hooks.useReactiveVar
local v1 = {}
local v2 = script.Parent.Parent.Parent
local v3 = v2.Parent
local v4 = require(v3.React)
local v_u_5 = v4.useEffect
local v_u_6 = v4.useState
require(v2.cache)
local v_u_7 = {
	["__value"] = "nil placeholder"
}
function v1.useReactiveVar(p_u_8) -- name: useReactiveVar
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_7
	local v_u_9 = p_u_8()
	local _, v_u_10 = v_u_6(v_u_9)
	v_u_5(function()
		-- upvalues: (copy) p_u_8, (copy) v_u_9, (copy) v_u_10
		local v11 = p_u_8()
		if v_u_9 == v11 then
			return p_u_8:onNextChange(v_u_10)
		end
		v_u_10(v11)
	end, { v_u_9 or v_u_7 })
	return v_u_9
end
return v1