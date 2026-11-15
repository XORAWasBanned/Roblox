-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.language.predicates
local v_u_1 = require(script.Parent.kinds).Kind
local v_u_2 = nil
local v_u_3 = nil
local v_u_4 = nil
local v_u_5 = nil
local v_u_6 = nil
local function v8(p7) -- name: isDefinitionNode
	-- upvalues: (ref) v_u_2, (ref) v_u_3, (ref) v_u_5
	return v_u_2(p7) or (v_u_3(p7) or v_u_5(p7))
end
v_u_2 = function(p9) -- name: isExecutableDefinitionNode
	-- upvalues: (copy) v_u_1
	return p9.kind == v_u_1.OPERATION_DEFINITION and true or p9.kind == v_u_1.FRAGMENT_DEFINITION
end
v_u_3 = function(p10) -- name: isTypeSystemDefinitionNode
	-- upvalues: (copy) v_u_1, (ref) v_u_4
	return p10.kind == v_u_1.SCHEMA_DEFINITION or v_u_4(p10) or p10.kind == v_u_1.DIRECTIVE_DEFINITION
end
v_u_4 = function(p11) -- name: isTypeDefinitionNode
	-- upvalues: (copy) v_u_1
	return (p11.kind == v_u_1.SCALAR_TYPE_DEFINITION or (p11.kind == v_u_1.OBJECT_TYPE_DEFINITION or (p11.kind == v_u_1.INTERFACE_TYPE_DEFINITION or (p11.kind == v_u_1.UNION_TYPE_DEFINITION or p11.kind == v_u_1.ENUM_TYPE_DEFINITION)))) and true or p11.kind == v_u_1.INPUT_OBJECT_TYPE_DEFINITION
end
v_u_5 = function(p12) -- name: isTypeSystemExtensionNode
	-- upvalues: (copy) v_u_1, (ref) v_u_6
	return p12.kind == v_u_1.SCHEMA_EXTENSION and true or v_u_6(p12)
end
v_u_6 = function(p13) -- name: isTypeExtensionNode
	-- upvalues: (copy) v_u_1
	return (p13.kind == v_u_1.SCALAR_TYPE_EXTENSION or (p13.kind == v_u_1.OBJECT_TYPE_EXTENSION or (p13.kind == v_u_1.INTERFACE_TYPE_EXTENSION or (p13.kind == v_u_1.UNION_TYPE_EXTENSION or p13.kind == v_u_1.ENUM_TYPE_EXTENSION)))) and true or p13.kind == v_u_1.INPUT_OBJECT_TYPE_EXTENSION
end
return {
	["isDefinitionNode"] = v8,
	["isExecutableDefinitionNode"] = v_u_2,
	["isSelectionNode"] = function(p14) -- name: isSelectionNode
		-- upvalues: (copy) v_u_1
		return (p14.kind == v_u_1.FIELD or p14.kind == v_u_1.FRAGMENT_SPREAD) and true or p14.kind == v_u_1.INLINE_FRAGMENT
	end,
	["isValueNode"] = function(p15) -- name: isValueNode
		-- upvalues: (copy) v_u_1
		return (p15.kind == v_u_1.VARIABLE or (p15.kind == v_u_1.INT or (p15.kind == v_u_1.FLOAT or (p15.kind == v_u_1.STRING or (p15.kind == v_u_1.BOOLEAN or (p15.kind == v_u_1.NULL or (p15.kind == v_u_1.ENUM or p15.kind == v_u_1.LIST))))))) and true or p15.kind == v_u_1.OBJECT
	end,
	["isTypeNode"] = function(p16) -- name: isTypeNode
		-- upvalues: (copy) v_u_1
		return (p16.kind == v_u_1.NAMED_TYPE or p16.kind == v_u_1.LIST_TYPE) and true or p16.kind == v_u_1.NON_NULL_TYPE
	end,
	["isTypeSystemDefinitionNode"] = v_u_3,
	["isTypeDefinitionNode"] = v_u_4,
	["isTypeSystemExtensionNode"] = v_u_5,
	["isTypeExtensionNode"] = v_u_6
}