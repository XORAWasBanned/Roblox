-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.core.ObservableQuery
local v1 = script.Parent.Parent
local v2 = v1.Parent
local v3 = {}
local v4 = require(v2.LuauPolyfill)
local v_u_5 = v4.Boolean
local v_u_6 = v4.Object
local v_u_7 = v4.Set
local v_u_8 = v4.setTimeout
local v_u_9 = v4.clearTimeout
local v_u_10 = require(v1.luaUtils.isCallable)
local v_u_11 = require(v2.Promise)
local v_u_12 = require(v1.jsutils.invariant).invariant
local v_u_13 = require(v1.jsutils.equal)
local v14 = require(script.Parent.networkStatus)
local v_u_15 = v14.NetworkStatus
local v_u_16 = v14.isNetworkRequestInFlight
local v17 = require(script.Parent.Parent.utilities)
local v_u_18 = v17.compact
local v_u_19 = v17.cloneDeep
local v_u_20 = v17.getOperationDefinition
local v_u_21 = v17.Observable
local v_u_22 = v17.iterateObserversSafely
local v_u_23 = v17.isNonEmptyArray
local v24 = v17.fixObservableSubclass
local v_u_25 = require(script.Parent.Parent.errors).ApolloError
require(script.Parent.types)
require(script.Parent.watchQueryOptions_types)
require(script.Parent.QueryInfo)
require(script.Parent.ObservableQuery_types)
local v_u_26 = nil
local v_u_27 = false
local v_u_28 = setmetatable({}, {
	["__index"] = v_u_21
})
function v_u_28.__index(p29, p30)
	-- upvalues: (copy) v_u_28
	if p30 == "variables" then
		return p29.options.variables
	elseif rawget(p29, p30) then
		return rawget(p29, p30)
	else
		local v31 = v_u_28
		if rawget(v31, p30) then
			local v32 = v_u_28
			return rawget(v32, p30)
		else
			local v33 = v_u_28
			return getmetatable(v33).__index[p30]
		end
	end
end
function v_u_28.__newindex(p34, p35, p36)
	if p35 == "variables" then
		error("setting getter-only property \'variables\'")
	end
	rawset(p34, p35, p36)
end
function v_u_28.new(p37) -- name: new
	-- upvalues: (copy) v_u_21, (copy) v_u_5, (ref) v_u_26, (copy) v_u_28, (copy) v_u_7, (copy) v_u_22, (copy) v_u_6, (copy) v_u_15, (copy) v_u_20
	local v38 = p37.queryManager
	local v39 = p37.queryInfo
	local v40 = p37.options
	local v_u_41 = nil
	local v46 = v_u_21.new(function(p_u_42)
		-- upvalues: (ref) v_u_5, (ref) v_u_26, (ref) v_u_41
		local function v44()
			-- upvalues: (copy) p_u_42, (ref) v_u_5, (ref) v_u_26
			local v43 = p_u_42._subscription._observer
			if v_u_5.toJSBoolean(v43) and not v_u_5.toJSBoolean(v43.error) then
				v43.error = v_u_26
			end
		end
		xpcall(v44, function() end)
		local v45 = not v_u_5.toJSBoolean(v_u_41.observers.size)
		v_u_41.observers:add(p_u_42)
		if v_u_5.toJSBoolean(v_u_41.lastError) then
			if v_u_5.toJSBoolean(p_u_42.error) then
				p_u_42:error(v_u_41.lastError)
			end
		elseif v_u_5.toJSBoolean(v_u_41.lastResult) and v_u_5.toJSBoolean(p_u_42.next) then
			p_u_42:next(v_u_41.lastResult)
		end
		if v45 then
			v_u_41:reobserve():catch(function() end)
		end
		return function()
			-- upvalues: (ref) v_u_41, (copy) p_u_42, (ref) v_u_5
			if v_u_41.observers:delete(p_u_42) and not v_u_5.toJSBoolean(v_u_41.observers.size) then
				v_u_41:tearDownQuery()
			end
		end
	end)
	local v47 = v_u_28
	v_u_41 = setmetatable(v46, v47)
	v_u_41.observers = v_u_7.new()
	v_u_41.subscriptions = v_u_7.new()
	v_u_41.observer = {
		["next"] = function(_, p48) -- name: next
			-- upvalues: (ref) v_u_5, (ref) v_u_41, (ref) v_u_22
			if v_u_5.toJSBoolean(v_u_41.lastError) or v_u_41:isDifferentFromLastResult(p48) then
				v_u_41:updateLastResult(p48)
				v_u_22(v_u_41.observers, "next", p48)
			end
		end,
		["error"] = function(_, p49)
			-- upvalues: (ref) v_u_41, (ref) v_u_6, (ref) v_u_15, (ref) v_u_22
			v_u_41:updateLastResult((v_u_6.assign({}, v_u_41.lastResult, {
				["error"] = p49,
				["errors"] = p49.graphQLErrors,
				["networkStatus"] = v_u_15.error,
				["loading"] = false
			})))
			v_u_41.lastError = p49
			v_u_22(v_u_41.observers, "error", v_u_41.lastError)
		end
	}
	v_u_41.isTornDown = false
	v_u_41.options = v40
	v_u_41.queryId = v38:generateQueryId()
	local v50 = v_u_20(v40.query)
	if v_u_5.toJSBoolean(v50) then
		if v_u_5.toJSBoolean(v50.name) then
			v_u_41.queryName = v50.name.value
		else
			v_u_41.queryName = v50.name
		end
	else
		v_u_41.queryName = v50
	end
	v_u_41.initialFetchPolicy = v_u_5.toJSBoolean(v40.fetchPolicy) and v40.fetchPolicy or "cache-first"
	v_u_41.queryManager = v38
	v_u_41.queryInfo = v39
	return v_u_41
end
function v_u_28.result(p_u_51) -- name: result
	-- upvalues: (copy) v_u_11, (copy) v_u_5, (copy) v_u_8
	return v_u_11.new(function(p_u_52, p_u_53)
		-- upvalues: (copy) p_u_51, (ref) v_u_5, (ref) v_u_8
		local v_u_54 = nil
		local v_u_55 = nil
		v_u_55 = {
			["next"] = function(_, p56) -- name: next
				-- upvalues: (copy) p_u_52, (ref) p_u_51, (ref) v_u_55, (ref) v_u_5, (ref) v_u_8, (ref) v_u_54
				p_u_52(p56)
				p_u_51.observers:delete(v_u_55)
				if not v_u_5.toJSBoolean(p_u_51.observers.size) then
					p_u_51.queryManager:removeQuery(p_u_51.queryId)
				end
				v_u_8(function()
					-- upvalues: (ref) v_u_54
					v_u_54:unsubscribe()
				end, 0)
			end,
			["error"] = function(_, p57)
				-- upvalues: (copy) p_u_53
				p_u_53(p57)
			end
		}
		v_u_54 = p_u_51:subscribe(v_u_55)
	end)
end
function v_u_28.getCurrentResult(p58, p59) -- name: getCurrentResult
	-- upvalues: (copy) v_u_5, (copy) v_u_15, (copy) v_u_6, (copy) v_u_16, (copy) v_u_25
	local v60 = p59 == nil and true or p59
	local v61 = p58.lastResult
	local v62 = p58.options.fetchPolicy == nil and "cache-first" or p58.options.fetchPolicy
	local v63
	if v_u_5.toJSBoolean(p58.queryInfo.networkStatus) then
		v63 = p58.queryInfo.networkStatus
	elseif v_u_5.toJSBoolean(v61) and v_u_5.toJSBoolean(v61.networkStatus) then
		v63 = v61.networkStatus
	else
		v63 = v_u_15.ready
	end
	local v64 = v_u_6.assign({}, v61, {
		["loading"] = v_u_16(v63),
		["networkStatus"] = v63
	})
	if not p58.queryManager:transform(p58.options.query).hasForcedResolvers then
		local v65 = p58.queryInfo:getDiff()
		if v_u_5.toJSBoolean(v65.complete) or v_u_5.toJSBoolean(p58.options.returnPartialData) then
			v64.data = v65.result
		else
			v64.data = nil
		end
		if v_u_5.toJSBoolean(v65.complete) then
			if v64.networkStatus == v_u_15.loading and (v62 == "cache-first" or v62 == "cache-only") then
				v64.networkStatus = v_u_15.ready
				v64.loading = false
			end
			v64.partial = nil
		elseif v62 ~= "no-cache" then
			v64.partial = true
		end
		if not (v_u_5.toJSBoolean(v65.complete) or (v_u_5.toJSBoolean(p58.options.partialRefetch) or (v_u_5.toJSBoolean(v64.loading) or (v_u_5.toJSBoolean(v64.data) or v_u_5.toJSBoolean(v64.error))))) then
			v64.error = v_u_25.new({
				["clientErrors"] = v65.missing
			})
		end
	end
	if v60 then
		p58:updateLastResult(v64)
	end
	return v64
end
function v_u_28.isDifferentFromLastResult(p66, p67) -- name: isDifferentFromLastResult
	-- upvalues: (copy) v_u_13
	return not v_u_13(p66.lastResultSnapshot, p67)
end
function v_u_28.getLastResult(p68) -- name: getLastResult
	return p68.lastResult
end
function v_u_28.getLastError(p69) -- name: getLastError
	return p69.lastError
end
function v_u_28.resetLastResults(p70) -- name: resetLastResults
	p70.lastResult = nil
	p70.lastResultSnapshot = nil
	p70.lastError = nil
	p70.isTornDown = false
end
function v_u_28.resetQueryStoreErrors(p71) -- name: resetQueryStoreErrors
	p71.queryManager:resetErrors(p71.queryId)
end
function v_u_28.refetch(p72, p73) -- name: refetch
	-- upvalues: (copy) v_u_5, (copy) v_u_13, (copy) v_u_6, (copy) v_u_15
	local v74 = {
		["pollInterval"] = 0
	}
	local v75 = p72.options.fetchPolicy
	if v75 == "no-cache" then
		v74.fetchPolicy = "no-cache"
	elseif v75 ~= "cache-and-network" then
		v74.fetchPolicy = "network-only"
	end
	if v_u_5.toJSBoolean(p73) and not v_u_13(p72.options.variables, p73) then
		p72.options.variables = v_u_6.assign({}, p72.options.variables, p73)
		v74.variables = p72.options.variables
	end
	p72.queryInfo:resetLastWrite()
	return p72:reobserve(v74, v_u_15.refetch)
end
function v_u_28.fetchMore(p_u_76, p_u_77) -- name: fetchMore
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_15, (ref) v_u_27, (copy) v_u_12
	local v78 = v_u_6.assign
	local v79 = {}
	local v80
	if v_u_5.toJSBoolean(p_u_77.query) then
		v80 = p_u_77
	else
		v80 = v_u_6.assign({}, p_u_76.options, p_u_77, {
			["variables"] = v_u_6.assign({}, p_u_76.options.variables, p_u_77.variables)
		})
	end
	local v_u_81 = v78(v79, v80, {
		["fetchPolicy"] = "no-cache"
	})
	local v_u_82 = p_u_76.queryManager:generateQueryId()
	if v_u_5.toJSBoolean(v_u_81.notifyOnNetworkStatusChange) then
		p_u_76.queryInfo.networkStatus = v_u_15.fetchMore
		p_u_76:observe()
	end
	return p_u_76.queryManager:fetchQuery(v_u_82, v_u_81, v_u_15.fetchMore):andThen(function(p83)
		-- upvalues: (copy) p_u_77, (ref) v_u_5, (ref) v_u_27, (ref) v_u_12, (copy) p_u_76, (copy) v_u_81
		local v_u_84 = p83.data
		local v_u_85 = p_u_77.updateQuery
		if not v_u_5.toJSBoolean(v_u_85) then
			p_u_76.queryManager.cache:writeQuery({
				["query"] = v_u_81.query,
				["variables"] = v_u_81.variables,
				["data"] = v_u_84
			})
			return p83
		end
		if _G.__DEV__ and not (v_u_27 and _G.__WARNED_ABOUT_OBSERVABLE_QUERY_UPDATE_QUERY__) then
			v_u_12.warn("The updateQuery callback for fetchMore is deprecated, and will be removed\nin the next major version of Apollo Client.\n\nPlease convert updateQuery functions to field policies with appropriate\nread and merge functions, or use/adapt a helper function (such as\nconcatPagination, offsetLimitPagination, or relayStylePagination) from\n@apollo/client/utilities.\n\nThe field policy system handles pagination more effectively than a\nhand-written updateQuery function, and you only need to define the policy\nonce, rather than every time you call fetchMore.")
			v_u_27 = true
			_G.__WARNED_ABOUT_OBSERVABLE_QUERY_UPDATE_QUERY__ = v_u_27
		end
		p_u_76:updateQuery(function(p86)
			-- upvalues: (copy) v_u_85, (ref) p_u_77, (copy) v_u_84, (ref) v_u_81
			return v_u_85(p_u_77, p86, {
				["fetchMoreResult"] = v_u_84,
				["variables"] = v_u_81.variables
			})
		end)
		return p83
	end):andThen(function(p87)
		-- upvalues: (copy) p_u_76, (copy) v_u_82
		p_u_76.queryManager:stopQuery(v_u_82)
		p_u_76:reobserve()
		return p87
	end):catch(function(p88)
		-- upvalues: (copy) p_u_76, (copy) v_u_82
		p_u_76.queryManager:stopQuery(v_u_82)
		p_u_76:reobserve()
		error(p88)
	end)
end
function v_u_28.subscribeToMore(p_u_89, p_u_90) -- name: subscribeToMore
	-- upvalues: (copy) v_u_5, (copy) v_u_12
	local v_u_96 = p_u_89.queryManager:startGraphQLSubscription({
		["query"] = p_u_90.document,
		["variables"] = p_u_90.variables,
		["context"] = p_u_90.context
	}):subscribe({
		["next"] = function(_, p_u_91) -- name: next
			-- upvalues: (copy) p_u_90, (ref) v_u_5, (copy) p_u_89
			local v_u_92 = p_u_90.updateQuery
			if v_u_5.toJSBoolean(v_u_92) then
				p_u_89:updateQuery(function(p93, p94)
					-- upvalues: (copy) v_u_92, (copy) p_u_91
					return v_u_92(p93, {
						["subscriptionData"] = p_u_91,
						["variables"] = p94.variables
					})
				end)
			end
		end,
		["error"] = function(_, p95) -- name: error
			-- upvalues: (ref) v_u_5, (copy) p_u_90, (ref) v_u_12
			if v_u_5.toJSBoolean(p_u_90.onError) then
				p_u_90:onError(p95)
			else
				v_u_12.error("Unhandled GraphQL subscription error", p95)
			end
		end
	})
	p_u_89.subscriptions:add(v_u_96)
	return function()
		-- upvalues: (ref) v_u_5, (copy) p_u_89, (copy) v_u_96
		if v_u_5.toJSBoolean(p_u_89.subscriptions:delete(v_u_96)) then
			v_u_96:unsubscribe()
		end
	end
end
function v_u_28.setOptions(p97, p98) -- name: setOptions
	return p97:reobserve(p98)
end
function v_u_28.setVariables(p99, p100) -- name: setVariables
	-- upvalues: (copy) v_u_13, (copy) v_u_5, (copy) v_u_11, (copy) v_u_15
	if v_u_13(p99.variables, p100) then
		if v_u_5.toJSBoolean(p99.observers.size) then
			return p99:result()
		else
			return v_u_11.resolve()
		end
	else
		p99.options.variables = p100
		if v_u_5.toJSBoolean(p99.observers.size) then
			return p99:reobserve({
				["fetchPolicy"] = p99.initialFetchPolicy,
				["variables"] = p100
			}, v_u_15.setVariables)
		else
			return v_u_11.resolve()
		end
	end
end
function v_u_28.updateQuery(p101, p102) -- name: updateQuery
	-- upvalues: (copy) v_u_5
	local v103 = p101.queryManager
	local v104 = v103.cache
	local v105 = {
		["query"] = nil,
		["variables"] = nil,
		["previousResult"] = nil,
		["returnPartialData"] = true,
		["optimistic"] = false,
		["query"] = p101.options.query,
		["variables"] = p101.variables
	}
	local v106
	if v_u_5.toJSBoolean(p101.lastResult) then
		v106 = p101.lastResult.data or nil
	else
		v106 = nil
	end
	v105.previousResult = v106
	local v107 = p102(v104:diff(v105).result, {
		["variables"] = p101.variables
	})
	if v_u_5.toJSBoolean(v107) then
		v103.cache:writeQuery({
			["query"] = p101.options.query,
			["data"] = v107,
			["variables"] = p101.variables
		})
		v103:broadcastQueries()
	end
end
function v_u_28.startPolling(p108, p109) -- name: startPolling
	p108.options.pollInterval = p109
	p108:updatePolling()
end
function v_u_28.stopPolling(p110) -- name: stopPolling
	p110.options.pollInterval = 0
	p110:updatePolling()
end
function v_u_28.fetch(p111, p112, p113) -- name: fetch
	p111.queryManager:setObservableQuery(p111)
	return p111.queryManager:fetchQueryObservable(p111.queryId, p112, p113)
end
function v_u_28.updatePolling(p_u_114) -- name: updatePolling
	-- upvalues: (copy) v_u_5, (copy) v_u_9, (copy) v_u_12, (copy) v_u_16, (copy) v_u_15, (copy) v_u_8
	local v_u_115 = nil
	if v_u_5.toJSBoolean(p_u_114.queryManager.ssrMode) then
		return
	else
		local v116 = p_u_114.pollingInfo
		local v117 = p_u_114.options.pollInterval
		if v_u_5.toJSBoolean(v117) then
			if not v_u_5.toJSBoolean(v116) or v116.interval ~= v117 then
				v_u_12(v117, "Attempted to start a polling query without a polling interval.")
				if not (v_u_5.toJSBoolean(v116) and v116) then
					p_u_114.pollingInfo = {}
					v116 = p_u_114.pollingInfo
				end
				v116.interval = v117
				local function v_u_118() -- name: maybeFetch
					-- upvalues: (ref) v_u_5, (copy) p_u_114, (ref) v_u_16, (ref) v_u_15, (ref) v_u_115
					if v_u_5.toJSBoolean(p_u_114.pollingInfo) then
						if not v_u_16(p_u_114.queryInfo.networkStatus) then
							p_u_114:reobserve({
								["fetchPolicy"] = "network-only"
							}, v_u_15.poll):andThen(v_u_115, v_u_115)
							return
						end
						v_u_115()
					end
				end
				local function v120() -- name: poll
					-- upvalues: (copy) p_u_114, (ref) v_u_5, (ref) v_u_9, (ref) v_u_8, (copy) v_u_118
					local v119 = p_u_114.pollingInfo
					if v_u_5.toJSBoolean(v119) then
						if v119.timeout then
							v_u_9(v119.timeout)
						end
						v119.timeout = v_u_8(v_u_118, v119.interval)
					end
				end
				v120()
			end
		else
			if v_u_5.toJSBoolean(v116) then
				v_u_9(v116.timeout)
				p_u_114.pollingInfo = nil
			end
			return
		end
	end
end
function v_u_28.updateLastResult(p121, p122) -- name: updateLastResult
	-- upvalues: (copy) v_u_5, (copy) v_u_19, (copy) v_u_23
	local v123 = p121.lastResult
	p121.lastResult = p122
	if v_u_5.toJSBoolean(p121.queryManager.assumeImmutableResults) then
		p121.lastResultSnapshot = p122
	else
		p121.lastResultSnapshot = v_u_19(p122)
	end
	if not v_u_23(p122.errors) then
		p121.lastError = nil
	end
	return v123
end
function v_u_28.reobserve(p124, p125, p126) -- name: reobserve
	-- upvalues: (copy) v_u_15, (copy) v_u_18, (copy) v_u_6, (copy) v_u_5, (copy) v_u_13
	p124.isTornDown = false
	local v127 = (p126 == v_u_15.refetch or p126 == v_u_15.fetchMore) and true or p126 == v_u_15.poll
	local v128 = p124.options.variables
	local v129
	if v127 then
		v129 = v_u_18(p124.options, p125)
	else
		v129 = v_u_6.assign(p124.options, v_u_18(p125))
	end
	if not v127 then
		p124:updatePolling()
		if p125 ~= nil and (v_u_5.toJSBoolean(p125.variables) and not (v_u_5.toJSBoolean(p125.fetchPolicy) or v_u_13(p125.variables, v128))) then
			v129.fetchPolicy = p124.initialFetchPolicy
			if p126 == nil then
				p126 = v_u_15.setVariables
			end
		end
	end
	local v130 = p124:fetch(v129, p126)
	if not v127 then
		if p124.concast then
			p124.concast:removeObserver(p124.observer, true)
		end
		p124.concast = v130
	end
	v130:addObserver(p124.observer)
	return v130.promise
end
function v_u_28.observe(p131) -- name: observe
	p131.observer:next(p131:getCurrentResult(false))
end
function v_u_28.hasObservers(p132) -- name: hasObservers
	return p132.observers.size > 0
end
function v_u_28.tearDownQuery(p133) -- name: tearDownQuery
	-- upvalues: (copy) v_u_5
	if not v_u_5.toJSBoolean(p133.isTornDown) then
		if v_u_5.toJSBoolean(p133.concast) then
			p133.concast:removeObserver(p133.observer)
			p133.concast = nil
		end
		p133:stopPolling()
		p133.subscriptions:forEach(function(p134)
			return p134:unsubscribe()
		end)
		p133.subscriptions:clear()
		p133.queryManager:stopQuery(p133.queryId)
		p133.observers:clear()
		p133.isTornDown = true
	end
end
v24(v_u_28)
v3.ObservableQuery = v_u_28
v_u_26 = function(_, p135) -- name: defaultSubscriptionObserverErrorCallback
	-- upvalues: (copy) v_u_12
	v_u_12.error("Unhandled error", p135.message, p135.stack)
end
function v3.applyNextFetchPolicy(p136) -- name: applyNextFetchPolicy
	-- upvalues: (copy) v_u_5, (copy) v_u_10
	local v137 = p136.fetchPolicy == nil and "cache-first" or p136.fetchPolicy
	local v138 = p136.nextFetchPolicy
	if v_u_5.toJSBoolean(v138) then
		if v_u_10(v138) then
			p136.fetchPolicy = v138(p136, v137)
			return
		end
		p136.fetchPolicy = v138
	end
end
return v3