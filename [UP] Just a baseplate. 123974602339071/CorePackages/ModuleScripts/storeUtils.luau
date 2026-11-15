-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.utilities.graphql.storeUtils
local v1 = script.Parent.Parent.Parent
local v2 = v1.Parent
local v3 = require(v2.LuauPolyfill)
local v_u_4 = v3.Array
local v_u_5 = v3.Object
local v_u_6 = game:GetService("HttpService")
local v7 = {}
local v_u_8 = nil
local v_u_9 = nil
local v_u_10 = nil
require(script.Parent.types)
require(v2.GraphQL)
local v_u_11 = require(v1.jsutils.invariant).InvariantError
local v_u_12 = require(script.Parent.Parent.common.objects).isNonNullObject
local v13 = require(script.Parent.fragments)
local v_u_14 = require(v1.luaUtils.objectKeysForEach)
local v_u_15 = v13.getFragmentFromSelection
function v7.makeReference(p16) -- name: makeReference
	return {
		["__ref"] = tostring(p16)
	}
end
function v7.isReference(p17) -- name: isReference
	local v18
	if type(p17) == "table" then
		local v19 = p17.__ref
		v18 = type(v19) == "string"
	else
		v18 = false
	end
	return v18
end
function v7.isDocumentNode(p20) -- name: isDocumentNode
	-- upvalues: (copy) v_u_12, (copy) v_u_4
	local v21 = v_u_12(p20)
	if v21 then
		if p20.kind == "Document" then
			v21 = v_u_4.isArray(p20.definitions)
		else
			v21 = false
		end
	end
	return v21
end
local function v_u_37(p22, p_u_23, p24, p_u_25) -- name: valueToObjectRepresentation
	-- upvalues: (copy) v_u_4, (copy) v_u_37, (copy) v_u_11
	if p24.kind == "IntValue" or p24.kind == "FloatValue" then
		local v26 = p_u_23.value
		local v27 = p24.value
		p22[v26] = tonumber(v27)
		return
	elseif p24.kind == "BooleanValue" or p24.kind == "StringValue" then
		p22[p_u_23.value] = p24.value
		return
	elseif p24.kind == "ObjectValue" then
		local v_u_28 = {}
		v_u_4.map(p24.fields, function(p29)
			-- upvalues: (ref) v_u_37, (copy) v_u_28, (copy) p_u_25
			v_u_37(v_u_28, p29.name, p29.value, p_u_25)
			return nil
		end)
		p22[p_u_23.value] = v_u_28
		return
	elseif p24.kind == "Variable" then
		local v30 = (p_u_25 or {})[p24.name.value]
		p22[p_u_23.value] = v30
		return
	elseif p24.kind == "ListValue" then
		p22[p_u_23.value] = v_u_4.map(p24.values, function(p31)
			-- upvalues: (ref) v_u_37, (copy) p_u_23, (copy) p_u_25
			local v32 = {}
			v_u_37(v32, p_u_23, p31, p_u_25)
			return v32[p_u_23.value]
		end)
		return
	elseif p24.kind == "EnumValue" then
		p22[p_u_23.value] = p24.value
		return
	elseif p24.kind == "NullValue" then
		p22[p_u_23.value] = nil
	else
		local v33 = error
		local v34 = v_u_11.new
		local v35 = p_u_23.value
		local v36 = p24.kind
		v33(v34(tostring(("The inline argument \"%s\" of kind \"%s\""):format(v35, v36)) .. "is not supported. Use variables instead of inline arguments to overcome this limitation."))
	end
end
v7.valueToObjectRepresentation = v_u_37
function v7.storeKeyNameFromField(p38, p_u_39) -- name: storeKeyNameFromField
	-- upvalues: (copy) v_u_4, (copy) v_u_37, (ref) v_u_8
	local v40
	if p38.directives then
		local v_u_41 = {}
		v_u_4.forEach(p38.directives, function(p_u_42)
			-- upvalues: (ref) v_u_41, (ref) v_u_4, (ref) v_u_37, (copy) p_u_39
			v_u_41[p_u_42.name.value] = {}
			if p_u_42.arguments then
				v_u_4.forEach(p_u_42.arguments, function(p43)
					-- upvalues: (ref) v_u_37, (ref) v_u_41, (copy) p_u_42, (ref) p_u_39
					local v44 = p43.name
					local v45 = p43.value
					v_u_37(v_u_41[p_u_42.name.value], v44, v45, p_u_39)
				end)
			end
		end)
		v40 = v_u_41
	else
		v40 = nil
	end
	local v_u_46
	if p38.arguments and #p38.arguments > 0 then
		v_u_46 = {}
		v_u_4.forEach(p38.arguments, function(p47)
			-- upvalues: (ref) v_u_37, (ref) v_u_46, (copy) p_u_39
			v_u_37(v_u_46, p47.name, p47.value, p_u_39)
		end)
	else
		v_u_46 = nil
	end
	return v_u_8(p38.name.value, v_u_46, v40)
end
local v_u_48 = {
	"connection",
	"include",
	"skip",
	"client",
	"rest",
	"export"
}
local v57 = {
	["__call"] = function(_, p49, p_u_50, p_u_51) -- name: __call
		-- upvalues: (copy) v_u_4, (ref) v_u_9, (copy) v_u_14, (copy) v_u_48
		if not (p_u_50 and (p_u_51 and (p_u_51.connection and p_u_51.connection.key))) then
			local v_u_52 = p49
			if p_u_50 then
				v_u_52 = v_u_52 .. ("(%s)"):format((v_u_9(p_u_50)))
			end
			if p_u_51 then
				v_u_14(p_u_51, function(p53)
					-- upvalues: (ref) v_u_4, (ref) v_u_48, (copy) p_u_51, (ref) v_u_52, (ref) v_u_9
					if v_u_4.indexOf(v_u_48, p53) == -1 then
						if p_u_51[p53] and next(p_u_51[p53]) ~= nil then
							v_u_52 = v_u_52 .. ("@%s(%s)"):format(p53, v_u_9(p_u_51[p53]))
						else
							v_u_52 = v_u_52 .. ("@%s"):format(p53)
						end
					else
						return
					end
				end)
			end
			return v_u_52
		end
		if not p_u_51.connection.filter or #p_u_51.connection.filter <= 0 then
			return p_u_51.connection.key
		end
		local v54 = not p_u_51.connection.filter and {} or p_u_51.connection.filter
		v_u_4.sort(v54, nil)
		local v_u_55 = {}
		v_u_4.forEach(v54, function(p56)
			-- upvalues: (copy) v_u_55, (copy) p_u_50
			v_u_55[p56] = p_u_50[p56]
		end)
		return ("%s(%s)"):format(p_u_51.connection.key, v_u_9(v_u_55))
	end
}
local v60 = {
	["setStringify"] = function(_, p58) -- name: setStringify
		-- upvalues: (ref) v_u_9
		local v59 = v_u_9
		v_u_9 = p58
		return v59
	end
}
v_u_8 = v_u_5.assign(setmetatable({}, v57), v60)
v7.getStoreKeyName = v_u_8
v_u_9 = function(p_u_61) -- name: stringify
	-- upvalues: (copy) v_u_12, (copy) v_u_6, (copy) v_u_4, (copy) v_u_5, (ref) v_u_9
	if v_u_12(p_u_61) then
		local v63 = v_u_4.map(v_u_4.sort(v_u_5.keys(p_u_61), nil), function(p62)
			-- upvalues: (ref) v_u_9, (copy) p_u_61
			return { p62, v_u_9(p_u_61[p62]) }
		end)
		if v_u_4.isArray(p_u_61) then
			return ("[%s]"):format(v_u_4.join(v_u_4.map(v63, function(p64)
				return p64[2]
			end), ","))
		else
			return ("{%s}"):format(v_u_4.join(v_u_4.map(v63, function(p65)
				return ("\"%s\":%s"):format(p65[1], p65[2])
			end), ","))
		end
	else
		return v_u_6:JSONEncode(p_u_61)
	end
end
function v7.argumentsObjectFromField(p66, p_u_67) -- name: argumentsObjectFromField
	-- upvalues: (copy) v_u_4, (copy) v_u_37
	if not p66.arguments or #p66.arguments <= 0 then
		return nil
	end
	local v_u_68 = {}
	v_u_4.forEach(p66.arguments, function(p69)
		-- upvalues: (ref) v_u_37, (copy) v_u_68, (copy) p_u_67
		v_u_37(v_u_68, p69.name, p69.value, p_u_67)
	end)
	return v_u_68
end
function v7.resultKeyNameFromField(p70) -- name: resultKeyNameFromField
	if p70.alias then
		return p70.alias.value
	else
		return p70.name.value
	end
end
local function v_u_78(p71, p72, p73) -- name: getTypenameFromResult
	-- upvalues: (ref) v_u_10, (copy) v_u_78, (copy) v_u_15
	local v74 = p71.__typename
	if typeof(v74) == "string" then
		return p71.__typename
	end
	for _, v75 in ipairs(p72.selections) do
		if v_u_10(v75) then
			if v75.name.value ~= "__typename" then
				continue
			end
			local v76
			if v75.alias then
				v76 = v75.alias.value
			else
				v76 = v75.name.value
			end
			return p71[v76]
		else
			local v77 = v_u_78(p71, v_u_15(v75, p73).selectionSet, p73)
			if typeof(v77) ~= "string" then
				continue
			end
			return v77
		end
	end
	return nil
end
v7.getTypenameFromResult = v_u_78
v_u_10 = function(p79) -- name: isField
	return p79.kind == "Field"
end
v7.isField = v_u_10
function v7.isInlineFragment(p80) -- name: isInlineFragment
	return p80.kind == "InlineFragment"
end
return v7