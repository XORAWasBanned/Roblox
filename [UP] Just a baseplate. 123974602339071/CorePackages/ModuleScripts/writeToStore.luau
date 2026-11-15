-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.cache.inmemory.writeToStore
local v_u_1 = _G.__DEV__
local v2 = {}
local v3 = script.Parent.Parent.Parent
local v4 = v3.Parent
local v5 = require(v4.LuauPolyfill)
local v_u_6 = v5.Boolean
local v_u_7 = v5.Object
local v_u_8 = v5.Map
local v_u_9 = v5.Set
local v_u_10 = v5.Array
local v_u_11 = require(v3.utilities).NULL
local v_u_12 = game:GetService("HttpService")
require(v4.GraphQL)
local v13 = require(v3.jsutils.invariant)
local v_u_14 = v13.invariant
local v_u_15 = v13.InvariantError
local v_u_16 = require(v3.jsutils.equal)
local v_u_17 = require(v3.luaUtils.objectKeysForEach)
local v18 = require(v3.utilities)
local v_u_19 = v18.createFragmentMap
local v_u_20 = v18.getFragmentFromSelection
local v_u_21 = v18.getDefaultValues
local v_u_22 = v18.getFragmentDefinitions
local v_u_23 = v18.getOperationDefinition
local v_u_24 = v18.getTypenameFromResult
local v_u_25 = v18.makeReference
local v_u_26 = v18.isField
local v_u_27 = v18.resultKeyNameFromField
local v_u_28 = v18.isReference
local v_u_29 = v18.shouldInclude
local v_u_30 = v18.cloneDeep
local v_u_31 = v18.addTypenameToDocument
require(script.Parent.types)
local v32 = require(script.Parent.helpers)
local v_u_33 = v32.makeProcessedFieldsMerger
local v_u_34 = v32.fieldNameFromStoreName
local v_u_35 = v32.storeValueIsStoreObject
require(script.Parent.entityStore)
require(script.Parent.Parent.core.types.Cache)
local v_u_36 = require(script.Parent["object-canon"]).canonicalStringify
require(script.Parent.writeToStore_types)
local v_u_37 = nil
local v_u_38 = nil
local v_u_39 = nil
local v_u_40 = nil
local v_u_41 = nil
local v_u_42 = {}
v_u_42.__index = v_u_42
function v_u_42.new(p43, p44) -- name: new
	-- upvalues: (copy) v_u_42
	local v45 = v_u_42
	local v46 = setmetatable({}, v45)
	v46.cache = p43
	v46.reader = p44
	return v46
end
function v_u_42.writeToStore(p_u_47, p_u_48, p49) -- name: writeToStore
	-- upvalues: (copy) v_u_23, (copy) v_u_33, (copy) v_u_7, (copy) v_u_21, (copy) v_u_36, (copy) v_u_19, (copy) v_u_22, (copy) v_u_8, (copy) v_u_28, (copy) v_u_15, (copy) v_u_12, (copy) v_u_25, (copy) v_u_1, (copy) v_u_34, (copy) v_u_9, (copy) v_u_26, (copy) v_u_17, (ref) v_u_37
	local v50 = p49.query
	local v51 = p49.result
	local v52 = p49.dataId
	local v53 = p49.variables
	local v54 = p49.overwrite
	local v55 = v_u_23(v50)
	local v_u_56 = v_u_33()
	local v57 = v_u_7.assign(v_u_21(v55), v53)
	local v_u_60 = {
		["store"] = nil,
		["written"] = nil,
		["merge"] = nil,
		["variables"] = nil,
		["varString"] = nil,
		["fragmentMap"] = nil,
		["overwrite"] = nil,
		["incomingById"] = nil,
		["clientOnly"] = false,
		["store"] = p_u_48,
		["written"] = {},
		["merge"] = function(p58, p59)
			-- upvalues: (copy) v_u_56
			return v_u_56:merge(p58, p59)
		end,
		["variables"] = v57,
		["varString"] = v_u_36(v57),
		["fragmentMap"] = v_u_19(v_u_22(v50)),
		["overwrite"] = v54 or false,
		["incomingById"] = v_u_8.new(nil)
	}
	local v61 = p_u_47:processSelectionSet({
		["result"] = v51 or {},
		["dataId"] = v52,
		["selectionSet"] = v55.selectionSet,
		["mergeTree"] = {
			["map"] = v_u_8.new(nil)
		},
		["context"] = v_u_60
	})
	if not v_u_28(v61) then
		error(v_u_15.new(("Could not identify object %s"):format(v_u_12:JSONEncode(v51))))
	end
	v_u_60.incomingById:forEach(function(p62, p63)
		-- upvalues: (ref) v_u_25, (copy) p_u_47, (copy) v_u_60, (ref) v_u_28, (ref) v_u_1, (ref) v_u_34, (ref) v_u_9, (ref) v_u_26, (ref) v_u_17, (ref) v_u_37, (copy) p_u_48
		local v_u_64 = p62.fields
		local v_u_65 = p62.mergeTree
		local v66 = p62.selections
		local v_u_67 = v_u_25(p63)
		if v_u_65.map.size > 0 then
			v_u_64 = p_u_47:applyMerges(v_u_65, v_u_67, v_u_64, v_u_60)
			if v_u_28(v_u_64) then
				return
			end
		end
		if v_u_1 and not v_u_60.overwrite then
			local v_u_68 = nil
			v_u_68 = v_u_9.new()
			v66:forEach(function(p69)
				-- upvalues: (ref) v_u_26, (ref) v_u_68
				if v_u_26(p69) and p69.selectionSet then
					v_u_68:add(p69.name.value)
				end
			end)
			v_u_17(v_u_64, function(p70)
				-- upvalues: (ref) v_u_68, (ref) v_u_34, (copy) v_u_65, (ref) v_u_37, (copy) v_u_67, (ref) v_u_64, (ref) v_u_60
				if v_u_68:has(v_u_34(p70)) then
					local v71 = v_u_65.map:get(p70)
					local v72
					if v71 == nil or v71.info == nil then
						v72 = false
					else
						v72 = v71.info.merge ~= nil
					end
					if not v72 then
						v_u_37(v_u_67, v_u_64, p70, v_u_60.store)
					end
				end
			end)
		end
		p_u_48:merge(p63, v_u_64)
	end)
	p_u_48:retain(v61.__ref)
	return v61
end
function v_u_42.processSelectionSet(p73, p74) -- name: processSelectionSet
	-- upvalues: (copy) v_u_25, (copy) v_u_10, (copy) v_u_24, (copy) v_u_9, (copy) v_u_29, (copy) v_u_26, (copy) v_u_27, (ref) v_u_38, (copy) v_u_28, (ref) v_u_39, (copy) v_u_31, (copy) v_u_14, (copy) v_u_12, (copy) v_u_20, (ref) v_u_40
	local v75 = p74.dataId
	local v76 = p74.result
	local v77 = p74.selectionSet
	local v78 = p74.context
	local v79 = p74.mergeTree
	local v80 = p73.cache.policies
	local v81 = v80:identify(v76, v77, v78.fragmentMap)
	local v82, v83 = table.unpack(v81, 1, 2)
	local v84 = v75 or v82
	if type(v84) == "string" then
		local v85
		if v78.written[v84] == nil then
			v85 = {}
			v78.written[v84] = v85
		else
			v85 = v78.written[v84]
		end
		local v86 = v_u_25(v84)
		if v_u_10.indexOf(v85, v77) >= 1 then
			return v86
		end
		table.insert(v85, v77)
		if p73.reader ~= nil and p73.reader:isFresh(v76, v86, v77, v78) then
			return v86
		end
	end
	local v87 = {}
	if v83 ~= nil then
		v87 = v78.merge(v87, v83)
	end
	local v88
	if v84 then
		v88 = v80.rootTypenamesById[v84]
	else
		v88 = v84
	end
	local v89 = v88 or v_u_24(v76, v77, v78.fragmentMap)
	if not v89 then
		if v84 then
			v89 = v78.store:get(v84, "__typename")
		else
			v89 = v84
		end
	end
	if type(v89) == "string" then
		v87.__typename = v89
	end
	local v90 = v_u_9.new(v77.selections)
	for _, v91 in v90 do
		if not v_u_29(v91, v78.variables) then
			continue
		end
		if v_u_26(v91) then
			local v92 = v76[v_u_27(v91)]
			local v93 = v78.clientOnly
			local v94 = not v93 and v91.directives
			if v94 then
				v94 = v_u_10.some(v91.directives, function(p95)
					return p95.name.value == "client"
				end)
			end
			v78.clientOnly = v94
			if v92 == nil then
				if not (v78.clientOnly or v_u_31:added(v91)) then
					local v96 = v_u_14.error
					local v97 = ("Missing field \'%s\' while writing result %s"):format(v_u_27(v91), v_u_12:JSONEncode(v76))
					v96((string.sub(v97, 1, 1000)))
				end
			else
				local v98 = v80:getStoreFieldName({
					["typename"] = v89,
					["fieldName"] = v91.name.value,
					["field"] = v91,
					["variables"] = v78.variables
				})
				local v99 = v_u_38(v79, v98)
				local v100 = p73:processFieldValue(v92, v91, v78, v99)
				local v101
				if v91.selectionSet == nil then
					v101 = nil
				else
					v101 = v78.store:getFieldValue(v100, "__typename")
					if not v101 and v_u_28(v100) then
						local v102 = v78.incomingById:get(v100.__ref)
						if v102 == nil then
							v101 = nil
						else
							v101 = v102.fields.__typename
						end
					end
				end
				local v103 = v80:getMergeFunction(v89, v91.name.value, v101)
				if v103 == nil then
					v_u_39(v79, v98)
				else
					v99.info = {
						["field"] = v91,
						["typename"] = v89,
						["merge"] = v103
					}
				end
				v87 = v78.merge(v87, {
					[v98] = v100
				})
			end
			v78.clientOnly = v93
		else
			local v104 = v_u_20(v91, v78.fragmentMap)
			if not (v104 and v80:fragmentMatches(v104, v89, v76, v78.variables)) then
				continue
			end
			v_u_10.forEach(v104.selectionSet.selections, v90.add, v90)
		end
	end
	if type(v84) ~= "string" then
		return v87
	end
	local v105 = v78.incomingById:get(v84)
	if v105 then
		v105.fields = v78.merge(v105.fields, v87)
		v105.mergeTree = v_u_40(v105.mergeTree, v79)
		v105.selections:forEach(v90.add, v90)
		v105.selections = v90
	else
		v78.incomingById:set(v84, {
			["fields"] = v87,
			["mergeTree"] = v79,
			["selections"] = v90
		})
	end
	return v_u_25(v84)
end
function v_u_42.processFieldValue(p_u_106, p107, p_u_108, p_u_109, p_u_110) -- name: processFieldValue
	-- upvalues: (copy) v_u_11, (copy) v_u_1, (copy) v_u_30, (copy) v_u_10, (ref) v_u_38, (ref) v_u_39
	if p_u_108.selectionSet and p107 ~= v_u_11 then
		if v_u_10.isArray(p107) then
			return v_u_10.map(p107, function(p111, p112)
				-- upvalues: (copy) p_u_106, (copy) p_u_108, (copy) p_u_109, (ref) v_u_38, (copy) p_u_110, (ref) v_u_39
				local v113 = p_u_106:processFieldValue(p111, p_u_108, p_u_109, v_u_38(p_u_110, p112))
				v_u_39(p_u_110, p112)
				return v113
			end)
		else
			return p_u_106:processSelectionSet({
				["result"] = p107,
				["selectionSet"] = p_u_108.selectionSet,
				["context"] = p_u_109,
				["mergeTree"] = p_u_110
			})
		end
	elseif v_u_1 then
		return v_u_30(p107)
	else
		return p107
	end
end
function v_u_42.applyMerges(p_u_114, p115, p116, p117, p_u_118, p119) -- name: applyMerges
	-- upvalues: (copy) v_u_28, (copy) v_u_10, (copy) v_u_35, (copy) v_u_8, (copy) v_u_14, (copy) v_u_6
	if p115.map.size > 0 and not v_u_28(p117) then
		local v120
		if v_u_10.isArray(p117) then
			v120 = false
		else
			v120 = v_u_28(p116) or v_u_35(p116)
		end
		local v_u_121
		if v120 then
			v_u_121 = p116
		else
			v_u_121 = nil
		end
		local v_u_122 = p117
		local v_u_123 = v_u_121 ~= nil and not p119 and (v_u_28(v_u_121) and { v_u_121.__ref } or { v_u_121 }) or p119
		local v_u_124 = nil
		p115.map:forEach(function(p125, p126)
			-- upvalues: (copy) v_u_121, (ref) v_u_10, (copy) p_u_118, (copy) v_u_122, (ref) v_u_123, (copy) p_u_114, (ref) v_u_124, (ref) v_u_8, (ref) v_u_14
			local v127 = v_u_121
			local v128
			if v_u_10.isArray(v127) then
				if typeof(p126) == "number" then
					v128 = v127[p126]
				else
					v128 = nil
				end
			else
				v128 = p_u_118.store:getFieldValue(v127, (tostring(p126)))
			end
			local v129 = v_u_122
			local v130
			if v_u_10.isArray(v129) then
				if typeof(p126) == "number" then
					v130 = v129[p126]
				else
					v130 = nil
				end
			else
				v130 = p_u_118.store:getFieldValue(v129, (tostring(p126)))
			end
			if v130 ~= nil then
				if v_u_123 ~= nil then
					local v131 = v_u_123
					table.insert(v131, p126)
				end
				local v132 = p_u_114:applyMerges(p125, v128, v130, p_u_118, v_u_123)
				if v132 ~= v130 then
					v_u_124 = v_u_124 or v_u_8.new(nil)
					v_u_124:set(p126, v132)
				end
				if v_u_123 ~= nil then
					v_u_14(table.remove(v_u_123, #v_u_123) == p126)
				end
			end
		end)
		if v_u_124 ~= nil then
			local v_u_133 = table.clone(v_u_122)
			v_u_124:forEach(function(p134, p135)
				-- upvalues: (ref) v_u_133
				v_u_133[p135] = p134
			end)
			p117 = v_u_133
		end
		p119 = v_u_123
	end
	if p115.info then
		return p_u_114.cache.policies:runMergeFunction(p116, p117, p115.info, p_u_118, v_u_6.toJSBoolean(p119) and p_u_118.store:getStorage(table.unpack(p119)) or nil)
	else
		return p117
	end
end
v2.StoreWriter = v_u_42
local v_u_136 = {}
v_u_38 = function(p137, p138) -- name: getChildMergeTree
	-- upvalues: (copy) v_u_136, (copy) v_u_8
	local v139 = p137.map
	if not v139:has(p138) then
		v139:set(p138, table.remove(v_u_136, #v_u_136) or {
			["map"] = v_u_8.new(nil)
		})
	end
	return v139:get(p138)
end
v_u_40 = function(p_u_140, p_u_141) -- name: mergeMergeTrees
	-- upvalues: (ref) v_u_41, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (ref) v_u_40
	if p_u_140 == p_u_141 or (p_u_141 == nil or v_u_41(p_u_141)) then
		return p_u_140
	end
	if p_u_140 == nil or v_u_41(p_u_140) then
		return p_u_141
	end
	local v142
	if p_u_140.info and p_u_141.info then
		v142 = v_u_7.assign(table.clone(p_u_140.info), p_u_141.info)
	else
		v142 = p_u_140.info or p_u_141.info
	end
	local v143
	if p_u_140.map.size > 0 then
		v143 = p_u_141.map.size
	else
		v143 = p_u_140.map.size
	end
	local v144
	if v143 > 0 then
		v144 = v_u_8.new()
	elseif p_u_140.map.size > 0 then
		v144 = p_u_140.map
	else
		v144 = p_u_141.map
	end
	local v_u_145 = {
		["info"] = v142,
		["map"] = v144
	}
	if v143 > 0 then
		local v_u_146 = v_u_9.new(p_u_141.map:keys())
		p_u_140.map:forEach(function(p147, p148)
			-- upvalues: (copy) v_u_145, (ref) v_u_40, (copy) p_u_141, (copy) v_u_146
			v_u_145.map:set(p148, v_u_40(p147, p_u_141.map:get(p148)))
			v_u_146:delete(p148)
		end)
		v_u_146:forEach(function(p149)
			-- upvalues: (copy) v_u_145, (ref) v_u_40, (copy) p_u_141, (copy) p_u_140
			v_u_145.map:set(p149, v_u_40(p_u_141.map:get(p149), p_u_140.map:get(p149)))
		end)
	end
	return v_u_145
end
v_u_41 = function(p150) -- name: mergeTreeIsEmpty
	local v151 = not p150
	if not v151 then
		local v152 = p150.info or p150.map.size > 0
		v151 = not v152
	end
	return v151
end
v_u_39 = function(p153, p154) -- name: maybeRecycleChildMergeTree
	-- upvalues: (ref) v_u_41, (copy) v_u_136
	local v155 = p153.map
	local v156 = v155:get(p154)
	if v156 ~= nil and v_u_41(v156) then
		local v157 = v_u_136
		table.insert(v157, v156)
		v155:delete(p154)
	end
end
local v_u_158 = v_u_9.new()
v_u_37 = function(p159, p160, p161, p_u_162) -- name: warnAboutDataLoss
	-- upvalues: (copy) v_u_28, (copy) v_u_16, (copy) v_u_10, (copy) v_u_7, (copy) v_u_6, (copy) v_u_34, (copy) v_u_158, (copy) v_u_14, (copy) v_u_12
	local v163 = p_u_162:getFieldValue(p159, p161)
	if typeof(v163) ~= "table" then
		v163 = false
	end
	if v163 then
		local v_u_164 = p_u_162:getFieldValue(p160, p161)
		if typeof(v_u_164) ~= "table" then
			v_u_164 = false
		end
		if v_u_164 then
			if v_u_28(v163) then
				return
			elseif v_u_16(v163, v_u_164) then
				return
			elseif v_u_10.every(v_u_7.keys(v163), function(p165)
				-- upvalues: (copy) p_u_162, (copy) v_u_164
				return p_u_162:getFieldValue(v_u_164, p165) ~= nil
			end) then
				return
			else
				local v166 = p_u_162:getFieldValue(p159, "__typename")
				local v167 = v_u_6.toJSBoolean(v166) and v166 and v166 or p_u_162:getFieldValue(p160, "__typename")
				local v168 = v_u_34(p161)
				local v169 = ("%s.%s"):format(v167, v168)
				if not v_u_158:has(v169) then
					v_u_158:add(v169)
					local v_u_170 = {}
					if not (v_u_10.isArray(v163) or v_u_10.isArray(v_u_164)) then
						v_u_10.forEach({ v163, v_u_164 }, function(p171)
							-- upvalues: (copy) p_u_162, (ref) v_u_10, (copy) v_u_170
							local v172 = p_u_162:getFieldValue(p171, "__typename")
							if typeof(v172) == "string" and not v_u_10.includes(v_u_170, v172) then
								local v173 = v_u_170
								table.insert(v173, v172)
							end
						end)
					end
					local v174 = v_u_14.warn
					local v175 = not v_u_6.toJSBoolean(#v_u_170) and "" or "either ensure all objects of type " .. v_u_10.join(v_u_170, " and ") .. " have an ID or a custom merge function, or "
					local v176 = v_u_12:JSONEncode(v163)
					local v177 = string.sub(v176, 1, 1000)
					local v178 = v_u_12:JSONEncode(v_u_164)
					v174(("Cache data may be lost when replacing the %s field of a %s object.\n\n\tTo address this problem (which is not a bug in Apollo Client), %sdefine a custom merge function for the %s field, so InMemoryCache can safely merge these objects:\n\n\t  existing: %s\n\t  incoming: %s\n\n\tFor more information about these options, please refer to the documentation:\n\n\t  * Ensuring entity objects have IDs: https://go.apollo.dev/c/generating-unique-identifiers\n\t  * Defining custom merge functions: https://go.apollo.dev/c/merging-non-normalized-objects\n\t"):format(v168, v167, v175, v169, v177, (string.sub(v178, 1, 1000))))
				end
			end
		else
			return
		end
	else
		return
	end
end
return v2