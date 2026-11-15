-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.react.hooks.utils.useDeepMemo
local v1 = {}
local v2 = script.Parent.Parent.Parent.Parent
local v3 = v2.Parent
local v_u_4 = require(v3.React).useRef
local v_u_5 = require(v2.jsutils.equal)
function v1.useDeepMemo(p6, p7) -- name: useDeepMemo
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	local v8 = v_u_4(nil)
	if not (v8.current and v_u_5(p7, v8.current.key)) then
		v8.current = {
			["key"] = p7,
			["value"] = p6()
		}
	end
	return v8.current.value
end
return v1