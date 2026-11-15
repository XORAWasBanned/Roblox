-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.react.data.MutationData
local v1 = {}
local v2 = script.Parent.Parent.Parent
local v3 = v2.Parent
local v4 = require(v3.LuauPolyfill)
local v_u_5 = v4.Boolean
local v_u_6 = v4.Object
local v_u_7 = require(v2.jsutils.equal)
local v_u_8 = require(script.Parent.Parent.parser).DocumentType
local v_u_9 = require(v2.errors).ApolloError
require(script.Parent.Parent.types.types)
local v_u_10 = require(script.Parent.OperationData).OperationData
local v_u_11 = require(v2.core).mergeOptions
require(v2.link.core)
local v_u_12 = setmetatable({}, {
	["__index"] = v_u_10
})
v_u_12.__index = v_u_12
function v_u_12.new(p13) -- name: new
	-- upvalues: (copy) v_u_10, (copy) v_u_5, (copy) v_u_8, (copy) v_u_12
	local v_u_14 = v_u_10.new(p13.options, p13.context)
	function v_u_14.runMutation(p15)
		-- upvalues: (copy) v_u_14, (ref) v_u_5
		local v16 = p15 == nil and {} or p15
		v_u_14:onMutationStart()
		local v_u_17 = v_u_14:generateNewMutationId()
		return v_u_14:mutate(v16):andThen(function(p18)
			-- upvalues: (ref) v_u_14, (copy) v_u_17
			v_u_14:onMutationCompleted(p18, v_u_17)
			return p18
		end):catch(function(p19)
			-- upvalues: (ref) v_u_14, (copy) v_u_17, (ref) v_u_5
			local v20 = v_u_14:getOptions()
			local v21 = v20.onError
			v_u_14:onMutationError(p19, v_u_17)
			if v_u_5.toJSBoolean(v21) then
				v21(v20, p19)
				return {
					["data"] = nil,
					["errors"] = nil,
					["errors"] = p19
				}
			end
			error(p19)
		end)
	end
	v_u_14:verifyDocumentType(p13.options.mutation, v_u_8.Mutation)
	v_u_14.result = p13.result
	v_u_14.setResult = p13.setResult
	v_u_14.mostRecentMutationId = 0
	local v22 = v_u_12
	return setmetatable(v_u_14, v22)
end
function v_u_12.execute(p23, p24) -- name: execute
	-- upvalues: (copy) v_u_8, (copy) v_u_6
	p23.isMounted = true
	p23:verifyDocumentType(p23:getOptions().mutation, v_u_8.Mutation)
	return { p23.runMutation, v_u_6.assign({}, p24, {
			["client"] = p23:refreshClient().client
		}) }
end
function v_u_12.afterExecute(p_u_25) -- name: afterExecute
	p_u_25.isMounted = true
	return function(...)
		-- upvalues: (copy) p_u_25
		return p_u_25:unmount(...)
	end
end
function v_u_12.cleanup(_) -- name: cleanup end
function v_u_12.mutate(p26, p27) -- name: mutate
	-- upvalues: (copy) v_u_11
	return p26:refreshClient().client:mutate(v_u_11(p26:getOptions(), p27))
end
function v_u_12.onMutationStart(p28) -- name: onMutationStart
	if not (p28.result.loading or p28:getOptions().ignoreResults) then
		p28:updateResult({
			["loading"] = true,
			["error"] = nil,
			["data"] = nil,
			["called"] = true
		})
	end
end
function v_u_12.onMutationCompleted(p29, p30, p31) -- name: onMutationCompleted
	-- upvalues: (copy) v_u_9, (copy) v_u_5
	local v32 = p29:getOptions()
	local v33 = v32.onCompleted
	local v34 = v32.ignoreResults
	local v35 = p30.data
	local v36 = p30.errors
	local v37
	if v36 and #v36 > 0 then
		v37 = v_u_9.new({
			["graphQLErrors"] = v36
		})
	else
		v37 = nil
	end
	if p29:isMostRecentMutation(p31) and not v34 then
		p29:updateResult({
			["called"] = true,
			["loading"] = false,
			["data"] = nil,
			["error"] = nil,
			["data"] = v35,
			["error"] = v37
		})
	end
	if v_u_5.toJSBoolean(v33) then
		v33(v35)
	end
end
function v_u_12.onMutationError(p38, p39, p40) -- name: onMutationError
	if p38:isMostRecentMutation(p40) then
		p38:updateResult({
			["loading"] = false,
			["error"] = nil,
			["data"] = nil,
			["called"] = true,
			["error"] = p39
		})
	end
end
function v_u_12.generateNewMutationId(p41) -- name: generateNewMutationId
	p41.mostRecentMutationId = p41.mostRecentMutationId + 1
	return p41.mostRecentMutationId
end
function v_u_12.isMostRecentMutation(p42, p43) -- name: isMostRecentMutation
	return p42.mostRecentMutationId == p43
end
function v_u_12.updateResult(p44, p45) -- name: updateResult
	-- upvalues: (copy) v_u_7
	if not p44.isMounted or p44.previousResult and v_u_7(p44.previousResult, p45) then
		return nil
	end
	p44:setResult(p45)
	p44.previousResult = p45
	return p45
end
v1.MutationData = v_u_12
return v1