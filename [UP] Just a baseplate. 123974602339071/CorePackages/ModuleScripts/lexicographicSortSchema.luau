-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.utilities.lexicographicSortSchema
local v1 = script.Parent.Parent
local v2 = v1.Parent
local v3 = require(v2.LuauPolyfill)
local v_u_4 = v3.Array
local v_u_5 = v3.Map
local v_u_6 = v3.Object
local v_u_7 = require(v1.jsutils.inspect).inspect
local v_u_8 = require(v1.jsutils.invariant).invariant
local v_u_9 = require(v1.jsutils.keyValMap).keyValMap
local v_u_10 = require(v1.jsutils.naturalCompare).naturalCompare
local v_u_11 = require(v1.type.schema).GraphQLSchema
local v_u_12 = require(v1.type.directives).GraphQLDirective
local v13 = require(v1.type.definition)
require(v1.language.ast)
local v_u_14 = require(v1.type.introspection).isIntrospectionType
local v_u_15 = v13.GraphQLList
local v_u_16 = v13.GraphQLNonNull
local v_u_17 = v13.GraphQLObjectType
local v_u_18 = v13.GraphQLInterfaceType
local v_u_19 = v13.GraphQLUnionType
local v_u_20 = v13.GraphQLEnumType
local v_u_21 = v13.GraphQLInputObjectType
local v_u_22 = v13.isListType
local v_u_23 = v13.isNonNullType
local v_u_24 = v13.isScalarType
local v_u_25 = v13.isObjectType
local v_u_26 = v13.isInterfaceType
local v_u_27 = v13.isUnionType
local v_u_28 = v13.isEnumType
local v_u_29 = v13.isInputObjectType
local v_u_30 = nil
local v_u_31 = nil
local v_u_32 = nil
local function v74(p33) -- name: lexicographicSortSchema
	-- upvalues: (copy) v_u_22, (copy) v_u_15, (copy) v_u_23, (copy) v_u_16, (copy) v_u_12, (copy) v_u_6, (ref) v_u_32, (ref) v_u_30, (copy) v_u_4, (ref) v_u_31, (copy) v_u_24, (copy) v_u_14, (copy) v_u_25, (copy) v_u_17, (copy) v_u_26, (copy) v_u_18, (copy) v_u_27, (copy) v_u_19, (copy) v_u_28, (copy) v_u_20, (copy) v_u_29, (copy) v_u_21, (copy) v_u_8, (copy) v_u_7, (copy) v_u_9, (copy) v_u_11
	local v_u_34 = nil
	local v_u_35 = nil
	local v_u_36 = nil
	local v37 = p33:toConfig()
	local function v_u_39(p38) -- name: replaceType
		-- upvalues: (ref) v_u_22, (ref) v_u_15, (copy) v_u_39, (ref) v_u_23, (ref) v_u_16, (ref) v_u_35
		if v_u_22(p38) then
			return v_u_15.new(v_u_39(p38.ofType))
		elseif v_u_23(p38) then
			return v_u_16.new(v_u_39(p38.ofType))
		else
			return v_u_35(p38)
		end
	end
	v_u_35 = function(p40) -- name: replaceNamedType
		-- upvalues: (ref) v_u_34
		return v_u_34[p40.name]
	end
	local function v42(p41) -- name: replaceMaybeType
		-- upvalues: (ref) v_u_35
		if p41 then
			return v_u_35(p41)
		else
			return nil
		end
	end
	local function v46(p43) -- name: sortDirective
		-- upvalues: (ref) v_u_12, (ref) v_u_6, (ref) v_u_32, (ref) v_u_36
		local v44 = p43:toConfig()
		return v_u_12.new(v_u_6.assign({}, v44, {
			["locations"] = v_u_32(v44.locations, function(p45)
				return p45
			end),
			["args"] = v_u_36(v44.args)
		}))
	end
	v_u_36 = function(p47) -- name: sortArgs
		-- upvalues: (ref) v_u_30, (ref) v_u_6, (copy) v_u_39
		return v_u_30(p47, function(p48)
			-- upvalues: (ref) v_u_6, (ref) v_u_39
			return v_u_6.assign({}, p48, {
				["type"] = v_u_39(p48.type)
			})
		end)
	end
	local function v_u_55(p49) -- name: sortFields
		-- upvalues: (ref) v_u_30, (ref) v_u_6, (copy) v_u_39, (ref) v_u_36
		return v_u_30(p49, function(p50)
			-- upvalues: (ref) v_u_6, (ref) v_u_39, (ref) v_u_36
			local v51 = v_u_6.assign
			local v52 = {}
			local v53 = {
				["type"] = v_u_39(p50.type)
			}
			local v54
			if p50.args then
				v54 = v_u_36(p50.args)
			else
				v54 = nil
			end
			v53.args = v54
			return v51(v52, p50, v53)
		end)
	end
	local function v_u_58(p56) -- name: sortInputFields
		-- upvalues: (ref) v_u_30, (ref) v_u_6, (copy) v_u_39
		return v_u_30(p56, function(p57)
			-- upvalues: (ref) v_u_6, (ref) v_u_39
			return v_u_6.assign({}, p57, {
				["type"] = v_u_39(p57.type)
			})
		end)
	end
	local function v_u_60(p59) -- name: sortTypes
		-- upvalues: (ref) v_u_4, (ref) v_u_31, (ref) v_u_35
		return v_u_4.map(v_u_31(p59), v_u_35)
	end
	local function v72(p61) -- name: sortNamedType
		-- upvalues: (ref) v_u_24, (ref) v_u_14, (ref) v_u_25, (ref) v_u_17, (ref) v_u_6, (ref) v_u_60, (ref) v_u_55, (ref) v_u_26, (ref) v_u_18, (ref) v_u_27, (ref) v_u_19, (ref) v_u_28, (ref) v_u_20, (ref) v_u_30, (ref) v_u_29, (ref) v_u_21, (ref) v_u_58, (ref) v_u_8, (ref) v_u_7
		if v_u_24(p61) or v_u_14(p61) then
			return p61
		end
		if v_u_25(p61) then
			local v_u_62 = p61:toConfig()
			local v63 = {
				["interfaces"] = function() -- name: interfaces
					-- upvalues: (ref) v_u_60, (copy) v_u_62
					return v_u_60(v_u_62.interfaces)
				end,
				["fields"] = function() -- name: fields
					-- upvalues: (ref) v_u_55, (copy) v_u_62
					return v_u_55(v_u_62.fields)
				end
			}
			return v_u_17.new(v_u_6.assign({}, v_u_62, v63))
		end
		if v_u_26(p61) then
			local v_u_64 = p61:toConfig()
			local v65 = {
				["interfaces"] = function() -- name: interfaces
					-- upvalues: (ref) v_u_60, (copy) v_u_64
					return v_u_60(v_u_64.interfaces)
				end,
				["fields"] = function() -- name: fields
					-- upvalues: (ref) v_u_55, (copy) v_u_64
					return v_u_55(v_u_64.fields)
				end
			}
			return v_u_18.new(v_u_6.assign({}, v_u_64, v65))
		end
		if v_u_27(p61) then
			local v_u_66 = p61:toConfig()
			local v67 = {
				["types"] = function() -- name: types
					-- upvalues: (ref) v_u_60, (copy) v_u_66
					return v_u_60(v_u_66.types)
				end
			}
			return v_u_19.new(v_u_6.assign({}, v_u_66, v67))
		end
		if v_u_28(p61) then
			local v68 = p61:toConfig()
			return v_u_20.new(v_u_6.assign({}, v68, {
				["values"] = v_u_30(v68.values, function(p69)
					return p69
				end)
			}))
		end
		if v_u_29(p61) then
			local v_u_70 = p61:toConfig()
			local v71 = {
				["fields"] = function() -- name: fields
					-- upvalues: (ref) v_u_58, (copy) v_u_70
					return v_u_58(v_u_70.fields)
				end
			}
			return v_u_21.new(v_u_6.assign({}, v_u_70, v71))
		end
		v_u_8(false, "Unexpected type: " .. v_u_7(p61))
		error("Unexpected type: " .. v_u_7(p61))
	end
	v_u_34 = v_u_9(v_u_31(v37.types), function(p73)
		return p73.name
	end, v72)
	return v_u_11.new(v_u_6.assign({}, v37, {
		["types"] = v_u_34:values(),
		["directives"] = v_u_4.map(v_u_31(v37.directives), v46),
		["query"] = v42(v37.query),
		["mutation"] = v42(v37.mutation),
		["subscription"] = v42(v37.subscription)
	}))
end
v_u_30 = function(p75, p76) -- name: sortObjMap
	-- upvalues: (copy) v_u_5, (ref) v_u_32
	local v77 = v_u_5.new()
	local v79 = v_u_32(p75:keys(), function(p78)
		return p78
	end)
	for _, v80 in ipairs(v79) do
		v77[v80] = p76(p75[v80])
	end
	return v77
end
v_u_31 = function(p81) -- name: sortByName
	-- upvalues: (ref) v_u_32
	return v_u_32(p81, function(p82)
		return p82.name
	end)
end
v_u_32 = function(p83, p_u_84) -- name: sortBy
	-- upvalues: (copy) v_u_4, (copy) v_u_10
	return v_u_4.sort(v_u_4.slice(p83), function(p85, p86)
		-- upvalues: (copy) p_u_84, (ref) v_u_10
		return v_u_10(p_u_84(p85), (p_u_84(p86)))
	end)
end
return {
	["lexicographicSortSchema"] = v74
}