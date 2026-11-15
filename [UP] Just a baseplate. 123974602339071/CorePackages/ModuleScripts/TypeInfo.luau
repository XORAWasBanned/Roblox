-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.utilities.TypeInfo
local v1 = script.Parent.Parent
local v2 = v1.Parent
local v_u_3 = require(v2.LuauPolyfill).Array
local v4 = v1.luaUtils
local v_u_5 = require(v4.null)
local v6 = v1.language
local v7 = v1.type
local v8 = require(v6.visitor)
local v9 = require(v6.ast)
local v_u_10 = require(v6.kinds).Kind
local v_u_11 = v9.isNode
local v_u_12 = v8.getVisitFn
require(v7.schema)
require(v7.directives)
local v13 = require(v7.definition)
local v_u_14 = v13.isObjectType
local v_u_15 = v13.isInterfaceType
local v_u_16 = v13.isEnumType
local v_u_17 = v13.isInputObjectType
local v_u_18 = v13.isListType
local v_u_19 = v13.isCompositeType
local v_u_20 = v13.isInputType
local v_u_21 = v13.isOutputType
local v_u_22 = v13.getNullableType
local v_u_23 = v13.getNamedType
local v24 = require(v7.introspection)
local v_u_25 = v24.SchemaMetaFieldDef
local v_u_26 = v24.TypeMetaFieldDef
local v_u_27 = v24.TypeNameMetaFieldDef
local v_u_28 = require(v1.utilities.typeFromAST).typeFromAST
local v29 = {}
local v_u_30 = {
	["__index"] = v29
}
local v_u_31 = nil
function v29.new(p32, p33, p34) -- name: new
	-- upvalues: (copy) v_u_30, (ref) v_u_31, (copy) v_u_20, (copy) v_u_19, (copy) v_u_21
	local v35 = v_u_30
	local v36 = setmetatable({}, v35)
	v36._schema = p32
	v36._typeStack = {}
	v36._parentTypeStack = {}
	v36._inputTypeStack = {}
	v36._fieldDefStack = {}
	v36._defaultValueStack = {}
	v36._directive = nil
	v36._argument = nil
	v36._enumValue = nil
	v36._getFieldDef = p33 or v_u_31
	if p34 then
		if v_u_20(p34) then
			local v37 = v36._inputTypeStack
			table.insert(v37, p34)
		end
		if v_u_19(p34) then
			local v38 = v36._parentTypeStack
			table.insert(v38, p34)
		end
		if v_u_21(p34) then
			local v39 = v36._typeStack
			table.insert(v39, p34)
		end
	end
	return v36
end
function v29.getType(p40) -- name: getType
	-- upvalues: (copy) v_u_5
	if #p40._typeStack > 0 then
		local v41 = p40._typeStack[#p40._typeStack]
		if v41 == v_u_5 then
			return nil
		else
			return v41
		end
	else
		return nil
	end
end
function v29.getParentType(p42) -- name: getParentType
	-- upvalues: (copy) v_u_5
	if #p42._parentTypeStack > 0 then
		local v43 = p42._parentTypeStack[#p42._parentTypeStack]
		if v43 == v_u_5 then
			return nil
		else
			return v43
		end
	else
		return nil
	end
end
function v29.getInputType(p44) -- name: getInputType
	-- upvalues: (copy) v_u_5
	if #p44._inputTypeStack > 0 then
		local v45 = p44._inputTypeStack[#p44._inputTypeStack]
		if v45 == v_u_5 then
			return nil
		else
			return v45
		end
	else
		return nil
	end
end
function v29.getParentInputType(p46) -- name: getParentInputType
	-- upvalues: (copy) v_u_5
	if #p46._inputTypeStack > 1 then
		local v47 = p46._inputTypeStack[#p46._inputTypeStack - 1]
		if v47 == v_u_5 then
			return nil
		else
			return v47
		end
	else
		return nil
	end
end
function v29.getFieldDef(p48) -- name: getFieldDef
	-- upvalues: (copy) v_u_5
	if #p48._fieldDefStack > 0 then
		local v49 = p48._fieldDefStack[#p48._fieldDefStack]
		if v49 == v_u_5 then
			return nil
		else
			return v49
		end
	else
		return nil
	end
end
function v29.getDefaultValue(p50) -- name: getDefaultValue
	-- upvalues: (copy) v_u_5
	if #p50._defaultValueStack > 0 then
		local v51 = p50._defaultValueStack[#p50._defaultValueStack]
		if v51 == v_u_5 then
			return nil
		else
			return v51
		end
	else
		return nil
	end
end
function v29.getDirective(p52) -- name: getDirective
	return p52._directive
end
function v29.getArgument(p53) -- name: getArgument
	return p53._argument
end
function v29.getEnumValue(p54) -- name: getEnumValue
	return p54._enumValue
end
function v29.enter(p55, p_u_56) -- name: enter
	-- upvalues: (copy) v_u_10, (copy) v_u_23, (copy) v_u_19, (copy) v_u_5, (copy) v_u_21, (copy) v_u_14, (copy) v_u_28, (copy) v_u_20, (copy) v_u_3, (copy) v_u_22, (copy) v_u_18, (copy) v_u_17, (copy) v_u_16
	local v57 = p55._schema
	local v58 = p_u_56.kind
	if v58 == v_u_10.SELECTION_SET then
		local v59 = v_u_23(p55:getType())
		local v60 = p55._parentTypeStack
		if not v_u_19(v59) then
			v59 = v_u_5
		end
		table.insert(v60, v59)
		return
	elseif v58 == v_u_10.FIELD then
		local v61 = p55:getParentType()
		local v62 = nil
		local v63
		if v61 then
			v63 = p55._getFieldDef(v57, v61, p_u_56)
			if v63 then
				v62 = v63.type
			end
		else
			v63 = nil
		end
		local v64 = p55._fieldDefStack
		local v65 = v63 or v_u_5
		table.insert(v64, v65)
		local v66 = p55._typeStack
		if not v_u_21(v62) then
			v62 = v_u_5
		end
		table.insert(v66, v62)
		return
	elseif v58 == v_u_10.DIRECTIVE then
		p55._directive = v57:getDirective(p_u_56.name.value)
		return
	elseif v58 == v_u_10.OPERATION_DEFINITION then
		local v67 = nil
		local v68 = p_u_56.operation
		if v68 == "query" then
			v67 = v57:getQueryType()
		elseif v68 == "mutation" then
			v67 = v57:getMutationType()
		elseif v68 == "subscription" then
			v67 = v57:getSubscriptionType()
		end
		local v69 = p55._typeStack
		if not v_u_14(v67) then
			v67 = v_u_5
		end
		table.insert(v69, v67)
		return
	elseif v58 == v_u_10.INLINE_FRAGMENT or v58 == v_u_10.FRAGMENT_DEFINITION then
		local v70 = p_u_56.typeCondition
		local v71
		if v70 then
			v71 = v_u_28(v57, v70)
		else
			v71 = v_u_23(p55:getType())
		end
		local v72 = p55._typeStack
		if not v_u_21(v71) then
			v71 = v_u_5
		end
		table.insert(v72, v71)
		return
	elseif v58 == v_u_10.VARIABLE_DEFINITION then
		local v73 = v_u_28(v57, p_u_56.type)
		local v74 = p55._inputTypeStack
		if not v_u_20(v73) then
			v73 = v_u_5
		end
		table.insert(v74, v73)
		return
	elseif v58 == v_u_10.ARGUMENT then
		local v75 = nil
		local v76 = p55:getDirective() or p55:getFieldDef()
		local v77
		if v76 then
			v77 = v_u_3.find(v76.args, function(p78)
				-- upvalues: (copy) p_u_56
				return p78.name == p_u_56.name.value
			end)
			if v77 then
				v75 = v77.type
			end
		else
			v77 = nil
		end
		p55._argument = v77
		local v79 = p55._defaultValueStack
		local v80
		if v77 then
			v80 = v77.defaultValue
		else
			v80 = v_u_5
		end
		table.insert(v79, v80)
		local v81 = p55._inputTypeStack
		if not v_u_20(v75) then
			v75 = v_u_5
		end
		table.insert(v81, v75)
		return
	elseif v58 == v_u_10.LIST then
		local v82 = v_u_22(p55:getInputType())
		if v_u_18(v82) then
			v82 = v82.ofType
		end
		local v83 = p55._defaultValueStack
		local v84 = v_u_5
		table.insert(v83, v84)
		local v85 = p55._inputTypeStack
		if not v_u_20(v82) then
			v82 = v_u_5
		end
		table.insert(v85, v82)
		return
	elseif v58 == v_u_10.OBJECT_FIELD then
		local v86 = v_u_23(p55:getInputType())
		local v87 = nil
		local v88
		if v_u_17(v86) then
			v88 = v86:getFields():get(p_u_56.name.value)
			if v88 then
				v87 = v88.type
			end
		else
			v88 = nil
		end
		local v89 = p55._defaultValueStack
		local v90
		if v88 then
			v90 = v88.defaultValue
		else
			v90 = v_u_5
		end
		table.insert(v89, v90)
		local v91 = p55._inputTypeStack
		if not v_u_20(v87) then
			v87 = v_u_5
		end
		table.insert(v91, v87)
		return
	elseif v58 == v_u_10.ENUM then
		local v92 = v_u_23(p55:getInputType())
		local v93
		if v_u_16(v92) then
			v93 = v92:getValue(p_u_56.value)
		else
			v93 = nil
		end
		p55._enumValue = v93
	end
end
function v29.leave(p94, p95) -- name: leave
	-- upvalues: (copy) v_u_10
	local v96 = p95.kind
	if v96 == v_u_10.SELECTION_SET then
		table.remove(p94._parentTypeStack)
		return
	elseif v96 == v_u_10.FIELD then
		table.remove(p94._fieldDefStack)
		table.remove(p94._typeStack)
		return
	elseif v96 == v_u_10.DIRECTIVE then
		p94._directive = nil
		return
	elseif v96 == v_u_10.OPERATION_DEFINITION or (v96 == v_u_10.INLINE_FRAGMENT or v96 == v_u_10.FRAGMENT_DEFINITION) then
		table.remove(p94._typeStack)
		return
	elseif v96 == v_u_10.VARIABLE_DEFINITION then
		table.remove(p94._inputTypeStack)
		return
	elseif v96 == v_u_10.ARGUMENT then
		p94._argument = nil
		table.remove(p94._defaultValueStack)
		table.remove(p94._inputTypeStack)
		return
	elseif v96 == v_u_10.LIST or v96 == v_u_10.OBJECT_FIELD then
		table.remove(p94._defaultValueStack)
		table.remove(p94._inputTypeStack)
	elseif v96 == v_u_10.ENUM then
		p94._enumValue = nil
	end
end
v_u_31 = function(p97, p98, p99) -- name: getFieldDef
	-- upvalues: (copy) v_u_25, (copy) v_u_26, (copy) v_u_27, (copy) v_u_19, (copy) v_u_14, (copy) v_u_15
	local v100 = p99.name.value
	if v100 == v_u_25.name and p97:getQueryType() == p98 then
		return v_u_25
	elseif v100 == v_u_26.name and p97:getQueryType() == p98 then
		return v_u_26
	elseif v100 == v_u_27.name and v_u_19(p98) then
		return v_u_27
	elseif v_u_14(p98) or v_u_15(p98) then
		return p98:getFields():get(v100)
	else
		return nil
	end
end
return {
	["TypeInfo"] = v29,
	["visitWithTypeInfo"] = function(p_u_101, p_u_102) -- name: visitWithTypeInfo
		-- upvalues: (copy) v_u_12, (copy) v_u_11
		return {
			["enter"] = function(_, p103, ...) -- name: enter
				-- upvalues: (copy) p_u_101, (ref) v_u_12, (copy) p_u_102, (ref) v_u_11
				p_u_101:enter(p103)
				local v104 = v_u_12(p_u_102, p103.kind, false)
				if not v104 then
					return nil
				end
				local v105 = v104(p_u_102, p103, ...)
				if v105 ~= nil then
					p_u_101:leave(p103)
					if v_u_11(v105) then
						p_u_101:enter(v105)
					end
				end
				return v105
			end,
			["leave"] = function(_, p106, ...) -- name: leave
				-- upvalues: (ref) v_u_12, (copy) p_u_102, (copy) p_u_101
				local v107 = v_u_12(p_u_102, p106.kind, true)
				local v108
				if v107 then
					v108 = v107(p_u_102, p106, ...)
				else
					v108 = nil
				end
				p_u_101:leave(p106)
				return v108
			end
		}
	end
}