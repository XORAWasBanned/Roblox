-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.FieldsOnCorrectTypeRule
local v1 = script.Parent.Parent.Parent
local v2 = v1.jsutils
local v3 = v1.Parent
local v_u_4 = require(v3.LuauPolyfill).Array
local v_u_5 = require(v2.didYouMean).didYouMean
local v_u_6 = require(v2.suggestionList).suggestionList
local v_u_7 = require(v2.naturalCompare).naturalCompare
local v_u_8 = require(v1.error.GraphQLError).GraphQLError
local v9 = require(v1.type.definition)
local v_u_10 = v9.isObjectType
local v_u_11 = v9.isInterfaceType
local v_u_12 = v9.isAbstractType
local v_u_13 = nil
local v_u_14 = nil
local v21 = {
	["FieldsOnCorrectTypeRule"] = function(p_u_15)
		-- upvalues: (copy) v_u_5, (ref) v_u_14, (ref) v_u_13, (copy) v_u_8
		return {
			["Field"] = function(_, p16) -- name: Field
				-- upvalues: (copy) p_u_15, (ref) v_u_5, (ref) v_u_14, (ref) v_u_13, (ref) v_u_8
				local v17 = p_u_15:getParentType()
				if v17 and not p_u_15:getFieldDef() then
					local v18 = p_u_15:getSchema()
					local v19 = p16.name.value
					local v20 = v_u_5("to use an inline fragment on", v_u_14(v18, v17, v19))
					if v20 == "" then
						v20 = v_u_5(v_u_13(v17, v19))
					end
					p_u_15:reportError(v_u_8.new(("Cannot query field \"%s\" on type \"%s\"."):format(v19, v17.name) .. v20, p16))
				end
			end
		}
	end
}
v_u_14 = function(p_u_22, p23, p24) -- name: getSuggestedTypeNames
	-- upvalues: (copy) v_u_12, (copy) v_u_4, (copy) v_u_11, (copy) v_u_7
	if not v_u_12(p23) then
		return {}
	end
	local v25 = {}
	local v_u_26 = {}
	for _, v27 in ipairs(p_u_22:getPossibleTypes(p23)) do
		if not v27:getFields():get(p24) then
			continue
		end
		v25[v27] = true
		v_u_26[v27.name] = 1
		for _, v28 in ipairs(v27:getInterfaces()) do
			if not v28:getFields():get(p24) then
				continue
			end
			v25[v28] = true
			v_u_26[v28.name] = (v_u_26[v28.name] or 0) + 1
		end
	end
	local v29 = {}
	for v30, _ in pairs(v25) do
		table.insert(v29, v30)
	end
	v_u_4.sort(v29, function(p31, p32)
		-- upvalues: (copy) v_u_26, (ref) v_u_11, (copy) p_u_22, (ref) v_u_7
		local v33 = v_u_26[p32.name] - v_u_26[p31.name]
		if v33 == 0 then
			return v_u_11(p31) and p_u_22:isSubType(p31, p32) and -1 or (v_u_11(p32) and p_u_22:isSubType(p32, p31) and 1 or v_u_7(p31.name, p32.name))
		else
			return v33
		end
	end)
	return v_u_4.map(v29, function(p34)
		return p34.name
	end)
end
v_u_13 = function(p35, p36) -- name: getSuggestedFieldNames
	-- upvalues: (copy) v_u_10, (copy) v_u_11, (copy) v_u_6
	return not (v_u_10(p35) or v_u_11(p35)) and {} or v_u_6(p36, (p35:getFields():keys()))
end
return v21