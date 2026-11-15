-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.ValidationContext
local v1 = script.Parent.Parent
local v2 = v1.Parent
local v3 = require(v2.LuauPolyfill)
local v_u_4 = v3.Array
local v_u_5 = v3.Map
local v6 = v1.jsutils
require(v6.ObjMap)
local v7 = v1.language
local v_u_8 = require(v7.kinds).Kind
local v_u_9 = require(v7.visitor).visit
require(v7.ast)
require(v1.error.GraphQLError)
local v10 = require(v1.utilities.TypeInfo)
local v_u_11 = v10.TypeInfo
local v_u_12 = v10.visitWithTypeInfo
require(v1.type.schema)
require(v1.type.directives)
require(v1.type.definition)
local v_u_13 = {}
local v_u_14 = {
	["__index"] = v_u_13
}
function v_u_13.new(p15, p16) -- name: new
	-- upvalues: (copy) v_u_14
	local v17 = v_u_14
	return setmetatable({
		["_ast"] = nil,
		["_fragments"] = nil,
		["_fragmentSpreads"] = nil,
		["_recursivelyReferencedFragments"] = nil,
		["_onError"] = nil,
		["_ast"] = p15,
		["_fragmentSpreads"] = {},
		["_recursivelyReferencedFragments"] = {},
		["_onError"] = p16
	}, v17)
end
function v_u_13.reportError(p18, p19) -- name: reportError
	p18._onError(p19)
end
function v_u_13.getDocument(p20) -- name: getDocument
	return p20._ast
end
function v_u_13.getFragment(p21, p22) -- name: getFragment
	-- upvalues: (copy) v_u_8
	local v23
	if p21._fragments then
		v23 = p21._fragments
	else
		v23 = {}
		for _, v24 in ipairs(p21:getDocument().definitions) do
			if v24.kind ~= v_u_8.FRAGMENT_DEFINITION then
				continue
			end
			v23[v24.name.value] = v24
		end
		p21._fragments = v23
	end
	return v23[p22]
end
function v_u_13.getFragmentSpreads(p25, p26) -- name: getFragmentSpreads
	-- upvalues: (copy) v_u_8
	local v27 = p25._fragmentSpreads[p26] or {}
	if not p25._fragmentSpreads[p26] then
		local v28 = { p26 }
		while #v28 ~= 0 do
			local v29 = table.remove(v28)
			for _, v30 in ipairs(v29.selections) do
				if v30.kind == v_u_8.FRAGMENT_SPREAD then
					table.insert(v27, v30)
				else
					if not v30.selectionSet then
						continue
					end
					local v31 = v30.selectionSet
					table.insert(v28, v31)
				end
			end
		end
		p25._fragmentSpreads[p26] = v27
	end
	return v27
end
function v_u_13.getRecursivelyReferencedFragments(p32, p33) -- name: getRecursivelyReferencedFragments
	local v34 = p32._recursivelyReferencedFragments[p33] or {}
	if not p32._recursivelyReferencedFragments[p33] then
		local v35 = { p33.selectionSet }
		local v36 = {}
		while #v35 ~= 0 do
			local v37 = table.remove(v35)
			for _, v38 in ipairs(p32:getFragmentSpreads(v37)) do
				local v39 = v38.name.value
				if v36[v39] == true then
					continue
				end
				v36[v39] = true
				local v40 = p32:getFragment(v39)
				if not v40 then
					continue
				end
				table.insert(v34, v40)
				local v41 = v40.selectionSet
				table.insert(v35, v41)
			end
		end
		p32._recursivelyReferencedFragments[p33] = v34
	end
	return v34
end
local v42 = setmetatable({}, {
	["__index"] = v_u_13
})
local v_u_43 = {
	["__index"] = v42
}
function v42.new(p44, p45, p46) -- name: new
	-- upvalues: (copy) v_u_13, (copy) v_u_43
	local v47 = v_u_13.new(p44, p46)
	v47._schema = p45
	local v48 = v_u_43
	return setmetatable(v47, v48)
end
function v42.getSchema(p49) -- name: getSchema
	return p49._schema
end
local v50 = setmetatable({}, {
	["__index"] = v_u_13
})
local v_u_51 = {
	["__index"] = v50
}
function v50.new(p52, p53, p54, p55) -- name: new
	-- upvalues: (copy) v_u_13, (copy) v_u_5, (copy) v_u_51
	local v56 = v_u_13.new(p53, p55)
	v56._schema = p52
	v56._typeInfo = p54
	v56._variableUsages = v_u_5.new()
	v56._recursiveVariableUsages = v_u_5.new()
	local v57 = v_u_51
	return setmetatable(v56, v57)
end
function v50.getSchema(p58) -- name: getSchema
	return p58._schema
end
function v50.getVariableUsages(p59, p60) -- name: getVariableUsages
	-- upvalues: (copy) v_u_11, (copy) v_u_9, (copy) v_u_12
	local v_u_61 = p59._variableUsages[p60]
	if not v_u_61 then
		v_u_61 = {}
		local v_u_62 = v_u_11.new(p59._schema)
		v_u_9(p60, v_u_12(v_u_62, {
			["VariableDefinition"] = function() -- name: VariableDefinition
				return false
			end,
			["Variable"] = function(_, p63) -- name: Variable
				-- upvalues: (copy) v_u_61, (copy) v_u_62
				local v64 = v_u_61
				local v65 = {
					["node"] = p63,
					["type"] = v_u_62:getInputType(),
					["defaultValue"] = v_u_62:getDefaultValue()
				}
				table.insert(v64, v65)
			end
		}))
		p59._variableUsages[p60] = v_u_61
	end
	return v_u_61
end
function v50.getRecursiveVariableUsages(p66, p67) -- name: getRecursiveVariableUsages
	-- upvalues: (copy) v_u_4
	local v68 = p66._recursiveVariableUsages[p67]
	if not v68 then
		v68 = p66:getVariableUsages(p67)
		for _, v69 in ipairs(p66:getRecursivelyReferencedFragments(p67)) do
			v68 = v_u_4.concat(v68, p66:getVariableUsages(v69))
		end
		p66._recursiveVariableUsages[p67] = v68
	end
	return v68
end
function v50.getType(p70) -- name: getType
	return p70._typeInfo:getType()
end
function v50.getParentType(p71) -- name: getParentType
	return p71._typeInfo:getParentType()
end
function v50.getInputType(p72) -- name: getInputType
	return p72._typeInfo:getInputType()
end
function v50.getParentInputType(p73) -- name: getParentInputType
	return p73._typeInfo:getParentInputType()
end
function v50.getFieldDef(p74) -- name: getFieldDef
	return p74._typeInfo:getFieldDef()
end
function v50.getDirective(p75) -- name: getDirective
	return p75._typeInfo:getDirective()
end
function v50.getArgument(p76) -- name: getArgument
	return p76._typeInfo:getArgument()
end
function v50.getEnumValue(p77) -- name: getEnumValue
	return p77._typeInfo:getEnumValue()
end
return {
	["ASTValidationContext"] = v_u_13,
	["SDLValidationContext"] = v42,
	["ValidationContext"] = v50
}