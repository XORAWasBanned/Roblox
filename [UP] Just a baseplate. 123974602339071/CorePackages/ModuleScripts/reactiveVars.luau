-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.cache.inmemory.reactiveVars
local v1 = script.Parent.Parent.Parent
local v2 = v1.Parent
local v3 = {}
local v_u_4 = require(v1.optimism).dep
local v5 = require(v1.wry.context).Slot
require(script.Parent.Parent.core.cache)
local v6 = require(v2.LuauPolyfill)
local v_u_7 = v6.Array
local v_u_8 = v6.Set
local v9 = v6.WeakMap
local v_u_10 = nil
local v_u_11 = v5.new()
v3.cacheSlot = v_u_11
local v_u_12 = v9.new()
local function v_u_15(p13) -- name: getCacheInfo
	-- upvalues: (copy) v_u_12, (copy) v_u_8, (copy) v_u_4
	local v14 = v_u_12:get(p13)
	if not v14 then
		v14 = {
			["vars"] = v_u_8.new(),
			["dep"] = v_u_4()
		}
		v_u_12:set(p13, v14)
	end
	return v14
end
function v3.forgetCache(p_u_16) -- name: forgetCache
	-- upvalues: (copy) v_u_15
	v_u_15(p_u_16).vars:forEach(function(p17)
		-- upvalues: (copy) p_u_16
		return p17:forgetCache(p_u_16)
	end)
end
function v3.recallCache(p_u_18) -- name: recallCache
	-- upvalues: (copy) v_u_15
	v_u_15(p_u_18).vars:forEach(function(p19)
		-- upvalues: (copy) p_u_18
		return p19:attachCache(p_u_18)
	end)
end
function v3.makeVar(p_u_20) -- name: makeVar
	-- upvalues: (copy) v_u_8, (copy) v_u_15, (ref) v_u_10, (copy) v_u_7, (copy) v_u_11
	local v_u_21 = v_u_8.new()
	local v_u_22 = v_u_8.new()
	local v_u_23 = nil
	local v_u_24 = nil
	local v30 = {
		["__call"] = function(_, ...) -- name: __call
			-- upvalues: (ref) p_u_20, (copy) v_u_21, (ref) v_u_15, (ref) v_u_23, (ref) v_u_10, (ref) v_u_7, (copy) v_u_22, (ref) v_u_11, (ref) v_u_24
			if select("#", ...) >= 1 then
				local v25 = ({ ... })[1]
				if p_u_20 ~= v25 then
					p_u_20 = v25
					v_u_21:forEach(function(p26)
						-- upvalues: (ref) v_u_15, (ref) v_u_23, (ref) v_u_10
						v_u_15(p26).dep:dirty(v_u_23)
						v_u_10(p26)
					end)
					local v27 = v_u_7.from(v_u_22)
					v_u_22:clear()
					v_u_7.forEach(v27, function(p28)
						-- upvalues: (ref) p_u_20
						p28(p_u_20)
					end)
				end
			else
				local v29 = v_u_11:getValue()
				if v29 then
					v_u_24(v29)
					v_u_15(v29).dep(v_u_23)
				end
			end
			return p_u_20
		end
	}
	v_u_23 = setmetatable({}, v30)
	function v_u_23.onNextChange(_, p_u_31)
		-- upvalues: (copy) v_u_22
		v_u_22:add(p_u_31)
		return function()
			-- upvalues: (ref) v_u_22, (copy) p_u_31
			v_u_22:delete(p_u_31)
		end
	end
	v_u_24 = function(p32)
		-- upvalues: (copy) v_u_21, (ref) v_u_15, (ref) v_u_23
		v_u_21:add(p32)
		v_u_15(p32).vars:add(v_u_23)
		return v_u_23
	end
	function v_u_23.attachCache(_, p33)
		-- upvalues: (ref) v_u_24
		return v_u_24(p33)
	end
	function v_u_23.forgetCache(_, p34)
		-- upvalues: (copy) v_u_21
		return v_u_21:delete(p34)
	end
	return v_u_23
end
v_u_10 = function(p35) -- name: broadcast
	if p35.broadcastWatches ~= nil then
		p35:broadcastWatches()
	end
end
return v3