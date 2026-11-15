-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.ValuesOfCorrectTypeRule
local v1 = script.Parent.Parent.Parent
local v2 = v1.language
local v3 = v1.jsutils
local v_u_4 = require(v3.instanceOf)
local v_u_5 = require(v3.keyMap).keyMap
local v_u_6 = require(v3.inspect).inspect
local v_u_7 = require(v3.didYouMean).didYouMean
local v_u_8 = require(v3.suggestionList).suggestionList
local v_u_9 = require(v1.error.GraphQLError).GraphQLError
local v_u_10 = require(v2.printer).print
local v11 = require(v1.type.definition)
local v_u_12 = v11.isLeafType
local v_u_13 = v11.isInputObjectType
local v_u_14 = v11.isListType
local v_u_15 = v11.isNonNullType
local v_u_16 = v11.isRequiredInputField
local v_u_17 = v11.getNullableType
local v_u_18 = v11.getNamedType
local v19 = {}
local v_u_20 = nil
function v19.ValuesOfCorrectTypeRule(p_u_21)
	-- upvalues: (copy) v_u_17, (copy) v_u_14, (ref) v_u_20, (copy) v_u_18, (copy) v_u_13, (copy) v_u_5, (copy) v_u_16, (copy) v_u_6, (copy) v_u_9, (copy) v_u_8, (copy) v_u_7, (copy) v_u_15, (copy) v_u_10
	return {
		["ListValue"] = function(_, p22) -- name: ListValue
			-- upvalues: (ref) v_u_17, (copy) p_u_21, (ref) v_u_14, (ref) v_u_20
			if not v_u_14((v_u_17(p_u_21:getParentInputType()))) then
				v_u_20(p_u_21, p22)
				return false
			end
		end,
		["ObjectValue"] = function(_, p23) -- name: ObjectValue
			-- upvalues: (ref) v_u_18, (copy) p_u_21, (ref) v_u_13, (ref) v_u_20, (ref) v_u_5, (ref) v_u_16, (ref) v_u_6, (ref) v_u_9
			local v24 = v_u_18(p_u_21:getInputType())
			if not v_u_13(v24) then
				v_u_20(p_u_21, p23)
				return false
			end
			local v26 = v_u_5(p23.fields, function(p25)
				return p25.name.value
			end)
			for _, v27 in ipairs(v24:getFields():values()) do
				if v26[v27.name] or not v_u_16(v27) then
					continue
				end
				local v28 = v_u_6(v27.type)
				p_u_21:reportError(v_u_9.new(("Field \"%s.%s\" of required type \"%s\" was not provided."):format(v24.name, v27.name, v28), p23))
			end
		end,
		["ObjectField"] = function(_, p29) -- name: ObjectField
			-- upvalues: (ref) v_u_18, (copy) p_u_21, (ref) v_u_13, (ref) v_u_8, (ref) v_u_9, (ref) v_u_7
			local v30 = v_u_18(p_u_21:getParentInputType())
			if not p_u_21:getInputType() and v_u_13(v30) then
				local v31 = v_u_8(p29.name.value, v30:getFields():keys())
				p_u_21:reportError(v_u_9.new(("Field \"%s\" is not defined by type \"%s\"."):format(p29.name.value, v30.name) .. v_u_7(v31), p29))
			end
		end,
		["NullValue"] = function(_, p32) -- name: NullValue
			-- upvalues: (copy) p_u_21, (ref) v_u_15, (ref) v_u_9, (ref) v_u_6, (ref) v_u_10
			local v33 = p_u_21:getInputType()
			if v_u_15(v33) then
				p_u_21:reportError(v_u_9.new(("Expected value of type \"%s\", found %s."):format(v_u_6(v33), v_u_10(p32)), p32))
			end
		end,
		["EnumValue"] = function(_, p34) -- name: EnumValue
			-- upvalues: (ref) v_u_20, (copy) p_u_21
			return v_u_20(p_u_21, p34)
		end,
		["IntValue"] = function(_, p35) -- name: IntValue
			-- upvalues: (ref) v_u_20, (copy) p_u_21
			return v_u_20(p_u_21, p35)
		end,
		["FloatValue"] = function(_, p36) -- name: FloatValue
			-- upvalues: (ref) v_u_20, (copy) p_u_21
			return v_u_20(p_u_21, p36)
		end,
		["StringValue"] = function(_, p37) -- name: StringValue
			-- upvalues: (ref) v_u_20, (copy) p_u_21
			return v_u_20(p_u_21, p37)
		end,
		["BooleanValue"] = function(_, p38) -- name: BooleanValue
			-- upvalues: (ref) v_u_20, (copy) p_u_21
			return v_u_20(p_u_21, p38)
		end
	}
end
v_u_20 = function(p_u_39, p_u_40) -- name: isValidValueNode
	-- upvalues: (copy) v_u_18, (copy) v_u_12, (copy) v_u_6, (copy) v_u_9, (copy) v_u_10, (copy) v_u_4
	local v_u_41 = p_u_39:getInputType()
	if v_u_41 then
		local v_u_42 = v_u_18(v_u_41)
		if v_u_12(v_u_42) then
			local function v44()
				-- upvalues: (copy) v_u_42, (copy) p_u_40, (ref) v_u_6, (copy) v_u_41, (copy) p_u_39, (ref) v_u_9, (ref) v_u_10
				if v_u_42:parseLiteral(p_u_40, nil) == nil then
					local v43 = v_u_6(v_u_41)
					p_u_39:reportError(v_u_9.new(("Expected value of type \"%s\", found %s."):format(v43, v_u_10(p_u_40)), p_u_40))
				end
			end
			local function v47(p45)
				-- upvalues: (ref) v_u_6, (copy) v_u_41, (ref) v_u_4, (ref) v_u_9, (copy) p_u_39, (ref) v_u_10, (copy) p_u_40
				local v46 = v_u_6(v_u_41)
				if v_u_4(p45, v_u_9) then
					p_u_39:reportError(p45)
				else
					p_u_39:reportError(v_u_9.new(("Expected value of type \"%s\", found %s; "):format(v46, v_u_10(p_u_40)) .. p45.message, p_u_40, nil, nil, nil, p45))
				end
			end
			xpcall(v44, v47)
		else
			local v48 = v_u_6(v_u_41)
			p_u_39:reportError(v_u_9.new(("Expected value of type \"%s\", found %s."):format(v48, v_u_10(p_u_40)), p_u_40))
		end
	else
		return
	end
end
return v19