-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.optimism.dep
local v1 = script.Parent.Parent.Parent
local v2 = require(v1.LuauPolyfill)
local v_u_3 = v2.Set
local v_u_4 = v2.Array
local v5 = {}
require(script.Parent.anyEntryTypes)
require(script.Parent.initTypes)
local v_u_6 = require(script.Parent.context).parentEntrySlot
local v7 = require(script.Parent.helpers)
local v_u_8 = v7.hasOwnProperty
local v_u_9 = v7.maybeUnsubscribe
local v_u_10 = v7.toArray
local v_u_11 = {
	["setDirty"] = true,
	["dispose"] = true,
	["forget"] = true
}
require(script.Parent.depTypes)
function v5.dep(p_u_12) -- name: dep
	-- upvalues: (copy) v_u_6, (copy) v_u_3, (copy) v_u_9, (copy) v_u_8, (copy) v_u_11, (copy) v_u_4, (copy) v_u_10
	local v_u_13 = {}
	if p_u_12 ~= nil then
		p_u_12 = p_u_12.subscribe
	end
	local v18 = {
		["__call"] = function(_, p14) -- name: __call
			-- upvalues: (ref) v_u_6, (copy) v_u_13, (ref) v_u_3, (copy) p_u_12, (ref) v_u_9
			local v15 = v_u_6:getValue()
			if v15 ~= nil then
				local v16 = v_u_13[p14]
				if not v16 then
					v16 = v_u_3.new()
					v_u_13[p14] = v16
				end
				v15:dependOn(v16)
				local v17 = p_u_12
				if type(v17) == "function" then
					v_u_9(v16)
					v16.unsubscribe = p_u_12(p14)
				end
			end
		end
	}
	local v19 = setmetatable({}, v18)
	function v19.dirty(_, p20, p21)
		-- upvalues: (copy) v_u_13, (ref) v_u_8, (ref) v_u_11, (ref) v_u_4, (ref) v_u_10, (ref) v_u_9
		local v22 = v_u_13[p20]
		if v22 then
			local v_u_23 = not (p21 and v_u_8(v_u_11, p21)) and "setDirty" or p21
			v_u_4.forEach(v_u_10(v22), function(p24)
				-- upvalues: (copy) v_u_23
				p24[v_u_23](p24)
			end)
			v_u_13[p20] = nil
			v_u_9(v22)
		end
	end
	return v19
end
return v5