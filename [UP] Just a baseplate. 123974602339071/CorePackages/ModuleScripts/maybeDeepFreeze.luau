-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.utilities.common.maybeDeepFreeze
local v1 = {}
local v2 = script.Parent.Parent.Parent.Parent
local v3 = require(v2.LuauPolyfill)
local v_u_4 = v3.Object
local v_u_5 = v3.Set
local v_u_6 = v3.Array
require(script.Parent.Parent.globals)
local v_u_7 = require(script.Parent.objects).isNonNullObject
local function v_u_12(p8) -- name: deepFreeze
	-- upvalues: (copy) v_u_5, (copy) v_u_7, (copy) v_u_4, (copy) v_u_6
	local v_u_9 = v_u_5.new({ p8 })
	for _, v_u_10 in v_u_9 do
		if not v_u_7(v_u_10) then
			continue
		end
		if not table.isfrozen(v_u_10) then
			v_u_4.freeze(v_u_10)
		end
		v_u_6.forEach(v_u_4.keys(v_u_10), function(p11)
			-- upvalues: (ref) v_u_7, (copy) v_u_10, (copy) v_u_9
			if v_u_7(v_u_10[p11]) then
				v_u_9:add(v_u_10[p11])
			end
		end)
	end
	return p8
end
function v1.maybeDeepFreeze(p13) -- name: maybeDeepFreeze
	-- upvalues: (copy) v_u_12
	if _G.__DEV__ then
		v_u_12(p13)
	end
	return p13
end
return v1