-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.core.QueryInfo
local v1 = {}
local v2 = script.Parent.Parent
local v3 = v2.Parent
local v4 = require(v3.LuauPolyfill)
local v_u_5 = v4.Boolean
local v_u_6 = v4.clearTimeout
local v7 = v4.Map
local v_u_8 = v4.Object
local v_u_9 = v4.Set
local v_u_10 = v4.setTimeout
local v11 = v4.WeakMap
require(v3.GraphQL)
local v_u_12 = require(v2.jsutils.equal)
require(v2.cache)
require(script.Parent.watchQueryOptions_types)
require(script.Parent.ObservableQuery_types)
require(script.Parent.Parent.link.core)
local v13 = require(script.Parent.Parent.utilities)
local v_u_14 = v13.isNonEmptyArray
local v_u_15 = v13.graphQLResultHasError
local v16 = v13.canUseWeakMap
local v17 = require(script.Parent.networkStatus)
local v_u_18 = v17.NetworkStatus
local v_u_19 = v17.isNetworkRequestInFlight
require(script.Parent.Parent.errors)
local v_u_20 = {
	["FORBID"] = 0,
	["OVERWRITE"] = 1,
	["MERGE"] = 2
}
v1.CacheWriteBehavior = v_u_20
local v_u_21
if v16 then
	v_u_21 = v11.new()
else
	v_u_21 = v7.new(nil)
end
local v_u_22 = {}
v_u_22.__index = v_u_22
function v_u_22.new(p_u_23) -- name: new
	-- upvalues: (copy) v_u_9, (copy) v_u_21, (copy) v_u_22
	local v24 = {
		["listeners"] = v_u_9.new(),
		["document"] = nil,
		["lastRequestId"] = 1,
		["subscriptions"] = v_u_9.new(),
		["stopped"] = false,
		["cache"] = p_u_23,
		["dirty"] = false,
		["observableQuery"] = nil
	}
	if not v_u_21:has(p_u_23) then
		v_u_21:set(p_u_23, 0)
		local v_u_25 = p_u_23.evict
		if typeof(v_u_25) == "function" then
			function p_u_23.evict(...)
				-- upvalues: (ref) v_u_21, (copy) p_u_23, (copy) v_u_25
				v_u_21:set(p_u_23, (v_u_21:get(p_u_23) + 1) % 1000000000000000)
				return v_u_25(...)
			end
		end
		local v_u_26 = p_u_23.modify
		if typeof(v_u_26) == "function" then
			function p_u_23.modify(...)
				-- upvalues: (ref) v_u_21, (copy) p_u_23, (copy) v_u_26
				v_u_21:set(p_u_23, (v_u_21:get(p_u_23) + 1) % 1000000000000000)
				return v_u_26(...)
			end
		end
		local v_u_27 = p_u_23.reset
		if typeof(v_u_27) == "function" then
			function p_u_23.reset(...)
				-- upvalues: (ref) v_u_21, (copy) p_u_23, (copy) v_u_27
				v_u_21:set(p_u_23, (v_u_21:get(p_u_23) + 1) % 1000000000000000)
				return v_u_27(...)
			end
		end
	end
	local v28 = v_u_22
	return setmetatable(v24, v28)
end
function v_u_22.init(p29, p30) -- name: init
	-- upvalues: (copy) v_u_5, (copy) v_u_18, (copy) v_u_12, (copy) v_u_8
	local v31 = v_u_5.toJSBoolean(p30.networkStatus) and p30.networkStatus or v_u_18.loading
	if v_u_5.toJSBoolean(p29.variables) and (p29.networkStatus ~= v_u_18.loading and not v_u_12(p29.variables, p30.variables)) then
		v31 = v_u_18.setVariables
	end
	if not v_u_12(p30.variables, p29.variables) then
		p29.lastDiff = nil
	end
	v_u_8.assign(p29, {
		["document"] = p30.document,
		["variables"] = p30.variables,
		["networkError"] = v_u_8.None,
		["graphQLErrors"] = v_u_5.toJSBoolean(p29.graphQLErrors) and (p29.graphQLErrors or {}) or {},
		["networkStatus"] = v31
	})
	if v_u_5.toJSBoolean(p30.observableQuery) then
		p29:setObservableQuery(p30.observableQuery)
	end
	if v_u_5.toJSBoolean(p30.lastRequestId) then
		p29.lastRequestId = p30.lastRequestId
	end
	return p29
end
function v_u_22.reset(p32) -- name: reset
	-- upvalues: (copy) v_u_5, (copy) v_u_6
	if v_u_5.toJSBoolean(p32.notifyTimeout) then
		v_u_6(p32.notifyTimeout)
		p32.notifyTimeout = nil
	end
	p32.lastDiff = nil
	p32.dirty = false
end
function v_u_22.getDiff(p33, p34) -- name: getDiff
	-- upvalues: (copy) v_u_5, (copy) v_u_12
	if p34 == nil then
		p34 = p33.variables
	end
	local v35 = p33:getDiffOptions(p34)
	if v_u_5.toJSBoolean(p33.lastDiff) and v_u_12(v35, p33.lastDiff.options) then
		return p33.lastDiff.diff
	end
	p33.variables = p34
	p33:updateWatch(p33.variables)
	local v36 = p33.observableQuery
	if v_u_5.toJSBoolean(v36) and v36.options.fetchPolicy == "no-cache" then
		return {
			["complete"] = false
		}
	end
	local v37 = p33.cache:diff(v35)
	p33:updateLastDiff(v37, v35)
	return v37
end
function v_u_22.updateLastDiff(p38, p39, p40) -- name: updateLastDiff
	-- upvalues: (copy) v_u_5
	p38.lastDiff = v_u_5.toJSBoolean(p39) and ({
		["diff"] = p39,
		["options"] = v_u_5.toJSBoolean(p40) and p40 and p40 or p38:getDiffOptions()
	} or nil) or nil
end
function v_u_22.getDiffOptions(p41, p42) -- name: getDiffOptions
	-- upvalues: (copy) v_u_5
	if p42 == nil then
		p42 = p41.variables
	end
	local v43 = p41.observableQuery
	return {
		["query"] = nil,
		["variables"] = nil,
		["returnPartialData"] = true,
		["optimistic"] = true,
		["canonizeResults"] = nil,
		["query"] = p41.document,
		["variables"] = p42,
		["canonizeResults"] = not v_u_5.toJSBoolean(v43) or v43.options.canonizeResults ~= false
	}
end
function v_u_22.setDiff(p_u_44, p45) -- name: setDiff
	-- upvalues: (copy) v_u_5, (copy) v_u_12, (copy) v_u_10
	local v46
	if v_u_5.toJSBoolean(p_u_44.lastDiff) then
		v46 = p_u_44.lastDiff.diff
	else
		v46 = p_u_44.lastDiff
	end
	p_u_44:updateLastDiff(p45)
	if v_u_5.toJSBoolean(v46) then
		v46 = v46.result
	end
	if v_u_5.toJSBoolean(p45) then
		p45 = p45.result
	end
	if not (p_u_44.dirty or v_u_12(v46, p45)) then
		p_u_44.dirty = true
		if not v_u_5.toJSBoolean(p_u_44.notifyTimeout) then
			p_u_44.notifyTimeout = v_u_10(function()
				-- upvalues: (copy) p_u_44
				return p_u_44:notify()
			end, 0)
		end
	end
end
function v_u_22.setObservableQuery(p_u_47, p_u_48) -- name: setObservableQuery
	-- upvalues: (copy) v_u_5
	if p_u_48 == p_u_47.observableQuery then
		return
	else
		if v_u_5.toJSBoolean(p_u_47.oqListener) then
			p_u_47.listeners:delete(p_u_47.oqListener)
		end
		p_u_47.observableQuery = p_u_48
		if v_u_5.toJSBoolean(p_u_48) and p_u_48 ~= nil then
			p_u_48.queryInfo = p_u_47
			function p_u_47.oqListener()
				-- upvalues: (ref) v_u_5, (copy) p_u_47, (copy) p_u_48
				if v_u_5.toJSBoolean(p_u_47:getDiff().fromOptimisticTransaction) then
					p_u_48.observe(p_u_48)
				else
					p_u_48:reobserve()
				end
			end
			p_u_47.listeners:add(p_u_47.oqListener)
		else
			p_u_47.oqListener = nil
		end
	end
end
function v_u_22.notify(p_u_49) -- name: notify
	-- upvalues: (copy) v_u_5, (copy) v_u_6
	if v_u_5.toJSBoolean(p_u_49.notifyTimeout) then
		v_u_6(p_u_49.notifyTimeout)
		p_u_49.notifyTimeout = nil
	end
	if p_u_49:shouldNotify() then
		p_u_49.listeners:forEach(function(p50)
			-- upvalues: (copy) p_u_49
			return p50(p_u_49)
		end)
	end
	p_u_49.dirty = false
end
function v_u_22.shouldNotify(p51) -- name: shouldNotify
	-- upvalues: (copy) v_u_5, (copy) v_u_19
	if not (p51.dirty and v_u_5.toJSBoolean(p51.listeners.size)) then
		return false
	end
	if v_u_19(p51.networkStatus) and v_u_5.toJSBoolean(p51.observableQuery) then
		local v52 = p51.observableQuery.options.fetchPolicy
		if v52 ~= "cache-only" and v52 ~= "cache-and-network" then
			return false
		end
	end
	return true
end
function v_u_22.stop(p53) -- name: stop
	-- upvalues: (copy) v_u_22, (copy) v_u_5
	if not p53.stopped then
		p53.stopped = true
		p53:reset()
		p53:cancel()
		p53.cancel = v_u_22.cancel
		p53.subscriptions:forEach(function(p54)
			return p54:unsubscribe()
		end)
		local v55 = p53.observableQuery
		if v_u_5.toJSBoolean(v55) then
			v55:stopPolling()
		end
	end
end
function v_u_22.cancel(_) -- name: cancel end
function v_u_22.updateWatch(p_u_56, p57) -- name: updateWatch
	-- upvalues: (copy) v_u_5, (copy) v_u_8, (copy) v_u_12
	if p57 == nil then
		p57 = p_u_56.variables
	end
	local v58 = p_u_56.observableQuery
	if not v_u_5.toJSBoolean(v58) or v58.options.fetchPolicy ~= "no-cache" then
		local v60 = v_u_8.assign({}, p_u_56:getDiffOptions(p57), {
			["watcher"] = p_u_56,
			["callback"] = function(_, p59) -- name: callback
				-- upvalues: (copy) p_u_56
				return p_u_56:setDiff(p59)
			end
		})
		local v61 = v_u_8.assign({}, v60, {
			["callback"] = v_u_8.None
		})
		local v62 = v_u_8.assign({}, p_u_56.lastWatch, {
			["callback"] = v_u_8.None
		})
		if not (v_u_5.toJSBoolean(p_u_56.lastWatch) and v_u_12(v61, v62)) then
			p_u_56:cancel()
			p_u_56.lastWatch = v60
			p_u_56.cancel = p_u_56.cache:watch(p_u_56.lastWatch)
		end
	end
end
function v_u_22.resetLastWrite(p63) -- name: resetLastWrite
	p63.lastWrite = nil
end
function v_u_22.shouldWrite(p64, p65, p66) -- name: shouldWrite
	-- upvalues: (copy) v_u_5, (copy) v_u_21, (copy) v_u_12
	local v67 = p64.lastWrite
	local v68 = v_u_5.toJSBoolean(v67) and (v67.dmCount == v_u_21:get(p64.cache) and v_u_12(p66, v67.variables))
	if v68 then
		v68 = v_u_12(p65.data, v67.result.data)
	end
	return not v68
end
local v_u_69 = nil
function v_u_22.markResult(p_u_70, p_u_71, p_u_72, p_u_73) -- name: markResult
	-- upvalues: (copy) v_u_14, (copy) v_u_20, (ref) v_u_69, (copy) v_u_21, (copy) v_u_5
	if v_u_14(p_u_71.errors) then
		p_u_70.graphQLErrors = p_u_71.errors
	else
		p_u_70.graphQLErrors = {}
	end
	p_u_70:reset()
	if p_u_72.fetchPolicy == "no-cache" then
		p_u_70:updateLastDiff({
			["result"] = nil,
			["complete"] = true,
			["result"] = p_u_71.data
		}, p_u_70:getDiffOptions(p_u_72.variables))
	elseif p_u_73 ~= v_u_20.FORBID then
		if v_u_69(p_u_71, p_u_72.errorPolicy) then
			p_u_70.cache:performTransaction(function(p74)
				-- upvalues: (copy) p_u_70, (copy) p_u_71, (copy) p_u_72, (copy) p_u_73, (ref) v_u_20, (ref) v_u_21, (ref) v_u_5
				if p_u_70:shouldWrite(p_u_71, p_u_72.variables) then
					p74:writeQuery({
						["query"] = p_u_70.document,
						["data"] = p_u_71.data,
						["variables"] = p_u_72.variables,
						["overwrite"] = p_u_73 == v_u_20.OVERWRITE
					})
					p_u_70.lastWrite = {
						["result"] = p_u_71,
						["variables"] = p_u_72.variables,
						["dmCount"] = v_u_21:get(p_u_70.cache)
					}
				elseif v_u_5.toJSBoolean(p_u_70.lastDiff) and v_u_5.toJSBoolean(p_u_70.lastDiff.diff.complete) then
					p_u_71.data = p_u_70.lastDiff.diff.result
					return
				end
				local v75 = p_u_70:getDiffOptions(p_u_72.variables)
				local v76 = p74:diff(v75)
				if not p_u_70.stopped then
					p_u_70:updateWatch(p_u_72.variables)
				end
				p_u_70:updateLastDiff(v76, v75)
				if v_u_5.toJSBoolean(v76.complete) then
					p_u_71.data = v76.result
				end
			end)
			return
		end
		p_u_70.lastWrite = nil
	end
end
function v_u_22.markReady(p77) -- name: markReady
	-- upvalues: (copy) v_u_18
	p77.networkError = nil
	p77.networkStatus = v_u_18.ready
	return p77.networkStatus
end
function v_u_22.markError(p78, p79) -- name: markError
	-- upvalues: (copy) v_u_18, (copy) v_u_5
	p78.networkStatus = v_u_18.error
	p78.lastWrite = nil
	p78:reset()
	if v_u_5.toJSBoolean(p79.graphQLErrors) then
		p78.graphQLErrors = p79.graphQLErrors
	end
	if v_u_5.toJSBoolean(p79.networkError) then
		p78.networkError = p79.networkError
	end
	return p79
end
v1.QueryInfo = v_u_22
v_u_69 = function(p80, p81) -- name: shouldWriteResult
	-- upvalues: (copy) v_u_15, (copy) v_u_5
	local v82 = p81 == nil and "none" or p81
	local v83 = v82 == "ignore" and true or v82 == "all"
	local v84 = not v_u_15(p80)
	return not v84 and (v83 and v_u_5.toJSBoolean(p80.data)) and true or v84
end
v1.shouldWriteResult = v_u_69
return v1