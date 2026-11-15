-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.utilities.common.cloneDeep
local v1 = {}
local v2 = script.Parent.Parent.Parent
local v3 = v2.Parent
local v4 = require(v3.LuauPolyfill)
local v_u_5 = v4.Array
local v_u_6 = v4.Map
local v_u_7 = require(v2.luaUtils.Object)
local v_u_8 = v4.instanceof
local v_u_9 = require(script.Parent.Parent.globals.null).NULL
local v_u_10 = nil
function v1.cloneDeep(p11) -- name: cloneDeep
	-- upvalues: (ref) v_u_10
	return v_u_10(p11)
end
local v_u_12 = {
	v4.Error,
	v4.Map,
	v4.WeakMap,
	v4.Set
}
v_u_10 = function(p_u_13, p14) -- name: cloneDeepHelper
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (ref) v_u_10, (copy) v_u_9, (copy) v_u_12, (copy) v_u_8, (copy) v_u_7
	if v_u_5.isArray(p_u_13) then
		local v_u_15 = p14 or v_u_6.new(nil)
		if v_u_15:has(p_u_13) then
			return v_u_15:get(p_u_13)
		end
		local v_u_16 = v_u_5.slice(p_u_13, 1)
		v_u_15:set(p_u_13, v_u_16)
		v_u_5.forEach(v_u_16, function(p17, p18)
			-- upvalues: (copy) v_u_16, (ref) v_u_10, (ref) v_u_15
			v_u_16[p18] = v_u_10(p17, v_u_15)
		end)
		return v_u_16
	end
	if typeof(p_u_13) ~= "table" or (p_u_13 == v_u_9 or not v_u_5.every(v_u_12, function(p19)
		-- upvalues: (ref) v_u_8, (copy) p_u_13
		return not v_u_8(p_u_13, p19)
	end)) then
		return p_u_13
	end
	local v_u_20 = p14 or v_u_6.new(nil)
	if v_u_20:has(p_u_13) then
		return v_u_20:get(p_u_13)
	end
	local v_u_21 = v_u_7.create(v_u_7.getPrototypeOf(p_u_13))
	v_u_20:set(p_u_13, v_u_21)
	v_u_5.forEach(v_u_7.keys(p_u_13), function(p22)
		-- upvalues: (copy) v_u_21, (ref) v_u_10, (copy) p_u_13, (ref) v_u_20
		v_u_21[p22] = v_u_10(p_u_13[p22], v_u_20)
	end)
	return v_u_21
end
return v1