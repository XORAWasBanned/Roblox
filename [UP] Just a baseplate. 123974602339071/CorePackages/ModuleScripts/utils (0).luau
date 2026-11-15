-- Path: CorePackages.Packages._Index.Merge.Merge.typedefs-mergers.utils
local v1 = script.Parent.Parent.Parent
local v2 = require(v1.LuauPolyfill)
local v_u_3 = v2.Boolean
local v_u_4 = v2.instanceof
local v5 = {}
local v6 = require(v1.GraphQL)
local v_u_7 = v6.Source
local v_u_8 = v6.Kind
function v5.isStringTypes(p9) -- name: isStringTypes
	return typeof(p9) == "string"
end
function v5.isSourceTypes(p10) -- name: isSourceTypes
	-- upvalues: (copy) v_u_4, (copy) v_u_7
	return v_u_4(p10, v_u_7)
end
function v5.extractType(p11) -- name: extractType
	-- upvalues: (copy) v_u_8
	while p11.kind == v_u_8.LIST_TYPE or p11.kind == "NonNullType" do
		p11 = p11.type
	end
	return p11
end
function v5.isWrappingTypeNode(p12) -- name: isWrappingTypeNode
	-- upvalues: (copy) v_u_8
	return p12.kind ~= v_u_8.NAMED_TYPE
end
function v5.isListTypeNode(p13) -- name: isListTypeNode
	-- upvalues: (copy) v_u_8
	return p13.kind == v_u_8.LIST_TYPE
end
function v5.isNonNullTypeNode(p14) -- name: isNonNullTypeNode
	-- upvalues: (copy) v_u_8
	return p14.kind == v_u_8.NON_NULL_TYPE
end
local function v_u_16(p15) -- name: printTypeNode
	-- upvalues: (copy) v_u_3, (copy) v_u_8, (copy) v_u_16
	if v_u_3.toJSBoolean(p15.kind == v_u_8.LIST_TYPE) then
		return ("[%s]"):format(v_u_16(p15.type))
	elseif v_u_3.toJSBoolean(p15.kind == v_u_8.NON_NULL_TYPE) then
		return ("%s!"):format(v_u_16(p15.type))
	else
		return p15.name.value
	end
end
v5.printTypeNode = v_u_16
local v_u_17 = {
	["A_SMALLER_THAN_B"] = -1,
	["A_EQUALS_B"] = 0,
	["A_GREATER_THAN_B"] = 1
}
v5.CompareVal = v_u_17
function v5.defaultStringComparator(p18, p19) -- name: defaultStringComparator
	-- upvalues: (copy) v_u_17
	if p18 == nil and p19 == nil then
		return v_u_17.A_EQUALS_B
	elseif p18 == nil then
		return v_u_17.A_SMALLER_THAN_B
	elseif p19 == nil then
		return v_u_17.A_GREATER_THAN_B
	elseif p18 < p19 then
		return v_u_17.A_SMALLER_THAN_B
	elseif p19 < p18 then
		return v_u_17.A_GREATER_THAN_B
	else
		return v_u_17.A_EQUALS_B
	end
end
return v5