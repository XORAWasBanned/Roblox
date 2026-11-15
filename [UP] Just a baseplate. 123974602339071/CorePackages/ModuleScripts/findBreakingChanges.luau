-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.utilities.findBreakingChanges
local v1 = script.Parent.Parent
local v2 = v1.Parent
local v3 = require(v2.LuauPolyfill)
local v_u_4 = v3.Array
local v_u_5 = v3.Object
local v_u_6 = require(v1.luaUtils.keyMapOrdered).keyMapOrdered
local v7 = v1.jsutils
local v_u_8 = require(v7.inspect).inspect
local v_u_9 = require(v7.invariant).invariant
local v_u_10 = require(v7.naturalCompare).naturalCompare
local v11 = v1.language
local v_u_12 = require(v11.printer).print
local v_u_13 = require(v11.visitor).visit
require(v11.ast)
local v14 = v1.type
require(v14.schema)
local v15 = require(v14.definition)
local v_u_16 = require(v14.scalars).isSpecifiedScalarType
local v_u_17 = v15.isScalarType
local v_u_18 = v15.isObjectType
local v_u_19 = v15.isInterfaceType
local v_u_20 = v15.isUnionType
local v_u_21 = v15.isEnumType
local v_u_22 = v15.isInputObjectType
local v_u_23 = v15.isNonNullType
local v_u_24 = v15.isListType
local v_u_25 = v15.isNamedType
local v_u_26 = v15.isRequiredArgument
local v_u_27 = v15.isRequiredInputField
local v_u_28 = require(script.Parent.astFromValue).astFromValue
local v_u_29 = nil
local v_u_30 = nil
local v_u_31 = nil
local v_u_32 = nil
local v_u_33 = nil
local v_u_34 = nil
local v_u_35 = nil
local v_u_36 = nil
local v_u_37 = nil
local v_u_38 = nil
local v_u_39 = nil
local v_u_40 = nil
local v_u_41 = nil
local v_u_42 = nil
local v_u_43 = v_u_5.freeze({
	["TYPE_REMOVED"] = "TYPE_REMOVED",
	["TYPE_CHANGED_KIND"] = "TYPE_CHANGED_KIND",
	["TYPE_REMOVED_FROM_UNION"] = "TYPE_REMOVED_FROM_UNION",
	["VALUE_REMOVED_FROM_ENUM"] = "VALUE_REMOVED_FROM_ENUM",
	["REQUIRED_INPUT_FIELD_ADDED"] = "REQUIRED_INPUT_FIELD_ADDED",
	["IMPLEMENTED_INTERFACE_REMOVED"] = "IMPLEMENTED_INTERFACE_REMOVED",
	["FIELD_REMOVED"] = "FIELD_REMOVED",
	["FIELD_CHANGED_KIND"] = "FIELD_CHANGED_KIND",
	["REQUIRED_ARG_ADDED"] = "REQUIRED_ARG_ADDED",
	["ARG_REMOVED"] = "ARG_REMOVED",
	["ARG_CHANGED_KIND"] = "ARG_CHANGED_KIND",
	["DIRECTIVE_REMOVED"] = "DIRECTIVE_REMOVED",
	["DIRECTIVE_ARG_REMOVED"] = "DIRECTIVE_ARG_REMOVED",
	["REQUIRED_DIRECTIVE_ARG_ADDED"] = "REQUIRED_DIRECTIVE_ARG_ADDED",
	["DIRECTIVE_REPEATABLE_REMOVED"] = "DIRECTIVE_REPEATABLE_REMOVED",
	["DIRECTIVE_LOCATION_REMOVED"] = "DIRECTIVE_LOCATION_REMOVED"
})
local v_u_44 = v_u_5.freeze({
	["VALUE_ADDED_TO_ENUM"] = "VALUE_ADDED_TO_ENUM",
	["TYPE_ADDED_TO_UNION"] = "TYPE_ADDED_TO_UNION",
	["OPTIONAL_INPUT_FIELD_ADDED"] = "OPTIONAL_INPUT_FIELD_ADDED",
	["OPTIONAL_ARG_ADDED"] = "OPTIONAL_ARG_ADDED",
	["IMPLEMENTED_INTERFACE_ADDED"] = "IMPLEMENTED_INTERFACE_ADDED",
	["ARG_DEFAULT_VALUE_CHANGE"] = "ARG_DEFAULT_VALUE_CHANGE"
})
local function v48(p45, p46) -- name: findBreakingChanges
	-- upvalues: (copy) v_u_4, (ref) v_u_29, (copy) v_u_43
	return v_u_4.filter(v_u_29(p45, p46), function(p47)
		-- upvalues: (ref) v_u_43
		return v_u_43[p47.type] ~= nil
	end)
end
local function v52(p49, p50) -- name: findDangerousChanges
	-- upvalues: (copy) v_u_4, (ref) v_u_29, (copy) v_u_44
	return v_u_4.filter(v_u_29(p49, p50), function(p51)
		-- upvalues: (ref) v_u_44
		return v_u_44[p51.type] ~= nil
	end)
end
v_u_29 = function(p53, p54) -- name: findSchemaChanges
	-- upvalues: (copy) v_u_4, (ref) v_u_30, (ref) v_u_31
	return v_u_4.concat(v_u_30(p53, p54), v_u_31(p53, p54))
end
v_u_31 = function(p55, p56) -- name: findDirectiveChanges
	-- upvalues: (ref) v_u_32, (copy) v_u_43, (copy) v_u_26
	local v57 = v_u_32(p55:getDirectives(), p56:getDirectives())
	local v58 = {}
	for _, v59 in ipairs(v57.removed) do
		local v60 = {
			["type"] = v_u_43.DIRECTIVE_REMOVED,
			["description"] = ("%s was removed."):format(v59.name)
		}
		table.insert(v58, v60)
	end
	for _, v61 in ipairs(v57.persisted) do
		local v62 = v61[1]
		local v63 = v61[2]
		local v64 = v_u_32(v62.args, v63.args)
		for _, v65 in ipairs(v64.added) do
			if not v_u_26(v65) then
				continue
			end
			local v66 = {
				["type"] = v_u_43.REQUIRED_DIRECTIVE_ARG_ADDED,
				["description"] = ("A required arg %s on directive %s was added."):format(v65.name, v62.name)
			}
			table.insert(v58, v66)
		end
		for _, v67 in ipairs(v64.removed) do
			local v68 = {
				["type"] = v_u_43.DIRECTIVE_ARG_REMOVED,
				["description"] = ("%s was removed from %s."):format(v67.name, v62.name)
			}
			table.insert(v58, v68)
		end
		if v62.isRepeatable and not v63.isRepeatable then
			local v69 = {
				["type"] = v_u_43.DIRECTIVE_REPEATABLE_REMOVED,
				["description"] = ("Repeatable flag was removed from %s."):format(v62.name)
			}
			table.insert(v58, v69)
		end
		for _, v70 in ipairs(v62.locations) do
			if table.find(v63.locations, v70) ~= nil then
				continue
			end
			local v71 = {
				["type"] = v_u_43.DIRECTIVE_LOCATION_REMOVED,
				["description"] = ("%s was removed from %s."):format(v70, v62.name)
			}
			table.insert(v58, v71)
		end
	end
	return v58
end
v_u_30 = function(p72, p73) -- name: findTypeChanges
	-- upvalues: (ref) v_u_32, (copy) v_u_43, (copy) v_u_16, (copy) v_u_21, (ref) v_u_33, (copy) v_u_20, (ref) v_u_34, (copy) v_u_22, (ref) v_u_35, (copy) v_u_18, (copy) v_u_4, (ref) v_u_36, (ref) v_u_37, (copy) v_u_19, (ref) v_u_38
	local v74 = v_u_32(p72:getTypeMap():values(), p73:getTypeMap():values())
	local v75 = {}
	for _, v76 in ipairs(v74.removed) do
		local v77 = {
			["type"] = v_u_43.TYPE_REMOVED,
			["description"] = v_u_16(v76) and ("Standard scalar %s was removed because it is not referenced anymore."):format(v76.name) or ("%s was removed."):format(v76.name)
		}
		table.insert(v75, v77)
	end
	for _, v78 in ipairs(v74.persisted) do
		local v79 = v78[1]
		local v80 = v78[2]
		if v_u_21(v79) and v_u_21(v80) then
			for _, v81 in ipairs(v_u_33(v79, v80)) do
				table.insert(v75, v81)
			end
		elseif v_u_20(v79) and v_u_20(v80) then
			for _, v82 in ipairs(v_u_34(v79, v80)) do
				table.insert(v75, v82)
			end
		elseif v_u_22(v79) and v_u_22(v80) then
			for _, v83 in ipairs(v_u_35(v79, v80)) do
				table.insert(v75, v83)
			end
		elseif v_u_18(v79) and v_u_18(v80) then
			for _, v84 in ipairs(v_u_4.concat(v_u_36(v79, v80), v_u_37(v79, v80))) do
				table.insert(v75, v84)
			end
		elseif v_u_19(v79) and v_u_19(v80) then
			for _, v85 in ipairs(v_u_4.concat(v_u_36(v79, v80), v_u_37(v79, v80))) do
				table.insert(v75, v85)
			end
		else
			if v79.new == v80.new then
				continue
			end
			local v86 = {
				["type"] = v_u_43.TYPE_CHANGED_KIND,
				["description"] = ("%s changed from %s to %s."):format(v79.name, v_u_38(v79), v_u_38(v80))
			}
			table.insert(v75, v86)
		end
	end
	return v75
end
v_u_35 = function(p87, p88) -- name: findInputObjectTypeChanges
	-- upvalues: (ref) v_u_32, (copy) v_u_27, (copy) v_u_43, (copy) v_u_44, (ref) v_u_39
	local v89 = v_u_32(p87:getFields():values(), p88:getFields():values())
	local v90 = {}
	for _, v91 in ipairs(v89.added) do
		if v_u_27(v91) then
			local v92 = {
				["type"] = v_u_43.REQUIRED_INPUT_FIELD_ADDED,
				["description"] = ("A required field %s on input type %s was added."):format(v91.name, p87.name)
			}
			table.insert(v90, v92)
		else
			local v93 = {
				["type"] = v_u_44.OPTIONAL_INPUT_FIELD_ADDED,
				["description"] = ("An optional field %s on input type %s was added."):format(v91.name, p87.name)
			}
			table.insert(v90, v93)
		end
	end
	for _, v94 in ipairs(v89.removed) do
		local v95 = {
			["type"] = v_u_43.FIELD_REMOVED,
			["description"] = ("%s.%s was removed."):format(p87.name, v94.name)
		}
		table.insert(v90, v95)
	end
	for _, v96 in ipairs(v89.persisted) do
		local v97 = v96[1]
		local v98 = v96[2]
		if v_u_39(v97.type, v98.type) then
			continue
		end
		local v99 = {
			["type"] = v_u_43.FIELD_CHANGED_KIND
		}
		local v100 = p87.name
		local v101 = v97.name
		local v102 = v97.type
		local v103 = tostring(v102)
		local v104 = v98.type
		v99.description = ("%s.%s changed type from %s to %s."):format(v100, v101, v103, (tostring(v104)))
		table.insert(v90, v99)
	end
	return v90
end
v_u_34 = function(p105, p106) -- name: findUnionTypeChanges
	-- upvalues: (ref) v_u_32, (copy) v_u_44, (copy) v_u_43
	local v107 = v_u_32(p105:getTypes(), p106:getTypes())
	local v108 = {}
	for _, v109 in ipairs(v107.added) do
		local v110 = {
			["type"] = v_u_44.TYPE_ADDED_TO_UNION,
			["description"] = ("%s was added to union type %s."):format(v109.name, p105.name)
		}
		table.insert(v108, v110)
	end
	for _, v111 in ipairs(v107.removed) do
		local v112 = {
			["type"] = v_u_43.TYPE_REMOVED_FROM_UNION,
			["description"] = ("%s was removed from union type %s."):format(v111.name, p105.name)
		}
		table.insert(v108, v112)
	end
	return v108
end
v_u_33 = function(p113, p114) -- name: findEnumTypeChanges
	-- upvalues: (ref) v_u_32, (copy) v_u_44, (copy) v_u_43
	local v115 = v_u_32(p113:getValues(), p114:getValues())
	local v116 = {}
	for _, v117 in ipairs(v115.added) do
		local v118 = {
			["type"] = v_u_44.VALUE_ADDED_TO_ENUM,
			["description"] = ("%s was added to enum type %s."):format(v117.name, p113.name)
		}
		table.insert(v116, v118)
	end
	for _, v119 in ipairs(v115.removed) do
		local v120 = {
			["type"] = v_u_43.VALUE_REMOVED_FROM_ENUM,
			["description"] = ("%s was removed from enum type %s."):format(v119.name, p113.name)
		}
		table.insert(v116, v120)
	end
	return v116
end
v_u_37 = function(p121, p122) -- name: findImplementedInterfacesChanges
	-- upvalues: (ref) v_u_32, (copy) v_u_44, (copy) v_u_43
	local v123 = v_u_32(p121:getInterfaces(), p122:getInterfaces())
	local v124 = {}
	for _, v125 in ipairs(v123.added) do
		local v126 = {
			["type"] = v_u_44.IMPLEMENTED_INTERFACE_ADDED,
			["description"] = ("%s added to interfaces implemented by %s."):format(v125.name, p121.name)
		}
		table.insert(v124, v126)
	end
	for _, v127 in ipairs(v123.removed) do
		local v128 = {
			["type"] = v_u_43.IMPLEMENTED_INTERFACE_REMOVED,
			["description"] = ("%s no longer implements interface %s."):format(p121.name, v127.name)
		}
		table.insert(v124, v128)
	end
	return v124
end
v_u_36 = function(p129, p130) -- name: findFieldChanges
	-- upvalues: (ref) v_u_32, (copy) v_u_43, (ref) v_u_40, (ref) v_u_41
	local v131 = v_u_32(p129:getFields():values(), p130:getFields():values())
	local v132 = {}
	for _, v133 in ipairs(v131.removed) do
		local v134 = {
			["type"] = v_u_43.FIELD_REMOVED,
			["description"] = ("%s.%s was removed."):format(p129.name, v133.name)
		}
		table.insert(v132, v134)
	end
	for _, v135 in ipairs(v131.persisted) do
		local v136 = v135[1]
		local v137 = v135[2]
		for _, v138 in ipairs(v_u_40(p129, v136, v137)) do
			table.insert(v132, v138)
		end
		if v_u_41(v136.type, v137.type) then
			break
		end
		local v139 = {
			["type"] = v_u_43.FIELD_CHANGED_KIND
		}
		local v140 = ("%s.%s changed type from "):format(p129.name, v136.name)
		local v141 = v136.type
		local v142 = tostring(v141)
		local v143 = v137.type
		v139.description = v140 .. ("%s to %s."):format(v142, (tostring(v143)))
		table.insert(v132, v139)
	end
	return v132
end
v_u_40 = function(p144, p145, p146) -- name: findArgChanges
	-- upvalues: (ref) v_u_32, (copy) v_u_43, (ref) v_u_39, (copy) v_u_44, (ref) v_u_42, (copy) v_u_26
	local v147 = v_u_32(p145.args, p146.args)
	local v148 = {}
	for _, v149 in ipairs(v147.removed) do
		local v150 = {
			["type"] = v_u_43.ARG_REMOVED,
			["description"] = ("%s.%s arg %s was removed."):format(p144.name, p145.name, v149.name)
		}
		table.insert(v148, v150)
	end
	for _, v151 in ipairs(v147.persisted) do
		local v152 = v151[1]
		local v153 = v151[2]
		if v_u_39(v152.type, v153.type) then
			if v152.defaultValue == nil then
				continue
			end
			if v153.defaultValue == nil then
				local v154 = {
					["type"] = v_u_44.ARG_DEFAULT_VALUE_CHANGE,
					["description"] = ("%s.%s arg %s defaultValue was removed."):format(p144.name, p145.name, v152.name)
				}
				table.insert(v148, v154)
			else
				local v155 = v_u_42(v152.defaultValue, v152.type)
				local v156 = v_u_42(v153.defaultValue, v153.type)
				if v155 == v156 then
					continue
				end
				local v157 = {
					["type"] = v_u_44.ARG_DEFAULT_VALUE_CHANGE,
					["description"] = ("%s.%s arg %s has changed defaultValue from %s to %s."):format(p144.name, p145.name, v152.name, v155, v156)
				}
				table.insert(v148, v157)
			end
		else
			local v158 = {
				["type"] = v_u_43.ARG_CHANGED_KIND
			}
			local v159 = ("%s.%s arg %s has changed type from "):format(p144.name, p145.name, v152.name)
			local v160 = v152.type
			local v161 = tostring(v160)
			local v162 = v153.type
			v158.description = v159 .. ("%s to %s."):format(v161, (tostring(v162)))
			table.insert(v148, v158)
		end
	end
	for _, v163 in ipairs(v147.added) do
		if v_u_26(v163) then
			local v164 = {
				["type"] = v_u_43.REQUIRED_ARG_ADDED,
				["description"] = ("A required arg %s on %s.%s was added."):format(v163.name, p144.name, p145.name)
			}
			table.insert(v148, v164)
		else
			local v165 = {
				["type"] = v_u_44.OPTIONAL_ARG_ADDED,
				["description"] = ("An optional arg %s on %s.%s was added."):format(v163.name, p144.name, p145.name)
			}
			table.insert(v148, v165)
		end
	end
	return v148
end
v_u_41 = function(p166, p167) -- name: isChangeSafeForObjectOrInterfaceField
	-- upvalues: (copy) v_u_24, (ref) v_u_41, (copy) v_u_23, (copy) v_u_25
	if v_u_24(p166) then
		local v168 = not (v_u_24(p167) and v_u_41(p166.ofType, p167.ofType)) and v_u_23(p167)
		if v168 then
			v168 = v_u_41(p166, p167.ofType)
		end
		return v168
	elseif v_u_23(p166) then
		local v169 = v_u_23(p167)
		if v169 then
			v169 = v_u_41(p166.ofType, p167.ofType)
		end
		return v169
	else
		local v170 = ((not v_u_25(p167) or p166.name ~= p167.name) and true or false) and v_u_23(p167)
		if v170 then
			v170 = v_u_41(p166, p167.ofType)
		end
		return v170
	end
end
v_u_39 = function(p171, p172) -- name: isChangeSafeForInputObjectFieldOrFieldArg
	-- upvalues: (copy) v_u_24, (ref) v_u_39, (copy) v_u_23, (copy) v_u_25
	if v_u_24(p171) then
		local v173 = v_u_24(p172)
		if v173 then
			v173 = v_u_39(p171.ofType, p172.ofType)
		end
		return v173
	elseif v_u_23(p171) then
		local v174 = not (v_u_23(p172) and v_u_39(p171.ofType, p172.ofType) or v_u_23(p172))
		if v174 then
			v174 = v_u_39(p171.ofType, p172)
		end
		return v174
	else
		local v175 = v_u_25(p172)
		if v175 then
			v175 = p171.name == p172.name
		end
		return v175
	end
end
v_u_38 = function(p176) -- name: typeKindName
	-- upvalues: (copy) v_u_17, (copy) v_u_18, (copy) v_u_19, (copy) v_u_20, (copy) v_u_21, (copy) v_u_22, (copy) v_u_9, (copy) v_u_8
	if v_u_17(p176) then
		return "a Scalar type"
	end
	if v_u_18(p176) then
		return "an Object type"
	end
	if v_u_19(p176) then
		return "an Interface type"
	end
	if v_u_20(p176) then
		return "a Union type"
	end
	if v_u_21(p176) then
		return "an Enum type"
	end
	if v_u_22(p176) then
		return "an Input type"
	end
	v_u_9(false, "Unexpected type: " .. v_u_8(p176))
	return ""
end
v_u_42 = function(p177, p178) -- name: stringifyValue
	-- upvalues: (copy) v_u_28, (copy) v_u_9, (copy) v_u_13, (copy) v_u_4, (copy) v_u_10, (copy) v_u_5, (copy) v_u_12
	local v179 = v_u_28(p177, p178)
	v_u_9(v179 ~= nil)
	return v_u_12((v_u_13(v179, {
		["ObjectValue"] = function(_, p180) -- name: ObjectValue
			-- upvalues: (ref) v_u_4, (ref) v_u_10, (ref) v_u_5
			local v181 = v_u_4.concat({}, p180.fields)
			v_u_4.sort(v181, function(p182, p183)
				-- upvalues: (ref) v_u_10
				return v_u_10(p182.name.value, p183.name.value)
			end)
			return v_u_5.assign({}, p180, {
				["fields"] = v181
			})
		end
	})))
end
v_u_32 = function(p184, p185) -- name: diff
	-- upvalues: (copy) v_u_6
	local v187 = v_u_6(p184, function(p186)
		return p186.name
	end)
	local v189 = v_u_6(p185, function(p188)
		return p188.name
	end)
	local v190 = {}
	local v191 = {}
	local v192 = {}
	for _, v193 in ipairs(p184) do
		local v194 = v189:get(v193.name)
		if v194 == nil then
			table.insert(v191, v193)
		else
			table.insert(v190, { v193, v194 })
		end
	end
	for _, v195 in ipairs(p185) do
		if v187:get(v195.name) ~= nil then
			continue
		end
		table.insert(v192, v195)
	end
	return {
		["added"] = v192,
		["persisted"] = v190,
		["removed"] = v191
	}
end
return {
	["BreakingChangeType"] = v_u_43,
	["DangerousChangeType"] = v_u_44,
	["findBreakingChanges"] = v48,
	["findDangerousChanges"] = v52
}