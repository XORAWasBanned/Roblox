-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.react.data.OperationData
local v1 = {}
local v2 = script.Parent.Parent.Parent
local v3 = v2.Parent
local v_u_4 = require(v3.LuauPolyfill).Boolean
require(v3.GraphQL)
local v_u_5 = require(v2.jsutils.equal)
local v_u_6 = require(v2.jsutils.invariant).invariant
require(script.Parent.Parent.Parent.core)
local v7 = require(script.Parent.Parent.parser)
local v_u_8 = v7.parser
local v_u_9 = v7.operationName
require(script.Parent.Parent.types.types)
local v_u_10 = {}
v_u_10.__index = v_u_10
function v_u_10.new(p11, p12) -- name: new
	-- upvalues: (copy) v_u_4, (copy) v_u_10
	local v13 = {
		["options"] = v_u_4.toJSBoolean(p11) and p11 and p11 or {},
		["context"] = v_u_4.toJSBoolean(p12) and p12 and p12 or {}
	}
	local v14 = v_u_10
	return setmetatable(v13, v14)
end
function v_u_10.getOptions(p15) -- name: getOptions
	return p15.options
end
function v_u_10.setOptions(p16, p17, p18) -- name: setOptions
	-- upvalues: (copy) v_u_5
	if p18 == nil then
		p18 = false
	end
	if p18 and not v_u_5(p16.options, p17) then
		p16.previousOptions = p16.options
	end
	p16.options = p17
end
function v_u_10.unmount(p19) -- name: unmount
	p19.isMounted = false
end
function v_u_10.refreshClient(p20) -- name: refreshClient
	-- upvalues: (copy) v_u_4, (copy) v_u_6
	local v21 = v_u_4.toJSBoolean
	local v22
	if v_u_4.toJSBoolean(p20.options) then
		v22 = p20.options.client
	else
		v22 = p20.options
	end
	local v23, v24
	if not v21(v22) then
		if v_u_4.toJSBoolean(p20.context) then
			v23 = p20.context.client
		else
			v23 = p20.context
		end
		v_u_6(v_u_4.toJSBoolean(v23), "Could not find \"client\" in the context or passed in as an option. Wrap the root component in an <ApolloProvider>, or pass an ApolloClient instance in via options.")
		if v23 == p20.client then
			v24 = false
		else
			p20.client = v23
			p20:cleanup()
			v24 = true
		end
		return {
			["client"] = p20.client,
			["isNew"] = v24
		}
	end
	if v_u_4.toJSBoolean(p20.options) then
		v23 = p20.options.client
	else
		v23 = p20.options
	end
	if v23 then
		v_u_6(v_u_4.toJSBoolean(v23), "Could not find \"client\" in the context or passed in as an option. Wrap the root component in an <ApolloProvider>, or pass an ApolloClient instance in via options.")
		if v23 == p20.client then
			v24 = false
		else
			p20.client = v23
			p20:cleanup()
			v24 = true
		end
		return {
			["client"] = p20.client,
			["isNew"] = v24
		}
	end
	if v_u_4.toJSBoolean(p20.context) then
		v23 = p20.context.client
	else
		v23 = p20.context
	end
	v_u_6(v_u_4.toJSBoolean(v23), "Could not find \"client\" in the context or passed in as an option. Wrap the root component in an <ApolloProvider>, or pass an ApolloClient instance in via options.")
	if v23 == p20.client then
		v24 = false
	else
		p20.client = v23
		p20:cleanup()
		v24 = true
	end
	return {
		["client"] = p20.client,
		["isNew"] = v24
	}
end
function v_u_10.verifyDocumentType(_, p25, p26) -- name: verifyDocumentType
	-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_6
	local v27 = v_u_8(p25)
	local v28 = v_u_9(p26)
	local v29 = v_u_9(v27.type)
	v_u_6(v27.type == p26, ("Running a %s requires a graphql "):format(v28) .. ("%s, but a %s was used instead."):format(v28, v29))
end
v1.OperationData = v_u_10
return v1