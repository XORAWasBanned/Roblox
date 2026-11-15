-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.PossibleTypeExtensionsRule
local v1 = script.Parent.Parent.Parent
local v2 = v1.jsutils
local v3 = v1.Parent
local v4 = require(v3.LuauPolyfill)
local v_u_5 = v4.Array
local v_u_6 = v4.Object
local v_u_7 = require(v2.inspect).inspect
local v_u_8 = require(v2.invariant).invariant
local v_u_9 = require(v2.didYouMean).didYouMean
local v_u_10 = require(v2.suggestionList).suggestionList
local v_u_11 = require(v1.error.GraphQLError).GraphQLError
local v12 = v1.language
local v_u_13 = require(v12.kinds).Kind
local v_u_14 = require(v12.predicates).isTypeDefinitionNode
local v15 = require(v1.type.definition)
local v_u_16 = v15.isScalarType
local v_u_17 = v15.isObjectType
local v_u_18 = v15.isInterfaceType
local v_u_19 = v15.isUnionType
local v_u_20 = v15.isEnumType
local v_u_21 = v15.isInputObjectType
local v22 = {}
local v_u_23 = nil
local v_u_24 = nil
local v_u_25 = nil
function v22.PossibleTypeExtensionsRule(p_u_26)
	-- upvalues: (copy) v_u_14, (ref) v_u_23, (ref) v_u_24, (ref) v_u_25, (copy) v_u_11, (copy) v_u_6, (copy) v_u_5, (copy) v_u_10, (copy) v_u_9
	local v_u_27 = p_u_26:getSchema()
	local v_u_28 = {}
	for _, v29 in ipairs(p_u_26:getDocument().definitions) do
		if not v_u_14(v29) then
			continue
		end
		v_u_28[v29.name.value] = v29
	end
	local function v_u_38(p30) -- name: checkExtension
		-- upvalues: (copy) v_u_28, (copy) v_u_27, (ref) v_u_23, (ref) v_u_24, (ref) v_u_25, (copy) p_u_26, (ref) v_u_11, (ref) v_u_6, (ref) v_u_5, (ref) v_u_10, (ref) v_u_9
		local v31 = p30.name.value
		local v32 = v_u_28[v31]
		local v33
		if v_u_27 then
			v33 = v_u_27:getType(v31)
		else
			v33 = nil
		end
		local v34 = nil
		if v32 then
			v34 = v_u_23[v32.kind]
		elseif v33 then
			v34 = v_u_24(v33)
		end
		if v34 then
			if v34 ~= p30.kind then
				local v35 = v_u_25(p30.kind)
				p_u_26:reportError(v_u_11.new(("Cannot extend non-%s type \"%s\"."):format(v35, v31), v32 and ({ v32, p30 } or p30) or p30))
				return
			end
		else
			local v36 = v_u_6.keys(v_u_28)
			if v_u_27 then
				v36 = v_u_5.concat(v36, v_u_27:getTypeMap():keys())
			end
			local v37 = v_u_10(v31, v36)
			p_u_26:reportError(v_u_11.new(("Cannot extend type \"%s\" because it is not defined."):format(v31) .. v_u_9(v37), p30.name))
		end
	end
	local function v39(_, ...)
		-- upvalues: (copy) v_u_38
		return v_u_38(...)
	end
	return {
		["ScalarTypeExtension"] = v39,
		["ObjectTypeExtension"] = v39,
		["InterfaceTypeExtension"] = v39,
		["UnionTypeExtension"] = v39,
		["EnumTypeExtension"] = v39,
		["InputObjectTypeExtension"] = v39
	}
end
v_u_23 = {
	[v_u_13.SCALAR_TYPE_DEFINITION] = v_u_13.SCALAR_TYPE_EXTENSION,
	[v_u_13.OBJECT_TYPE_DEFINITION] = v_u_13.OBJECT_TYPE_EXTENSION,
	[v_u_13.INTERFACE_TYPE_DEFINITION] = v_u_13.INTERFACE_TYPE_EXTENSION,
	[v_u_13.UNION_TYPE_DEFINITION] = v_u_13.UNION_TYPE_EXTENSION,
	[v_u_13.ENUM_TYPE_DEFINITION] = v_u_13.ENUM_TYPE_EXTENSION,
	[v_u_13.INPUT_OBJECT_TYPE_DEFINITION] = v_u_13.INPUT_OBJECT_TYPE_EXTENSION
}
v_u_24 = function(p40) -- name: typeToExtKind
	-- upvalues: (copy) v_u_16, (copy) v_u_13, (copy) v_u_17, (copy) v_u_18, (copy) v_u_19, (copy) v_u_20, (copy) v_u_21, (copy) v_u_8, (copy) v_u_7
	if v_u_16(p40) then
		return v_u_13.SCALAR_TYPE_EXTENSION
	end
	if v_u_17(p40) then
		return v_u_13.OBJECT_TYPE_EXTENSION
	end
	if v_u_18(p40) then
		return v_u_13.INTERFACE_TYPE_EXTENSION
	end
	if v_u_19(p40) then
		return v_u_13.UNION_TYPE_EXTENSION
	end
	if v_u_20(p40) then
		return v_u_13.ENUM_TYPE_EXTENSION
	end
	if v_u_21(p40) then
		return v_u_13.INPUT_OBJECT_TYPE_EXTENSION
	end
	v_u_8(false, "Unexpected type: " .. v_u_7(p40))
	return nil
end
v_u_25 = function(p41) -- name: extensionKindToTypeName
	-- upvalues: (copy) v_u_13, (copy) v_u_8, (copy) v_u_7
	if p41 == v_u_13.SCALAR_TYPE_EXTENSION then
		return "scalar"
	end
	if p41 == v_u_13.OBJECT_TYPE_EXTENSION then
		return "object"
	end
	if p41 == v_u_13.INTERFACE_TYPE_EXTENSION then
		return "interface"
	end
	if p41 == v_u_13.UNION_TYPE_EXTENSION then
		return "union"
	end
	if p41 == v_u_13.ENUM_TYPE_EXTENSION then
		return "enum"
	end
	if p41 == v_u_13.INPUT_OBJECT_TYPE_EXTENSION then
		return "input object"
	end
	v_u_8(false, "Unexpected kind: " .. v_u_7(p41))
	return ""
end
return v22