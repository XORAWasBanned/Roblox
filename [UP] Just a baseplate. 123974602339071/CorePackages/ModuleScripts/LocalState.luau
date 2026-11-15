-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.core.LocalState
local v1 = script.Parent.Parent
local v2 = v1.Parent
local v3 = require(v2.LuauPolyfill)
local v_u_4 = v3.Array
local v_u_5 = v3.Object
local v_u_6 = v3.Boolean
local v_u_7 = v3.String
local v_u_8 = require(v2.Promise)
local v_u_9 = require(v1.utilities.globals.null).NULL
local v10 = {}
local v11 = require(v2.GraphQL)
local v_u_12 = v11.visit
local v_u_13 = v11.BREAK
local v_u_14 = require(v1.jsutils.invariant).invariant
require(script.Parent.Parent.cache)
local v15 = require(script.Parent.Parent.utilities)
local v_u_16 = v15.argumentsObjectFromField
local v_u_17 = v15.buildQueryFromSelectionSet
local v_u_18 = v15.createFragmentMap
local v_u_19 = v15.getFragmentDefinitions
local v_u_20 = v15.getMainDefinition
local v_u_21 = v15.hasDirectives
local v_u_22 = v15.isField
local v_u_23 = v15.isInlineFragment
local v_u_24 = v15.mergeDeep
local v_u_25 = v15.mergeDeepArray
local v_u_26 = v15.removeClientSetsFromDocument
local v_u_27 = v15.resultKeyNameFromField
local v_u_28 = v15.shouldInclude
require(script.Parent.ApolloClient_types)
require(script.Parent.types)
require(script.Parent.Parent.link.core)
local v_u_29 = require(script.Parent.Parent.cache).cacheSlot
local v_u_30 = {}
v_u_30.__index = v_u_30
function v_u_30.new(p31) -- name: new
	-- upvalues: (copy) v_u_30
	local v32 = v_u_30
	local v33 = setmetatable({}, v32)
	local v34 = p31.cache
	local v35 = p31.client
	local v36 = p31.resolvers
	local v37 = p31.fragmentMatcher
	v33.cache = v34
	if v35 ~= nil then
		v33.client = v35
	end
	if v36 ~= nil then
		v33:addResolvers(v36)
	end
	if v37 ~= nil then
		v33:setFragmentMatcher(v37)
	end
	return v33
end
function v_u_30.addResolvers(p_u_38, p39) -- name: addResolvers
	-- upvalues: (copy) v_u_6, (copy) v_u_4, (copy) v_u_24
	p_u_38.resolvers = v_u_6.toJSBoolean(p_u_38.resolvers) and (p_u_38.resolvers or {}) or {}
	if v_u_4.isArray(p39) then
		v_u_4.forEach(p39, function(p40)
			-- upvalues: (copy) p_u_38, (ref) v_u_24
			p_u_38.resolvers = v_u_24(p_u_38.resolvers, p40)
		end)
	else
		p_u_38.resolvers = v_u_24(p_u_38.resolvers, p39)
	end
end
function v_u_30.setResolvers(p41, p42) -- name: setResolvers
	p41.resolvers = {}
	p41:addResolvers(p42)
end
function v_u_30.getResolvers(p43) -- name: getResolvers
	-- upvalues: (copy) v_u_6
	return v_u_6.toJSBoolean(p43.resolvers) and p43.resolvers or {}
end
function v_u_30.runResolvers(p44, p45) -- name: runResolvers
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_8
	local v46 = p45.document
	local v_u_47 = p45.remoteResult
	local v48 = p45.context
	local v49 = p45.variables
	local v50 = p45.onlyRunForcedResolvers
	if p45.onlyRunForcedResolvers == nil then
		v50 = false
	end
	if v_u_6.toJSBoolean(v46) then
		return p44:resolveDocument(v46, v_u_47.data, v48, v49, p44.fragmentMatcher, v50):andThen(function(p51)
			-- upvalues: (ref) v_u_5, (copy) v_u_47
			return v_u_5.assign({}, v_u_47, {
				["data"] = p51.result
			})
		end)
	else
		return v_u_8.resolve(v_u_47)
	end
end
function v_u_30.setFragmentMatcher(p52, p53) -- name: setFragmentMatcher
	p52.fragmentMatcher = p53
end
function v_u_30.getFragmentMatcher(p54) -- name: getFragmentMatcher
	return p54.fragmentMatcher
end
function v_u_30.clientQuery(p55, p56) -- name: clientQuery
	-- upvalues: (copy) v_u_21, (copy) v_u_6, (copy) v_u_9
	if v_u_21({ "client" }, p56) and v_u_6.toJSBoolean(p55.resolvers) then
		return p56
	else
		return v_u_9
	end
end
function v_u_30.serverQuery(_, p57) -- name: serverQuery
	-- upvalues: (copy) v_u_26
	return v_u_26(p57)
end
function v_u_30.prepareContext(p58, p59) -- name: prepareContext
	-- upvalues: (copy) v_u_5
	local v_u_60 = p58.cache
	return v_u_5.assign({}, p59, {
		["cache"] = v_u_60,
		["getCacheKey"] = function(_, p61) -- name: getCacheKey
			-- upvalues: (copy) v_u_60
			return v_u_60:identify(p61)
		end
	})
end
function v_u_30.addExportedVariables(p62, p63, p64, p65) -- name: addExportedVariables
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_8
	local v_u_66 = p64 == nil and {} or p64
	local v67 = p65 == nil and {} or p65
	if not v_u_6.toJSBoolean(p63) then
		return v_u_8.resolve(v_u_5.assign({}, v_u_66))
	end
	local v68 = p62:buildRootValueFromCache(p63, v_u_66)
	return p62:resolveDocument(p63, v_u_6.toJSBoolean(v68) and v68 and v68 or {}, p62:prepareContext(v67), v_u_66):andThen(function(p69)
		-- upvalues: (ref) v_u_5, (ref) v_u_66
		return v_u_5.assign({}, v_u_66, p69.exportedVariables)
	end)
end
function v_u_30.shouldForceResolvers(_, p70) -- name: shouldForceResolvers
	-- upvalues: (copy) v_u_12, (copy) v_u_6, (copy) v_u_4, (copy) v_u_13
	local v_u_71 = false
	local v75 = {
		["Directive"] = {
			["enter"] = function(_, p72) -- name: enter
				-- upvalues: (ref) v_u_6, (ref) v_u_71, (ref) v_u_4, (ref) v_u_13
				v_u_71 = p72.name.value == "client" and (v_u_6.toJSBoolean(p72.arguments) and v_u_4.some(p72.arguments, function(p73)
					local v74
					if p73.name.value == "always" and p73.value.kind == "BooleanValue" then
						v74 = p73.value.value == true
					else
						v74 = false
					end
					return v74
				end))
				if v_u_71 then
					return v_u_13
				else
					return nil
				end
			end
		}
	}
	v_u_12(p70, v75)
	return v_u_71
end
function v_u_30.buildRootValueFromCache(p76, p77, p78) -- name: buildRootValueFromCache
	-- upvalues: (copy) v_u_17
	return p76.cache:diff({
		["query"] = nil,
		["variables"] = nil,
		["returnPartialData"] = true,
		["optimistic"] = false,
		["query"] = v_u_17(p77),
		["variables"] = p78
	}).result
end
function v_u_30.resolveDocument(p79, p80, p81, p82, p83, p84, p85) -- name: resolveDocument
	-- upvalues: (copy) v_u_20, (copy) v_u_19, (copy) v_u_18, (copy) v_u_6, (copy) v_u_7, (copy) v_u_5
	local v86 = p82 == nil and {} or p82
	local v87 = p83 == nil and {} or p83
	local v88 = p84 == nil and function()
		return true
	end or p84
	if p85 == nil then
		p85 = false
	end
	local v89 = v_u_20(p80)
	local v90 = v_u_18((v_u_19(p80)))
	local v91 = v89.operation
	local v92 = not v_u_6.toJSBoolean(v91) and "Query" or string.upper((string.sub(v91, 1, 1))) .. v_u_7.slice(v91, 2)
	local v_u_93 = {
		["fragmentMap"] = v90
	}
	local v94 = {
		["cache"] = p79.cache,
		["client"] = p79.client
	}
	v_u_93.context = v_u_5.assign({}, v86, v94)
	v_u_93.variables = v87
	v_u_93.fragmentMatcher = v88
	v_u_93.defaultOperationType = v92
	v_u_93.exportedVariables = {}
	v_u_93.onlyRunForcedResolvers = p85
	return p79:resolveSelectionSet(v89.selectionSet, p81, v_u_93):andThen(function(p95)
		-- upvalues: (copy) v_u_93
		return {
			["result"] = p95,
			["exportedVariables"] = v_u_93.exportedVariables
		}
	end)
end
function v_u_30.resolveSelectionSet(p_u_96, p97, p_u_98, p_u_99) -- name: resolveSelectionSet
	-- upvalues: (copy) v_u_6, (copy) v_u_28, (copy) v_u_8, (copy) v_u_22, (copy) v_u_27, (copy) v_u_23, (copy) v_u_14, (copy) v_u_4, (copy) v_u_25
	local v_u_100 = p_u_99.fragmentMap
	local v_u_101 = p_u_99.context
	local v_u_102 = p_u_99.variables
	local v_u_103 = { p_u_98 }
	local function v112(p_u_104) -- name: execute
		-- upvalues: (ref) v_u_6, (ref) v_u_28, (copy) v_u_102, (ref) v_u_8, (ref) v_u_22, (copy) p_u_96, (copy) p_u_98, (copy) p_u_99, (copy) v_u_103, (ref) v_u_27, (ref) v_u_23, (copy) v_u_100, (ref) v_u_14, (copy) v_u_101
		if not v_u_6.toJSBoolean(v_u_28(p_u_104, v_u_102)) then
			return v_u_8.resolve(nil)
		end
		if v_u_22(p_u_104) then
			return p_u_96:resolveField(p_u_104, p_u_98, p_u_99):andThen(function(p105)
				-- upvalues: (ref) v_u_103, (ref) v_u_27, (copy) p_u_104
				if typeof(p105) ~= "nil" then
					local v106 = v_u_103
					local v107 = {
						[v_u_27(p_u_104)] = p105
					}
					table.insert(v106, v107)
				end
			end)
		end
		local v108
		if v_u_23(p_u_104) then
			v108 = p_u_104
		else
			v108 = v_u_100[p_u_104.name.value]
			v_u_14(v108, ("No fragment named %s"):format(p_u_104.name.value))
		end
		if v108 and v108.typeCondition ~= nil then
			local v109 = v108.typeCondition.name.value
			if v_u_6.toJSBoolean(p_u_99:fragmentMatcher(p_u_98, v109, v_u_101)) then
				return p_u_96:resolveSelectionSet(v108.selectionSet, p_u_98, p_u_99):andThen(function(p110)
					-- upvalues: (ref) v_u_103
					local v111 = v_u_103
					table.insert(v111, p110)
				end)
			end
		end
		return v_u_8.resolve(nil)
	end
	return v_u_8.all(v_u_4.map(p97.selections, v112)):andThen(function()
		-- upvalues: (ref) v_u_25, (copy) v_u_103
		return v_u_25(v_u_103)
	end)
end
function v_u_30.resolveField(p_u_113, p_u_114, p115, p_u_116) -- name: resolveField
	-- upvalues: (copy) v_u_27, (copy) v_u_6, (copy) v_u_8, (copy) v_u_29, (copy) v_u_16, (copy) v_u_4, (copy) v_u_9
	local v117 = p_u_116.variables
	local v118 = p_u_114.name.value
	local v119 = v_u_27(p_u_114)
	local v120 = v118 ~= v119
	local v_u_121 = v_u_6.toJSBoolean(p115[v119]) and p115[v119] or p115[v118]
	local v122 = v_u_8.resolve(v_u_121)
	if not p_u_116.onlyRunForcedResolvers or p_u_113:shouldForceResolvers(p_u_114) then
		local v123 = v_u_6.toJSBoolean(p115.__typename) and p115.__typename or p_u_116.defaultOperationType
		local v124
		if v_u_6.toJSBoolean(p_u_113.resolvers) then
			v124 = p_u_113.resolvers[tostring(v123)]
		else
			v124 = p_u_113.resolvers
		end
		if v_u_6.toJSBoolean(v124) then
			if v120 then
				v119 = v118
			end
			local v125 = v124[v119]
			if v_u_6.toJSBoolean(v125) then
				v122 = v_u_8.resolve(v_u_29:withValue(p_u_113.cache, v125, {
					p115,
					v_u_16(p_u_114, v117),
					p_u_116.context,
					{
						["field"] = p_u_114,
						["fragmentMap"] = p_u_116.fragmentMap
					}
				}))
			end
		end
	end
	return v122:andThen(function(p_u_126)
		-- upvalues: (copy) v_u_121, (copy) p_u_114, (ref) v_u_4, (ref) v_u_6, (copy) p_u_116, (ref) v_u_9, (copy) p_u_113
		if p_u_126 == nil then
			p_u_126 = v_u_121
		end
		if p_u_114.directives ~= nil then
			v_u_4.forEach(p_u_114.directives, function(p127)
				-- upvalues: (ref) v_u_6, (ref) v_u_4, (ref) p_u_116, (ref) p_u_126
				if p127.name.value == "export" and v_u_6.toJSBoolean(p127.arguments) then
					v_u_4.forEach(p127.arguments, function(p128)
						-- upvalues: (ref) p_u_116, (ref) p_u_126
						if p128.name.value == "as" and p128.value.kind == "StringValue" then
							p_u_116.exportedVariables[p128.value.value] = p_u_126
						end
					end)
				end
			end)
		end
		if v_u_6.toJSBoolean(p_u_114.selectionSet) then
			if p_u_126 == nil or p_u_126 == v_u_9 then
				return p_u_126
			elseif v_u_4.isArray(p_u_126) then
				return p_u_113:resolveSubSelectedArray(p_u_114, p_u_126, p_u_116)
			elseif v_u_6.toJSBoolean(p_u_114.selectionSet) then
				return p_u_113:resolveSelectionSet(p_u_114.selectionSet, p_u_126, p_u_116)
			else
				return nil
			end
		else
			return p_u_126
		end
	end)
end
function v_u_30.resolveSubSelectedArray(p_u_129, p_u_130, p131, p_u_132) -- name: resolveSubSelectedArray
	-- upvalues: (copy) v_u_8, (copy) v_u_4, (copy) v_u_9, (copy) v_u_6
	return v_u_8.all(v_u_4.map(p131, function(p133)
		-- upvalues: (ref) v_u_9, (ref) v_u_4, (copy) p_u_129, (copy) p_u_130, (copy) p_u_132, (ref) v_u_6
		if p133 == v_u_9 then
			return v_u_9
		elseif v_u_4.isArray(p133) then
			return p_u_129:resolveSubSelectedArray(p_u_130, p133, p_u_132)
		elseif v_u_6.toJSBoolean(p_u_130.selectionSet) then
			return p_u_129:resolveSelectionSet(p_u_130.selectionSet, p133, p_u_132)
		else
			return nil
		end
	end))
end
v10.LocalState = v_u_30
return v10