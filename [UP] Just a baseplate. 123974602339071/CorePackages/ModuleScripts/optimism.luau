-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.optimism
local v1 = script.Parent
local v2 = v1.Parent
local v3 = require(v2.LuauPolyfill)
local v_u_4 = v3.Array
local v5 = v3.Set
local v_u_6 = v3.Boolean
local v_u_7 = v3.Object
local v8 = {}
local v_u_9 = require(v1.wry.trie).Trie
local v_u_10 = require(script.cache).Cache
local v_u_11 = require(script.entry).Entry
local v_u_12 = require(script.context).parentEntrySlot
local v13 = require(script.context)
v8.bindContext = v13.bindContext
v8.noContext = v13.noContext
v8.setTimeout = v13.setTimeout
v8.dep = require(script.dep).dep
local v_u_14 = v_u_9.new(true)
function v8.defaultMakeCacheKey(_, ...)
	-- upvalues: (copy) v_u_14
	return v_u_14:lookupArray({ ... })
end
v8.KeyTrie = v_u_9
require(script.initTypes)
local v_u_15 = v5.new()
function v8.wrap(p_u_16, p17, p_u_18) -- name: wrap
	-- upvalues: (copy) v_u_10, (copy) v_u_6, (copy) v_u_9, (copy) v_u_11, (copy) v_u_4, (copy) v_u_15, (copy) v_u_12, (copy) v_u_7
	local v19 = p17
	local v_u_20 = v19 == nil and {} or v19
	local v_u_22 = v_u_10.new(v_u_6.toJSBoolean(v_u_20.max) and (v_u_20.max or 65536) or 65536, function(p21)
		return p21:dispose()
	end)
	local v_u_23 = v_u_20.keyArgs
	local v_u_24 = v_u_6.toJSBoolean(v_u_20.makeCacheKey) and v_u_20.makeCacheKey
	if not v_u_24 then
		local v_u_25 = v_u_9.new(true)
		v_u_24 = function(_, ...)
			-- upvalues: (copy) v_u_25
			return v_u_25:lookupArray({ ... })
		end
	end
	if p_u_18 ~= nil then
		local v_u_26 = p_u_16
		p_u_16 = function(...)
			-- upvalues: (copy) v_u_26, (copy) p_u_18
			return v_u_26(p_u_18, ...)
		end
	end
	local v41 = {
		["__call"] = function(_, p27, ...) -- name: __call
			-- upvalues: (copy) p_u_18, (copy) v_u_24, (copy) v_u_23, (ref) p_u_16, (copy) v_u_22, (ref) v_u_11, (ref) v_u_20, (ref) v_u_4, (ref) v_u_15, (ref) v_u_12
			local v_u_28 = p_u_18 == nil and { p27, ... } or { ... }
			local function v30()
				-- upvalues: (ref) v_u_23, (ref) v_u_28
				if not v_u_23 then
					return v_u_28
				end
				local v29 = v_u_28
				return v_u_23(nil, table.unpack(v29))
			end
			local v_u_31 = v_u_24(nil, table.unpack(v30()))
			if v_u_31 == nil then
				local v32 = v_u_28
				return p_u_16(table.unpack(v32))
			end
			local v33 = v_u_22:get(v_u_31)
			if v33 == nil then
				v33 = v_u_11.new(p_u_16)
				v_u_22:set(v_u_31, v33)
				v33.subscribe = v_u_20.subscribe
				function v33.forget()
					-- upvalues: (ref) v_u_22, (copy) v_u_31
					return v_u_22:delete(v_u_31)
				end
			end
			local v34 = v33:recompute((v_u_4.slice(v_u_28)))
			v_u_22:set(v_u_31, v33)
			v_u_15:add(v_u_22)
			if not v_u_12:hasValue() then
				v_u_15:forEach(function(p35)
					return p35:clean()
				end)
				v_u_15:clear()
			end
			return v34
		end,
		["__index"] = function(p36, p37) -- name: __index
			-- upvalues: (copy) v_u_22
			if p37 == "size" then
				return v_u_22.map.size
			else
				return rawget(p36, p37)
			end
		end,
		["__newindex"] = function(p38, p39, p40) -- name: __newindex
			if p39 == "size" then
				error("attempt to update a read-only table", 2)
			end
			rawset(p38, p39, p40)
		end
	}
	local v42 = setmetatable({}, v41)
	local function v_u_45(p43) -- name: dirtyKey
		-- upvalues: (copy) v_u_22, (ref) v_u_6
		local v44 = v_u_22:get(p43)
		if v_u_6.toJSBoolean(v44) then
			v44:setDirty()
		end
	end
	function v42.dirtyKey(_, ...)
		-- upvalues: (copy) v_u_45
		return v_u_45(...)
	end
	local function v_u_47(...)
		-- upvalues: (copy) v_u_24, (copy) v_u_22, (ref) v_u_6
		local v46 = v_u_22:get((v_u_24(nil, ...)))
		if v_u_6.toJSBoolean(v46) then
			v46:setDirty()
		end
	end
	function v42.dirty(_, ...)
		-- upvalues: (copy) v_u_47
		return v_u_47(...)
	end
	local function v_u_50(p48) -- name: peekKey
		-- upvalues: (copy) v_u_22, (ref) v_u_6
		local v49 = v_u_22:get(p48)
		if v_u_6.toJSBoolean(v49) then
			return v49:peek()
		end
	end
	function v42.peekKey(_, ...)
		-- upvalues: (copy) v_u_50
		return v_u_50(...)
	end
	local function v_u_51(...)
		-- upvalues: (copy) v_u_50, (copy) v_u_24
		return v_u_50(v_u_24(nil, ...))
	end
	function v42.peek(_, ...)
		-- upvalues: (copy) v_u_51
		return v_u_51(...)
	end
	local function v_u_53(p52) -- name: forgetKey
		-- upvalues: (copy) v_u_22
		return v_u_22:delete(p52)
	end
	function v42.forgetKey(_, ...)
		-- upvalues: (copy) v_u_53
		return v_u_53(...)
	end
	local function v_u_54(...)
		-- upvalues: (copy) v_u_53, (copy) v_u_24
		return v_u_53(v_u_24(nil, ...))
	end
	function v42.forget(_, ...)
		-- upvalues: (copy) v_u_54
		return v_u_54(...)
	end
	v42.makeCacheKey = v_u_24
	if v_u_6.toJSBoolean(v_u_23) then
		local function v_u_56(...)
			-- upvalues: (copy) v_u_24, (copy) v_u_23
			local v55 = v_u_23
			return v_u_24(nil, table.unpack(v55(...)))
		end
		function v42.getKey(_, ...)
			-- upvalues: (copy) v_u_56
			return v_u_56(...)
		end
	else
		v42.getKey = v_u_24
	end
	return v_u_7.freeze(v42)
end
return v8