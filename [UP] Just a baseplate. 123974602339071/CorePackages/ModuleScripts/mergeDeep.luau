-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.utilities.common.mergeDeep
local v1 = {}
local v2 = script.Parent.Parent.Parent
local v3 = v2.Parent
local v_u_4 = require(v3.LuauPolyfill).Set
local v_u_5 = newproxy(true)
getmetatable(v_u_5).__tostring = function()
	return "Value.None"
end
local v_u_6 = require(script.Parent.objects).isNonNullObject
local v_u_7 = require(v2.luaUtils.hasOwnProperty)
local v_u_8 = require(v2.luaUtils.objectKeysForEach)
local v_u_9 = nil
function v1.mergeDeep(...) -- name: mergeDeep
	-- upvalues: (ref) v_u_9
	return v_u_9({ ... })
end
local v_u_10 = {}
v_u_9 = function(p11) -- name: mergeDeepArray
	-- upvalues: (copy) v_u_10
	local v12 = p11[1] or {}
	local v13 = #p11
	if v13 > 1 then
		local v14 = v_u_10.new()
		for v15 = 2, v13 do
			v12 = v14:merge(v12, p11[v15])
		end
	end
	return v12
end
v1.mergeDeepArray = v_u_9
v_u_10.__index = v_u_10
function v_u_10.new(p16) -- name: new
	-- upvalues: (copy) v_u_10, (copy) v_u_6, (copy) v_u_4
	local v17 = v_u_10
	local v18 = setmetatable({}, v17)
	v18.reconciler = p16 == nil and function(p19, p20, p21, p22)
		return p19:merge(p20[p22], p21[p22])
	end or p16
	v18.isObject = v_u_6
	v18.pastCopies = v_u_4.new()
	return v18
end
function v_u_10.merge(p_u_23, p_u_24, p_u_25, ...) -- name: merge
	-- upvalues: (copy) v_u_6, (copy) v_u_8, (copy) v_u_7, (copy) v_u_5
	local v_u_26 = table.pack(...)
	if not (v_u_6(p_u_25) and v_u_6(p_u_24)) then
		return p_u_25
	end
	v_u_8(p_u_25, function(p27)
		-- upvalues: (ref) v_u_7, (ref) p_u_24, (copy) p_u_25, (copy) p_u_23, (copy) v_u_26, (ref) v_u_5
		if v_u_7(p_u_24, p27) then
			local v28 = p_u_24[p27]
			if p_u_25[p27] ~= v28 then
				local v29 = v_u_26
				local v30 = p_u_23:reconciler(p_u_24, p_u_25, p27, table.unpack(v29))
				if v30 ~= v28 then
					p_u_24 = p_u_23:shallowCopyForMerge(p_u_24)
					p_u_24[p27] = v30
				end
			end
		else
			p_u_24 = p_u_23:shallowCopyForMerge(p_u_24)
			p_u_24[p27] = p_u_25[p27]
		end
		if p_u_24[p27] == v_u_5 then
			p_u_24[p27] = nil
		end
	end)
	return p_u_24
end
function v_u_10.shallowCopyForMerge(p31, p32) -- name: shallowCopyForMerge
	-- upvalues: (copy) v_u_6
	if v_u_6(p32) and not p31.pastCopies:has(p32) then
		p32 = table.clone(p32)
		p31.pastCopies:add(p32)
	end
	return p32
end
v_u_10.None = v_u_5
v1.DeepMerger = v_u_10
return v1