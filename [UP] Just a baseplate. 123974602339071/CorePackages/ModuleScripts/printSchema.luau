-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.utilities.printSchema
local v1 = script.Parent.Parent.Parent
local v2 = require(v1.LuauPolyfill)
local v_u_3 = v2.Array
local v_u_4 = v2.Boolean
local v_u_5 = require(script.Parent.Parent.jsutils.inspect).inspect
local v_u_6 = require(script.Parent.Parent.jsutils.invariant).invariant
local v_u_7 = require(script.Parent.Parent.language.printer).print
local v_u_8 = require(script.Parent.Parent.language.blockString).printBlockString
local v_u_9 = require(script.Parent.Parent.type.introspection).isIntrospectionType
local v_u_10 = require(script.Parent.Parent.type.scalars).GraphQLString
local v_u_11 = require(script.Parent.Parent.type.scalars).isSpecifiedScalarType
local v12 = require(script.Parent.Parent.type.directives)
local v_u_13 = v12.DEFAULT_DEPRECATION_REASON
local v_u_14 = v12.isSpecifiedDirective
local v15 = require(script.Parent.Parent.type.definition)
local v_u_16 = v15.isScalarType
local v_u_17 = v15.isObjectType
local v_u_18 = v15.isInterfaceType
local v_u_19 = v15.isUnionType
local v_u_20 = v15.isEnumType
local v_u_21 = v15.isInputObjectType
require(script.Parent.Parent.type.schema)
require(script.Parent.Parent.language.ast)
local v_u_22 = require(script.Parent.astFromValue).astFromValue
local v23 = require(script.Parent.astFromValue).NULL
local v24 = require(script.Parent.Parent.luaUtils.isNillish)
local v_u_25 = v24.isNillish
local v_u_26 = v24.isNotNillish
local v_u_27 = nil
local v_u_28 = nil
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
local v_u_43 = nil
local v_u_44 = nil
local v_u_45 = nil
local function v48(p46) -- name: printSchema
	-- upvalues: (ref) v_u_29, (copy) v_u_14, (ref) v_u_30
	return v_u_29(p46, function(p47)
		-- upvalues: (ref) v_u_14
		return not v_u_14(p47)
	end, v_u_30)
end
local function v50(p49) -- name: printIntrospectionSchema
	-- upvalues: (ref) v_u_29, (copy) v_u_14, (copy) v_u_9
	return v_u_29(p49, v_u_14, v_u_9)
end
v_u_30 = function(p51) -- name: isDefinedType
	-- upvalues: (copy) v_u_11, (copy) v_u_9
	local v52 = not v_u_11(p51)
	if v52 then
		v52 = not v_u_9(p51)
	end
	return v52
end
v_u_29 = function(p53, p54, p55) -- name: printFilteredSchema
	-- upvalues: (copy) v_u_3, (ref) v_u_31, (ref) v_u_32, (ref) v_u_33, (copy) v_u_4
	local v56 = v_u_3.filter(p53:getDirectives(), p54)
	local v57 = v_u_3.filter(p53:getTypeMap():values(), p55)
	local v60 = v_u_3.concat({ v_u_31(p53) }, v_u_3.map(v56, function(p58)
		-- upvalues: (ref) v_u_32
		return v_u_32(p58)
	end), v_u_3.map(v57, function(p59)
		-- upvalues: (ref) v_u_33
		return v_u_33(p59)
	end))
	local v62 = v_u_3.filter(v60, function(p61)
		-- upvalues: (ref) v_u_4
		return v_u_4.toJSBoolean(p61)
	end)
	return v_u_3.join(v62, "\n\n") .. "\n"
end
v_u_31 = function(p63) -- name: printSchemaDefinition
	-- upvalues: (copy) v_u_25, (ref) v_u_34, (copy) v_u_26, (ref) v_u_28, (copy) v_u_3
	if not (v_u_25(p63.description) and v_u_34(p63)) then
		local v64 = {}
		local v65 = p63:getQueryType()
		if v_u_26(v65) then
			local v66 = v65.name
			table.insert(v64, ("  query: %s"):format(v66))
		end
		local v67 = p63:getMutationType()
		if v_u_26(v67) then
			local v68 = v67.name
			table.insert(v64, ("  mutation: %s"):format(v68))
		end
		local v69 = p63:getSubscriptionType()
		if v_u_26(v69) then
			local v70 = v69.name
			table.insert(v64, ("  subscription: %s"):format(v70))
		end
		return v_u_28(p63) .. ("schema {\n%s\n}"):format(v_u_3.join(v64, "\n"))
	end
end
v_u_34 = function(p71) -- name: isSchemaOfCommonNames
	-- upvalues: (copy) v_u_26
	local v72 = p71:getQueryType()
	if v_u_26(v72) and v72.name ~= "Query" then
		return false
	end
	local v73 = p71:getMutationType()
	if v_u_26(v73) and v73.name ~= "Mutation" then
		return false
	end
	local v74 = p71:getSubscriptionType()
	return (not v_u_26(v74) or v74.name == "Subscription") and true or false
end
v_u_33 = function(p75) -- name: printType
	-- upvalues: (copy) v_u_16, (ref) v_u_27, (copy) v_u_17, (ref) v_u_35, (copy) v_u_18, (ref) v_u_40, (copy) v_u_19, (ref) v_u_41, (copy) v_u_20, (ref) v_u_42, (copy) v_u_21, (ref) v_u_43, (copy) v_u_6, (copy) v_u_5
	if v_u_16(p75) then
		return v_u_27(p75)
	end
	if v_u_17(p75) then
		return v_u_35(p75)
	end
	if v_u_18(p75) then
		return v_u_40(p75)
	end
	if v_u_19(p75) then
		return v_u_41(p75)
	end
	if v_u_20(p75) then
		return v_u_42(p75)
	end
	if v_u_21(p75) then
		return v_u_43(p75)
	end
	v_u_6(false, "Unexpected type: " .. v_u_5(p75))
	return ""
end
v_u_27 = function(p76) -- name: printScalar
	-- upvalues: (ref) v_u_28, (ref) v_u_44
	return v_u_28(p76) .. ("scalar %s"):format(p76.name) .. v_u_44(p76)
end
local function v_u_80(p77) -- name: printImplementedInterfaces
	-- upvalues: (copy) v_u_3
	local v78 = p77.getInterfaces(p77)
	return #v78 <= 0 and "" or " implements " .. v_u_3.join(v_u_3.map(v78, function(p79)
		return p79.name
	end), " & ")
end
v_u_35 = function(p81) -- name: printObject
	-- upvalues: (ref) v_u_28, (copy) v_u_80, (ref) v_u_45
	return v_u_28(p81) .. ("type %s"):format(p81.name) .. v_u_80(p81) .. v_u_45(p81)
end
v_u_40 = function(p82) -- name: printInterface
	-- upvalues: (ref) v_u_28, (copy) v_u_80, (ref) v_u_45
	return v_u_28(p82) .. ("interface %s"):format(p82.name) .. v_u_80(p82) .. v_u_45(p82)
end
v_u_41 = function(p83) -- name: printUnion
	-- upvalues: (copy) v_u_3, (ref) v_u_28
	local v84 = p83:getTypes()
	local v85 = #v84 <= 0 and "" or " = " .. v_u_3.join(v84, " | ")
	return v_u_28(p83) .. "union " .. p83.name .. v85
end
v_u_42 = function(p86) -- name: printEnum
	-- upvalues: (copy) v_u_3, (ref) v_u_28, (ref) v_u_38, (ref) v_u_39
	local v89 = v_u_3.map(p86:getValues(), function(p87, p88)
		-- upvalues: (ref) v_u_28, (ref) v_u_38
		return v_u_28(p87, "  ", p88 == 1) .. "  " .. p87.name .. v_u_38(p87.deprecationReason)
	end)
	return v_u_28(p86) .. ("enum %s"):format(p86.name) .. v_u_39(v89)
end
v_u_43 = function(p90) -- name: printInputObject
	-- upvalues: (copy) v_u_3, (ref) v_u_28, (ref) v_u_37, (ref) v_u_39
	local v93 = v_u_3.map(p90:getFields():values(), function(p91, p92)
		-- upvalues: (ref) v_u_28, (ref) v_u_37
		return v_u_28(p91, "  ", p92 == 1) .. "  " .. v_u_37(p91)
	end)
	return v_u_28(p90) .. ("input %s"):format(p90.name) .. v_u_39(v93)
end
v_u_45 = function(p94) -- name: printFields
	-- upvalues: (copy) v_u_3, (ref) v_u_28, (ref) v_u_36, (ref) v_u_38, (ref) v_u_39
	return v_u_39((v_u_3.map(p94.getFields(p94):values(), function(p95, p96)
		-- upvalues: (ref) v_u_28, (ref) v_u_36, (ref) v_u_38
		local v97 = v_u_28(p95, "  ", p96 == 1)
		local v98 = p95.name
		local v99 = v_u_36(p95.args, "  ")
		local v100 = p95.type
		return v97 .. "  " .. v98 .. v99 .. ": " .. tostring(v100) .. v_u_38(p95.deprecationReason)
	end)))
end
v_u_39 = function(p101) -- name: printBlock
	-- upvalues: (copy) v_u_3
	return #p101 == 0 and "" or " {\n" .. v_u_3.join(p101, "\n") .. "\n}"
end
v_u_36 = function(p102, p103) -- name: printArgs
	-- upvalues: (copy) v_u_3, (copy) v_u_25, (ref) v_u_37, (ref) v_u_28
	local v_u_104 = p103 == nil and "" or p103
	if #p102 == 0 then
		return ""
	elseif v_u_3.every(p102, function(p105)
		-- upvalues: (ref) v_u_25
		return v_u_25(p105.description)
	end) then
		return "(" .. v_u_3.join(v_u_3.map(p102, v_u_37), ", ") .. ")"
	else
		return "(\n" .. v_u_3.join(v_u_3.map(p102, function(p106, p107)
			-- upvalues: (ref) v_u_28, (copy) v_u_104, (ref) v_u_37
			return v_u_28(p106, "  " .. v_u_104, p107 == 1) .. "  " .. v_u_104 .. v_u_37(p106)
		end), "\n") .. "\n" .. v_u_104 .. ")"
	end
end
v_u_37 = function(p108) -- name: printInputValue
	-- upvalues: (copy) v_u_22, (copy) v_u_26, (copy) v_u_7, (ref) v_u_38
	local v109 = v_u_22(p108.defaultValue, p108.type)
	local v110 = p108.name
	local v111 = p108.type
	local v112 = v110 .. ": " .. tostring(v111)
	if v_u_26(v109) then
		v112 = v112 .. (" = %s"):format(v_u_7(v109))
	end
	return v112 .. v_u_38(p108.deprecationReason)
end
v_u_32 = function(p113) -- name: printDirective
	-- upvalues: (ref) v_u_28, (ref) v_u_36, (copy) v_u_3
	return v_u_28(p113) .. "directive @" .. p113.name .. v_u_36(p113.args) .. (p113.isRepeatable and " repeatable" or "") .. " on " .. v_u_3.join(p113.locations, " | ")
end
v_u_38 = function(p114) -- name: printDeprecated
	-- upvalues: (copy) v_u_25, (copy) v_u_22, (copy) v_u_10, (copy) v_u_13, (copy) v_u_7
	if v_u_25(p114) then
		return ""
	end
	local v115 = v_u_22(p114, v_u_10)
	return (not v115 or p114 == v_u_13) and " @deprecated" or " @deprecated(reason: " .. v_u_7(v115) .. ")"
end
v_u_44 = function(p116) -- name: printSpecifiedByUrl
	-- upvalues: (copy) v_u_25, (copy) v_u_22, (copy) v_u_10, (copy) v_u_6, (copy) v_u_7
	if v_u_25(p116.specifiedByUrl) then
		return ""
	end
	local v117 = v_u_22(p116.specifiedByUrl, v_u_10)
	v_u_6(v117, "Unexpected null value returned from `astFromValue` for specifiedByUrl")
	return " @specifiedBy(url: " .. v_u_7(v117) .. ")"
end
v_u_28 = function(p118, p119, p120) -- name: printDescription
	-- upvalues: (copy) v_u_25, (copy) v_u_8, (copy) v_u_4
	local v121 = p119 == nil and "" or p119
	local v122 = p120 == nil and true or p120
	local v123 = p118.description
	if v_u_25(v123) then
		return ""
	end
	local v124 = v_u_8(v123, "", string.len(v123) > 70)
	local v125
	if v_u_4.toJSBoolean(v121) and not v122 then
		v125 = "\n" .. v121
	else
		v125 = v121
	end
	local v126, _ = string.gsub(v124, "\n", "\n" .. v121)
	return v125 .. v126 .. "\n"
end
return {
	["printSchema"] = v48,
	["printIntrospectionSchema"] = v50,
	["printType"] = v_u_33,
	["NULL"] = v23
}