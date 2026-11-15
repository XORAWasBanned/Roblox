-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.react.data.QueryData
local v1 = {}
local v2 = script.Parent.Parent.Parent
local v3 = v2.Parent
local v_u_4 = require(v3.Promise)
local v5 = require(v3.LuauPolyfill)
local v_u_6 = v5.Boolean
local v_u_7 = v5.Object
local v_u_8 = require(v2.luaUtils.hasOwnProperty)
local v_u_9 = require(v2.jsutils.equal)
local v_u_10 = require(v2.errors).ApolloError
local v_u_11 = require(script.Parent.Parent.Parent.core).NetworkStatus
require(v2.utilities)
local v_u_12 = require(script.Parent.Parent.parser).DocumentType
require(script.Parent.Parent.types.types)
local v_u_13 = require(script.Parent.OperationData).OperationData
local v_u_14 = setmetatable({}, {
	["__index"] = v_u_13
})
v_u_14.__index = v_u_14
function v_u_14.new(p15) -- name: new
	-- upvalues: (copy) v_u_13, (copy) v_u_6, (copy) v_u_14
	local v16 = p15.options
	local v17 = p15.context
	local v18 = p15.onNewData
	local v_u_19 = v_u_13.new(v16, v17)
	v_u_19.runLazy = false
	v_u_19.previous = {}
	v_u_19.onNewData = v18
	function v_u_19.runLazyQuery(p20)
		-- upvalues: (copy) v_u_19
		v_u_19:cleanup()
		v_u_19.runLazy = true
		v_u_19.lazyOptions = p20
		v_u_19:onNewData()
	end
	function v_u_19.obsRefetch(_, p21)
		-- upvalues: (ref) v_u_6, (copy) v_u_19
		if v_u_6.toJSBoolean(v_u_19.currentObservable) then
			return v_u_19.currentObservable:refetch(p21)
		else
			return nil
		end
	end
	function v_u_19.obsFetchMore(_, p22)
		-- upvalues: (copy) v_u_19
		if v_u_19.currentObservable then
			return v_u_19.currentObservable:fetchMore(p22)
		else
			return nil
		end
	end
	function v_u_19.obsUpdateQuery(_, p23)
		-- upvalues: (copy) v_u_19
		if v_u_19.currentObservable then
			return v_u_19.currentObservable:updateQuery(p23)
		else
			return nil
		end
	end
	function v_u_19.obsStartPolling(_, p24)
		-- upvalues: (copy) v_u_19
		if v_u_19.currentObservable then
			return v_u_19.currentObservable:startPolling(p24)
		else
			return nil
		end
	end
	function v_u_19.obsStopPolling(_)
		-- upvalues: (copy) v_u_19
		if v_u_19.currentObservable then
			return v_u_19.currentObservable:stopPolling()
		else
			return nil
		end
	end
	function v_u_19.obsSubscribeToMore(p25)
		-- upvalues: (copy) v_u_19
		if v_u_19.currentObservable then
			return v_u_19.currentObservable:subscribeToMore(p25)
		else
			return nil
		end
	end
	local v26 = v_u_14
	return setmetatable(v_u_19, v26)
end
function v_u_14.execute(p27) -- name: execute
	-- upvalues: (copy) v_u_6
	p27:refreshClient()
	local v28 = p27:getOptions()
	local v29 = v28.skip
	local v30 = v28.query
	if v29 or v30 ~= p27.previous.query then
		p27:removeQuerySubscription()
		p27:removeObservable(not v_u_6.toJSBoolean(v29))
		p27.previous.query = v30
	end
	p27:updateObservableQuery()
	return p27:getExecuteSsrResult() or p27:getExecuteResult()
end
function v_u_14.executeLazy(p31) -- name: executeLazy
	-- upvalues: (copy) v_u_6, (copy) v_u_11
	if v_u_6.toJSBoolean(p31.runLazy) then
		return table.pack(p31.runLazyQuery, p31:execute())
	else
		return table.pack(p31.runLazyQuery, {
			["loading"] = false,
			["networkStatus"] = nil,
			["called"] = false,
			["data"] = nil,
			["networkStatus"] = v_u_11.ready
		})
	end
end
function v_u_14.fetchData(p_u_32) -- name: fetchData
	-- upvalues: (copy) v_u_6, (copy) v_u_4
	local v33 = p_u_32:getOptions()
	if v_u_6.toJSBoolean(v_u_6.toJSBoolean(v33.skip) and v33.skip or v33.ssr == false) then
		return false
	else
		return v_u_4.new(function(p34)
			-- upvalues: (copy) p_u_32
			return p_u_32:startQuerySubscription(p34)
		end)
	end
end
function v_u_14.afterExecute(p_u_35, p36) -- name: afterExecute
	-- upvalues: (copy) v_u_6
	local v37 = p36 or {}
	local v38
	if v37.lazy then
		v38 = v37.lazy
	else
		v38 = false
	end
	p_u_35.isMounted = true
	local v39 = p_u_35:getOptions()
	local v40 = v39.ssr == false
	if v_u_6.toJSBoolean(p_u_35.currentObservable) and not (v_u_6.toJSBoolean(v40) or v_u_6.toJSBoolean(p_u_35:ssrInitiated())) then
		p_u_35:startQuerySubscription()
	end
	if not v_u_6.toJSBoolean(v38) or v_u_6.toJSBoolean(p_u_35.runLazy) then
		p_u_35:handleErrorOrCompleted()
	end
	p_u_35.previousOptions = v39
	return function(...)
		-- upvalues: (copy) p_u_35
		return p_u_35:unmount(...)
	end
end
function v_u_14.cleanup(p41) -- name: cleanup
	p41:removeQuerySubscription()
	p41:removeObservable(true)
	p41.previous.result = nil
end
function v_u_14.getOptions(p42) -- name: getOptions
	-- upvalues: (copy) v_u_6, (copy) v_u_7
	local v43 = getmetatable(p42)
	local v44 = getmetatable(v43).__index.getOptions(p42)
	if v_u_6.toJSBoolean(p42.lazyOptions) then
		v44.variables = v_u_7.assign({}, v44.variables, p42.lazyOptions.variables)
		v44.context = v_u_7.assign({}, v44.context, p42.lazyOptions.context)
	end
	if v_u_6.toJSBoolean(p42.runLazy) then
		p42.options.skip = nil
	end
	return v44
end
function v_u_14.ssrInitiated(p45) -- name: ssrInitiated
	-- upvalues: (copy) v_u_6
	if v_u_6.toJSBoolean(p45.context) then
		return p45.context.renderPromises
	else
		return p45.context
	end
end
function v_u_14.getExecuteSsrResult(p46) -- name: getExecuteSsrResult
	-- upvalues: (copy) v_u_7, (copy) v_u_11, (copy) v_u_6
	local v47 = p46:getOptions()
	local v48 = v47.ssr
	local v49 = v47.skip
	local v50 = v48 == false
	local v51 = p46:refreshClient().client.disableNetworkFetches
	local v52 = v_u_7.assign({}, {
		["loading"] = true,
		["networkStatus"] = nil,
		["called"] = true,
		["data"] = nil,
		["stale"] = false,
		["client"] = nil,
		["networkStatus"] = v_u_11.loading,
		["client"] = p46.client
	}, p46:observableQueryFields())
	if v_u_6.toJSBoolean(v50) and (v_u_6.toJSBoolean(p46:ssrInitiated()) or v_u_6.toJSBoolean(v51)) then
		p46.previous.result = v52
		return v52
	end
	if not v_u_6.toJSBoolean(p46:ssrInitiated()) then
		return nil
	end
	if v_u_6.toJSBoolean(p46:getExecuteResult()) then
		v52 = p46:getExecuteResult() or v52
	end
	if v_u_6.toJSBoolean(v52.loading) and not v_u_6.toJSBoolean(v49) then
		p46.context.renderPromises:addQueryPromise(p46, function()
			return nil
		end)
	end
	return v52
end
function v_u_14.prepareObservableQueryOptions(p53) -- name: prepareObservableQueryOptions
	-- upvalues: (copy) v_u_12, (copy) v_u_6, (copy) v_u_7
	local v54 = p53:getOptions()
	p53:verifyDocumentType(v54.query, v_u_12.Query)
	local v55 = v_u_6.toJSBoolean(v54.displayName) and (v54.displayName or "Query") or "Query"
	if v_u_6.toJSBoolean(p53:ssrInitiated()) and (v54.fetchPolicy == "network-only" or v54.fetchPolicy == "cache-and-network") then
		v54.fetchPolicy = "cache-first"
	end
	return v_u_7.assign({}, v54, {
		["displayName"] = v55,
		["context"] = v54.context
	})
end
function v_u_14.initializeObservableQuery(p56) -- name: initializeObservableQuery
	-- upvalues: (copy) v_u_6, (copy) v_u_7
	if v_u_6.toJSBoolean(p56:ssrInitiated()) then
		p56.currentObservable = p56.context.renderPromises:getSSRObservable(p56:getOptions())
	end
	if not v_u_6.toJSBoolean(p56.currentObservable) then
		local v57 = p56:prepareObservableQueryOptions()
		p56.previous.observableQueryOptions = v_u_7.assign({}, v57, {
			["children"] = v_u_7.None
		})
		p56.currentObservable = p56:refreshClient().client:watchQuery(v_u_7.assign({}, v57))
		if v_u_6.toJSBoolean(p56:ssrInitiated()) then
			p56.context.renderPromises:registerSSRObservable(p56.currentObservable, v57)
		end
	end
end
function v_u_14.updateObservableQuery(p58) -- name: updateObservableQuery
	-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_9
	if v_u_6.toJSBoolean(p58.currentObservable) then
		local v59 = v_u_7.assign({}, p58:prepareObservableQueryOptions(), {
			["children"] = v_u_7.None
		})
		if v_u_6.toJSBoolean(p58:getOptions().skip) then
			p58.previous.observableQueryOptions = v59
		elseif not v_u_9(v59, p58.previous.observableQueryOptions) then
			p58.previous.observableQueryOptions = v59
			p58.currentObservable:setOptions(v59):catch(function() end)
		end
	else
		p58:initializeObservableQuery()
		return
	end
end
function v_u_14.startQuerySubscription(p_u_60, p_u_61) -- name: startQuerySubscription
	-- upvalues: (copy) v_u_6, (copy) v_u_9, (copy) v_u_8
	if p_u_61 == nil then
		p_u_61 = p_u_60.onNewData
	end
	if not (v_u_6.toJSBoolean(p_u_60.currentSubscription) or v_u_6.toJSBoolean(p_u_60:getOptions().skip)) then
		local v69 = {
			["next"] = function(_, p62) -- name: next
				-- upvalues: (copy) p_u_60, (ref) v_u_6, (ref) v_u_9, (ref) p_u_61
				local v63 = p62.loading
				local v64 = p62.networkStatus
				local v65 = p62.data
				local v66 = p_u_60.previous.result
				if not v_u_6.toJSBoolean(v66) or (v66.loading ~= v63 or (v66.networkStatus ~= v64 or not v_u_9(v66.data, v65))) then
					p_u_61(p_u_60)
				end
			end,
			["error"] = function(_, p67)
				-- upvalues: (copy) p_u_60, (ref) v_u_8, (ref) v_u_6, (ref) v_u_9, (ref) p_u_61
				p_u_60:resubscribeToQuery()
				if not v_u_8(p67, "graphQLErrors") then
					error(p67)
				end
				local v68 = p_u_60.previous.result
				if v_u_6.toJSBoolean(v68) and v_u_6.toJSBoolean(v68.loading) or not v_u_9(p67, p_u_60.previous.error) then
					p_u_60.previous.error = p67
					p_u_61(p_u_60)
				end
			end
		}
		p_u_60.currentSubscription = p_u_60.currentObservable:subscribe(v69)
	end
end
function v_u_14.resubscribeToQuery(p70) -- name: resubscribeToQuery
	-- upvalues: (copy) v_u_6, (copy) v_u_7
	p70:removeQuerySubscription()
	local v71 = p70.currentObservable
	if v_u_6.toJSBoolean(v71) then
		local v72 = v71:getLastError()
		local v73 = v71:getLastResult()
		v71:resetLastResults()
		p70:startQuerySubscription()
		v_u_7.assign(v71, {
			["lastError"] = v72,
			["lastResult"] = v73
		})
	end
end
function v_u_14.getExecuteResult(p74) -- name: getExecuteResult
	-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_11, (copy) v_u_10
	local v75 = p74:observableQueryFields()
	local v76 = p74:getOptions()
	if v_u_6.toJSBoolean(v76.skip) then
		v75 = v_u_7.assign({}, v75, {
			["data"] = v_u_7.None,
			["error"] = v_u_7.None,
			["loading"] = false,
			["networkStatus"] = v_u_11.ready,
			["called"] = true
		})
	elseif v_u_6.toJSBoolean(p74.currentObservable) then
		local v77 = p74.currentObservable:getCurrentResult()
		local v78 = v77.data
		local v79 = v77.loading
		local v80 = v77.partial
		local v81 = v77.networkStatus
		local v82 = v77.errors
		local v83 = v77.error
		if v_u_6.toJSBoolean(v82) and #v82 > 0 then
			v83 = v_u_10.new({
				["graphQLErrors"] = v82
			})
		end
		v75 = v_u_7.assign({}, v75, {
			["data"] = v78,
			["loading"] = v79,
			["networkStatus"] = v81,
			["error"] = v83,
			["called"] = true
		})
		if not v_u_6.toJSBoolean(v79) then
			if v_u_6.toJSBoolean(v83) then
				v_u_7.assign(v75, {
					["data"] = (p74.currentObservable:getLastResult() or {}).data
				})
			else
				local v84 = p74.currentObservable.options.fetchPolicy
				local v85 = v76.partialRefetch
				if v_u_6.toJSBoolean(v85) and (v_u_6.toJSBoolean(v80) and (not v_u_6.toJSBoolean(v78) or #v_u_7.keys(v78) == 0)) and v84 ~= "cache-only" then
					v_u_7.assign(v75, {
						["loading"] = true,
						["networkStatus"] = nil,
						["networkStatus"] = v_u_11.loading
					})
					v75:refetch()
					return v75
				end
			end
		end
	end
	v75.client = p74.client
	p74:setOptions(v76, true)
	local v86 = p74.previous.result
	if v_u_6.toJSBoolean(v86) and v_u_6.toJSBoolean(v86.loading) then
		p74.previous.loading = v86.loading
	else
		p74.previous.loading = false
	end
	if v_u_6.toJSBoolean(v86) then
		v75.previousData = v_u_6.toJSBoolean(v86.data) and v86.data or v86.previousData
	else
		v75.previousData = v86
	end
	p74.previous.result = v75
	if v_u_6.toJSBoolean(p74.currentObservable) then
		p74.currentObservable:resetQueryStoreErrors()
	end
	return v75
end
function v_u_14.handleErrorOrCompleted(p87) -- name: handleErrorOrCompleted
	-- upvalues: (copy) v_u_6, (copy) v_u_9
	if p87.currentObservable and p87.previous.result then
		local v88 = p87.previous.result
		local v89 = v88.data
		local v90 = v88.loading
		local v91 = v88.error
		if not v_u_6.toJSBoolean(v90) then
			local v92 = p87:getOptions()
			local v93 = v92.query
			local v94 = v92.variables
			local v95 = v92.onCompleted
			local v96 = v92.onError
			local v97 = v92.skip
			if v_u_6.toJSBoolean(p87.previousOptions) and (not v_u_6.toJSBoolean(p87.previous.loading) and (v_u_9(p87.previousOptions.query, v93) and v_u_9(p87.previousOptions.variables, v94))) then
				return
			end
			if v_u_6.toJSBoolean(v95) and not (v_u_6.toJSBoolean(v91) or v_u_6.toJSBoolean(v97)) then
				v95(v89)
				return
			end
			if v_u_6.toJSBoolean(v96) and v_u_6.toJSBoolean(v91) then
				v96(v91)
			end
		end
	end
end
function v_u_14.removeQuerySubscription(p98) -- name: removeQuerySubscription
	-- upvalues: (copy) v_u_6
	if v_u_6.toJSBoolean(p98.currentSubscription) then
		p98.currentSubscription:unsubscribe()
		p98.currentSubscription = nil
	end
end
function v_u_14.removeObservable(p99, p100) -- name: removeObservable
	-- upvalues: (copy) v_u_6
	if v_u_6.toJSBoolean(p99.currentObservable) then
		p99.currentObservable.tearDownQuery(p99.currentObservable)
		if v_u_6.toJSBoolean(p100) then
			p99.currentObservable = nil
		end
	end
end
function v_u_14.observableQueryFields(p101) -- name: observableQueryFields
	-- upvalues: (copy) v_u_6
	local v102
	if v_u_6.toJSBoolean(p101.currentObservable) then
		v102 = p101.currentObservable.variables
	else
		v102 = nil
	end
	return {
		["variables"] = v102,
		["refetch"] = p101.obsRefetch,
		["fetchMore"] = p101.obsFetchMore,
		["updateQuery"] = p101.obsUpdateQuery,
		["startPolling"] = p101.obsStartPolling,
		["stopPolling"] = p101.obsStopPolling,
		["subscribeToMore"] = p101.obsSubscribeToMore
	}
end
v1.QueryData = v_u_14
return v1