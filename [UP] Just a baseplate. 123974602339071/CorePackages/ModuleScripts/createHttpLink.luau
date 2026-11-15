-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.link.http.createHttpLink
local v1 = script.Parent.Parent.Parent.Parent
local v2 = require(v1.LuauPolyfill)
local v_u_3 = v2.Array
local v_u_4 = v2.Boolean
local v_u_5 = v2.Object
local v_u_6 = v2.Set
local v7 = {}
local v_u_8 = require(v1.GraphQL).visit
local v_u_9 = require(script.Parent.Parent.core).ApolloLink
local v_u_10 = require(script.Parent.Parent.Parent.utilities).Observable
local v_u_11 = require(script.Parent.serializeFetchParameter).serializeFetchParameter
local v_u_12 = require(script.Parent.selectURI).selectURI
local v_u_13 = require(script.Parent.parseAndCheckHttpResponse).parseAndCheckHttpResponse
local v_u_14 = require(script.Parent.checkFetcher).checkFetcher
local v15 = require(script.Parent.selectHttpOptionsAndBody)
local v_u_16 = v15.selectHttpOptionsAndBody
local v_u_17 = v15.fallbackHttpConfig
local v_u_18 = require(script.Parent.createSignalIfSupported).createSignalIfSupported
local v_u_19 = require(script.Parent.rewriteURIForGET).rewriteURIForGET
local v_u_20 = require(script.Parent.Parent.utils).fromError
function v7.createHttpLink(p21) -- name: createHttpLink
	-- upvalues: (copy) v_u_5, (copy) v_u_14, (copy) v_u_4, (copy) v_u_9, (copy) v_u_12, (copy) v_u_16, (copy) v_u_17, (copy) v_u_6, (copy) v_u_8, (copy) v_u_18, (copy) v_u_3, (copy) v_u_19, (copy) v_u_20, (copy) v_u_11, (copy) v_u_10, (copy) v_u_13
	local v22 = p21 == nil and {} or p21
	local v_u_23 = v22.uri == nil and "/graphql" or (v22.uri or "/graphql")
	local v_u_24 = v22.fetch
	local v25 = v22.includeExtensions
	local v_u_26 = v22.useGETForQueries
	local v_u_27
	if v22.includeUnusedVariables == nil then
		v_u_27 = false
	else
		v_u_27 = v22.includeUnusedVariables or false
	end
	local v28 = v_u_5.assign({}, v22, {
		["uri"] = v_u_5.None,
		["fetch"] = v_u_5.None,
		["includeExtensions"] = v_u_5.None,
		["useGETForQueries"] = v_u_5.None,
		["includeUnusedVariables"] = v_u_5.None
	})
	v_u_14(v_u_24)
	if not v_u_4.toJSBoolean(v_u_24) then
		v_u_24 = _G.fetch
	end
	local v_u_29 = {
		["http"] = {
			["includeExtensions"] = v25
		},
		["options"] = v28.fetchOptions,
		["credentials"] = v28.credentials,
		["headers"] = v28.headers
	}
	return v_u_9.new(function(_, p_u_30)
		-- upvalues: (ref) v_u_12, (copy) v_u_23, (ref) v_u_4, (ref) v_u_5, (ref) v_u_16, (ref) v_u_17, (copy) v_u_29, (copy) v_u_27, (ref) v_u_6, (ref) v_u_8, (ref) v_u_18, (copy) v_u_26, (ref) v_u_3, (ref) v_u_19, (ref) v_u_20, (ref) v_u_11, (ref) v_u_10, (ref) v_u_24, (ref) v_u_13
		local v_u_31 = v_u_12(p_u_30, v_u_23)
		local v32 = p_u_30:getContext()
		local v33 = {}
		if v_u_4.toJSBoolean(v32.clientAwareness) then
			local v34 = v32.clientAwareness.name
			local v35 = v32.clientAwareness.version
			if v_u_4.toJSBoolean(v34) then
				v33["apollographql-client-name"] = v34
			end
			if v_u_4.toJSBoolean(v35) then
				v33["apollographql-client-version"] = v35
			end
		end
		local v36 = v_u_5.assign({}, v33, v32.headers)
		local v37 = v_u_16(p_u_30, v_u_17, v_u_29, {
			["http"] = v32.http,
			["options"] = v32.fetchOptions,
			["credentials"] = v32.credentials,
			["headers"] = v36
		})
		local v_u_38 = v37.options
		local v_u_39 = v37.body
		if v_u_39.variables ~= nil and not v_u_27 then
			local v_u_40 = v_u_6.new(v_u_5.keys(v_u_39.variables))
			local v43 = {
				["Variable"] = function(_, p41, _, p42) -- name: Variable
					-- upvalues: (ref) v_u_4, (copy) v_u_40
					if v_u_4.toJSBoolean(p42) and p42.kind ~= "VariableDefinition" then
						v_u_40:delete(p41.name.value)
					end
				end
			}
			v_u_8(p_u_30.query, v43)
			if v_u_4.toJSBoolean(v_u_40.size) then
				v_u_39.variables = v_u_5.assign({}, v_u_39.variables)
				v_u_40:forEach(function(p44)
					-- upvalues: (copy) v_u_39
					v_u_39.variables[p44] = nil
				end)
			end
		end
		local v_u_45
		if v_u_4.toJSBoolean(v_u_38.signal) then
			v_u_45 = nil
		else
			local v46 = v_u_18()
			local v47 = v46.controller
			local v48 = v46.signal
			v_u_45 = v47
			if v_u_4.toJSBoolean(v_u_45) then
				v_u_38.signal = v48
			end
		end
		if v_u_4.toJSBoolean(v_u_26) and not v_u_3.some(p_u_30.query.definitions, function(p49) -- name: definitionIsMutation
			local v50
			if p49.kind == "OperationDefinition" then
				v50 = p49.operation == "mutation"
			else
				v50 = false
			end
			return v50
		end) then
			v_u_38.method = "GET"
		end
		if v_u_38.method == "GET" then
			local v51 = v_u_19(v_u_31, v_u_39)
			v_u_31 = v51.newURI
			local v52 = v51.parseError
			if v_u_4.toJSBoolean(v52) then
				return v_u_20(v52)
			end
		else
			local function v53()
				-- upvalues: (copy) v_u_38, (ref) v_u_11, (copy) v_u_39
				v_u_38.body = v_u_11(v_u_39, "Payload")
			end
			local v54, v55 = pcall(v53)
			if not v54 then
				return v_u_20(v55)
			end
		end
		return v_u_10.new(function(p_u_56)
			-- upvalues: (ref) v_u_24, (ref) v_u_31, (copy) v_u_38, (copy) p_u_30, (ref) v_u_13, (ref) v_u_4, (ref) v_u_45
			v_u_24(v_u_31, v_u_38):andThen(function(p57)
				-- upvalues: (ref) p_u_30
				p_u_30:setContext({
					["response"] = p57
				})
				return p57
			end):andThen(v_u_13(p_u_30)):andThen(function(p58)
				-- upvalues: (copy) p_u_56
				p_u_56:next(p58)
				p_u_56:complete()
				return p58
			end):catch(function(p59)
				-- upvalues: (ref) v_u_4, (copy) p_u_56
				if p59.name ~= "AbortError" then
					if v_u_4.toJSBoolean(p59.result) and (v_u_4.toJSBoolean(p59.result.errors) and v_u_4.toJSBoolean(p59.result.data)) then
						p_u_56:next(p59.result)
					end
					p_u_56:error(p59)
				end
			end)
			return function()
				-- upvalues: (ref) v_u_4, (ref) v_u_45
				if v_u_4.toJSBoolean(v_u_45) then
					v_u_45:abort()
				end
			end
		end)
	end)
end
return v7