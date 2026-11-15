-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.type.scalars
local v1 = script.Parent.Parent.Parent
local v2 = require(v1.LuauPolyfill)
local v_u_3 = v2.Array
local v_u_4 = v2.Number
local v5 = v2.Object
require(script.Parent.Parent.language.ast)
local v_u_6 = require(script.Parent.Parent.jsutils.inspect).inspect
local v_u_7 = require(script.Parent.Parent.jsutils.isObjectLike).isObjectLike
local v_u_8 = require(script.Parent.Parent.language.kinds).Kind
local v_u_9 = require(script.Parent.Parent.language.printer).print
local v_u_10 = require(script.Parent.Parent.error.GraphQLError).GraphQLError
local v11 = require(script.Parent.definition).GraphQLScalarType
local v_u_12 = nil
function serializeInt(p13) -- name: serializeInt
	-- upvalues: (ref) v_u_12, (copy) v_u_4, (copy) v_u_10, (copy) v_u_6
	local v14 = v_u_12(p13)
	if typeof(v14) == "boolean" then
		return v14 and 1 or 0
	end
	local v15
	if typeof(v14) == "string" and v14 ~= "" then
		v15 = tonumber(v14)
	else
		v15 = v14
	end
	if typeof(v15) ~= "number" or not v_u_4.isInteger(v15) then
		error(v_u_10.new(("Int cannot represent non-integer value: %s"):format(v_u_6(v14))))
	end
	if v15 > 2147483647 or v15 < -2147483648 then
		error(v_u_10.new("Int cannot represent non 32-bit signed integer value: " .. v_u_6(v14)))
	end
	return v15
end
function coerceInt(p16) -- name: coerceInt
	-- upvalues: (copy) v_u_4, (copy) v_u_10, (copy) v_u_6
	if typeof(p16) ~= "number" or not v_u_4.isInteger(p16) then
		error(v_u_10.new(("Int cannot represent non-integer value: %s"):format(v_u_6(p16))))
	end
	if p16 > 2147483647 or p16 < -2147483648 then
		error(v_u_10.new(("Int cannot represent non 32-bit signed integer value: %s"):format(p16)))
	end
	return p16
end
local v20 = v11.new({
	["name"] = "Int",
	["description"] = "The `Int` scalar type represents non-fractional signed whole numeric values. Int can represent values between -(2^31) and 2^31 - 1.",
	["serialize"] = nil,
	["parseValue"] = nil,
	["parseLiteral"] = nil,
	["serialize"] = serializeInt,
	["parseValue"] = coerceInt,
	["parseLiteral"] = function(p17) -- name: parseLiteral
		-- upvalues: (copy) v_u_8, (copy) v_u_10, (copy) v_u_9
		if p17.kind ~= v_u_8.INT then
			error(v_u_10.new(("Int cannot represent non-integer value: %s"):format(v_u_9(p17)), p17))
		end
		local v18 = p17.value
		local v19 = tonumber(v18, 10)
		if v19 > 2147483647 or v19 < -2147483648 then
			error(v_u_10.new(("Int cannot represent non 32-bit signed integer value: %s"):format(p17.value), p17))
		end
		return v19
	end
})
local function v25(p21) -- name: serializeFloat
	-- upvalues: (ref) v_u_12, (copy) v_u_10, (copy) v_u_6
	local v22 = v_u_12(p21)
	if typeof(v22) == "boolean" then
		return v22 and 1 or 0
	end
	local v23
	if typeof(v22) == "string" and v22 ~= "" then
		v23 = tonumber(v22)
	else
		v23 = v22
	end
	if typeof(v23) ~= "number" then
		error(v_u_10.new(("Float cannot represent non numeric value: %s"):format(v_u_6(v22))))
		return v23
	end
	local v24
	if typeof(v23) == "number" and v23 ~= (1 / 0) then
		v24 = v23 == v23
	else
		v24 = false
	end
	if v24 then
		return v23
	end
	error(v_u_10.new(("Float cannot represent non numeric value: %s"):format(v_u_6(v22))))
	return v23
end
function coerceFloat(p26) -- name: coerceFloat
	-- upvalues: (copy) v_u_10, (copy) v_u_6
	if typeof(p26) ~= "number" then
		error(v_u_10.new(("Float cannot represent non numeric value: %s"):format(v_u_6(p26))))
		return p26
	end
	local v27
	if typeof(p26) == "number" and p26 ~= (1 / 0) then
		v27 = p26 == p26
	else
		v27 = false
	end
	if v27 then
		return p26
	end
	error(v_u_10.new(("Float cannot represent non numeric value: %s"):format(v_u_6(p26))))
	return p26
end
local v30 = v11.new({
	["name"] = "Float",
	["description"] = "The `Float` scalar type represents signed double-precision fractional values as specified by [IEEE 754](https://en.wikipedia.org/wiki/IEEE_floating_point).",
	["serialize"] = nil,
	["parseValue"] = nil,
	["parseLiteral"] = nil,
	["serialize"] = v25,
	["parseValue"] = coerceFloat,
	["parseLiteral"] = function(p28) -- name: parseLiteral
		-- upvalues: (copy) v_u_8, (copy) v_u_10, (copy) v_u_9
		if p28.kind ~= v_u_8.FLOAT and p28.kind ~= v_u_8.INT then
			error(v_u_10.new(("Float cannot represent non numeric value: %s"):format(v_u_9(p28)), p28))
		end
		local v29 = p28.value
		return tonumber(v29, nil)
	end
})
v_u_12 = function(p31) -- name: serializeObject
	-- upvalues: (copy) v_u_7
	if v_u_7(p31) then
		local v32 = p31.valueOf
		if typeof(v32) == "function" then
			local v33 = p31:valueOf()
			if not v_u_7(v33) then
				return v33
			end
		end
		local v34 = p31.toJSON
		if typeof(v34) == "function" then
			return p31:toJSON()
		end
	end
	return p31
end
local function v38(p35) -- name: serializeString
	-- upvalues: (ref) v_u_12, (copy) v_u_10, (copy) v_u_6
	local v36 = v_u_12(p35)
	if typeof(v36) == "string" then
		return v36
	end
	if typeof(v36) == "boolean" then
		return v36 and "true" or "false"
	end
	if typeof(v36) == "number" then
		local v37
		if typeof(v36) == "number" and v36 ~= (1 / 0) then
			v37 = v36 == v36
		else
			v37 = false
		end
		if v37 then
			return tostring(v36)
		end
	end
	error(v_u_10.new(("String cannot represent value: %s"):format(v_u_6(p35))))
end
function coerceString(p39) -- name: coerceString
	-- upvalues: (copy) v_u_10, (copy) v_u_6
	if typeof(p39) ~= "string" then
		error(v_u_10.new(("String cannot represent a non string value: %s"):format(v_u_6(p39))))
	end
	return p39
end
local v41 = v11.new({
	["name"] = "String",
	["description"] = "The `String` scalar type represents textual data, represented as UTF-8 character sequences. The String type is most often used by GraphQL to represent free-form human-readable text.",
	["serialize"] = nil,
	["parseValue"] = nil,
	["parseLiteral"] = nil,
	["serialize"] = v38,
	["parseValue"] = coerceString,
	["parseLiteral"] = function(p40) -- name: parseLiteral
		-- upvalues: (copy) v_u_8, (copy) v_u_10, (copy) v_u_9
		if p40.kind ~= v_u_8.STRING then
			error(v_u_10.new(("String cannot represent a non string value: %s"):format(v_u_9(p40)), p40))
		end
		return p40.value
	end
})
local function v45(p42) -- name: serializeBoolean
	-- upvalues: (ref) v_u_12, (copy) v_u_10, (copy) v_u_6
	local v43 = v_u_12(p42)
	if typeof(v43) == "boolean" then
		return v43
	end
	local v44
	if typeof(v43) == "number" and v43 ~= (1 / 0) then
		v44 = v43 == v43
	else
		v44 = false
	end
	if v44 then
		return v43 ~= 0
	end
	error(v_u_10.new(("Boolean cannot represent a non boolean value: %s"):format(v_u_6(v43))))
end
function coerceBoolean(p46) -- name: coerceBoolean
	-- upvalues: (copy) v_u_10, (copy) v_u_6
	if typeof(p46) ~= "boolean" then
		error(v_u_10.new(("Boolean cannot represent a non boolean value: %s"):format(v_u_6(p46))))
	end
	return p46
end
local v48 = v11.new({
	["name"] = "Boolean",
	["description"] = "The `Boolean` scalar type represents `true` or `false`.",
	["serialize"] = nil,
	["parseValue"] = nil,
	["parseLiteral"] = nil,
	["serialize"] = v45,
	["parseValue"] = coerceBoolean,
	["parseLiteral"] = function(p47) -- name: parseLiteral
		-- upvalues: (copy) v_u_8, (copy) v_u_10, (copy) v_u_9
		if p47.kind ~= v_u_8.BOOLEAN then
			error(v_u_10.new(("Boolean cannot represent a non boolean value: %s"):format(v_u_9(p47)), p47))
		end
		return p47.value
	end
})
local function v51(p49) -- name: serializeID
	-- upvalues: (ref) v_u_12, (copy) v_u_4, (copy) v_u_10, (copy) v_u_6
	local v50 = v_u_12(p49)
	if typeof(v50) == "string" then
		return v50
	end
	if v_u_4.isInteger(v50) then
		return tostring(v50)
	end
	error(v_u_10.new(("ID cannot represent value: %s"):format(v_u_6(p49))))
end
function coerceID(p52) -- name: coerceID
	-- upvalues: (copy) v_u_4, (copy) v_u_10, (copy) v_u_6
	if typeof(p52) == "string" then
		return p52
	end
	if typeof(p52) == "number" and v_u_4.isInteger(p52) then
		return tostring(p52)
	end
	error(v_u_10.new(("ID cannot represent value: %s"):format(v_u_6(p52))))
end
local v54 = v11.new({
	["name"] = "ID",
	["description"] = "The `ID` scalar type represents a unique identifier, often used to refetch an object or as key for a cache. The ID type appears in a JSON response as a String; however, it is not intended to be human-readable. When expected as an input type, any string (such as `\"4\"`) or integer (such as `4`) input value will be accepted as an ID.",
	["serialize"] = nil,
	["parseValue"] = nil,
	["parseLiteral"] = nil,
	["serialize"] = v51,
	["parseValue"] = coerceID,
	["parseLiteral"] = function(p53) -- name: parseLiteral
		-- upvalues: (copy) v_u_8, (copy) v_u_10, (copy) v_u_9
		if p53.kind ~= v_u_8.STRING and p53.kind ~= v_u_8.INT then
			error(v_u_10.new("ID cannot represent a non-string and non-integer value: " .. v_u_9(p53), p53))
		end
		return p53.value
	end
})
local v_u_55 = v5.freeze({
	v41,
	v20,
	v30,
	v48,
	v54
})
return {
	["GraphQLInt"] = v20,
	["GraphQLFloat"] = v30,
	["GraphQLString"] = v41,
	["GraphQLBoolean"] = v48,
	["GraphQLID"] = v54,
	["specifiedScalarTypes"] = v_u_55,
	["isSpecifiedScalarType"] = function(p_u_56) -- name: isSpecifiedScalarType
		-- upvalues: (copy) v_u_3, (copy) v_u_55
		return v_u_3.some(v_u_55, function(p57)
			-- upvalues: (copy) p_u_56
			return p57.name == p_u_56.name
		end)
	end
}