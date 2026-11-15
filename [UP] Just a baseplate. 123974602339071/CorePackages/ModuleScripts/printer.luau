-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.language.printer
local v1 = script.Parent.Parent.Parent
local v_u_2 = require(v1.LuauPolyfill).Array
local v_u_3 = game:GetService("HttpService")
require(script.Parent.ast)
local v_u_4 = require(script.Parent.visitor).visit
local v_u_5 = require(script.Parent.blockString).printBlockString
local v_u_6 = nil
local v_u_7 = nil
local v_u_8 = nil
local v_u_9 = nil
local v_u_10 = nil
local v_u_11 = nil
local function v13(p12) -- name: print_
	-- upvalues: (copy) v_u_4, (ref) v_u_6
	return v_u_4(p12, {
		["leave"] = v_u_6
	})
end
local function v16(p_u_14) -- name: addDescription
	-- upvalues: (ref) v_u_7
	return function(_, p15)
		-- upvalues: (ref) v_u_7, (copy) p_u_14
		return v_u_7({ p15.description, p_u_14(p15) }, "\n")
	end
end
v_u_6 = {
	["Name"] = function(_, p17) -- name: Name
		return p17.value
	end,
	["Variable"] = function(_, p18) -- name: Variable
		local v19 = p18.name
		return "$" .. tostring(v19)
	end,
	["Document"] = function(_, p20) -- name: Document
		-- upvalues: (ref) v_u_7
		return v_u_7(p20.definitions, "\n\n") .. "\n"
	end,
	["OperationDefinition"] = function(_, p21) -- name: OperationDefinition
		-- upvalues: (ref) v_u_9, (ref) v_u_7
		local v22 = p21.operation
		local v23 = p21.name
		local v24 = v_u_9("(", v_u_7(p21.variableDefinitions, ", "), ")")
		local v25 = v_u_7(p21.directives, " ")
		local v26 = p21.selectionSet
		if v23 or v25 and v25 ~= "" or (v24 and v24 ~= "" or v22 ~= "query") then
			return v_u_7({
				v22,
				v_u_7({ v23, v24 }),
				v25,
				v26
			}, " ")
		else
			return v26
		end
	end,
	["VariableDefinition"] = function(_, p27) -- name: VariableDefinition
		-- upvalues: (ref) v_u_9, (ref) v_u_7
		local v28 = p27.variable
		local v29 = p27.type
		local v30 = p27.defaultValue
		local v31 = p27.directives
		return tostring(v28) .. ": " .. tostring(v29) .. v_u_9(" = ", v30) .. v_u_9(" ", v_u_7(v31, " "))
	end,
	["SelectionSet"] = function(_, p32) -- name: SelectionSet
		-- upvalues: (ref) v_u_8
		return v_u_8(p32.selections)
	end,
	["Field"] = function(_, p33) -- name: Field
		-- upvalues: (ref) v_u_9, (ref) v_u_7, (ref) v_u_10
		local v34 = p33.alias
		local v35 = p33.name
		local v36 = p33.arguments
		local v37 = p33.directives
		local v38 = p33.selectionSet
		local v39 = v_u_9("", v34, ": ") .. tostring(v35)
		local v40 = v39 .. v_u_9("(", v_u_7(v36, ", "), ")")
		local v41 = utf8.len(v40)
		local v42 = v41 ~= nil
		assert(v42, "invalid utf8 string")
		if v41 > 80 then
			v40 = v39 .. v_u_9("(\n", v_u_10(v_u_7(v36, "\n")), "\n)")
		end
		return v_u_7({ v40, v_u_7(v37, " "), v38 }, " ")
	end,
	["Argument"] = function(_, p43) -- name: Argument
		local v44 = p43.name
		local v45 = p43.value
		return tostring(v44) .. ": " .. tostring(v45)
	end,
	["FragmentSpread"] = function(_, p46) -- name: FragmentSpread
		-- upvalues: (ref) v_u_9, (ref) v_u_7
		local v47 = p46.name
		local v48 = p46.directives
		return "..." .. tostring(v47) .. v_u_9(" ", v_u_7(v48, " "))
	end,
	["InlineFragment"] = function(_, p49) -- name: InlineFragment
		-- upvalues: (ref) v_u_7, (ref) v_u_9
		local v50 = p49.typeCondition
		local v51 = p49.directives
		local v52 = p49.selectionSet
		return v_u_7({
			"...",
			v_u_9("on ", v50),
			v_u_7(v51, " "),
			v52
		}, " ")
	end,
	["FragmentDefinition"] = function(_, p53) -- name: FragmentDefinition
		-- upvalues: (ref) v_u_9, (ref) v_u_7
		local v54 = p53.name
		local v55 = p53.typeCondition
		local v56 = p53.variableDefinitions
		local v57 = p53.directives
		local v58 = p53.selectionSet
		return "fragment " .. tostring(v54) .. v_u_9("(", v_u_7(v56, ", "), ")") .. " " .. "on " .. tostring(v55) .. " " .. v_u_9("", v_u_7(v57, " "), " ") .. tostring(v58)
	end,
	["IntValue"] = function(_, p59) -- name: IntValue
		return p59.value
	end,
	["FloatValue"] = function(_, p60) -- name: FloatValue
		return p60.value
	end,
	["StringValue"] = function(_, p61, p62) -- name: StringValue
		-- upvalues: (copy) v_u_5, (copy) v_u_3
		local v63 = p61.value
		if p61.block then
			return v_u_5(v63, p62 == "description" and "" or "  ")
		else
			return v_u_3:JSONEncode(v63)
		end
	end,
	["BooleanValue"] = function(_, p64) -- name: BooleanValue
		return p64.value and "true" or "false"
	end,
	["NullValue"] = function(_, _) -- name: NullValue
		return "null"
	end,
	["EnumValue"] = function(_, p65) -- name: EnumValue
		return p65.value
	end,
	["ListValue"] = function(_, p66) -- name: ListValue
		-- upvalues: (ref) v_u_7
		return "[" .. v_u_7(p66.values, ", ") .. "]"
	end,
	["ObjectValue"] = function(_, p67) -- name: ObjectValue
		-- upvalues: (ref) v_u_7
		return "{" .. v_u_7(p67.fields, ", ") .. "}"
	end,
	["ObjectField"] = function(_, p68) -- name: ObjectField
		return p68.name .. ": " .. p68.value
	end,
	["Directive"] = function(_, p69) -- name: Directive
		-- upvalues: (ref) v_u_9, (ref) v_u_7
		local v70 = p69.name
		local v71 = p69.arguments
		return "@" .. tostring(v70) .. v_u_9("(", v_u_7(v71, ", "), ")")
	end,
	["NamedType"] = function(_, p72) -- name: NamedType
		return p72.name
	end,
	["ListType"] = function(_, p73) -- name: ListType
		local v74 = p73.type
		return "[" .. tostring(v74) .. "]"
	end,
	["NonNullType"] = function(_, p75) -- name: NonNullType
		local v76 = p75.type
		return tostring(v76) .. "!"
	end,
	["SchemaDefinition"] = v16(function(p77)
		-- upvalues: (ref) v_u_7, (ref) v_u_8
		local v78 = p77.directives
		local v79 = p77.operationTypes
		return v_u_7({ "schema", v_u_7(v78, " "), v_u_8(v79) }, " ")
	end),
	["OperationTypeDefinition"] = function(_, p80) -- name: OperationTypeDefinition
		local v81 = p80.operation
		local v82 = p80.type
		return tostring(v81) .. ": " .. tostring(v82)
	end,
	["ScalarTypeDefinition"] = v16(function(p83)
		-- upvalues: (ref) v_u_7
		return v_u_7({ "scalar", p83.name, v_u_7(p83.directives, " ") }, " ")
	end),
	["ObjectTypeDefinition"] = v16(function(p84)
		-- upvalues: (ref) v_u_7, (ref) v_u_9, (ref) v_u_8
		local v85 = p84.name
		local v86 = p84.interfaces
		local v87 = p84.directives
		local v88 = p84.fields
		return v_u_7({
			"type",
			v85,
			v_u_9("implements ", v_u_7(v86, " & ")),
			v_u_7(v87, " "),
			v_u_8(v88)
		}, " ")
	end),
	["FieldDefinition"] = v16(function(p89)
		-- upvalues: (ref) v_u_11, (ref) v_u_9, (ref) v_u_10, (ref) v_u_7
		local v90 = p89.name
		local v91 = p89.arguments
		local v92 = p89.type
		local v93 = p89.directives
		local v94 = tostring(v90)
		local v95
		if v_u_11(v91) then
			v95 = v_u_9("(\n", v_u_10(v_u_7(v91, "\n")), "\n)")
		else
			v95 = v_u_9("(", v_u_7(v91, ", "), ")")
		end
		return v94 .. v95 .. ": " .. tostring(v92) .. v_u_9(" ", v_u_7(v93, " "))
	end),
	["InputValueDefinition"] = v16(function(p96)
		-- upvalues: (ref) v_u_7, (ref) v_u_9
		local v97 = p96.name
		local v98 = p96.type
		local v99 = p96.defaultValue
		local v100 = p96.directives
		return v_u_7({ tostring(v97) .. ": " .. tostring(v98), v_u_9("= ", v99), v_u_7(v100, " ") }, " ")
	end),
	["InterfaceTypeDefinition"] = v16(function(p101)
		-- upvalues: (ref) v_u_7, (ref) v_u_9, (ref) v_u_8
		local v102 = p101.name
		local v103 = p101.interfaces
		local v104 = p101.directives
		local v105 = p101.fields
		return v_u_7({
			"interface",
			v102,
			v_u_9("implements ", v_u_7(v103, " & ")),
			v_u_7(v104, " "),
			v_u_8(v105)
		}, " ")
	end),
	["UnionTypeDefinition"] = v16(function(p106)
		-- upvalues: (ref) v_u_7
		local v107 = p106.name
		local v108 = p106.directives
		local v109 = p106.types
		return v_u_7({
			"union",
			v107,
			v_u_7(v108, " "),
			(not v109 or #v109 == 0) and "" or "= " .. v_u_7(v109, " | ")
		}, " ")
	end),
	["EnumTypeDefinition"] = v16(function(p110)
		-- upvalues: (ref) v_u_7, (ref) v_u_8
		local v111 = p110.name
		local v112 = p110.directives
		local v113 = p110.values
		return v_u_7({
			"enum",
			v111,
			v_u_7(v112, " "),
			v_u_8(v113)
		}, " ")
	end),
	["EnumValueDefinition"] = v16(function(p114)
		-- upvalues: (ref) v_u_7
		return v_u_7({ p114.name, v_u_7(p114.directives, " ") }, " ")
	end),
	["InputObjectTypeDefinition"] = v16(function(p115)
		-- upvalues: (ref) v_u_7, (ref) v_u_8
		local v116 = p115.name
		local v117 = p115.directives
		local v118 = p115.fields
		return v_u_7({
			"input",
			v116,
			v_u_7(v117, " "),
			v_u_8(v118)
		}, " ")
	end),
	["DirectiveDefinition"] = v16(function(p119)
		-- upvalues: (ref) v_u_11, (ref) v_u_9, (ref) v_u_10, (ref) v_u_7
		local v120 = p119.name
		local v121 = p119.arguments
		local v122 = p119.repeatable
		local v123 = p119.locations
		local v124 = "directive @"
		local v125 = tostring(v120)
		local v126
		if v_u_11(v121) then
			v126 = v_u_9("(\n", v_u_10(v_u_7(v121, "\n")), "\n)")
		else
			v126 = v_u_9("(", v_u_7(v121, ", "), ")")
		end
		return v124 .. v125 .. v126 .. (v122 and " repeatable" or "") .. " on " .. v_u_7(v123, " | ")
	end),
	["SchemaExtension"] = function(_, p127) -- name: SchemaExtension
		-- upvalues: (ref) v_u_7, (ref) v_u_8
		local v128 = p127.directives
		local v129 = p127.operationTypes
		return v_u_7({ "extend schema", v_u_7(v128, " "), v_u_8(v129) }, " ")
	end,
	["ScalarTypeExtension"] = function(_, p130) -- name: ScalarTypeExtension
		-- upvalues: (ref) v_u_7
		return v_u_7({ "extend scalar", p130.name, v_u_7(p130.directives, " ") }, " ")
	end,
	["ObjectTypeExtension"] = function(_, p131) -- name: ObjectTypeExtension
		-- upvalues: (ref) v_u_7, (ref) v_u_9, (ref) v_u_8
		local v132 = p131.name
		local v133 = p131.interfaces
		local v134 = p131.directives
		local v135 = p131.fields
		return v_u_7({
			"extend type",
			v132,
			v_u_9("implements ", v_u_7(v133, " & ")),
			v_u_7(v134, " "),
			v_u_8(v135)
		}, " ")
	end,
	["InterfaceTypeExtension"] = function(_, p136) -- name: InterfaceTypeExtension
		-- upvalues: (ref) v_u_7, (ref) v_u_9, (ref) v_u_8
		local v137 = p136.name
		local v138 = p136.interfaces
		local v139 = p136.directives
		local v140 = p136.fields
		return v_u_7({
			"extend interface",
			v137,
			v_u_9("implements ", v_u_7(v138, " & ")),
			v_u_7(v139, " "),
			v_u_8(v140)
		}, " ")
	end,
	["UnionTypeExtension"] = function(_, p141) -- name: UnionTypeExtension
		-- upvalues: (ref) v_u_7
		local v142 = p141.name
		local v143 = p141.directives
		local v144 = p141.types
		return v_u_7({
			"extend union",
			v142,
			v_u_7(v143, " "),
			(not v144 or #v144 == 0) and "" or "= " .. v_u_7(v144, " | ")
		}, " ")
	end,
	["EnumTypeExtension"] = function(_, p145) -- name: EnumTypeExtension
		-- upvalues: (ref) v_u_7, (ref) v_u_8
		local v146 = p145.name
		local v147 = p145.directives
		local v148 = p145.values
		return v_u_7({
			"extend enum",
			v146,
			v_u_7(v147, " "),
			v_u_8(v148)
		}, " ")
	end,
	["InputObjectTypeExtension"] = function(_, p149) -- name: InputObjectTypeExtension
		-- upvalues: (ref) v_u_7, (ref) v_u_8
		local v150 = p149.name
		local v151 = p149.directives
		local v152 = p149.fields
		return v_u_7({
			"extend input",
			v150,
			v_u_7(v151, " "),
			v_u_8(v152)
		}, " ")
	end
}
v_u_7 = function(p153, p154) -- name: join
	-- upvalues: (copy) v_u_2
	return not p153 and "" or v_u_2.join(v_u_2.filter(p153, function(p155)
		local v156 = tostring(p155)
		if v156 then
			v156 = p155 ~= ""
		end
		return v156
	end), p154 or "")
end
v_u_8 = function(p157) -- name: block
	-- upvalues: (ref) v_u_9, (ref) v_u_10, (ref) v_u_7
	return v_u_9("{\n", v_u_10(v_u_7(p157, "\n")), "\n}")
end
v_u_9 = function(p158, p159, p160) -- name: wrap
	return (p159 == nil or p159 == "") and "" or p158 .. tostring(p159) .. tostring(p160 or "")
end
v_u_10 = function(p161) -- name: indent
	-- upvalues: (ref) v_u_9
	return v_u_9("  ", (p161:gsub("\n", "\n  ")))
end
local function v_u_163(p162) -- name: isMultiline
	return string.find(tostring(p162), "\n") ~= nil
end
v_u_11 = function(p164) -- name: hasMultilineItems
	-- upvalues: (copy) v_u_2, (ref) v_u_163
	local v165
	if p164 == nil then
		v165 = false
	else
		v165 = v_u_2.some(p164, v_u_163)
	end
	return v165
end
return {
	["print"] = v13
}