-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.utilities.coerceInputValue
local v1 = script.Parent.Parent
local v2 = v1.Parent
local v3 = v1.jsutils
local v4 = v1.luaUtils
local v5 = require(v2.LuauPolyfill)
local v_u_6 = v5.Array
local v_u_7 = v5.Object
local v_u_8 = require(v3.inspect).inspect
local v_u_9 = require(v3.invariant).invariant
local v_u_10 = require(v3.didYouMean).didYouMean
local v_u_11 = require(v3.isObjectLike).isObjectLike
local v_u_12 = require(v3.suggestionList).suggestionList
local v_u_13 = require(v3.printPathArray).printPathArray
local v_u_14 = require(v3.Path).addPath
local v_u_15 = require(v3.instanceOf)
local v_u_16 = require(v4.null)
local v17 = require(v4.isNillish)
local v_u_18 = v17.isNillish
local v_u_19 = v17.isNotNillish
local v_u_20 = require(v3.Path).pathToArray
local v_u_21 = require(v3.isIteratableObject).isIteratableObject
local v_u_22 = require(v1.error.GraphQLError).GraphQLError
local v23 = require(v1.type.definition)
local v_u_24 = v23.isLeafType
local v_u_25 = v23.isInputObjectType
local v_u_26 = v23.isListType
local v_u_27 = v23.isNonNullType
local v_u_28 = nil
local v_u_29 = nil
local function v33(p30, p31, p32) -- name: coerceInputValue
	-- upvalues: (ref) v_u_29, (ref) v_u_28
	return v_u_28(p30, p31, p32 or v_u_29)
end
v_u_29 = function(p34, p35, p36) -- name: defaultOnError
	-- upvalues: (copy) v_u_8, (copy) v_u_13
	local v37 = "Invalid value " .. v_u_8(p35)
	if #p34 > 0 then
		v37 = v37 .. " at \"value" .. v_u_13(p34) .. "\""
	end
	p36.message = v37 .. ": " .. p36.message
	error(p36)
end
v_u_28 = function(p38, p39, p_u_40, p_u_41) -- name: coerceInputValueImpl
	-- upvalues: (copy) v_u_27, (copy) v_u_19, (ref) v_u_28, (copy) v_u_20, (copy) v_u_22, (copy) v_u_8, (copy) v_u_18, (copy) v_u_16, (copy) v_u_26, (copy) v_u_21, (copy) v_u_6, (copy) v_u_14, (copy) v_u_25, (copy) v_u_11, (copy) v_u_7, (copy) v_u_12, (copy) v_u_10, (copy) v_u_24, (copy) v_u_15, (copy) v_u_9
	if v_u_27(p39) then
		if v_u_19(p38) then
			return v_u_28(p38, p39.ofType, p_u_40, p_u_41)
		end
		p_u_40(v_u_20(p_u_41), p38, v_u_22.new("Expected non-nullable type \"" .. v_u_8(p39) .. "\" not to be null."))
		return
	elseif v_u_18(p38) then
		return v_u_16
	elseif v_u_26(p39) then
		local v_u_42 = p39.ofType
		return not v_u_21(p38) and { v_u_28(p38, v_u_42, p_u_40, p_u_41) } or v_u_6.from(p38, function(p43, p44)
			-- upvalues: (ref) v_u_14, (copy) p_u_41, (ref) v_u_28, (copy) v_u_42, (copy) p_u_40
			return v_u_28(p43, v_u_42, p_u_40, (v_u_14(p_u_41, p44, nil)))
		end)
	elseif v_u_25(p39) then
		if v_u_11(p38) then
			local v45 = p39:getFields()
			local v46 = {}
			for _, v47 in ipairs(v45:values()) do
				local v48 = p38[v47.name]
				if v48 == nil then
					if v47.defaultValue == nil then
						if not v_u_27(v47.type) then
							continue
						end
						local v49 = v_u_8(v47.type)
						p_u_40(v_u_20(p_u_41), p38, v_u_22.new("Field \"" .. v47.name .. "\" of required type \"" .. v49 .. "\" was not provided."))
					else
						v46[v47.name] = v47.defaultValue
					end
				else
					v46[v47.name] = v_u_28(v48, v47.type, p_u_40, v_u_14(p_u_41, v47.name, p39.name))
				end
			end
			for _, v50 in ipairs(v_u_7.keys(p38)) do
				if v45:get(v50) then
					continue
				end
				local v51 = v_u_12(v50, p39:getFields():keys())
				p_u_40(v_u_20(p_u_41), p38, v_u_22.new(("Field \"%s\" is not defined by type \"%s\".%s"):format(v50, p39.name, v_u_10(v51))))
			end
			return v46
		end
		p_u_40(v_u_20(p_u_41), p38, v_u_22.new("Expected type \"" .. p39.name .. "\" to be an object."))
		return
	elseif v_u_24(p39) then
		local v52 = p39.parseValue
		local v53, v54 = pcall(v52, p39, p38)
		if v53 then
			if v54 == nil then
				p_u_40(v_u_20(p_u_41), p38, v_u_22.new(("Expected type \"%s\"."):format(p39.name)))
			end
			return v54
		elseif v_u_15(v54, v_u_22) then
			p_u_40(v_u_20(p_u_41), p38, v54)
		else
			p_u_40(v_u_20(p_u_41), p38, v_u_22.new("Expected type \"" .. p39.name .. "\". " .. v54.message, nil, nil, nil, nil, v54))
		end
	else
		v_u_9(false, "Unexpected input type: " .. v_u_8(p39))
		return
	end
end
return {
	["coerceInputValue"] = v33
}