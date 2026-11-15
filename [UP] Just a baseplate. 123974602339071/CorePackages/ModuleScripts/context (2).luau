-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.wry.context.context
local v1 = script.Parent.Parent.Parent.Parent
local v2 = require(v1.LuauPolyfill)
local v3 = {}
local v4 = require(script.Parent.slot).Slot
v3.Slot = v4
local v_u_5 = v4.bind
local v6 = v4.noContext
v3.bind = v_u_5
v3.noContext = v6
local v_u_7 = v2.setTimeout
function v3.setTimeout(p8, p9) -- name: setTimeoutWithContext
	-- upvalues: (copy) v_u_7, (copy) v_u_5
	return v_u_7(v_u_5(p8), p9)
end
return v3