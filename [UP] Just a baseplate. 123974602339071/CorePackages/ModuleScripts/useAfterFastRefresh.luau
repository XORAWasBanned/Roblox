-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.react.hooks.utils.useAfterFastRefresh
local v1 = {}
local v2 = script.Parent.Parent.Parent.Parent.Parent
local v3 = require(v2.React)
local v_u_4 = v3.useEffect
local v_u_5 = v3.useRef
function v1.useAfterFastRefresh(p_u_6) -- name: useAfterFastRefresh
	-- upvalues: (copy) v_u_5, (copy) v_u_4
	if _G.__DEV__ then
		local v_u_7 = v_u_5(false)
		v_u_4(function()
			-- upvalues: (copy) v_u_7
			return function()
				-- upvalues: (ref) v_u_7
				v_u_7.current = true
			end
		end, {})
		v_u_4(function()
			-- upvalues: (copy) v_u_7, (copy) p_u_6
			if v_u_7.current == true then
				v_u_7.current = false
				p_u_6()
			end
		end, {})
	end
end
return v1