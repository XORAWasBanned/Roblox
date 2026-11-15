-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.cache.inmemory.object-canon
local v1 = script.Parent.Parent.Parent
local v2 = v1.Parent
local v3 = require(v2.LuauPolyfill)
local v_u_4 = v3.Array
local v_u_5 = v3.Set
local v_u_6 = v3.WeakMap
local v_u_7 = v3.Map
local v_u_8 = require(v1.luaUtils.Object)
local v_u_9 = game:GetService("HttpService")
local v10 = {}
local v_u_11 = require(v1.wry.trie).Trie
local v12 = require(script.Parent.Parent.Parent.utilities)
local v_u_13 = v12.canUseWeakMap
local v_u_14 = v12.isNonNullObject
local v_u_15 = require(v1.luaUtils.sortedEncode).sortedEncode
local v_u_16 = nil
local v_u_17 = nil
local v_u_18 = nil
local v_u_19 = {}
v_u_19.__index = v_u_19
function v_u_19.new() -- name: new
	-- upvalues: (copy) v_u_19, (copy) v_u_5, (copy) v_u_11, (copy) v_u_13, (copy) v_u_6, (copy) v_u_7
	local v20 = v_u_19
	local v21 = setmetatable({}, v20)
	v21.known = v_u_5.new()
	v21.pool = v_u_11.new(v_u_13)
	v21.passes = v_u_6.new()
	v21.keysByJSON = v_u_7.new(nil)
	v21.empty = v21:admit({})
	return v21
end
function v_u_19.isKnown(p22, p23) -- name: isKnown
	-- upvalues: (copy) v_u_14
	local v24 = v_u_14(p23)
	if v24 then
		v24 = p22.known:has(p23)
	end
	return v24
end
function v_u_19.pass(p25, p26) -- name: pass
	-- upvalues: (copy) v_u_14
	if not v_u_14(p26) then
		return p26
	end
	local v27 = table.clone(p26)
	p25.passes:set(v27, p26)
	return v27
end
function v_u_19.admit(p_u_28, p_u_29) -- name: admit
	-- upvalues: (copy) v_u_14, (copy) v_u_8, (copy) v_u_4
	if v_u_14(p_u_29) then
		local v30 = p_u_28.passes:get(p_u_29)
		if v30 then
			return v30
		end
		if v_u_8.getPrototypeOf(p_u_29) == nil then
			if #p_u_29 == 0 and not next(p_u_29) and true or #p_u_29 > 1 then
				if p_u_28.known:has(p_u_29) then
					return p_u_29
				end
				local v31 = v_u_4.map(p_u_29, p_u_28.admit, p_u_28)
				local v32 = p_u_28.pool:lookupArray(v31)
				if not v32.array then
					v32.array = v31
					p_u_28.known:add(v32.array)
					if _G.__DEV__ then
						v_u_8.freeze(v31)
					end
				end
				return v32.array
			end
			if p_u_28.known:has(p_u_29) then
				return p_u_29
			end
			local v33 = v_u_8.getPrototypeOf(p_u_29)
			local v_u_34 = { v33 }
			local v35 = p_u_28:sortedKeys(p_u_29)
			local v36 = v35.json
			table.insert(v_u_34, v36)
			local v_u_37 = #v_u_34
			v_u_4.forEach(v35.sorted, function(p38)
				-- upvalues: (copy) v_u_34, (copy) p_u_28, (copy) p_u_29
				local v39 = v_u_34
				local v40 = p_u_28
				local v41 = p_u_29[p38]
				table.insert(v39, v40:admit(v41))
			end)
			local v42 = p_u_28.pool:lookupArray(v_u_34)
			if not v42.object then
				v42.object = v_u_8.create(v33)
				local v_u_43 = v42.object
				p_u_28.known:add(v_u_43)
				v_u_4.forEach(v35.sorted, function(p44, p45)
					-- upvalues: (copy) v_u_43, (copy) v_u_34, (copy) v_u_37
					v_u_43[p44] = v_u_34[v_u_37 + p45]
				end)
				if _G.__DEV__ then
					v_u_8.freeze(v_u_43)
				end
			end
			return v42.object
		end
	end
	return p_u_29
end
function v_u_19.sortedKeys(p46, p47) -- name: sortedKeys
	-- upvalues: (copy) v_u_8, (copy) v_u_4, (copy) v_u_9
	local v48 = v_u_8.keys(p47)
	local v49 = p46.pool:lookupArray(v48)
	if not v49.keys then
		v_u_4.sort(v48)
		local v50 = v_u_9:JSONEncode(v48)
		v49.keys = p46.keysByJSON:get(v50)
		if not v49.keys then
			v49.keys = {
				["sorted"] = v48,
				["json"] = v50
			}
			p46.keysByJSON:set(v50, v49.keys)
		end
	end
	return v49.keys
end
v10.ObjectCanon = v_u_19
local v55 = {
	["__call"] = function(_, p51) -- name: __call
		-- upvalues: (copy) v_u_14, (ref) v_u_17, (ref) v_u_16, (ref) v_u_18, (copy) v_u_15, (copy) v_u_9
		if not v_u_14(p51) then
			return v_u_9:JSONEncode(p51)
		end
		if v_u_17 == nil then
			v_u_16()
		end
		local v52 = v_u_17:admit(p51)
		local v53 = v_u_18:get(v52)
		if v53 == nil then
			local v54 = v_u_18
			v53 = v_u_15(v52)
			v54:set(v52, v53)
		end
		return v53
	end
}
local v56 = {
	["reset"] = function(_) -- name: reset
		-- upvalues: (ref) v_u_16
		return v_u_16()
	end
}
v10.canonicalStringify = v_u_8.assign(setmetatable({}, v55), v56)
v_u_16 = function() -- name: resetCanonicalStringify
	-- upvalues: (ref) v_u_17, (copy) v_u_19, (ref) v_u_18, (copy) v_u_6
	v_u_17 = v_u_19.new()
	v_u_18 = v_u_6.new()
end
return v10