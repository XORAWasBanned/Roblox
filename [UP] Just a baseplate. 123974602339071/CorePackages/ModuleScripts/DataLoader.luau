-- Path: CorePackages.Packages._Index.DataLoader.DataLoader
local v1 = script.Parent
local v2 = require(v1.LuauPolyfill)
local v_u_3 = v2.Array
local v_u_4 = v2.Boolean
local v_u_5 = v2.Map
local v_u_6 = v2.instanceof
local v_u_7 = v2.setTimeout
local v_u_8 = v2.Error
local v_u_9 = v2.Error
local v_u_10 = require(v1.Promise)
local v11 = {}
local v_u_12 = nil
local v_u_13 = nil
local v_u_14 = nil
local v_u_15 = nil
local v_u_16 = nil
local v_u_17 = nil
local v_u_18 = nil
local v_u_19 = nil
local v_u_20 = nil
local v_u_21 = nil
local v_u_22 = {}
v_u_22.__index = v_u_22
function v_u_22.new(p23, p24) -- name: new
	-- upvalues: (copy) v_u_22, (copy) v_u_8, (ref) v_u_13, (ref) v_u_17, (ref) v_u_18, (ref) v_u_19, (ref) v_u_20
	local v25 = v_u_22
	local v26 = setmetatable({}, v25)
	if typeof(p23) ~= "function" then
		error(v_u_8.new("DataLoader must be constructed with a function which accepts " .. ("Array<key> and returns Promise<Array<value>>, but got: %s."):format((tostring(p23)))))
	end
	v26._batchLoadFn = p23
	v26._maxBatchSize = v_u_13(p24)
	v26._batchScheduleFn = v_u_17(p24)
	v26._cacheKeyFn = v_u_18(p24)
	v26._cacheMap = v_u_19(p24)
	v26._batch = nil
	v26.name = v_u_20(p24)
	return v26
end
function v_u_22.load(p27, p28) -- name: load
	-- upvalues: (copy) v_u_8, (ref) v_u_12, (copy) v_u_4, (copy) v_u_10
	if p28 == nil then
		error(v_u_8.new("The loader.load() function must be called with a value, " .. ("but got: %s."):format((tostring(p28)))))
	end
	local v_u_29 = v_u_12(p27)
	local v30 = p27._cacheMap
	local v31 = p27._cacheKeyFn(p28)
	if v_u_4.toJSBoolean(v30) then
		local v_u_32 = v30:get(v31)
		if v_u_4.toJSBoolean(v_u_32) then
			local v_u_33 = v_u_4.toJSBoolean(v_u_29.cacheHits) and v_u_29.cacheHits
			if not v_u_33 then
				v_u_29.cacheHits = {}
				v_u_33 = v_u_29.cacheHits
			end
			return v_u_10.new(function(p_u_34)
				-- upvalues: (copy) v_u_33, (copy) v_u_32
				local v35 = v_u_33
				local function v36()
					-- upvalues: (copy) p_u_34, (ref) v_u_32
					p_u_34(v_u_32)
				end
				table.insert(v35, v36)
			end)
		end
	end
	local v37 = v_u_29.keys
	table.insert(v37, p28)
	local v41 = v_u_10.new(function(p38, p39)
		-- upvalues: (copy) v_u_29
		local v40 = v_u_29.callbacks
		table.insert(v40, {
			["resolve"] = p38,
			["reject"] = p39
		})
	end)
	if v_u_4.toJSBoolean(v30) then
		v30:set(v31, v41)
	end
	return v41
end
function v_u_22.loadMany(p42, p43) -- name: loadMany
	-- upvalues: (copy) v_u_4, (ref) v_u_21, (copy) v_u_8, (copy) v_u_10
	local v44, v45
	if v_u_4.toJSBoolean(v_u_21(p43)) then
		v44 = 0
		v45 = {}
	else
		error(v_u_8.new("The loader.loadMany() function must be called with Array<key> " .. ("but got: %s."):format((tostring(p43)))))
		v44 = 0
		v45 = {}
	end
	while v44 < #p43 do
		local v46 = p42:load(p43[v44 + 1])
		table.insert(v45, v46:catch(function(p47)
			return p47
		end))
		v44 = v44 + 1
	end
	return v_u_10.all(v45)
end
function v_u_22.clear(p48, p49) -- name: clear
	-- upvalues: (copy) v_u_4
	local v50 = p48._cacheMap
	if v_u_4.toJSBoolean(v50) then
		v50:delete((p48._cacheKeyFn(p49)))
	end
	return p48
end
function v_u_22.clearAll(p51) -- name: clearAll
	-- upvalues: (copy) v_u_4
	local v52 = p51._cacheMap
	if v_u_4.toJSBoolean(v52) then
		v52:clear()
	end
	return p51
end
function v_u_22.prime(p53, p54, p55) -- name: prime
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_9, (copy) v_u_10
	local v56 = p53._cacheMap
	if v_u_4.toJSBoolean(v56) then
		local v57 = p53._cacheKeyFn(p54)
		if v56:get(v57) == nil then
			local v58
			if v_u_6(p55, v_u_9) then
				v58 = v_u_10.reject(p55)
				v58:catch(function() end)
			else
				v58 = v_u_10.resolve(p55)
			end
			v56:set(v57, v58)
		end
	end
	return p53
end
local function v_u_60(p59)
	-- upvalues: (copy) v_u_7
	v_u_7(p59)
end
v_u_12 = function(p_u_61) -- name: getCurrentBatch
	-- upvalues: (copy) v_u_4, (ref) v_u_14
	local v62 = p_u_61._batch
	if v62 ~= nil and (not v_u_4.toJSBoolean(v62.hasDispatched) and #v62.keys < p_u_61._maxBatchSize) then
		return v62
	end
	local v_u_63 = {
		["hasDispatched"] = false,
		["keys"] = nil,
		["callbacks"] = nil,
		["keys"] = {},
		["callbacks"] = {}
	}
	p_u_61._batch = v_u_63
	p_u_61._batchScheduleFn(function()
		-- upvalues: (ref) v_u_14, (copy) p_u_61, (copy) v_u_63
		v_u_14(p_u_61, v_u_63)
	end)
	return v_u_63
end
v_u_14 = function(p_u_64, p_u_65) -- name: dispatchBatch
	-- upvalues: (ref) v_u_16, (ref) v_u_15, (copy) v_u_8, (copy) v_u_4, (ref) v_u_21, (copy) v_u_6, (copy) v_u_9
	p_u_65.hasDispatched = true
	if #p_u_65.keys ~= 0 then
		local v_u_66 = nil
		local function v67()
			-- upvalues: (ref) v_u_66, (copy) p_u_64, (copy) p_u_65
			v_u_66 = p_u_64._batchLoadFn(p_u_65.keys)
		end
		local function v69(p68)
			-- upvalues: (ref) v_u_15, (copy) p_u_64, (copy) p_u_65, (ref) v_u_8
			return v_u_15(p_u_64, p_u_65, v_u_8.new("DataLoader must be constructed with a function which accepts " .. "Array<key> and returns Promise<Array<value>>, but the function " .. ("errored synchronously: %s."):format((tostring(p68))))), true
		end
		local _, v70, v71 = xpcall(v67, v69)
		if v71 then
			return v70
		end
		if v_u_4.toJSBoolean(v_u_66) then
			local v72 = v_u_66.andThen
			if typeof(v72) == "function" then
				v_u_66:andThen(function(p73)
					-- upvalues: (ref) v_u_4, (ref) v_u_21, (ref) v_u_8, (copy) p_u_65, (ref) v_u_16, (ref) v_u_6, (ref) v_u_9
					if not v_u_4.toJSBoolean(v_u_21(p73)) then
						error(v_u_8.new("DataLoader must be constructed with a function which accepts " .. "Array<key> and returns Promise<Array<value>>, but the function did " .. ("not return a Promise of an Array: %s."):format(table.concat(p73, ","))))
					end
					if #p73 ~= #p_u_65.keys then
						error(v_u_8.new("DataLoader must be constructed with a function which accepts " .. "Array<key> and returns Promise<Array<value>>, but the function did " .. "not return a Promise of an Array of the same length as the Array " .. "of keys." .. ("\n\nKeys:\n%s"):format(table.concat(p_u_65.keys, ",")) .. ("\n\nValues:\n%s"):format(table.concat(p73, ","))))
					end
					v_u_16(p_u_65)
					local v74 = 0
					while v74 < #p_u_65.callbacks do
						local v75 = p73[v74 + 1]
						if v_u_6(v75, v_u_9) then
							p_u_65.callbacks[v74 + 1].reject(v75)
						else
							p_u_65.callbacks[v74 + 1].resolve(v75)
						end
						v74 = v74 + 1
					end
				end):catch(function(p76)
					-- upvalues: (ref) v_u_15, (copy) p_u_64, (copy) p_u_65
					v_u_15(p_u_64, p_u_65, p76)
				end)
				return nil
			end
		end
		local v77 = v_u_66
		return v_u_15(p_u_64, p_u_65, v_u_8.new("DataLoader must be constructed with a function which accepts " .. "Array<key> and returns Promise<Array<value>>, but the function did " .. ("not return a Promise: %s."):format((tostring(v77)))))
	end
	v_u_16(p_u_65)
end
v_u_15 = function(p78, p79, p80) -- name: failedDispatch
	-- upvalues: (ref) v_u_16
	v_u_16(p79)
	local v81 = 0
	while v81 < #p79.keys do
		p78:clear(p79.keys[v81 + 1])
		p79.callbacks[v81 + 1].reject(p80)
		v81 = v81 + 1
	end
end
v_u_16 = function(p82) -- name: resolveCacheHits
	-- upvalues: (copy) v_u_4
	if v_u_4.toJSBoolean(p82.cacheHits) then
		local v83 = 0
		while v83 < #p82.cacheHits do
			p82.cacheHits[v83 + 1]()
			v83 = v83 + 1
		end
	end
end
v_u_13 = function(p84) -- name: getValidMaxBatchSize
	-- upvalues: (copy) v_u_4, (copy) v_u_8
	local v85 = not v_u_4.toJSBoolean(p84) or p84.batch ~= false
	if not v_u_4.toJSBoolean(v85) then
		return 1
	end
	if v_u_4.toJSBoolean(p84) then
		p84 = p84.maxBatchSize
	end
	if p84 == nil then
		return (1 / 0)
	end
	if typeof(p84) ~= "number" or p84 < 1 then
		error(v_u_8.new(("maxBatchSize must be a positive number: %s"):format((tostring(p84)))))
	end
	return p84
end
v_u_17 = function(p86) -- name: getValidBatchScheduleFn
	-- upvalues: (copy) v_u_4, (copy) v_u_60, (copy) v_u_8
	if v_u_4.toJSBoolean(p86) then
		p86 = p86.batchScheduleFn
	end
	if p86 == nil then
		return v_u_60
	end
	if typeof(p86) ~= "function" then
		error(v_u_8.new(("batchScheduleFn must be a function: %s"):format((tostring(p86)))))
	end
	return p86
end
v_u_18 = function(p87) -- name: getValidCacheKeyFn
	-- upvalues: (copy) v_u_4, (copy) v_u_8
	if v_u_4.toJSBoolean(p87) then
		p87 = p87.cacheKeyFn
	end
	if p87 == nil then
		return function(p88)
			return p88
		end
	end
	if typeof(p87) ~= "function" then
		error(v_u_8.new(("cacheKeyFn must be a function: %s"):format((tostring(p87)))))
	end
	return p87
end
v_u_19 = function(p_u_89) -- name: getValidCacheMap
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_3, (copy) v_u_8
	local v90 = not v_u_4.toJSBoolean(p_u_89) or p_u_89.cache ~= false
	if not v_u_4.toJSBoolean(v90) then
		return nil
	end
	if v_u_4.toJSBoolean(p_u_89) then
		p_u_89 = p_u_89.cacheMap
	end
	if p_u_89 == nil then
		return v_u_5.new()
	end
	if p_u_89 ~= nil then
		local v93 = v_u_3.filter({
			"get",
			"set",
			"delete",
			"clear"
		}, function(p91)
			-- upvalues: (ref) v_u_4, (copy) p_u_89
			if not v_u_4.toJSBoolean(p_u_89) then
				return p_u_89
			end
			local v92 = p_u_89[tostring(p91)]
			return typeof(v92) ~= "function"
		end)
		if #v93 ~= 0 then
			local v94 = error
			local v95 = v_u_8.new
			local v96 = v_u_3.join
			v94(v95("Custom cacheMap missing methods: " .. tostring(v96(v93, ", "))))
		end
	end
	return p_u_89
end
v_u_20 = function(p97) -- name: getValidName
	-- upvalues: (copy) v_u_4
	local v98 = v_u_4.toJSBoolean
	local v99
	if v_u_4.toJSBoolean(p97) then
		v99 = p97.name
	else
		v99 = p97
	end
	if v98(v99) then
		return p97.name
	else
		return nil
	end
end
v_u_21 = function(p100) -- name: isArrayLike
	local v101
	if typeof(p100) == "table" then
		if #p100 == 0 then
			v101 = true
		elseif #p100 > 0 then
			v101 = p100[#p100] ~= nil
		else
			v101 = false
		end
	else
		v101 = false
	end
	return v101
end
v11.DataLoader = v_u_22
return v11