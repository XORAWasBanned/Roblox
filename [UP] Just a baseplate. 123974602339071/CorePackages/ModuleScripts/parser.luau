-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.react.parser
local v1 = {}
local v2 = script.Parent.Parent
local v3 = v2.Parent
local v4 = require(v3.LuauPolyfill)
local v_u_5 = v4.Array
local v_u_6 = v4.Boolean
require(v3.GraphQL)
local v_u_7 = require(v2.jsutils.invariant).invariant
local v8 = v4.Map
local v_u_9 = {
	["Query"] = 0,
	["Mutation"] = 1,
	["Subscription"] = 2
}
v1.DocumentType = v_u_9
local v_u_10 = v8.new(nil)
function v1.operationName(p11) -- name: operationName
	-- upvalues: (copy) v_u_9
	return p11 == v_u_9.Query and "Query" or (p11 == v_u_9.Mutation and "Mutation" or (p11 == v_u_9.Subscription and "Subscription" or nil))
end
function v1.parser(p12) -- name: parser
	-- upvalues: (copy) v_u_10, (copy) v_u_7, (copy) v_u_6, (copy) v_u_5, (copy) v_u_9
	local v13 = v_u_10:get(p12)
	if v13 ~= nil then
		return v13
	end
	local v14 = v_u_7
	local v15 = v_u_6.toJSBoolean(p12)
	if v15 then
		v15 = v_u_6.toJSBoolean(p12.kind)
	end
	v14(v15, ("Argument of %s passed to parser was not a valid GraphQL "):format((tostring(p12))) .. "DocumentNode. You may need to use \'graphql-tag\' or another method to convert your operation into a document")
	local v17 = v_u_5.filter(p12.definitions, function(p16)
		return p16.kind == "FragmentDefinition"
	end)
	local v20 = v_u_5.filter(p12.definitions, function(p18)
		local v19
		if p18.kind == "OperationDefinition" then
			v19 = p18.operation == "query"
		else
			v19 = false
		end
		return v19
	end)
	local v23 = v_u_5.filter(p12.definitions, function(p21)
		local v22
		if p21.kind == "OperationDefinition" then
			v22 = p21.operation == "mutation"
		else
			v22 = false
		end
		return v22
	end)
	local v26 = v_u_5.filter(p12.definitions, function(p24)
		local v25
		if p24.kind == "OperationDefinition" then
			v25 = p24.operation == "subscription"
		else
			v25 = false
		end
		return v25
	end)
	v_u_7((#v17 == 0 or (#v20 ~= 0 or #v23 ~= 0)) and true or #v26 ~= 0, "Passing only a fragment to \'graphql\' is not yet supported. You must include a query, subscription or mutation as well")
	local v27 = v_u_7
	local v28 = #v20 + #v23 + #v26 <= 1
	local v29 = tostring(p12)
	local v30 = #v20
	local v31 = tostring(v30)
	local v32 = #v26
	local v33 = ("%s had %s queries, %s "):format(v29, v31, (tostring(v32)))
	local v34 = #v23
	v27(v28, "react-apollo only supports a query, subscription, or a mutation per HOC. " .. v33 .. ("subscriptions and %s mutations. "):format((tostring(v34))) .. "You can use \'compose\' to join multiple operation types to a component")
	local v35
	if #v20 == 0 then
		v35 = v_u_9.Mutation
	else
		v35 = v_u_9.Query
	end
	if #v20 == 0 and #v23 == 0 then
		v35 = v_u_9.Subscription
	end
	if #v20 > 0 then
		v26 = v20
	elseif #v23 > 0 then
		v26 = v23
	end
	local v36 = v_u_7
	local v37 = #v26 == 1
	local v38 = ("react-apollo only supports one definition per HOC. %s had "):format((tostring(p12)))
	local v39 = #v26
	v36(v37, v38 .. ("%s definitions. "):format((tostring(v39))) .. "You can use \'compose\' to join multiple operation types to a component")
	local v40 = v26[1]
	local v41 = v40.variableDefinitions and (v40.variableDefinitions or {}) or {}
	local v42 = {
		["name"] = (not v40.name or v40.name.kind ~= "Name") and "data" or v40.name.value,
		["type"] = v35,
		["variables"] = v41
	}
	v_u_10:set(p12, v42)
	return v42
end
return v1