-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.core.ApolloClient
local v1 = {}
local v2 = script.Parent.Parent
local v3 = v2.Parent
local v4 = require(v3.LuauPolyfill)
local v_u_5 = v4.Array
local v_u_6 = v4.Boolean
local v_u_7 = v4.Object
local v_u_8 = v4.setTimeout
local v_u_9 = require(v3.Promise)
require(v3.GraphQL)
local v10 = require(v2.jsutils.invariant)
local v_u_11 = v10.invariant
local v_u_12 = v10.InvariantError
local v13 = require(script.Parent.Parent.link.core)
local v_u_14 = v13.ApolloLink
local v_u_15 = v13.execute
require(script.Parent.Parent.cache)
local v_u_16 = require(script.Parent.Parent.utilities).compact
local v_u_17 = require(script.Parent.Parent.version).version
local v_u_18 = require(script.Parent.Parent.link.http).HttpLink
local v_u_19 = require(script.Parent.QueryManager).QueryManager
require(script.Parent.ObservableQuery_types)
require(v2.core.types)
require(script.Parent.watchQueryOptions_types)
require(script.Parent.watchQueryOptions)
local v_u_20 = require(script.Parent.LocalState).LocalState
require(script.Parent.ApolloClient_types)
local function v_u_23(p21, p22) -- name: mergeOptions
	-- upvalues: (copy) v_u_16, (copy) v_u_6, (copy) v_u_7
	return v_u_16(p21, p22, v_u_6.toJSBoolean(p22.variables) and {
		["variables"] = v_u_7.assign({}, p21.variables, p22.variables)
	} or p22.variables)
end
v1.mergeOptions = v_u_23
local v_u_24 = {}
v_u_24.__index = v_u_24
function v_u_24.new(p25) -- name: new
	-- upvalues: (copy) v_u_24, (copy) v_u_6, (copy) v_u_18, (copy) v_u_14, (copy) v_u_12, (copy) v_u_8, (copy) v_u_17, (copy) v_u_20, (copy) v_u_19
	local v26 = v_u_24
	local v_u_27 = setmetatable({}, v26)
	v_u_27.defaultOptions = {}
	v_u_27.resetStoreCallbacks = {}
	v_u_27.clearStoreCallbacks = {}
	local v28 = p25.uri
	local v29 = p25.credentials
	local v30 = p25.headers
	local v31 = p25.cache
	local v32 = p25.defaultOptions
	local v33 = p25.resolvers
	local v34 = p25.typeDefs
	local v35 = p25.fragmentMatcher
	local v36 = p25.name
	local v37 = p25.version
	local v38
	if p25.ssrMode == nil then
		v38 = false
	else
		v38 = p25.ssrMode
	end
	local v39 = p25.ssrForceFetchDelay == nil and 0 or p25.ssrForceFetchDelay
	local v40
	if p25.connectToDevTools == nil then
		local v41 = _G
		v40 = typeof(v41) == "table" and not v_u_6.toJSBoolean(_G.__APOLLO_CLIENT__)
		if v40 then
			v40 = _G.__DEV__
		end
	else
		v40 = p25.connectToDevTools
	end
	local v42 = p25.queryDeduplication == nil and true or p25.queryDeduplication
	local v43
	if p25.assumeImmutableResults == nil then
		v43 = false
	else
		v43 = p25.assumeImmutableResults
	end
	local v44 = p25.link
	if not v_u_6.toJSBoolean(v44) then
		if v_u_6.toJSBoolean(v28) then
			v44 = v_u_18.new({
				["uri"] = v28,
				["credentials"] = v29,
				["headers"] = v30
			})
		else
			v44 = v_u_14.empty()
		end
	end
	if not v_u_6.toJSBoolean(v31) then
		error(v_u_12.new("To initialize Apollo Client, you must specify a \'cache\' property in the options object. \nFor more information, please visit: https://go.apollo.dev/c/docs"))
	end
	v_u_27.link = v44
	v_u_27.cache = v31
	v_u_27.disableNetworkFetches = v_u_6.toJSBoolean(v38) and v38 and v38 or v39 > 0
	v_u_27.queryDeduplication = v42
	v_u_27.defaultOptions = v_u_6.toJSBoolean(v32) and v32 and v32 or {}
	v_u_27.typeDefs = v34
	if v_u_6.toJSBoolean(v39) then
		v_u_8(function()
			-- upvalues: (copy) v_u_27
			v_u_27.disableNetworkFetches = false
			return v_u_27.disableNetworkFetches
		end, v39)
	end
	v_u_27.version = v_u_17
	v_u_27.localState = v_u_20.new({
		["cache"] = v31,
		["client"] = v_u_27,
		["resolvers"] = v33,
		["fragmentMatcher"] = v35
	})
	v_u_27.queryManager = v_u_19.new({
		["cache"] = v_u_27.cache,
		["link"] = v_u_27.link,
		["queryDeduplication"] = v42,
		["ssrMode"] = v38,
		["clientAwareness"] = {
			["name"] = v36,
			["version"] = v37
		},
		["localState"] = v_u_27.localState,
		["assumeImmutableResults"] = v43,
		["onBroadcast"] = v40 and function() end or nil
	})
	return v_u_27
end
function v_u_24.stop(p45) -- name: stop
	p45.queryManager:stop()
end
function v_u_24.watchQuery(p46, p47) -- name: watchQuery
	-- upvalues: (copy) v_u_6, (copy) v_u_23, (copy) v_u_7
	if v_u_6.toJSBoolean(p46.defaultOptions.watchQuery) then
		p47 = v_u_23(p46.defaultOptions.watchQuery, p47)
	end
	if p46.disableNetworkFetches and (p47.fetchPolicy == "network-only" or p47.fetchPolicy == "cache-and-network") then
		p47 = v_u_7.assign({}, p47, {
			["fetchPolicy"] = "cache-first"
		})
	end
	return p46.queryManager:watchQuery(p47)
end
function v_u_24.query(p48, p49) -- name: query
	-- upvalues: (copy) v_u_6, (copy) v_u_23, (copy) v_u_11, (copy) v_u_7
	if v_u_6.toJSBoolean(p48.defaultOptions.query) then
		p49 = v_u_23(p48.defaultOptions.query, p49)
	end
	v_u_11(p49.fetchPolicy ~= "cache-and-network", "The cache-and-network fetchPolicy does not work with client.query, because client.query can only return a single result. Please use client.watchQuery to receive multiple results from the cache and the network, or consider using a different fetchPolicy, such as cache-first or network-only.")
	if p48.disableNetworkFetches and p49.fetchPolicy == "network-only" then
		p49 = v_u_7.assign({}, p49, {
			["fetchPolicy"] = "cache-first"
		})
	end
	return p48.queryManager:query(p49)
end
function v_u_24.mutate(p50, p51) -- name: mutate
	-- upvalues: (copy) v_u_6, (copy) v_u_23
	if v_u_6.toJSBoolean(p50.defaultOptions.mutate) then
		p51 = v_u_23(p50.defaultOptions.mutate, p51)
	end
	return p50.queryManager:mutate(p51)
end
function v_u_24.subscribe(p52, p53) -- name: subscribe
	return p52.queryManager:startGraphQLSubscription(p53)
end
function v_u_24.readQuery(p54, p55, p56) -- name: readQuery
	if p56 == nil then
		p56 = false
	end
	return p54.cache:readQuery(p55, p56)
end
function v_u_24.readFragment(p57, p58, p59) -- name: readFragment
	if p59 == nil then
		p59 = false
	end
	return p57.cache:readFragment(p58, p59)
end
function v_u_24.writeQuery(p60, p61) -- name: writeQuery
	p60.cache:writeQuery(p61)
	p60.queryManager:broadcastQueries()
end
function v_u_24.writeFragment(p62, p63) -- name: writeFragment
	p62.cache:writeFragment(p63)
	p62.queryManager:broadcastQueries()
end
function v_u_24.__actionHookForDevTools(p64, p65) -- name: __actionHookForDevTools
	p64.devToolsHookCb = p65
end
function v_u_24.__requestRaw(p66, p67) -- name: __requestRaw
	-- upvalues: (copy) v_u_15
	return v_u_15(p66.link, p67)
end
function v_u_24.resetStore(p_u_68) -- name: resetStore
	-- upvalues: (copy) v_u_9, (copy) v_u_5
	return v_u_9.delay(0):andThen(function()
		-- upvalues: (copy) p_u_68
		return p_u_68.queryManager:clearStore()
	end):andThen(function()
		-- upvalues: (ref) v_u_9, (ref) v_u_5, (copy) p_u_68
		return v_u_9.all(v_u_5.map(p_u_68.resetStoreCallbacks, function(p69)
			return p69()
		end))
	end):andThen(function()
		-- upvalues: (copy) p_u_68
		return p_u_68:reFetchObservableQueries()
	end)
end
function v_u_24.clearStore(p_u_70) -- name: clearStore
	-- upvalues: (copy) v_u_9, (copy) v_u_5
	return v_u_9.delay(0):andThen(function()
		-- upvalues: (copy) p_u_70
		return p_u_70.queryManager:clearStore()
	end):andThen(function()
		-- upvalues: (ref) v_u_9, (ref) v_u_5, (copy) p_u_70
		return v_u_9.all(v_u_5.map(p_u_70.clearStoreCallbacks, function(p71)
			return p71()
		end))
	end)
end
function v_u_24.onResetStore(p_u_72, p_u_73) -- name: onResetStore
	-- upvalues: (copy) v_u_5
	local v74 = p_u_72.resetStoreCallbacks
	table.insert(v74, p_u_73)
	return function()
		-- upvalues: (copy) p_u_72, (ref) v_u_5, (copy) p_u_73
		p_u_72.resetStoreCallbacks = v_u_5.filter(p_u_72.resetStoreCallbacks, function(p75)
			-- upvalues: (ref) p_u_73
			return p75 ~= p_u_73
		end)
	end
end
function v_u_24.onClearStore(p_u_76, p_u_77) -- name: onClearStore
	-- upvalues: (copy) v_u_5
	local v78 = p_u_76.clearStoreCallbacks
	table.insert(v78, p_u_77)
	return function()
		-- upvalues: (copy) p_u_76, (ref) v_u_5, (copy) p_u_77
		p_u_76.clearStoreCallbacks = v_u_5.filter(p_u_76.clearStoreCallbacks, function(p79)
			-- upvalues: (ref) p_u_77
			return p79 ~= p_u_77
		end)
	end
end
function v_u_24.reFetchObservableQueries(p80, p81) -- name: reFetchObservableQueries
	return p80.queryManager:reFetchObservableQueries(p81)
end
function v_u_24.refetchQueries(p82, p83) -- name: refetchQueries
	-- upvalues: (copy) v_u_9, (copy) v_u_11
	local v_u_84 = {}
	local v_u_85 = {}
	p82.queryManager:refetchQueries(p83):forEach(function(p86, p87)
		-- upvalues: (copy) v_u_84, (copy) v_u_85
		local v88 = v_u_84
		table.insert(v88, p87)
		local v89 = v_u_85
		table.insert(v89, p86)
	end)
	local v90 = v_u_9.all(v_u_85)
	v90.queries = v_u_84
	v90.results = v_u_85
	v90:catch(function(p91)
		-- upvalues: (ref) v_u_11
		v_u_11.debug(("In client.refetchQueries, Promise.all promise rejected with error %s"):format(p91.message))
	end)
	return v90
end
function v_u_24.getObservableQueries(p92, p93) -- name: getObservableQueries
	local v94 = p93 == nil and "active" or p93
	return p92.queryManager:getObservableQueries(v94)
end
function v_u_24.extract(p95, p96) -- name: extract
	return p95.cache:extract(p96)
end
function v_u_24.restore(p97, p98) -- name: restore
	return p97.cache:restore(p98)
end
function v_u_24.addResolvers(p99, p100) -- name: addResolvers
	p99.localState:addResolvers(p100)
end
function v_u_24.setResolvers(p101, p102) -- name: setResolvers
	p101.localState:setResolvers(p102)
end
function v_u_24.getResolvers(p103) -- name: getResolvers
	return p103.localState:getResolvers()
end
function v_u_24.setLocalStateFragmentMatcher(p104, p105) -- name: setLocalStateFragmentMatcher
	p104.localState:setFragmentMatcher(p105)
end
function v_u_24.setLink(p106, p107) -- name: setLink
	p106.queryManager.link = p107
	p106.link = p106.queryManager.link
end
v1.ApolloClient = v_u_24
return v1