-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.cache.inmemory.inMemoryCache
local v1 = script.Parent.Parent.Parent
local v2 = v1.Parent
local v3 = require(v2.LuauPolyfill)
local v_u_4 = v3.Map
local v_u_5 = v3.Object
local v_u_6 = v3.Set
local v_u_7 = v3.instanceof
local v_u_8 = require(v1.utilities).NULL
local v_u_9 = require(v2.Promise)
local v10 = {}
require(v2.GraphQL)
local v_u_11 = require(v1.optimism).wrap
local v_u_12 = require(v1.jsutils.equal)
local v_u_13 = require(script.Parent.Parent.core.cache).ApolloCache
require(script.Parent.Parent.core.types.Cache)
local v_u_14 = require(script.Parent.Parent.core.types.common).MissingFieldError
local v15 = require(script.Parent.Parent.Parent.utilities)
local v_u_16 = v15.addTypenameToDocument
local v_u_17 = v15.isReference
require(script.Parent.types)
local v_u_18 = require(script.Parent.readFromStore).StoreReader
local v_u_19 = require(script.Parent.writeToStore).StoreWriter
local v20 = require(script.Parent.entityStore)
local v_u_21 = v20.EntityStore_Root
local v_u_22 = v20.supportsResultCaching
local v23 = require(script.Parent.reactiveVars)
local v_u_24 = v23.makeVar
local v_u_25 = v23.forgetCache
local v_u_26 = v23.recallCache
local v27 = require(script.Parent.policies)
local v28 = v27.defaultDataIdFromObject
local v_u_29 = v27.Policies
local v_u_30 = require(script.Parent.helpers).hasOwn
local v_u_31 = require(script.Parent["object-canon"]).canonicalStringify
local v_u_32 = {
	["dataIdFromObject"] = nil,
	["addTypename"] = true,
	["resultCaching"] = true,
	["typePolicies"] = nil,
	["dataIdFromObject"] = v28,
	["typePolicies"] = {}
}
local v_u_33 = setmetatable({}, {
	["__index"] = v_u_13
})
v_u_33.__index = v_u_33
function v_u_33.new(p34) -- name: new
	-- upvalues: (copy) v_u_13, (copy) v_u_33, (copy) v_u_6, (copy) v_u_4, (copy) v_u_24, (copy) v_u_5, (copy) v_u_32, (copy) v_u_29
	local v35 = v_u_13.new()
	local v36 = v_u_33
	local v37 = setmetatable(v35, v36)
	local v38 = p34 == nil and {} or p34
	v37.watches = v_u_6.new()
	v37.typenameDocumentCache = v_u_4.new(nil)
	v37.makeVar = v_u_24
	v37.txCount = 0
	v37.config = v_u_5.assign({}, v_u_32, v38)
	v37.addTypename = v37.config.addTypename
	v37.policies = v_u_29.new({
		["cache"] = v37,
		["dataIdFromObject"] = v37.config.dataIdFromObject,
		["possibleTypes"] = v37.config.possibleTypes,
		["typePolicies"] = v37.config.typePolicies
	})
	v37:init()
	return v37
end
function v_u_33.init(p39) -- name: init
	-- upvalues: (copy) v_u_21
	p39.data = v_u_21.new({
		["policies"] = p39.policies,
		["resultCaching"] = p39.config.resultCaching
	})
	p39.optimisticData = p39.data.stump
	p39:resetResultCache()
end
function v_u_33.resetResultCache(p_u_40, p41) -- name: resetResultCache
	-- upvalues: (copy) v_u_18, (copy) v_u_19, (copy) v_u_11, (copy) v_u_22, (copy) v_u_31, (copy) v_u_6
	local v42 = p_u_40.storeReader
	local v43 = v_u_18.new
	local v44 = {
		["cache"] = p_u_40,
		["addTypename"] = p_u_40.addTypename,
		["resultCacheMaxSize"] = p_u_40.config.resultCacheMaxSize
	}
	local v45
	if p41 or not v42 then
		v45 = nil
	else
		v45 = v42.canon
	end
	v44.canon = v45
	p_u_40.storeReader = v43(v44)
	p_u_40.storeWriter = v_u_19.new(p_u_40, p_u_40.storeReader)
	p_u_40.maybeBroadcastWatch = v_u_11(function(_, p46, p47)
		-- upvalues: (ref) p_u_40
		return p_u_40:broadcastWatch(p46, p47)
	end, {
		["max"] = p_u_40.config.resultCacheMaxSize,
		["makeCacheKey"] = function(_, p48) -- name: makeCacheKey
			-- upvalues: (ref) p_u_40, (ref) v_u_22, (ref) v_u_31
			local v49
			if p48.optimistic then
				v49 = p_u_40.optimisticData
			else
				v49 = p_u_40.data
			end
			if v_u_22(v49) then
				local v50 = {
					["optimistic"] = p48.optimistic,
					["rootId"] = p48.rootId,
					["variables"] = p48.variables
				}
				return v49:makeCacheKey(p48.query, p48.callback, v_u_31(v50))
			end
		end
	}, p_u_40)
	v_u_6.new({ p_u_40.data.group, p_u_40.optimisticData.group }):forEach(function(p51)
		return p51:resetCaching()
	end)
end
function v_u_33.restore(p52, p53) -- name: restore
	p52:init()
	if p53 then
		p52.data:replace(p53)
	end
	return p52
end
function v_u_33.extract(p54, p55) -- name: extract
	if p55 == nil then
		p55 = false
	end
	if p55 then
		return p54.optimisticData:extract()
	else
		return p54.data:extract()
	end
end
function v_u_33.read(p_u_56, p_u_57) -- name: read
	-- upvalues: (copy) v_u_5, (copy) v_u_8, (copy) v_u_7, (copy) v_u_14
	local v_u_58
	if p_u_57.returnPartialData == nil then
		v_u_58 = false
	else
		v_u_58 = p_u_57.returnPartialData
	end
	local function v59()
		-- upvalues: (copy) p_u_56, (ref) v_u_5, (copy) p_u_57, (ref) v_u_58, (ref) v_u_8
		return p_u_56.storeReader:diffQueryAgainstStore(v_u_5.assign({}, p_u_57, {
			["store"] = p_u_57.optimistic and p_u_56.optimisticData or p_u_56.data,
			["config"] = p_u_56.config,
			["returnPartialData"] = v_u_58
		})).result or v_u_8
	end
	local v60, v61 = pcall(v59)
	if not v60 then
		if v_u_7(v61, v_u_14) then
			return v_u_8
		end
		error(v61)
	end
	return v61
end
function v_u_33.write(p_u_62, p_u_63) -- name: write
	local v65, v66 = pcall(function()
		-- upvalues: (ref) p_u_62, (copy) p_u_63
		local v64 = p_u_62
		v64.txCount = v64.txCount + 1
		return p_u_62.storeWriter:writeToStore(p_u_62.data, p_u_63)
	end)
	p_u_62.txCount = p_u_62.txCount - 1
	if p_u_62.txCount == 0 and p_u_63.broadcast ~= false then
		p_u_62:broadcastWatches()
	end
	if not v65 then
		error(v66)
	end
	return v66
end
function v_u_33.modify(p_u_67, p_u_68) -- name: modify
	-- upvalues: (copy) v_u_30
	if v_u_30(p_u_68, "id") and not p_u_68.id then
		return false
	end
	local v_u_69
	if p_u_68.optimistic then
		v_u_69 = p_u_67.optimisticData
	else
		v_u_69 = p_u_67.data
	end
	local function v71()
		-- upvalues: (ref) p_u_67, (ref) v_u_69, (copy) p_u_68
		local v70 = p_u_67
		v70.txCount = v70.txCount + 1
		return v_u_69:modify(p_u_68.id or "ROOT_QUERY", p_u_68.fields)
	end
	local v72, v73 = pcall(v71)
	p_u_67.txCount = p_u_67.txCount - 1
	if p_u_67.txCount == 0 and p_u_68.broadcast ~= false then
		p_u_67:broadcastWatches()
	end
	if not v72 then
		error(v73)
	end
	return v73
end
function v_u_33.diff(p74, p75) -- name: diff
	-- upvalues: (copy) v_u_5
	return p74.storeReader:diffQueryAgainstStore(v_u_5.assign({}, p75, {
		["store"] = p75.optimistic and p74.optimisticData or p74.data,
		["rootId"] = p75.id or "ROOT_QUERY",
		["config"] = p74.config
	}))
end
function v_u_33.watch(p_u_76, p_u_77) -- name: watch
	-- upvalues: (copy) v_u_26, (copy) v_u_25
	if p_u_76.watches.size == 0 then
		v_u_26(p_u_76)
	end
	p_u_76.watches:add(p_u_77)
	if p_u_77.immediate then
		p_u_76:maybeBroadcastWatch(p_u_77)
	end
	return function()
		-- upvalues: (ref) p_u_76, (copy) p_u_77, (ref) v_u_25
		if p_u_76.watches:delete(p_u_77) and p_u_76.watches.size == 0 then
			v_u_25(p_u_76)
		end
		p_u_76.maybeBroadcastWatch:forget(p_u_77)
	end
end
function v_u_33.gc(p78, p79) -- name: gc
	-- upvalues: (copy) v_u_31
	v_u_31:reset()
	local v80 = p78.optimisticData:gc()
	if p79 and p78.txCount == 0 then
		if p79.resetResultCache then
			p78:resetResultCache(p79.resetResultIdentities)
			return v80
		end
		if p79.resetResultIdentities then
			p78.storeReader:resetCanon()
		end
	end
	return v80
end
function v_u_33.retain(p81, p82, p83) -- name: retain
	if p83 then
		return p81.optimisticData:retain(p82)
	else
		return p81.data:retain(p82)
	end
end
function v_u_33.release(p84, p85, p86) -- name: release
	if p86 then
		return p84.optimisticData:release(p85)
	else
		return p84.data:release(p85)
	end
end
function v_u_33.identify(p87, p88) -- name: identify
	-- upvalues: (copy) v_u_17
	if v_u_17(p88) then
		return p88.__ref
	else
		return p87.policies:identify(p88)[1]
	end
end
function v_u_33.evict(p_u_89, p_u_90) -- name: evict
	-- upvalues: (copy) v_u_30, (copy) v_u_5
	if not p_u_90.id then
		if v_u_30(p_u_90, "id") then
			return false
		end
		p_u_90 = v_u_5.assign(table.clone(p_u_90), {
			["id"] = "ROOT_QUERY"
		})
	end
	local function v92()
		-- upvalues: (ref) p_u_89, (ref) p_u_90
		local v91 = p_u_89
		v91.txCount = v91.txCount + 1
		return p_u_89.optimisticData:evict(p_u_90)
	end
	local v93, v94 = pcall(v92)
	p_u_89.txCount = p_u_89.txCount - 1
	if p_u_89.txCount == 0 and p_u_90.broadcast ~= false then
		p_u_89:broadcastWatches()
	end
	if not v93 then
		error(v94)
	end
	return v94
end
function v_u_33.reset(p95) -- name: reset
	-- upvalues: (copy) v_u_31, (copy) v_u_9
	p95:init()
	p95:broadcastWatches()
	v_u_31:reset()
	return v_u_9.delay(0)
end
function v_u_33.removeOptimistic(p96, p97) -- name: removeOptimistic
	local v98 = p96.optimisticData:removeLayer(p97)
	if v98 ~= p96.optimisticData then
		p96.optimisticData = v98
		p96:broadcastWatches()
	end
end
function v_u_33.batch(p_u_99, p_u_100) -- name: batch
	-- upvalues: (copy) v_u_6, (copy) v_u_5
	local v101 = p_u_100.optimistic == nil and true or p_u_100.optimistic
	local v102 = p_u_100.removeOptimistic
	local v_u_103 = p_u_100.onWatchUpdated
	local function v114(p104) -- name: perform
		-- upvalues: (ref) p_u_99, (copy) p_u_100
		local v105 = p_u_99.data
		local v106 = p_u_99.optimisticData
		local v107 = p_u_99
		v107.txCount = v107.txCount + 1
		if p104 then
			p_u_99.optimisticData = p104
			p_u_99.data = p_u_99.optimisticData
		end
		local v108 = p_u_100.update
		local v109 = p_u_100
		local v110 = p_u_99
		local v111, v112 = pcall(v108, v109, v110)
		local v113 = p_u_99
		v113.txCount = v113.txCount - 1
		p_u_99.data = v105
		p_u_99.optimisticData = v106
		if not v111 then
			error(v112)
		end
	end
	local v_u_115 = v_u_6.new()
	if v_u_103 and p_u_99.txCount == 0 then
		p_u_99:broadcastWatches(v_u_5.assign(table.clone(p_u_100), {
			["onWatchUpdated"] = function(_, p116) -- name: onWatchUpdated
				-- upvalues: (copy) v_u_115
				v_u_115:add(p116)
				return false
			end
		}))
	end
	if typeof(v101) == "string" then
		p_u_99.optimisticData = p_u_99.optimisticData:addLayer(v101, v114)
	elseif v101 == false then
		v114(p_u_99.data)
	else
		v114()
	end
	if typeof(v102) == "string" then
		p_u_99.optimisticData = p_u_99.optimisticData:removeLayer(v102)
	end
	if v_u_103 and v_u_115.size > 0 then
		p_u_99:broadcastWatches(v_u_5.assign(table.clone(p_u_100), {
			["onWatchUpdated"] = function(p117, p118, p119) -- name: onWatchUpdated
				-- upvalues: (copy) v_u_103, (copy) v_u_115
				local v120 = v_u_103(p117, p118, p119)
				if v120 ~= false then
					v_u_115:delete(p118)
				end
				return v120
			end
		}))
		if v_u_115.size > 0 then
			v_u_115:forEach(function(p121)
				-- upvalues: (ref) p_u_99
				return p_u_99.maybeBroadcastWatch:dirty(p121)
			end)
		end
	else
		p_u_99:broadcastWatches(p_u_100)
	end
end
function v_u_33.performTransaction(p122, p_u_123, p124) -- name: performTransaction
	-- upvalues: (copy) v_u_8
	return p122:batch({
		["update"] = function(_, ...) -- name: update
			-- upvalues: (copy) p_u_123
			return p_u_123(...)
		end,
		["optimistic"] = p124 or p124 ~= v_u_8
	})
end
function v_u_33.transformDocument(p125, p126) -- name: transformDocument
	-- upvalues: (copy) v_u_16
	if not p125.addTypename then
		return p126
	end
	local v127 = p125.typenameDocumentCache:get(p126)
	if not v127 then
		v127 = v_u_16(p126)
		p125.typenameDocumentCache:set(p126, v127)
		p125.typenameDocumentCache:set(v127, v127)
	end
	return v127
end
function v_u_33.broadcastWatches(p_u_128, p_u_129) -- name: broadcastWatches
	if p_u_128.txCount == 0 then
		p_u_128.watches:forEach(function(p130)
			-- upvalues: (copy) p_u_128, (copy) p_u_129
			return p_u_128:maybeBroadcastWatch(p130, p_u_129)
		end)
	end
end
function v_u_33.broadcastWatch(p131, p132, p133) -- name: broadcastWatch
	-- upvalues: (copy) v_u_12
	local v134 = p132.lastDiff
	local v135 = p131:diff({
		["query"] = p132.query,
		["variables"] = p132.variables,
		["optimistic"] = p132.optimistic
	})
	if p133 then
		if p132.optimistic then
			local v136 = p133.optimistic
			if typeof(v136) == "string" then
				v135.fromOptimisticTransaction = true
			end
		end
		local v137 = p133.onWatchUpdated
		if v137 and v137(p131, p132, v135, v134) == false then
			return
		end
	end
	if not (v134 and v_u_12(v134.result, v135.result)) then
		p132.lastDiff = v135
		p132:callback(p132.lastDiff, v134)
	end
end
v10.InMemoryCache = v_u_33
return v10