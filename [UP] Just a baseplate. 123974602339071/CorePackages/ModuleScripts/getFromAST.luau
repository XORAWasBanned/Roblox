-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.utilities.graphql.getFromAST
local v1 = {}
local v2 = script.Parent.Parent.Parent
local v3 = v2.Parent
local v4 = require(v3.LuauPolyfill)
local v_u_5 = v4.Array
local v_u_6 = v4.Boolean
require(v3.GraphQL)
local v7 = require(v2.jsutils.invariant)
local v_u_8 = v7.invariant
local v_u_9 = v7.InvariantError
local v_u_10 = require(script.Parent.storeUtils).valueToObjectRepresentation
local function v_u_20(p11) -- name: checkDocument
	-- upvalues: (copy) v_u_8, (copy) v_u_5, (copy) v_u_9
	local v12 = v_u_8
	local v13
	if p11 then
		v13 = p11.kind == "Document"
	else
		v13 = p11
	end
	v12(v13, "Expecting a parsed GraphQL document. Perhaps you need to wrap the query string in a \"gql\" tag? http://docs.apollostack.com/apollo-client/core.html#gql")
	local v16 = v_u_5.map(v_u_5.filter(p11.definitions, function(p14)
		return p14.kind ~= "FragmentDefinition"
	end), function(p15)
		-- upvalues: (ref) v_u_9
		if p15.kind ~= "OperationDefinition" then
			error(v_u_9.new(("Schema type definitions not allowed in queries. Found: \"%s\""):format(p15.kind)))
		end
		return p15
	end)
	local v17 = v_u_8
	local v18 = #v16 <= 1
	local v19 = #v16
	v17(v18, ("Ambiguous GraphQL document: contains %s operations"):format((tostring(v19))))
	return p11
end
v1.checkDocument = v_u_20
function v1.getOperationDefinition(p21) -- name: getOperationDefinition
	-- upvalues: (copy) v_u_20, (copy) v_u_5
	v_u_20(p21)
	return v_u_5.filter(p21.definitions, function(p22)
		return p22.kind == "OperationDefinition"
	end)[1]
end
function v1.getOperationName(p23) -- name: getOperationName
	-- upvalues: (copy) v_u_5, (copy) v_u_6
	local v26 = v_u_5.map(v_u_5.filter(p23.definitions, function(p24)
		-- upvalues: (ref) v_u_6
		if v_u_6.toJSBoolean(p24.kind == "OperationDefinition") then
			return p24.name
		else
			return p24.kind == "OperationDefinition"
		end
	end), function(p25)
		-- upvalues: (ref) v_u_6
		return v_u_6.toJSBoolean(p25) and (v_u_6.toJSBoolean(p25.name) and p25.name.value) or nil
	end)
	return v_u_6.toJSBoolean(v26[1]) and v26[1] or nil
end
function v1.getFragmentDefinitions(p27) -- name: getFragmentDefinitions
	-- upvalues: (copy) v_u_5
	return v_u_5.filter(p27.definitions, function(p28)
		return p28.kind == "FragmentDefinition"
	end)
end
function v1.getQueryDefinition(p29) -- name: getQueryDefinition
	-- upvalues: (copy) v_u_20, (copy) v_u_5, (copy) v_u_8, (copy) v_u_6
	v_u_20(p29)
	local v31 = v_u_5.filter(p29.definitions, function(p30)
		return p30.kind == "OperationDefinition"
	end)[1]
	local v32 = v_u_8
	local v33 = v_u_6.toJSBoolean(v31)
	if v33 then
		v33 = v31.operation == "query"
	end
	v32(v33, "Must contain a query definition.")
	return v31
end
function v1.getFragmentDefinition(p34) -- name: getFragmentDefinition
	-- upvalues: (copy) v_u_8
	v_u_8(p34.kind == "Document", "Expecting a parsed GraphQL document. Perhaps you need to wrap the query string in a \"gql\" tag? http://docs.apollostack.com/apollo-client/core.html#gql")
	v_u_8(#p34.definitions <= 1, "Fragment must have exactly one definition.")
	local v35 = p34.definitions[1]
	v_u_8(v35.kind == "FragmentDefinition", "Must be a fragment definition.")
	return v35
end
function v1.getMainDefinition(p36) -- name: getMainDefinition
	-- upvalues: (copy) v_u_20, (copy) v_u_6, (copy) v_u_9
	v_u_20(p36)
	local v37 = nil
	for _, v38 in ipairs(p36.definitions) do
		if v38.kind == "OperationDefinition" then
			local v39 = v38.operation
			if v39 == "query" or (v39 == "mutation" or v39 == "subscription") then
				return v38
			end
		end
		if v38.kind ~= "FragmentDefinition" or v_u_6.toJSBoolean(v37) then
			continue
		end
		v37 = v38
	end
	if v_u_6.toJSBoolean(v37) then
		return v37
	end
	error(v_u_9.new("Expected a parsed GraphQL query with a query, mutation, subscription, or a fragment."))
end
function v1.getDefaultValues(p40) -- name: getDefaultValues
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_10
	local v_u_41 = {}
	local v42
	if p40 == nil then
		v42 = nil
	else
		v42 = p40.variableDefinitions
	end
	if v42 ~= nil and #v42 > 0 then
		v_u_5.forEach(v42, function(p43)
			-- upvalues: (ref) v_u_6, (ref) v_u_10, (copy) v_u_41
			if v_u_6.toJSBoolean(p43.defaultValue) then
				v_u_10(v_u_41, p43.variable.name, p43.defaultValue)
			end
		end)
	end
	return v_u_41
end
return v1