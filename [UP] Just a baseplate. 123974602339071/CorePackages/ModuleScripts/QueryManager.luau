-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.core.QueryManager
local v1 = {}
local v2 = script.Parent.Parent
local v3 = v2.Parent
local v4 = require(v3.LuauPolyfill)
local v_u_5 = v4.Array
local v_u_6 = v4.Boolean
local v_u_7 = v4.instanceof
local v_u_8 = v4.Map
local v_u_9 = v4.Object
local v_u_10 = v4.Set
local v_u_11 = v4.WeakMap
local v_u_12 = require(v3.Promise)
local v_u_13 = game:GetService("HttpService")
local v_u_14 = require(v2.luaUtils.isCallable)
local v_u_15 = require(v2.utilities.globals.null).toJSBoolean
require(v3.GraphQL)
local v16 = require(v2.jsutils.invariant)
local v_u_17 = v16.invariant
local v_u_18 = v16.InvariantError
local v_u_19 = require(v2.jsutils.equal)
local v_u_20 = require(script.Parent.Parent.link.core).execute
local v_u_21 = require(script.Parent.Parent.cache).canonicalStringify
local v22 = require(script.Parent.Parent.utilities)
local v_u_23 = v22.getDefaultValues
local v_u_24 = v22.getOperationDefinition
local v_u_25 = v22.getOperationName
local v_u_26 = v22.hasClientExports
local v_u_27 = v22.graphQLResultHasError
local v_u_28 = v22.removeConnectionDirectiveFromDocument
local _ = v22.canUseWeakMap
local v_u_29 = v22.Observable
local v_u_30 = v22.asyncMap
local v_u_31 = v22.isNonEmptyArray
local v_u_32 = v22.Concast
local v_u_33 = v22.makeUniqueId
local v_u_34 = v22.isDocumentNode
local v_u_35 = v22.isNonNullObject
local v36 = require(script.Parent.Parent.errors)
local v_u_37 = v36.ApolloError
local v_u_38 = v36.isApolloError
require(script.Parent.watchQueryOptions_types)
local v39 = require(script.Parent.ObservableQuery)
require(script.Parent.ObservableQuery_types)
local v_u_40 = v39.ObservableQuery
local v_u_41 = v39.applyNextFetchPolicy
local v42 = require(script.Parent.networkStatus)
local v_u_43 = v42.NetworkStatus
local v_u_44 = v42.isNetworkRequestInFlight
require(script.Parent.types)
local v_u_45 = require(script.Parent.LocalState).LocalState
local v46 = require(script.Parent.QueryInfo)
local v_u_47 = v46.QueryInfo
local v_u_48 = v46.shouldWriteResult
local v_u_49 = v46.CacheWriteBehavior
local v_u_50 = require(v2.luaUtils.hasOwnProperty)
local v_u_51 = {}
v_u_51.__index = v_u_51
function v_u_51.new(p52) -- name: new
	-- upvalues: (copy) v_u_51, (copy) v_u_8, (copy) v_u_11, (copy) v_u_45, (copy) v_u_6
	local v53 = p52.cache
	local v54 = p52.link
	local v55 = p52.queryDeduplication
	local v56 = p52.onBroadcast
	local v57 = p52.ssrMode
	local v58 = p52.clientAwareness
	local v59 = p52.localState
	local v60 = p52.assumeImmutableResults
	if v55 == nil then
		v55 = false
	end
	if v57 == nil then
		v57 = false
	end
	local v61 = v58 == nil and {} or v58
	local v62 = v_u_51
	local v63 = setmetatable({}, v62)
	v63.clientAwareness = {}
	v63.queries = v_u_8.new()
	v63.fetchCancelFns = v_u_8.new()
	v63.transformCache = v_u_11.new()
	v63.queryIdCounter = 1
	v63.requestIdCounter = 1
	v63.mutationIdCounter = 1
	v63.inFlightLinkObservables = v_u_8.new()
	v63.cache = v53
	v63.link = v54
	v63.queryDeduplication = v55
	v63.clientAwareness = v61
	v63.localState = v59 or v_u_45.new({
		["cache"] = v53
	})
	v63.ssrMode = v57
	v63.assumeImmutableResults = v_u_6.toJSBoolean(v60)
	v63.onBroadcast = v56
	if v_u_6.toJSBoolean(v63.onBroadcast) then
		v63.mutationStore = {}
	end
	return v63
end
function v_u_51.stop(p_u_64) -- name: stop
	-- upvalues: (copy) v_u_18
	p_u_64.queries:forEach(function(_, p65)
		-- upvalues: (copy) p_u_64
		p_u_64:stopQueryNoBroadcast(p65)
	end)
	p_u_64:cancelPendingFetches(v_u_18.new("QueryManager stopped while query was in flight"))
end
function v_u_51.cancelPendingFetches(p66, p_u_67) -- name: cancelPendingFetches
	p66.fetchCancelFns:forEach(function(p68)
		-- upvalues: (copy) p_u_67
		return p68(p_u_67)
	end)
	p66.fetchCancelFns:clear()
end
function v_u_51.mutate(p_u_69, p_u_70) -- name: mutate
	-- upvalues: (copy) v_u_12, (copy) v_u_17, (copy) v_u_6, (copy) v_u_30, (copy) v_u_9, (copy) v_u_27, (copy) v_u_37, (copy) v_u_14, (copy) v_u_7
	return v_u_12.resolve():andThen(function()
		-- upvalues: (copy) p_u_70, (ref) v_u_17, (ref) v_u_6, (copy) p_u_69, (ref) v_u_12, (ref) v_u_30, (ref) v_u_9, (ref) v_u_27, (ref) v_u_37, (ref) v_u_14, (ref) v_u_7
		local v71 = p_u_70.mutation
		local v72 = p_u_70.variables
		local v_u_73 = p_u_70.optimisticResponse
		local v_u_74 = p_u_70.updateQueries
		local v75 = p_u_70.refetchQueries
		local v_u_76 = p_u_70.awaitRefetchQueries
		local v_u_77 = p_u_70.update
		local v_u_78 = p_u_70.onQueryUpdated
		local v79 = p_u_70.errorPolicy
		local v_u_80 = p_u_70.fetchPolicy
		local v_u_81 = p_u_70.keepRootFields
		local v_u_82 = p_u_70.context
		local v_u_83 = v75 == nil and {} or v75
		if v_u_76 == nil then
			v_u_76 = false
		end
		local v_u_84 = v79 == nil and "none" or v79
		v_u_17(v71, "mutation option is required. You must specify your GraphQL document in the mutation option.")
		v_u_17(not v_u_6.toJSBoolean(v_u_80) or v_u_80 == "no-cache", "Mutations only support a \'no-cache\' fetchPolicy. If you don\'t want to disable the cache, remove your fetchPolicy setting to proceed with the default mutation behavior.")
		local v_u_85 = p_u_69:generateMutationId()
		local v_u_86 = p_u_69:transform(v71).document
		local v_u_87 = p_u_69:getVariables(v_u_86, v72)
		if p_u_69:transform(v_u_86).hasClientExports then
			v_u_87 = p_u_69.localState:addExportedVariables(v_u_86, v_u_87, v_u_82):expect()
		end
		local v_u_88
		if v_u_6.toJSBoolean(p_u_69.mutationStore) then
			p_u_69.mutationStore[v_u_85] = {
				["mutation"] = nil,
				["variables"] = nil,
				["loading"] = true,
				["error"] = nil,
				["mutation"] = v_u_86,
				["variables"] = v_u_87
			}
			v_u_88 = p_u_69.mutationStore[v_u_85]
		else
			v_u_88 = p_u_69.mutationStore
		end
		if v_u_6.toJSBoolean(v_u_73) then
			p_u_69:markMutationOptimistic(v_u_73, {
				["mutationId"] = v_u_85,
				["document"] = v_u_86,
				["variables"] = v_u_87,
				["fetchPolicy"] = v_u_80,
				["errorPolicy"] = v_u_84,
				["context"] = v_u_82,
				["updateQueries"] = v_u_74,
				["update"] = v_u_77,
				["keepRootFields"] = v_u_81
			})
		end
		p_u_69:broadcastQueries()
		local v_u_89 = p_u_69
		return v_u_12.new(function(p_u_90, p_u_91)
			-- upvalues: (ref) v_u_30, (ref) p_u_69, (ref) v_u_86, (ref) v_u_9, (copy) v_u_82, (copy) v_u_73, (ref) v_u_87, (ref) v_u_27, (ref) v_u_84, (ref) v_u_37, (ref) v_u_6, (ref) v_u_88, (ref) v_u_14, (ref) v_u_83, (copy) v_u_85, (copy) v_u_80, (copy) v_u_77, (copy) v_u_74, (ref) v_u_76, (copy) v_u_78, (copy) v_u_81, (copy) v_u_89, (ref) v_u_7
			local v92 = {
				["optimisticResponse"] = v_u_73
			}
			local v95 = {
				["next"] = function(_, p93) -- name: next
					-- upvalues: (ref) v_u_89, (copy) p_u_90
					v_u_89:broadcastQueries()
					p_u_90(p93)
				end,
				["error"] = function(_, p94) -- name: error
					-- upvalues: (ref) v_u_6, (ref) v_u_88, (ref) v_u_73, (ref) v_u_89, (ref) v_u_85, (copy) p_u_91, (ref) v_u_7, (ref) v_u_37
					if v_u_6.toJSBoolean(v_u_88) then
						v_u_88.loading = false
						v_u_88.error = p94
					end
					if v_u_6.toJSBoolean(v_u_73) then
						v_u_89.cache:removeOptimistic(v_u_85)
					end
					v_u_89:broadcastQueries()
					p_u_91(v_u_7(p94, v_u_37) and p94 and p94 or v_u_37.new({
						["networkError"] = p94
					}))
				end
			}
			return v_u_30(p_u_69:getObservableFromLink(v_u_86, v_u_9.assign({}, v_u_82, v92), v_u_87, false), function(p96)
				-- upvalues: (ref) v_u_27, (ref) v_u_84, (ref) v_u_37, (ref) v_u_6, (ref) v_u_88, (ref) v_u_9, (ref) v_u_14, (ref) v_u_83, (ref) p_u_69, (ref) v_u_85, (ref) v_u_86, (ref) v_u_87, (ref) v_u_80, (ref) v_u_82, (ref) v_u_77, (ref) v_u_74, (ref) v_u_76, (ref) v_u_73, (ref) v_u_78, (ref) v_u_81
				if v_u_27(p96) and v_u_84 == "none" then
					error(v_u_37.new({
						["graphQLErrors"] = p96.errors
					}))
				end
				if v_u_6.toJSBoolean(v_u_88) then
					v_u_88.loading = false
					v_u_88.error = nil
				end
				local v97 = v_u_9.assign({}, p96)
				if v_u_14(v_u_83) then
					v_u_83 = v_u_83(v97)
				end
				if v_u_84 == "ignore" and v_u_27(v97) then
					v97.errors = nil
				end
				return p_u_69:markMutationResult({
					["mutationId"] = v_u_85,
					["result"] = v97,
					["document"] = v_u_86,
					["variables"] = v_u_87,
					["fetchPolicy"] = v_u_80,
					["errorPolicy"] = v_u_84,
					["context"] = v_u_82,
					["update"] = v_u_77,
					["updateQueries"] = v_u_74,
					["awaitRefetchQueries"] = v_u_76,
					["refetchQueries"] = v_u_83,
					["removeOptimistic"] = v_u_6.toJSBoolean(v_u_73) and v_u_85 or nil,
					["onQueryUpdated"] = v_u_78,
					["keepRootFields"] = v_u_81
				})
			end):subscribe(v95)
		end)
	end)
end
function v_u_51.markMutationResult(p_u_98, p_u_99, p_u_100) -- name: markMutationResult
	-- upvalues: (copy) v_u_48, (copy) v_u_6, (copy) v_u_50, (copy) v_u_25, (copy) v_u_5, (copy) v_u_9, (copy) v_u_12, (copy) v_u_15
	if p_u_100 == nil then
		p_u_100 = p_u_98.cache
	end
	local v_u_101 = p_u_99.result
	local v_u_102 = {}
	local v_u_103 = p_u_99.fetchPolicy == "no-cache"
	if not v_u_103 and v_u_48(v_u_101, p_u_99.errorPolicy) then
		local v104 = {
			["result"] = nil,
			["dataId"] = "ROOT_MUTATION",
			["query"] = nil,
			["variables"] = nil,
			["result"] = v_u_101.data,
			["query"] = p_u_99.document,
			["variables"] = p_u_99.variables
		}
		table.insert(v_u_102, v104)
		local v_u_105 = p_u_99.updateQueries
		if v_u_105 ~= nil then
			p_u_98.queries:forEach(function(p106, p107)
				-- upvalues: (ref) v_u_6, (ref) v_u_50, (copy) v_u_105, (copy) p_u_98, (ref) p_u_100, (ref) v_u_101, (ref) v_u_25, (copy) v_u_102
				local v108 = p106.observableQuery
				if v_u_6.toJSBoolean(v108) then
					v108 = v108.queryName
				end
				if v_u_6.toJSBoolean(v108) and v_u_50(v_u_105, v108) then
					local v109 = v_u_105[v108]
					local v110 = p_u_98.queries:get(p107)
					local v111 = v110.document
					local v112 = v110.variables
					local v113 = p_u_100:diff({
						["query"] = nil,
						["variables"] = nil,
						["returnPartialData"] = true,
						["optimistic"] = false,
						["query"] = v111,
						["variables"] = v112
					})
					local v114 = v113.result
					if v113.complete and v_u_6.toJSBoolean(v114) then
						local v115 = v_u_105
						local v116 = {
							["mutationResult"] = v_u_101
						}
						local v117
						if v_u_6.toJSBoolean(v111) then
							v117 = v_u_25(v111)
							if not v_u_6.toJSBoolean(v117) then
								v117 = nil
							end
						else
							v117 = nil
						end
						v116.queryName = v117
						v116.queryVariables = v112
						local v118 = v109(v115, v114, v116)
						if v_u_6.toJSBoolean(v118) then
							local v119 = v_u_102
							table.insert(v119, {
								["result"] = nil,
								["dataId"] = "ROOT_QUERY",
								["query"] = nil,
								["variables"] = nil,
								["result"] = v118,
								["query"] = v111,
								["variables"] = v112
							})
						end
					end
				end
			end)
		end
	end
	if #v_u_102 > 0 or (v_u_6.toJSBoolean(p_u_99.refetchQueries) or (v_u_6.toJSBoolean(p_u_99.update) or (v_u_6.toJSBoolean(p_u_99.onQueryUpdated) or v_u_6.toJSBoolean(p_u_99.removeOptimistic)))) then
		local v_u_120 = {}
		local v129 = {
			["updateCache"] = nil,
			["include"] = nil,
			["optimistic"] = false,
			["removeOptimistic"] = nil,
			["onQueryUpdated"] = nil,
			["updateCache"] = function(_, p_u_121) -- name: updateCache
				-- upvalues: (copy) v_u_103, (ref) v_u_5, (copy) v_u_102, (copy) p_u_99, (ref) v_u_6, (copy) p_u_98, (ref) v_u_101, (ref) v_u_9
				if not v_u_103 then
					v_u_5.forEach(v_u_102, function(p122)
						-- upvalues: (copy) p_u_121
						return p_u_121:write(p122)
					end)
				end
				local v123 = p_u_99.update
				if v123 ~= nil and v_u_6.toJSBoolean(v123) then
					if not v_u_103 then
						local v124 = p_u_121:diff({
							["id"] = "ROOT_MUTATION",
							["query"] = nil,
							["variables"] = nil,
							["optimistic"] = false,
							["returnPartialData"] = true,
							["query"] = p_u_98:transform(p_u_99.document).asQuery,
							["variables"] = p_u_99.variables
						})
						if v124.complete then
							v_u_101 = v_u_9.assign({}, v_u_101, {
								["data"] = v124.result
							})
						end
					end
					v123(p_u_99, p_u_121, v_u_101, {
						["context"] = p_u_99.context,
						["variables"] = p_u_99.variables
					})
				end
				if not (v_u_103 or p_u_99.keepRootFields) then
					p_u_121:modify({
						["id"] = "ROOT_MUTATION",
						["fields"] = nil,
						["fields"] = function(_, p125, p126) -- name: fields
							local v127 = p126.fieldName
							local v128 = p126.DELETE
							if v127 == "__typename" then
								return p125
							else
								return v128
							end
						end
					})
				end
			end,
			["include"] = p_u_99.refetchQueries,
			["removeOptimistic"] = p_u_99.removeOptimistic
		}
		local v130
		if v_u_6.toJSBoolean(p_u_99.onQueryUpdated) then
			v130 = p_u_99.onQueryUpdated or nil
		else
			v130 = nil
		end
		v129.onQueryUpdated = v130
		p_u_98:refetchQueries(v129):forEach(function(p131)
			-- upvalues: (copy) v_u_120
			local v132 = v_u_120
			return table.insert(v132, p131)
		end)
		if p_u_99.awaitRefetchQueries or v_u_6.toJSBoolean(p_u_99.onQueryUpdated) then
			return v_u_12.all(v_u_5.filter(v_u_120, v_u_15)):andThen(function()
				-- upvalues: (ref) v_u_101
				return v_u_101
			end)
		end
	end
	return v_u_12.resolve(v_u_101)
end
function v_u_51.markMutationOptimistic(p_u_133, p_u_134, p_u_135) -- name: markMutationOptimistic
	-- upvalues: (copy) v_u_14, (copy) v_u_9, (copy) v_u_17
	if v_u_14(p_u_134) then
		p_u_134 = p_u_134(p_u_135.variables)
	end
	return p_u_133.cache:recordOptimisticTransaction(function(p_u_136)
		-- upvalues: (copy) p_u_133, (ref) v_u_9, (copy) p_u_135, (ref) p_u_134, (ref) v_u_17
		local function v138()
			-- upvalues: (ref) p_u_133, (ref) v_u_9, (ref) p_u_135, (ref) p_u_134, (copy) p_u_136
			local v137 = {
				["result"] = {
					["data"] = p_u_134
				}
			}
			p_u_133:markMutationResult(v_u_9.assign({}, p_u_135, v137), p_u_136)
		end
		local v139, v140 = pcall(v138)
		if not v139 then
			v_u_17.error(v140)
		end
	end, p_u_135.mutationId)
end
function v_u_51.fetchQuery(p141, p142, p143, p144) -- name: fetchQuery
	return p141:fetchQueryObservable(p142, p143, p144).promise
end
function v_u_51.getQueryStore(p145) -- name: getQueryStore
	local v_u_146 = {}
	p145.queries:forEach(function(p147, p148)
		-- upvalues: (copy) v_u_146
		v_u_146[p148] = {
			["variables"] = p147.variables,
			["networkStatus"] = p147.networkStatus,
			["networkError"] = p147.networkError,
			["graphQLErrors"] = p147.graphQLErrors
		}
	end)
	return v_u_146
end
function v_u_51.resetErrors(p149, p150) -- name: resetErrors
	-- upvalues: (copy) v_u_6
	local v151 = p149.queries:get(p150)
	if v_u_6.toJSBoolean(v151) then
		v151.networkError = nil
		v151.graphQLErrors = {}
	end
end
function v_u_51.transform(p152, p153) -- name: transform
	-- upvalues: (copy) v_u_28, (copy) v_u_6, (copy) v_u_26, (copy) v_u_23, (copy) v_u_24, (copy) v_u_9, (copy) v_u_5
	local v154 = p152.transformCache
	if not v154:has(p153) then
		local v155 = p152.cache:transformDocument(p153)
		local v156 = v_u_28(p152.cache:transformForLink(v155))
		local v157 = p152.localState:clientQuery(v155)
		if v_u_6.toJSBoolean(v156) then
			v156 = p152.localState:serverQuery(v156)
		end
		local v159 = {
			["document"] = v155,
			["hasClientExports"] = v_u_26(v155),
			["hasForcedResolvers"] = p152.localState:shouldForceResolvers(v155),
			["clientQuery"] = v157,
			["serverQuery"] = v156,
			["defaultVars"] = v_u_23(v_u_24(v155)),
			["asQuery"] = v_u_9.assign({}, v155, {
				["definitions"] = v_u_5.map(v155.definitions, function(p158)
					-- upvalues: (ref) v_u_9
					if p158.kind == "OperationDefinition" and p158.operation ~= "query" then
						return v_u_9.assign({}, p158, {
							["operation"] = "query"
						})
					else
						return p158
					end
				end)
			})
		}
		if p153 ~= nil and not v154:has(p153) then
			v154:set(p153, v159)
		end
		if v155 ~= nil and not v154:has(v155) then
			v154:set(v155, v159)
		end
		if v157 ~= nil and not v154:has(v157) then
			v154:set(v157, v159)
		end
		if v156 ~= nil and not v154:has(v156) then
			v154:set(v156, v159)
		end
	end
	return v154:get(p153)
end
function v_u_51.getVariables(p160, p161, p162) -- name: getVariables
	-- upvalues: (copy) v_u_9
	return v_u_9.assign({}, p160:transform(p161).defaultVars, p162)
end
function v_u_51.watchQuery(p163, p164) -- name: watchQuery
	-- upvalues: (copy) v_u_9, (copy) v_u_47, (copy) v_u_40
	local v165 = v_u_9.assign({}, p164, {
		["variables"] = p163:getVariables(p164.query, p164.variables)
	})
	local v166 = v165.notifyOnNetworkStatusChange
	if typeof(v166) == "nil" then
		v165.notifyOnNetworkStatusChange = false
	end
	local v167 = v_u_47.new(p163.cache)
	local v168 = v_u_40.new({
		["queryManager"] = p163,
		["queryInfo"] = v167,
		["options"] = v165
	})
	p163.queries:set(v168.queryId, v167)
	v167:init({
		["document"] = v165.query,
		["observableQuery"] = v168,
		["variables"] = v165.variables
	})
	return v168
end
function v_u_51.query(p_u_169, p170, p_u_171) -- name: query
	-- upvalues: (copy) v_u_17, (copy) v_u_6
	if p_u_171 == nil then
		p_u_171 = p_u_169:generateQueryId()
	end
	v_u_17(p170.query, "query option is required. You must specify your GraphQL document in the query option.")
	v_u_17(p170.query.kind == "Document", "You must wrap the query string in a \"gql\" tag.")
	v_u_17(not v_u_6.toJSBoolean(p170.returnPartialData), "returnPartialData option only supported on watchQuery.")
	v_u_17(not v_u_6.toJSBoolean(p170.pollInterval), "pollInterval option only supported on watchQuery.")
	return p_u_169:fetchQuery(p_u_171, p170):andThen(function(p172)
		-- upvalues: (copy) p_u_169, (ref) p_u_171
		p_u_169:stopQuery(p_u_171)
		return p172
	end):catch(function(p173)
		-- upvalues: (copy) p_u_169, (ref) p_u_171
		p_u_169:stopQuery(p_u_171)
		error(p173)
	end)
end
function v_u_51.generateQueryId(p174) -- name: generateQueryId
	local v175 = p174.queryIdCounter
	p174.queryIdCounter = p174.queryIdCounter + 1
	return tostring(v175)
end
function v_u_51.generateRequestId(p176) -- name: generateRequestId
	local v177 = p176.requestIdCounter
	p176.requestIdCounter = p176.requestIdCounter + 1
	return v177
end
function v_u_51.generateMutationId(p178) -- name: generateMutationId
	local v179 = p178.mutationIdCounter
	p178.mutationIdCounter = p178.mutationIdCounter + 1
	return tostring(v179)
end
function v_u_51.stopQueryInStore(p180, p181) -- name: stopQueryInStore
	p180:stopQueryInStoreNoBroadcast(p181)
	p180:broadcastQueries()
end
function v_u_51.stopQueryInStoreNoBroadcast(p182, p183) -- name: stopQueryInStoreNoBroadcast
	-- upvalues: (copy) v_u_6
	local v184 = p182.queries:get(p183)
	if v_u_6.toJSBoolean(v184) then
		v184:stop()
	end
end
function v_u_51.clearStore(p185) -- name: clearStore
	-- upvalues: (copy) v_u_18, (copy) v_u_6, (copy) v_u_43
	p185:cancelPendingFetches(v_u_18.new("Store reset while query was in flight (not completed in link chain)"))
	p185.queries:forEach(function(p186, _)
		-- upvalues: (ref) v_u_6, (ref) v_u_43
		if v_u_6.toJSBoolean(p186.observableQuery) then
			p186.networkStatus = v_u_43.loading
		else
			p186:stop()
		end
	end)
	if v_u_6.toJSBoolean(p185.mutationStore) then
		p185.mutationStore = {}
	end
	return p185.cache:reset()
end
function v_u_51.resetStore(p_u_187) -- name: resetStore
	return p_u_187:clearStore():andThen(function()
		-- upvalues: (copy) p_u_187
		return p_u_187:reFetchObservableQueries()
	end)
end
function v_u_51.getObservableQueries(p_u_188, p189) -- name: getObservableQueries
	-- upvalues: (copy) v_u_8, (copy) v_u_10, (copy) v_u_5, (copy) v_u_34, (copy) v_u_35, (copy) v_u_6, (copy) v_u_33, (copy) v_u_40, (copy) v_u_9, (copy) v_u_17, (copy) v_u_13
	local v_u_190 = p189 == nil and "active" or p189
	local v_u_191 = v_u_8.new(nil)
	local v_u_192 = v_u_8.new(nil)
	local v_u_193 = v_u_10.new()
	if v_u_5.isArray(v_u_190) then
		v_u_5.forEach(v_u_190, function(p194)
			-- upvalues: (copy) v_u_192, (ref) v_u_34, (copy) p_u_188, (ref) v_u_35, (ref) v_u_6, (copy) v_u_193
			if typeof(p194) == "string" then
				v_u_192:set(p194, false)
				return
			elseif v_u_34(p194) then
				v_u_192:set(p_u_188:transform(p194).document, false)
			elseif v_u_35(p194) and v_u_6.toJSBoolean(p194.query) then
				v_u_193:add(p194)
			end
		end)
	end
	p_u_188.queries:forEach(function(p195, p196)
		-- upvalues: (ref) v_u_6, (ref) v_u_190, (copy) v_u_191, (copy) v_u_192
		local v197 = p195.observableQuery
		local v198 = p195.document
		if v_u_6.toJSBoolean(v197) then
			if v_u_190 == "all" then
				v_u_191:set(p196, v197)
				return
			end
			local v199 = v197.queryName
			if v197.options.fetchPolicy == "standby" or not v197:hasObservers() then
				return
			end
			if v_u_190 == "active" or v_u_6.toJSBoolean(v199) and v_u_192:has(v199) or v_u_6.toJSBoolean(v198) and v_u_192:has(v198) then
				v_u_191:set(p196, v197)
				if v_u_6.toJSBoolean(v199) then
					v_u_192:set(v199, true)
				end
				if v_u_6.toJSBoolean(v198) then
					v_u_192:set(v198, true)
				end
			end
		end
	end)
	if v_u_6.toJSBoolean(v_u_193.size) then
		for _, v200 in v_u_193 do
			local v201 = v_u_33("legacyOneTimeQuery")
			local v202 = p_u_188:getQuery(v201):init({
				["document"] = v200.query,
				["variables"] = v200.variables
			})
			local v203 = v_u_40.new({
				["queryManager"] = p_u_188,
				["queryInfo"] = v202,
				["options"] = v_u_9.assign({}, v200, {
					["fetchPolicy"] = "network-only"
				})
			})
			v202:setObservableQuery(v203)
			v_u_191:set(v201, v203)
		end
	end
	if _G.__DEV__ and v_u_6.toJSBoolean(v_u_192.size) then
		v_u_192:forEach(function(p204, p205)
			-- upvalues: (ref) v_u_17, (ref) v_u_13
			if not p204 then
				v_u_17.warn(("Unknown query %s%s requested in refetchQueries options.include array"):format(typeof(p205) == "string" and "named " or "", v_u_13:JSONEncode(p205)))
			end
		end)
	end
	return v_u_191
end
function v_u_51.reFetchObservableQueries(p_u_206, p_u_207) -- name: reFetchObservableQueries
	-- upvalues: (copy) v_u_6, (copy) v_u_12, (copy) v_u_5, (copy) v_u_15
	if p_u_207 == nil then
		p_u_207 = false
	end
	local v_u_208 = {}
	p_u_206:getObservableQueries(v_u_6.toJSBoolean(p_u_207) and "all" or "active"):forEach(function(p209, p210)
		-- upvalues: (ref) v_u_6, (ref) p_u_207, (copy) v_u_208, (copy) p_u_206
		local v211 = p209.options.fetchPolicy
		p209:resetLastResults()
		if v_u_6.toJSBoolean(p_u_207) or v211 ~= "standby" and v211 ~= "cache-only" then
			local v212 = v_u_208
			table.insert(v212, p209:refetch())
		end
		p_u_206:getQuery(p210):setDiff(nil)
	end)
	p_u_206:broadcastQueries()
	return v_u_12.all(v_u_5.filter(v_u_208, v_u_15))
end
function v_u_51.setObservableQuery(p213, p214) -- name: setObservableQuery
	p213:getQuery(p214.queryId):setObservableQuery(p214)
end
function v_u_51.startGraphQLSubscription(p_u_215, p216) -- name: startGraphQLSubscription
	-- upvalues: (copy) v_u_48, (copy) v_u_27, (copy) v_u_37, (copy) v_u_29
	local v217 = p216.query
	local v_u_218 = p216.fetchPolicy
	local v_u_219 = p216.errorPolicy
	local v220 = p216.variables
	local v221 = p216.context
	local v_u_222 = p216.context == nil and {} or v221
	local v_u_223 = p_u_215:transform(v217).document
	local v224 = p_u_215:getVariables(v_u_223, v220)
	local function v227(p_u_225) -- name: makeObservable
		-- upvalues: (copy) p_u_215, (ref) v_u_223, (ref) v_u_222, (copy) v_u_218, (ref) v_u_48, (copy) v_u_219, (ref) v_u_27, (ref) v_u_37
		return p_u_215:getObservableFromLink(v_u_223, v_u_222, p_u_225):map(function(p226)
			-- upvalues: (ref) v_u_218, (ref) v_u_48, (ref) v_u_219, (ref) p_u_215, (ref) v_u_223, (copy) p_u_225, (ref) v_u_27, (ref) v_u_37
			if v_u_218 ~= "no-cache" then
				if v_u_48(p226, v_u_219) then
					p_u_215.cache:write({
						["query"] = nil,
						["result"] = nil,
						["dataId"] = "ROOT_SUBSCRIPTION",
						["variables"] = nil,
						["query"] = v_u_223,
						["result"] = p226.data,
						["variables"] = p_u_225
					})
				end
				p_u_215:broadcastQueries()
			end
			if v_u_27(p226) then
				error(v_u_37.new({
					["graphQLErrors"] = p226.errors
				}))
			end
			return p226
		end)
	end
	if not p_u_215:transform(v_u_223).hasClientExports then
		return v227(v224)
	end
	local v_u_228 = p_u_215.localState:addExportedVariables(v_u_223, v224, v_u_222):andThen(v227)
	return v_u_29.new(function(p_u_229)
		-- upvalues: (copy) v_u_228
		local v_u_230 = nil
		v_u_228:andThen(function(p231)
			-- upvalues: (ref) v_u_230, (copy) p_u_229
			v_u_230 = p231:subscribe(p_u_229)
			return v_u_230
		end, p_u_229.error)
		return function()
			-- upvalues: (ref) v_u_230
			if v_u_230 == nil then
				return v_u_230
			else
				return v_u_230:unsubscribe()
			end
		end
	end)
end
function v_u_51.stopQuery(p232, p233) -- name: stopQuery
	p232:stopQueryNoBroadcast(p233)
	p232:broadcastQueries()
end
function v_u_51.stopQueryNoBroadcast(p234, p235) -- name: stopQueryNoBroadcast
	p234:stopQueryInStoreNoBroadcast(p235)
	p234:removeQuery(p235)
end
function v_u_51.removeQuery(p236, p237) -- name: removeQuery
	p236.fetchCancelFns:delete(p237)
	p236:getQuery(p237):stop()
	p236.queries:delete(p237)
end
function v_u_51.broadcastQueries(p238) -- name: broadcastQueries
	-- upvalues: (copy) v_u_6
	if v_u_6.toJSBoolean(p238.onBroadcast) then
		p238:onBroadcast()
	end
	p238.queries:forEach(function(p239, _)
		return p239:notify()
	end)
end
function v_u_51.getLocalState(p240) -- name: getLocalState
	return p240.localState
end
function v_u_51.getObservableFromLink(p_u_241, p242, p243, p_u_244, p245) -- name: getObservableFromLink
	-- upvalues: (copy) v_u_6, (copy) v_u_25, (copy) v_u_9, (copy) v_u_8, (copy) v_u_21, (copy) v_u_32, (copy) v_u_20, (copy) v_u_29, (copy) v_u_15, (copy) v_u_30
	if p245 == nil then
		if v_u_6.toJSBoolean(p243) then
			if p243.queryDeduplication == nil then
				p245 = p_u_241.queryDeduplication
			else
				p245 = p243.queryDeduplication
			end
		else
			p245 = p_u_241.queryDeduplication
		end
	end
	local v_u_246 = p_u_241:transform(p242).serverQuery
	local v_u_247, v248
	if v_u_6.toJSBoolean(v_u_246) then
		local v_u_249 = p_u_241.inFlightLinkObservables
		local v250 = p_u_241.link
		local v251 = {
			["query"] = v_u_246,
			["variables"] = p_u_244
		}
		local v252
		if v_u_6.toJSBoolean(v_u_25(v_u_246)) then
			v252 = v_u_25(v_u_246) or nil
		else
			v252 = nil
		end
		v251.operationName = v252
		v251.context = p_u_241:prepareContext(v_u_9.assign({}, p243, {
			["forceFetch"] = not p245
		}))
		v_u_247 = v251.context
		if p245 then
			local v253 = v_u_249:get(v_u_246)
			local v_u_254 = v_u_6.toJSBoolean(v253) and v253 and v253 or v_u_8.new(nil)
			v_u_249:set(v_u_246, v_u_254)
			local v_u_255 = v_u_21(p_u_244)
			v248 = v_u_254:get(v_u_255)
			if not v_u_6.toJSBoolean(v248) then
				v248 = v_u_32.new({ (v_u_20(v250, v251)) })
				v_u_254:set(v_u_255, v248)
				v248:cleanup(function()
					-- upvalues: (ref) v_u_6, (copy) v_u_254, (copy) v_u_255, (copy) v_u_249, (copy) v_u_246
					if v_u_6.toJSBoolean(v_u_254:delete(v_u_255)) and v_u_254.size < 1 then
						v_u_249:delete(v_u_246)
					end
				end)
			end
		else
			v248 = v_u_32.new({ (v_u_20(v250, v251)) })
		end
	else
		v248 = v_u_32.new({ v_u_29.of({
				["data"] = {}
			}) })
		v_u_247 = p_u_241:prepareContext(p243)
	end
	local v_u_256 = p_u_241:transform(p242).clientQuery
	if v_u_15(v_u_256) then
		v248 = v_u_30(v248, function(p257)
			-- upvalues: (copy) p_u_241, (copy) v_u_256, (ref) v_u_247, (copy) p_u_244
			local v258 = {
				["document"] = v_u_256,
				["remoteResult"] = p257,
				["context"] = v_u_247,
				["variables"] = p_u_244
			}
			return p_u_241.localState:runResolvers(v258)
		end)
	end
	return v248
end
function v_u_51.getResultsFromLink(p259, p_u_260, p_u_261, p_u_262) -- name: getResultsFromLink
	-- upvalues: (copy) v_u_30, (copy) v_u_31, (copy) v_u_37, (copy) v_u_6, (copy) v_u_43, (copy) v_u_38
	p_u_260.lastRequestId = p259:generateRequestId()
	local v_u_263 = p_u_260.lastRequestId
	return v_u_30(p259:getObservableFromLink(p_u_260.document, p_u_262.context, p_u_262.variables), function(p264)
		-- upvalues: (ref) v_u_31, (copy) v_u_263, (copy) p_u_260, (copy) p_u_262, (ref) v_u_37, (copy) p_u_261, (ref) v_u_6, (ref) v_u_43
		local v265 = v_u_31(p264.errors)
		if v_u_263 >= p_u_260.lastRequestId then
			if v265 and p_u_262.errorPolicy == "none" then
				error(p_u_260:markError(v_u_37.new({
					["graphQLErrors"] = p264.errors
				})))
			end
			p_u_260:markResult(p264, p_u_262, p_u_261)
			p_u_260:markReady()
		end
		local v266 = {
			["data"] = nil,
			["loading"] = false,
			["networkStatus"] = nil,
			["data"] = p264.data,
			["networkStatus"] = v_u_6.toJSBoolean(p_u_260.networkStatus) and p_u_260.networkStatus or v_u_43.ready
		}
		if v265 and p_u_262.errorPolicy ~= "ignore" then
			v266.errors = p264.errors
		end
		return v266
	end, function(p267)
		-- upvalues: (ref) v_u_38, (ref) v_u_37, (copy) v_u_263, (copy) p_u_260
		if not v_u_38(p267) then
			p267 = v_u_37.new({
				["networkError"] = p267
			})
		end
		if v_u_263 >= p_u_260.lastRequestId then
			p_u_260:markError(p267)
		end
		error(p267)
	end)
end
function v_u_51.fetchQueryObservable(p_u_268, p_u_269, p_u_270, p_u_271) -- name: fetchQueryObservable
	-- upvalues: (copy) v_u_43, (copy) v_u_9, (copy) v_u_12, (copy) v_u_32, (copy) v_u_41
	if p_u_271 == nil then
		p_u_271 = v_u_43.loading
	end
	local v272 = p_u_268:transform(p_u_270.query).document
	local v273 = p_u_268:getVariables(v272, p_u_270.variables)
	local v_u_274 = p_u_268:getQuery(p_u_269)
	local v275 = p_u_270.fetchPolicy
	local v276 = p_u_270.errorPolicy
	local v277 = p_u_270.returnPartialData
	local v278 = p_u_270.notifyOnNetworkStatusChange
	local v279 = p_u_270.context
	local v280 = v275 == nil and "cache-first" or v275
	local v281 = v276 == nil and "none" or v276
	if v277 == nil then
		v277 = false
	end
	if v278 == nil then
		v278 = false
	end
	local v282 = v279 == nil and {} or v279
	local v_u_283 = v_u_9.assign({}, p_u_270, {
		["query"] = v272,
		["variables"] = v273,
		["fetchPolicy"] = v280,
		["errorPolicy"] = v281,
		["returnPartialData"] = v277,
		["notifyOnNetworkStatusChange"] = v278,
		["context"] = v282
	})
	local function v_u_285(p284) -- name: fromVariables
		-- upvalues: (copy) v_u_283, (copy) p_u_268, (copy) v_u_274, (ref) p_u_271
		v_u_283.variables = p284
		return p_u_268:fetchQueryByPolicy(v_u_274, v_u_283, p_u_271)
	end
	local v_u_286 = nil
	p_u_268.fetchCancelFns:set(p_u_269, function(p_u_287)
		-- upvalues: (ref) v_u_12, (ref) v_u_286
		v_u_12.delay(0):andThen(function()
			-- upvalues: (ref) v_u_286, (copy) p_u_287
			return v_u_286:cancel(p_u_287)
		end)
	end)
	v_u_286 = v_u_32.new((function()
		-- upvalues: (copy) p_u_268, (copy) v_u_283, (copy) v_u_285
		if p_u_268:transform(v_u_283.query).hasClientExports then
			return p_u_268.localState:addExportedVariables(v_u_283.query, v_u_283.variables, v_u_283.context):andThen(v_u_285)
		else
			return v_u_285(v_u_283.variables)
		end
	end)())
	v_u_286:cleanup(function()
		-- upvalues: (copy) p_u_268, (copy) p_u_269, (ref) v_u_41, (copy) p_u_270
		p_u_268.fetchCancelFns:delete(p_u_269)
		v_u_41(p_u_270)
	end)
	return v_u_286
end
function v_u_51.refetchQueries(p_u_288, p_u_289) -- name: refetchQueries
	-- upvalues: (copy) v_u_6, (copy) v_u_33, (copy) v_u_8, (copy) v_u_7, (copy) v_u_47
	local v290 = p_u_289.updateCache
	local v291 = p_u_289.include
	local v292 = p_u_289.optimistic
	local v293 = p_u_289.removeOptimistic
	local v_u_294 = p_u_289.onQueryUpdated
	if v292 == nil then
		v292 = false
	end
	if v293 == nil then
		if v_u_6.toJSBoolean(v292) then
			v293 = v_u_33("refetchQueries")
		else
			v293 = nil
		end
	end
	local v_u_295 = v_u_8.new(nil)
	if v_u_6.toJSBoolean(v291) then
		p_u_288:getObservableQueries(v291):forEach(function(p296, p297)
			-- upvalues: (copy) v_u_295, (copy) p_u_288
			v_u_295:set(p297, {
				["oq"] = p296,
				["lastDiff"] = p_u_288:getQuery(p297):getDiff()
			})
		end)
	end
	local v_u_298 = v_u_8.new(nil)
	if v_u_6.toJSBoolean(v290) then
		local v299 = p_u_288.cache
		local v300 = {
			["update"] = v290
		}
		local v301
		if v292 and v_u_6.toJSBoolean(v293) then
			v301 = v293
		else
			v301 = false
		end
		v300.optimistic = v301
		v300.removeOptimistic = v293
		function v300.onWatchUpdated(_, p302, p303, p304) -- name: onWatchUpdated
			-- upvalues: (ref) v_u_7, (ref) v_u_47, (ref) v_u_6, (copy) v_u_294, (copy) v_u_295, (copy) p_u_289, (copy) v_u_298
			local v305
			if v_u_7(p302.watcher, v_u_47) then
				v305 = p302.watcher.observableQuery
			else
				v305 = v_u_7(p302.watcher, v_u_47)
			end
			if v_u_6.toJSBoolean(v305) then
				if v_u_294 then
					v_u_295:delete(v305.queryId)
					local v306 = v_u_294(p_u_289, v305, p303, p304)
					if v306 == true then
						v306 = v305:refetch()
					end
					if v306 ~= false then
						v_u_298:set(v305, v306)
					end
					return false
				end
				if v_u_294 then
					v_u_295:set(v305.queryId, {
						["oq"] = v305,
						["lastDiff"] = p304,
						["diff"] = p303
					})
				end
			end
			return nil
		end
		v299:batch(v300)
	end
	if v_u_6.toJSBoolean(v_u_295.size) then
		v_u_295:forEach(function(p307, p308)
			-- upvalues: (copy) v_u_294, (copy) p_u_289, (copy) v_u_298, (copy) p_u_288
			local v309 = p307.oq
			local v310 = p307.lastDiff
			local v311 = p307.diff
			local v312
			if v_u_294 == nil then
				v312 = nil
			else
				if v311 == nil then
					local v313 = v309.queryInfo
					v313:reset()
					v311 = v313:getDiff()
				end
				v312 = v_u_294(p_u_289, v309, v311, v310)
			end
			if v_u_294 == nil or v312 == true then
				v312 = v309:refetch()
			end
			if v312 ~= false then
				v_u_298:set(v309, v312)
			end
			local v314 = string.find(p308, "legacyOneTimeQuery")
			if v314 ~= nil and v314 >= 1 then
				p_u_288:stopQueryNoBroadcast(p308)
			end
		end)
	end
	if v_u_6.toJSBoolean(v293) then
		p_u_288.cache:removeOptimistic(v293)
	end
	return v_u_298
end
function v_u_51.fetchQueryByPolicy(p_u_315, p_u_316, p317, p318) -- name: fetchQueryByPolicy
	-- upvalues: (copy) v_u_6, (copy) v_u_43, (copy) v_u_31, (copy) v_u_19, (copy) v_u_17, (copy) v_u_5, (copy) v_u_29, (copy) v_u_9, (copy) v_u_44, (copy) v_u_49
	local v_u_319 = p317.query
	local v_u_320 = p317.variables
	local v_u_321 = p317.fetchPolicy
	local v322 = p317.refetchWritePolicy
	local v_u_323 = p317.errorPolicy
	local v_u_324 = p317.returnPartialData
	local v_u_325 = p317.context
	local v326 = p317.notifyOnNetworkStatusChange
	local v327 = p_u_316.networkStatus
	p_u_316:init({
		["document"] = v_u_319,
		["variables"] = v_u_320,
		["networkStatus"] = p318
	})
	local function v328() -- name: readCache
		-- upvalues: (copy) p_u_316, (copy) v_u_320
		return p_u_316:getDiff(v_u_320)
	end
	local function v337(p_u_329, p_u_330) -- name: resultsFromCache
		-- upvalues: (ref) v_u_6, (copy) p_u_316, (ref) v_u_43, (ref) v_u_31, (ref) v_u_19, (copy) v_u_324, (ref) v_u_17, (ref) v_u_5, (ref) v_u_29, (ref) v_u_9, (ref) v_u_44, (copy) p_u_315, (copy) v_u_319, (copy) v_u_325, (copy) v_u_320
		if p_u_330 == nil then
			p_u_330 = v_u_6.toJSBoolean(p_u_316.networkStatus) and p_u_316.networkStatus or v_u_43.loading
		end
		local v331 = p_u_329.result
		if _G.__DEV__ and (p_u_329.missing ~= nil and (v_u_31(p_u_329.missing) and not (v_u_19(v331, {}) or v_u_6.toJSBoolean(v_u_324)))) then
			v_u_17.debug(("Missing cache result fields: %s"):format(v_u_5.join(v_u_5.map(p_u_329.missing, function(p332)
				-- upvalues: (ref) v_u_5
				return v_u_5.join(p332.path, ".")
			end), ", ")), p_u_329.missing)
		end
		local function v_u_334(p333) -- name: fromData
			-- upvalues: (ref) v_u_29, (ref) v_u_9, (ref) v_u_44, (ref) p_u_330, (ref) v_u_6, (copy) p_u_329
			return v_u_29.of((v_u_9.assign({}, {
				["data"] = p333,
				["loading"] = v_u_44(p_u_330),
				["networkStatus"] = p_u_330
			}, not v_u_6.toJSBoolean(p_u_329.complete) and {
				["partial"] = true
			} or nil)))
		end
		if not (v_u_6.toJSBoolean(v331) and p_u_315:transform(v_u_319).hasForcedResolvers) then
			return v_u_334(v331)
		end
		local v335 = {
			["document"] = nil,
			["remoteResult"] = nil,
			["context"] = nil,
			["variables"] = nil,
			["onlyRunForcedResolvers"] = true,
			["document"] = v_u_319,
			["remoteResult"] = {
				["data"] = v331
			},
			["context"] = v_u_325,
			["variables"] = v_u_320
		}
		return p_u_315.localState:runResolvers(v335):andThen(function(p336)
			-- upvalues: (copy) v_u_334, (ref) v_u_6
			return v_u_334(v_u_6.toJSBoolean(p336.data) and p336.data or nil)
		end)
	end
	local v_u_338
	if v_u_321 == "no-cache" then
		v_u_338 = v_u_49.FORBID
	elseif p318 == v_u_43.refetch and v322 ~= "merge" then
		v_u_338 = v_u_49.OVERWRITE
	else
		v_u_338 = v_u_49.MERGE
	end
	local function v339() -- name: resultsFromLink
		-- upvalues: (copy) p_u_315, (copy) p_u_316, (ref) v_u_338, (copy) v_u_320, (copy) v_u_325, (copy) v_u_321, (copy) v_u_323
		return p_u_315:getResultsFromLink(p_u_316, v_u_338, {
			["variables"] = v_u_320,
			["context"] = v_u_325,
			["fetchPolicy"] = v_u_321,
			["errorPolicy"] = v_u_323
		})
	end
	if v326 then
		if typeof(v327) == "number" and v327 ~= p318 then
			v326 = v_u_44(p318)
		else
			v326 = false
		end
	end
	if v_u_321 == "cache-first" then
		local v340 = p_u_316:getDiff(v_u_320)
		return v_u_6.toJSBoolean(v340.complete) and { v337(v340, p_u_316:markReady()) } or ((v_u_6.toJSBoolean(v_u_324) or v_u_6.toJSBoolean(v326)) and { v337(v340), v339() } or { v339() })
	end
	if v_u_321 == "cache-and-network" then
		local v341 = p_u_316:getDiff(v_u_320)
		return (v_u_6.toJSBoolean(v341.complete) or (v_u_6.toJSBoolean(v_u_324) or v_u_6.toJSBoolean(v326))) and { v337(v341), v339() } or { v339() }
	end
	if v_u_321 == "cache-only" then
		return { v337(p_u_316:getDiff(v_u_320), p_u_316:markReady()) }
	end
	if v_u_321 == "network-only" then
		return v_u_6.toJSBoolean(v326) and { v337(v328()), v339() } or { v339() }
	end
	if v_u_321 == "no-cache" then
		return v_u_6.toJSBoolean(v326) and { v337(p_u_316:getDiff()), v339() } or { v339() }
	end
	if v_u_321 == "standby" then
		return {}
	end
	local v342 = p_u_316:getDiff(v_u_320)
	return v_u_6.toJSBoolean(v342.complete) and { v337(v342, p_u_316:markReady()) } or ((v_u_6.toJSBoolean(v_u_324) or v_u_6.toJSBoolean(v326)) and { v337(v342), v339() } or { v339() })
end
function v_u_51.getQuery(p343, p344) -- name: getQuery
	-- upvalues: (copy) v_u_6, (copy) v_u_47
	if v_u_6.toJSBoolean(p344) and not p343.queries:has(p344) then
		p343.queries:set(p344, v_u_47.new(p343.cache))
	end
	return p343.queries:get(p344)
end
function v_u_51.prepareContext(p345, p346) -- name: prepareContext
	-- upvalues: (copy) v_u_9
	local v347 = p346 == nil and {} or p346
	local v348 = p345.localState:prepareContext(v347)
	return v_u_9.assign({}, v348, {
		["clientAwareness"] = p345.clientAwareness
	})
end
v1.QueryManager = v_u_51
return v1