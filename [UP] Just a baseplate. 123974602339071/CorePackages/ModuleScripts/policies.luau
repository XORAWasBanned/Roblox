-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.cache.inmemory.policies
local v1 = script.Parent.Parent.Parent
local v2 = v1.Parent
local v_u_3 = game:GetService("HttpService")
local v4 = require(v2.LuauPolyfill)
local v_u_5 = v4.Array
local v_u_6 = v4.Object
local v_u_7 = v4.Set
local v_u_8 = v4.Map
local v_u_9 = require(v1.luaUtils.isCallable)
local v_u_10 = require(v1.luaUtils.objectKeysForEach)
local v_u_11 = require(v2.LuauRegExp)
local v12 = {}
local v_u_13 = nil
local v_u_14 = nil
local v_u_15 = nil
local v_u_16 = nil
local v_u_17 = nil
local v_u_18 = nil
require(v2.GraphQL)
local v_u_19 = require(v1.wry.trie).Trie
local v20 = require(v1.jsutils.invariant)
local v_u_21 = v20.invariant
local v_u_22 = v20.InvariantError
local v23 = require(script.Parent.Parent.Parent.utilities)
local v_u_24 = v23.getFragmentFromSelection
local v_u_25 = v23.isField
local v_u_26 = v23.getTypenameFromResult
local v_u_27 = v23.storeKeyNameFromField
local v_u_28 = v23.argumentsObjectFromField
local v_u_29 = v23.isReference
local v_u_30 = v23.getStoreKeyName
local v_u_31 = v23.canUseWeakMap
local v_u_32 = v23.isNonNullObject
local v_u_33 = v23.stringifyForDisplay
local v34 = require(script.Parent.helpers)
local v_u_35 = require(v1.luaUtils.hasOwnProperty)
local v_u_36 = v34.fieldNameFromStoreName
local v_u_37 = v34.storeValueIsStoreObject
local v_u_38 = v34.selectionSetMatchesResult
local v_u_39 = v34.TypeOrFieldNameRegExp
local v_u_40 = require(script.Parent.reactiveVars).cacheSlot
require(script.Parent.Parent.core.types.common)
require(script.Parent.writeToStore_types)
v_u_30:setStringify(require(script.Parent["object-canon"]).canonicalStringify)
require(script.Parent.policies_types)
local function v_u_49(_, p41, p42) -- name: defaultDataIdFromObject
	-- upvalues: (copy) v_u_3
	local v43 = p41.__typename
	local v44 = p41.id
	local v45 = p41._id
	if type(v43) == "string" then
		if p42 then
			if v44 == nil then
				if v45 == nil then
					p42.keyObject = nil
				else
					p42.keyObject = {
						["_id"] = v45
					}
				end
			else
				p42.keyObject = {
					["id"] = v44
				}
			end
		end
		if v44 ~= nil then
			v45 = v44
		end
		if v45 ~= nil then
			local v46 = type(v45)
			local v47 = string.format
			local v48 = "%s:%s"
			if v46 ~= "number" and v46 ~= "string" then
				v45 = v_u_3:JSONEncode(v45)
			end
			return v47(v48, v43, v45)
		end
	end
	return nil
end
v12.defaultDataIdFromObject = v_u_49
local function v_u_50(_) -- name: nullKeyFieldsFn
	return nil
end
local function v_u_52(_, p51) -- name: simpleKeyArgsFn
	return p51.fieldName
end
local function v_u_56(_, p53, p54, p55) -- name: mergeTrueFn
	return p55:mergeObjects(p53, p54)
end
local function v_u_58(_, _, p57) -- name: mergeFalseFn
	return p57
end
local v_u_59 = {}
v_u_59.__index = v_u_59
function v_u_59.new(p60) -- name: new
	-- upvalues: (copy) v_u_59, (copy) v_u_8, (copy) v_u_6, (copy) v_u_49
	local v61 = v_u_59
	local v62 = setmetatable({}, v61)
	v62.typePolicies = {}
	v62.toBeAdded = {}
	v62.supertypeMap = v_u_8.new(nil)
	v62.fuzzySubtypes = v_u_8.new(nil)
	v62.cache = nil
	v62.rootIdsByTypename = {}
	v62.rootTypenamesById = {}
	v62.usingPossibleTypes = false
	v62.config = p60
	local v63 = {
		["dataIdFromObject"] = v_u_49
	}
	v62.config = v_u_6.assign(v63, p60)
	v62.cache = v62.config.cache
	v62:setRootTypename("Query")
	v62:setRootTypename("Mutation")
	v62:setRootTypename("Subscription")
	if p60.possibleTypes then
		v62:addPossibleTypes(p60.possibleTypes)
	end
	if p60.typePolicies then
		v62:addTypePolicies(p60.typePolicies)
	end
	return v62
end
function v_u_59.identify(p64, p65, p66, p67) -- name: identify
	-- upvalues: (copy) v_u_26, (ref) v_u_16
	local v68
	if p66 and p67 then
		v68 = v_u_26(p65, p66, p67)
	else
		v68 = p65.__typename
	end
	if v68 == p64.rootTypenamesById.ROOT_QUERY then
		return { "ROOT_QUERY" }
	end
	local v69 = {
		["typename"] = v68,
		["selectionSet"] = p66,
		["fragmentMap"] = p67
	}
	local v70 = nil
	if v68 then
		v68 = p64:getTypePolicy(v68)
	end
	local v71
	if v68 and v68.keyFn then
		v71 = v68.keyFn
	else
		v71 = p64.config.dataIdFromObject
	end
	while true do
		if not v71 then
			v72 = v70
			break
		end
		local v72 = v71(v68, p65, v69)
		if type(v72) ~= "table" then
			break
		end
		v71 = v_u_16(v72)
	end
	local v73
	if v72 then
		v73 = tostring(v72)
	else
		v73 = nil
	end
	return v69.keyObject and { v73, v69.keyObject } or { v73 }
end
function v_u_59.addTypePolicies(p_u_74, p_u_75) -- name: addTypePolicies
	-- upvalues: (copy) v_u_10, (copy) v_u_6, (copy) v_u_35
	v_u_10(p_u_75, function(p76)
		-- upvalues: (copy) p_u_75, (ref) v_u_6, (copy) p_u_74, (ref) v_u_35
		local v77 = p_u_75[p76]
		local v78 = v77.queryType
		local v79 = v77.mutationType
		local v80 = v77.subscriptionType
		local v81 = v_u_6.assign({}, v77, {
			["queryType"] = v_u_6.None,
			["mutationType"] = v_u_6.None,
			["subscriptionType"] = v_u_6.None
		})
		if v78 then
			p_u_74:setRootTypename("Query", p76)
		end
		if v79 then
			p_u_74:setRootTypename("Mutation", p76)
		end
		if v80 then
			p_u_74:setRootTypename("Subscription", p76)
		end
		if v_u_35(p_u_74.toBeAdded, p76) then
			local v82 = p_u_74.toBeAdded[p76]
			table.insert(v82, v81)
		else
			p_u_74.toBeAdded[p76] = { v81 }
		end
	end)
end
function v_u_59.updateTypePolicy(p_u_83, p_u_84, p85) -- name: updateTypePolicy
	-- upvalues: (copy) v_u_9, (ref) v_u_56, (ref) v_u_58, (copy) v_u_50, (ref) v_u_16, (copy) v_u_10, (copy) v_u_52, (ref) v_u_15
	local v86 = p_u_83:getTypePolicy(p_u_84)
	local v87 = p85.keyFields
	local v_u_88 = p85.fields
	local v89 = p85.merge
	if v_u_9(v89) then
		v86.merge = v89
	elseif v89 == true then
		v86.merge = v_u_56
	elseif v89 == false then
		v86.merge = v_u_58
	else
		v86.merge = v86.merge
	end
	if v87 == false then
		v86.keyFn = v_u_50
	else
		local v90 = type(v87)
		if v90 == "table" then
			v86.keyFn = v_u_16(v87)
		elseif v90 == "function" then
			v86.keyFn = v87
		else
			v86.keyFn = v86.keyFn
		end
	end
	if v_u_88 then
		v_u_10(v_u_88, function(p91)
			-- upvalues: (copy) p_u_83, (copy) p_u_84, (copy) v_u_88, (ref) v_u_52, (ref) v_u_15, (ref) v_u_9, (ref) v_u_56, (ref) v_u_58
			local v92 = p_u_83:getFieldPolicy(p_u_84, p91, true)
			local v93 = v_u_88[p91]
			if type(v93) == "function" then
				v92.read = v93
			else
				local v94 = v93.keyArgs
				local v95 = v93.read
				local v96 = v93.merge
				if v94 == false then
					v92.keyFn = v_u_52
				else
					local v97 = type(v94)
					if v97 == "table" then
						v92.keyFn = v_u_15(v94)
					elseif v97 == "function" then
						v92.keyFn = v94
					else
						v92.keyFn = v92.keyFn
					end
				end
				if type(v95) == "function" then
					v92.read = v95
				end
				if v_u_9(v96) then
					v92.merge = v96
				elseif v96 == true then
					v92.merge = v_u_56
				elseif v96 == false then
					v92.merge = v_u_58
				else
					v92.merge = v92.merge
				end
			end
			if v92.read and v92.merge then
				v92.keyFn = v92.keyFn or v_u_52
			end
		end)
	end
end
function v_u_59.setRootTypename(p98, p99, p100) -- name: setRootTypename
	-- upvalues: (copy) v_u_21
	if p100 == nil then
		p100 = p99
	end
	local v101 = "ROOT_" .. string.upper(p99)
	local v102 = p98.rootTypenamesById[v101]
	if p100 ~= v102 then
		local v103 = not v102 or v102 == p99
		if not v103 then
			v_u_21(v103, ("Cannot change root %s __typename more than once"):format(p99))
		end
		if v102 then
			p98.rootIdsByTypename[v102] = nil
		end
		p98.rootIdsByTypename[p100] = v101
		p98.rootTypenamesById[v101] = p100
	end
end
function v_u_59.addPossibleTypes(p_u_104, p_u_105) -- name: addPossibleTypes
	-- upvalues: (copy) v_u_10, (copy) v_u_5, (copy) v_u_39, (copy) v_u_11
	p_u_104.usingPossibleTypes = true
	v_u_10(p_u_105, function(p_u_106)
		-- upvalues: (copy) p_u_104, (ref) v_u_5, (copy) p_u_105, (ref) v_u_39, (ref) v_u_11
		p_u_104:getSupertypeSet(p_u_106, true)
		v_u_5.forEach(p_u_105[p_u_106], function(p107)
			-- upvalues: (ref) p_u_104, (copy) p_u_106, (ref) v_u_39, (ref) v_u_11
			p_u_104:getSupertypeSet(p107, true):add(p_u_106)
			local v108 = v_u_39:exec(p107)
			if not v108 or v108[1] ~= p107 then
				p_u_104.fuzzySubtypes:set(p107, v_u_11.new(p107))
			end
		end)
	end)
end
function v_u_59.getTypePolicy(p_u_109, p_u_110) -- name: getTypePolicy
	-- upvalues: (copy) v_u_35, (copy) v_u_6, (copy) v_u_5
	if not v_u_35(p_u_109.typePolicies, p_u_110) then
		p_u_109.typePolicies[p_u_110] = {}
		local v_u_111 = p_u_109.typePolicies[p_u_110]
		v_u_111.fields = {}
		local v112 = p_u_109.supertypeMap:get(p_u_110)
		if v112 and v112.size > 0 then
			v112:forEach(function(p113)
				-- upvalues: (copy) p_u_109, (ref) v_u_6, (copy) v_u_111
				local v114 = p_u_109:getTypePolicy(p113)
				local v115 = v114.fields
				local v116 = v_u_6.assign(table.clone(v114), {
					["fields"] = v_u_6.None
				})
				v_u_6.assign(v_u_111, v116)
				v_u_6.assign(v_u_111.fields, v115)
			end)
		end
	end
	local v117 = p_u_109.toBeAdded[p_u_110]
	if v117 and #v117 > 0 then
		v_u_5.forEach(v_u_5.splice(v117, 1), function(p118)
			-- upvalues: (copy) p_u_109, (copy) p_u_110
			p_u_109:updateTypePolicy(p_u_110, p118)
		end)
	end
	return p_u_109.typePolicies[p_u_110]
end
function v_u_59.getFieldPolicy(p119, p120, p121, p122) -- name: getFieldPolicy
	if not p120 then
		return nil
	end
	local v123 = p119:getTypePolicy(p120).fields
	if v123[p121] then
		return v123[p121]
	end
	if not p122 then
		return nil
	end
	v123[p121] = {}
	return v123[p121]
end
function v_u_59.getSupertypeSet(p124, p125, p126) -- name: getSupertypeSet
	-- upvalues: (copy) v_u_7
	local v127 = p124.supertypeMap:get(p125)
	if not v127 and p126 then
		v127 = v_u_7.new()
		p124.supertypeMap:set(p125, v127)
	end
	return v127
end
function v_u_59.fragmentMatches(p_u_128, p129, p_u_130, p131, p132) -- name: fragmentMatches
	-- upvalues: (copy) v_u_5, (copy) v_u_21, (copy) v_u_38
	if not p129.typeCondition then
		return true
	end
	if not p_u_130 then
		return false
	end
	local v133 = p129.typeCondition.name.value
	if p_u_130 == v133 then
		return true
	end
	if p_u_128.usingPossibleTypes and p_u_128.supertypeMap:has(v133) then
		local v134 = p_u_128:getSupertypeSet(p_u_130, true)
		local v_u_135 = { v134 }
		local function v139(p136) -- name: maybeEnqueue
			-- upvalues: (copy) p_u_128, (ref) v_u_5, (copy) v_u_135
			local v137 = p_u_128:getSupertypeSet(p136, false)
			if v137 and (v137.size > 0 and v_u_5.indexOf(v_u_135, v137) < 1) then
				local v138 = v_u_135
				table.insert(v138, v137)
			end
		end
		local v140
		if p131 == nil then
			v140 = false
		else
			v140 = p_u_128.fuzzySubtypes.size > 0
		end
		local v141 = false
		for v142, _ in v_u_135 do
			local v143 = v_u_135[v142]
			if v143:has(v133) then
				if not v134:has(v133) then
					if v141 then
						v_u_21.warn(("Inferring subtype %s of supertype %s"):format(p_u_130, v133))
					end
					v134:add(v133)
				end
				return true
			end
			v143:forEach(v139)
			if not v140 or (v142 ~= #v_u_135 or not v_u_38(p129.selectionSet, p131, p132)) then
				continue
			end
			v_u_5.forEach(p_u_128.fuzzySubtypes:entries(), function(p144)
				-- upvalues: (copy) p_u_130, (copy) p_u_128, (ref) v_u_5, (copy) v_u_135
				local v145 = p144[2]
				local v146 = p144[1]
				local v147 = v145:exec(p_u_130)
				if v147 and v147[1] == p_u_130 then
					local v148 = p_u_128:getSupertypeSet(v146, false)
					if v148 and (v148.size > 0 and v_u_5.indexOf(v_u_135, v148) < 1) then
						local v149 = v_u_135
						table.insert(v149, v148)
					end
				end
				return 1
			end)
			v140 = false
			v141 = true
		end
	end
	return false
end
function v_u_59.hasKeyArgs(p150, p151, p152) -- name: hasKeyArgs
	local v153 = p150:getFieldPolicy(p151, p152, false)
	local v154
	if v153 == nil then
		v154 = false
	else
		v154 = v153.keyFn ~= nil
	end
	return v154
end
function v_u_59.getStoreFieldName(p155, p156) -- name: getStoreFieldName
	-- upvalues: (copy) v_u_28, (ref) v_u_15, (copy) v_u_27, (copy) v_u_30, (copy) v_u_36
	local v157 = p156.typename
	local v158 = p156.fieldName
	local v159 = p155:getFieldPolicy(v157, v158, false)
	local v160 = nil
	local v161
	if v159 then
		v161 = v159.keyFn
	else
		v161 = nil
	end
	if v161 and v157 then
		local v162 = {
			["typename"] = v157,
			["fieldName"] = v158,
			["field"] = p156.field or nil,
			["variables"] = p156.variables
		}
		local v163
		if p156.args == nil then
			if p156.field then
				v163 = v_u_28(p156.field, p156.variables)
			else
				v163 = nil
			end
		else
			v163 = p156.args
		end
		while v161 do
			local v164 = v161(v163, v162)
			if type(v164) ~= "table" then
				v160 = v164 or v158
				break
			end
			v161 = v_u_15(v164)
		end
	end
	if v160 == nil then
		if p156.field then
			v160 = v_u_27(p156.field, p156.variables)
		else
			local v165 = v_u_30
			local v166
			if p156.args == nil then
				if p156.field then
					v166 = v_u_28(p156.field, p156.variables)
				else
					v166 = nil
				end
			else
				v166 = p156.args
			end
			v160 = v165(v158, v166)
		end
	end
	if v160 == false then
		return v158
	elseif v158 == v_u_36(v160) then
		return v160
	else
		return v158 .. ":" .. v160
	end
end
function v_u_59.readField(p167, p168, p169) -- name: readField
	-- upvalues: (copy) v_u_36, (ref) v_u_13, (copy) v_u_40
	local v170 = p168.from
	if v170 then
		if p168.field or p168.fieldName then
			local v171 = p168.typename == nil and p169.store:getFieldValue(v170, "__typename")
			if v171 then
				p168.typename = v171
			end
			local v172 = p167:getStoreFieldName(p168)
			local v173 = v_u_36(v172)
			local v174 = p169.store:getFieldValue(v170, v172)
			local v175 = p167:getFieldPolicy(p168.typename, v173, false)
			local v176
			if v175 then
				v176 = v175.read
			else
				v176 = nil
			end
			if not v176 then
				return v174
			end
			local v177 = v_u_13
			local v178 = p169.store
			local v179
			if v170.__ref then
				v179 = v170.__ref
			else
				v179 = v170
			end
			local v180 = { v174, (v177(p167, v170, p168, p169, v178:getStorage(v179, v172))) }
			return v_u_40:withValue(p167.cache, v176, v180)
		end
	end
end
function v_u_59.getMergeFunction(p181, p182, p183, p184) -- name: getMergeFunction
	local v185 = p181:getFieldPolicy(p182, p183, false)
	if v185 then
		v185 = v185.merge
	end
	local v186 = not v185 and (p184 and p181:getTypePolicy(p184))
	if v186 then
		return v186.merge
	else
		return v186
	end
end
function v_u_59.runMergeFunction(p187, p188, p189, p190, p191, p192) -- name: runMergeFunction
	-- upvalues: (ref) v_u_56, (ref) v_u_14, (ref) v_u_58, (ref) v_u_13
	local v193 = p190.field
	local v194 = p190.typename
	local v195 = p190.merge
	if v195 == v_u_56 then
		return v_u_14(p191.store)(p190, p188, p189)
	end
	if v195 == v_u_58 then
		return p189
	end
	if p191.overwrite then
		p188 = nil
	end
	return v195(p190, p188, p189, v_u_13(p187, nil, {
		["typename"] = v194,
		["fieldName"] = v193.name.value,
		["field"] = v193,
		["variables"] = p191.variables
	}, p191, p192 or {}))
end
v12.Policies = v_u_59
v_u_13 = function(p_u_196, p_u_197, p198, p_u_199, p200) -- name: makeFieldFunctionOptions
	-- upvalues: (copy) v_u_36, (copy) v_u_28, (copy) v_u_29, (copy) v_u_6, (copy) v_u_35, (copy) v_u_21, (copy) v_u_33, (copy) v_u_5, (ref) v_u_14
	local v201 = p_u_196:getStoreFieldName(p198)
	local v202 = v_u_36(v201)
	local v_u_203 = p198.variables or p_u_199.variables
	local v204 = {}
	local v205
	if p198.args == nil then
		if p198.field then
			v205 = v_u_28(p198.field, p198.variables)
		else
			v205 = nil
		end
	else
		v205 = p198.args
	end
	v204.args = v205
	v204.field = p198.field or nil
	v204.fieldName = v202
	v204.storeFieldName = v201
	v204.variables = v_u_203
	function v204.isReference(_, ...) -- name: isReference
		-- upvalues: (ref) v_u_29
		return v_u_29(...)
	end
	v204.toReference = p_u_199.store.toReference
	v204.storage = p200
	v204.cache = p_u_196.cache
	v204.canRead = p_u_199.store.canRead
	function v204.readField(_, p206, ...) -- name: readField
		-- upvalues: (ref) v_u_6, (copy) p_u_197, (ref) v_u_35, (ref) v_u_21, (ref) v_u_33, (ref) v_u_5, (copy) v_u_203, (copy) p_u_196, (copy) p_u_199
		local v207 = type(p206)
		local v208 = {}
		local v209
		if v207 == "table" then
			v209 = v_u_6.assign(table.clone(p206), p206.from == v_u_6.None and {
				["from"] = "<Object.None>"
			} or nil)
		else
			v209 = p206
		end
		__set_list(v208, 1, {v209, select("#", ...) >= 1 and "<nil>" or nil})
		local v210
		if v207 == "string" then
			v210 = {
				["fieldName"] = p206
			}
			local v211
			if select("#", ...) >= 1 then
				v211 = ...
			else
				v211 = p_u_197
			end
			v210.from = v211
		else
			if v207 ~= "table" then
				v_u_21.warn(("Unexpected readField arguments: %s"):format(v_u_33(v_u_5.from(v208))))
				return
			end
			v210 = v_u_6.assign({}, p206)
			if not v_u_35(p206, "from") then
				v210.from = p_u_197
			end
		end
		if _G.__DEV__ and v210.from == nil then
			v_u_21.warn(("Undefined \'from\' passed to readField with arguments %s"):format(v_u_33(v_u_5.from(v208))))
		end
		if v210.variables == nil then
			v210.variables = v_u_203
		end
		return p_u_196:readField(v210, p_u_199)
	end
	v204.mergeObjects = v_u_14(p_u_199.store)
	return v204
end
v_u_14 = function(p_u_212) -- name: makeMergeObjectsFunction
	-- upvalues: (copy) v_u_5, (copy) v_u_22, (copy) v_u_32, (copy) v_u_29, (copy) v_u_37, (copy) v_u_6
	return function(_, p213, p214)
		-- upvalues: (ref) v_u_5, (ref) v_u_22, (ref) v_u_32, (copy) p_u_212, (ref) v_u_29, (ref) v_u_37, (ref) v_u_6
		if v_u_5.isArray(p213) or v_u_5.isArray(p214) then
			error(v_u_22.new("Cannot automatically merge arrays"))
		end
		if v_u_32(p213) and v_u_32(p214) then
			local v215 = p_u_212:getFieldValue(p213, "__typename")
			local v216 = p_u_212:getFieldValue(p214, "__typename")
			local v217
			if v215 == nil or v216 == nil then
				v217 = false
			else
				v217 = v215 ~= v216
			end
			if v217 then
				return p214
			end
			if v_u_29(p213) and v_u_37(p214) then
				p_u_212:merge(p213.__ref, p214)
				return p213
			end
			if v_u_37(p213) and v_u_29(p214) then
				p_u_212:merge(p213, p214.__ref)
				return p214
			end
			if v_u_37(p213) and v_u_37(p214) then
				return v_u_6.assign({}, p213, p214)
			end
		end
		return p214
	end
end
local function v_u_225(p_u_218, p_u_219) -- name: keyObjEncode
	-- upvalues: (copy) v_u_5, (copy) v_u_225, (copy) v_u_3
	local v220 = typeof(p_u_219) == "table"
	assert(v220, "specifier must be an array")
	return not next(p_u_219) and "[]" or "{" .. v_u_5.join(v_u_5.filter(v_u_5.map(p_u_219, function(p221, p222)
		-- upvalues: (ref) v_u_5, (copy) p_u_218, (copy) p_u_219, (ref) v_u_225, (ref) v_u_3
		if v_u_5.isArray(p221) then
			return ""
		end
		if not p_u_218[p221] then
			return ""
		end
		if p222 >= #p_u_219 then
			return v_u_3:JSONEncode(p221) .. ":" .. v_u_3:JSONEncode(p_u_218[p221])
		end
		local v223
		if v_u_5.isArray(p_u_219[p222 + 1]) then
			v223 = v_u_225(p_u_218[p221], p_u_219[p222 + 1])
		else
			v223 = v_u_3:JSONEncode(p_u_218[p221])
		end
		return v_u_3:JSONEncode(p221) .. ":" .. v223
	end), function(p224)
		return p224 ~= ""
	end), ",") .. "}"
end
v_u_15 = function(p_u_226) -- name: keyArgsFnFromSpecifier
	-- upvalues: (copy) v_u_225, (ref) v_u_18
	return function(p227, p228)
		-- upvalues: (ref) v_u_225, (ref) v_u_18, (copy) p_u_226
		if p227 then
			return ("%s:%s"):format(p228.fieldName, (v_u_225(v_u_18(p227, p_u_226, false), p_u_226)))
		else
			return p228.fieldName
		end
	end
end
v_u_16 = function(p_u_229) -- name: keyFieldsFnFromSpecifier
	-- upvalues: (copy) v_u_19, (copy) v_u_31, (ref) v_u_17, (ref) v_u_18, (copy) v_u_225
	local v_u_230 = v_u_19.new(v_u_31)
	return function(_, p231, p232)
		-- upvalues: (copy) v_u_230, (ref) v_u_17, (ref) v_u_18, (copy) p_u_229, (ref) v_u_225
		local v233
		if p232.selectionSet and p232.fragmentMap then
			local v234 = v_u_230:lookupArray({ p232.selectionSet, p232.fragmentMap })
			if v234.aliasMap then
				v233 = v234.aliasMap
			else
				v234.aliasMap = v_u_17(p232.selectionSet, p232.fragmentMap)
				v233 = v234.aliasMap
			end
		else
			v233 = nil
		end
		p232.keyObject = v_u_18(p231, p_u_229, true, v233)
		local v235 = p232.keyObject
		return ("%s:%s"):format(p232.typename or "null", (v_u_225(v235, p_u_229)))
	end
end
v_u_17 = function(p236, p_u_237) -- name: makeAliasMap
	-- upvalues: (copy) v_u_7, (copy) v_u_5, (copy) v_u_25, (ref) v_u_17, (copy) v_u_24
	local v_u_238 = v_u_7.new({ p236 })
	local v_u_239 = {}
	for _, v240 in v_u_238 do
		v_u_5.forEach(v240.selections, function(p241)
			-- upvalues: (ref) v_u_25, (copy) v_u_239, (ref) v_u_17, (copy) p_u_237, (ref) v_u_24, (copy) v_u_238
			if v_u_25(p241) then
				if p241.alias then
					local v242 = p241.alias.value
					local v243 = p241.name.value
					if v243 ~= v242 then
						local v244
						if v_u_239.aliases then
							v244 = v_u_239.aliases
						else
							v_u_239.aliases = {}
							v244 = v_u_239.aliases
						end
						v244[v243] = v242
					end
				end
				if p241.selectionSet then
					local v245
					if v_u_239.subsets then
						v245 = v_u_239.subsets
					else
						v_u_239.subsets = {}
						v245 = v_u_239.subsets
					end
					v245[p241.name.value] = v_u_17(p241.selectionSet, p_u_237)
					return
				end
			else
				local v246 = v_u_24(p241, p_u_237)
				if v246 then
					v_u_238:add(v246.selectionSet)
				end
			end
		end)
	end
	return v_u_239
end
v_u_18 = function(p247, p248, p249, p250) -- name: computeKeyObject
	-- upvalues: (ref) v_u_18, (copy) v_u_35, (copy) v_u_21
	local v251 = {}
	local v252 = nil
	for _, v253 in p248 do
		if type(v253) == "table" then
			if type(v252) ~= "string" then
				continue
			end
			local v254
			if p250 then
				v254 = p250.subsets
			else
				v254 = p250
			end
			if v254 then
				v254 = v254[v252]
			end
			v251[v252] = v_u_18(p247[v252], v253, p249, v254)
		else
			local v255
			if p250 then
				v255 = p250.aliases
			else
				v255 = p250
			end
			local v256
			if v255 and v255[v253] then
				v256 = v255[v253]
			else
				v256 = v253
			end
			if v_u_35(p247, v256) then
				v251[v253] = p247[v256]
				v252 = v253
			else
				v_u_21(not p249, ("Missing field \'%s\' while computing key fields"):format(v256))
				v252 = nil
			end
		end
	end
	return v251
end
v12.None = v_u_6.None
return v12