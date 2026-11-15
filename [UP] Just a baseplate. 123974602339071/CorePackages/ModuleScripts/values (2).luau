-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.execution.values
local v1 = script.Parent.Parent
local v2 = v1.Parent
local v_u_3 = require(v2.LuauPolyfill).Array
local v_u_4 = require(v1.luaUtils.null)
local v_u_5 = require(v1.luaUtils.isNillish).isNillish
require(v1.jsutils.ObjMap)
local v_u_6 = require(v1.jsutils.keyMap).keyMap
local v_u_7 = require(v1.jsutils.inspect).inspect
local v_u_8 = require(v1.jsutils.printPathArray).printPathArray
local v_u_9 = require(v1.error.GraphQLError).GraphQLError
local v10 = v1.language
require(v10.ast)
local v_u_11 = require(v10.kinds).Kind
local v_u_12 = require(v10.printer).print
local v13 = v1.type
require(v13.schema)
require(v13.definition)
require(v13.directives)
local v14 = require(v1.type.definition)
local v_u_15 = v14.isInputType
local v_u_16 = v14.isNonNullType
local v_u_17 = require(v1.utilities.typeFromAST).typeFromAST
local v_u_18 = require(v1.utilities.valueFromAST).valueFromAST
local v_u_19 = require(v1.utilities.coerceInputValue).coerceInputValue
local v_u_20 = nil
local v_u_21 = nil
local function v34(p22, p23, p24, p25)
	-- upvalues: (ref) v_u_20, (copy) v_u_9
	local v_u_26 = {}
	local v_u_27
	if p25 == nil then
		v_u_27 = nil
	else
		v_u_27 = p25.maxErrors
	end
	local v28 = v_u_20
	local function v31(p29)
		-- upvalues: (ref) v_u_27, (copy) v_u_26, (ref) v_u_9
		if v_u_27 ~= nil and v_u_27 <= #v_u_26 then
			error(v_u_9.new("Too many errors processing variables, error limit reached. Execution aborted."))
		end
		local v30 = v_u_26
		table.insert(v30, p29)
	end
	local v32, v33 = pcall(v28, p22, p23, p24, v31)
	if not v32 then
		table.insert(v_u_26, v33)
	end
	return #v_u_26 == 0 and {
		["coerced"] = v33
	} or {
		["errors"] = v_u_26
	}
end
v_u_20 = function(p35, p36, p37, p_u_38) -- name: coerceVariableValues
	-- upvalues: (copy) v_u_17, (copy) v_u_15, (copy) v_u_12, (copy) v_u_9, (ref) v_u_21, (copy) v_u_18, (copy) v_u_16, (copy) v_u_7, (copy) v_u_4, (copy) v_u_19, (copy) v_u_8
	local v39 = {}
	for _, v_u_40 in ipairs(p36) do
		local v_u_41 = v_u_40.variable.name.value
		local v42 = v_u_17(p35, v_u_40.type)
		if v_u_15(v42) then
			if v_u_21(p37, v_u_41) then
				local v43 = p37[v_u_41]
				if v43 == v_u_4 and v_u_16(v42) then
					local v44 = v_u_7(v42)
					p_u_38(v_u_9.new(("Variable \"$%s\" of non-null type \"%s\" must not be null."):format(v_u_41, v44), v_u_40))
				else
					v39[v_u_41] = v_u_19(v43, v42, function(p45, p46, p47)
						-- upvalues: (copy) v_u_41, (ref) v_u_7, (ref) v_u_8, (copy) p_u_38, (ref) v_u_9, (copy) v_u_40
						local v48 = ("Variable \"$%s\" got invalid value "):format(v_u_41) .. v_u_7(p46)
						if #p45 > 0 then
							v48 = v48 .. (" at \"%s%s\""):format(v_u_41, v_u_8(p45))
						end
						p_u_38(v_u_9.new(v48 .. "; " .. p47.message, v_u_40, nil, nil, nil, p47.originalError))
					end)
				end
			elseif v_u_40.defaultValue then
				v39[v_u_41] = v_u_18(v_u_40.defaultValue, v42)
			else
				if not v_u_16(v42) then
					continue
				end
				local v49 = v_u_7(v42)
				p_u_38(v_u_9.new(("Variable \"$%s\" of required type \"%s\" was not provided."):format(v_u_41, v49), v_u_40))
			end
		else
			local v50 = v_u_12(v_u_40.type)
			p_u_38(v_u_9.new(("Variable \"$%s\" expected value of type \"%s\" which cannot be used as an input type."):format(v_u_41, v50), v_u_40.type))
		end
	end
	return v39
end
local function v_u_65(p51, p52, p53) -- name: getArgumentValues
	-- upvalues: (copy) v_u_6, (copy) v_u_16, (copy) v_u_9, (copy) v_u_7, (copy) v_u_11, (ref) v_u_21, (copy) v_u_5, (copy) v_u_18, (copy) v_u_12
	local v55 = v_u_6(not p52.arguments and {} or p52.arguments, function(p54)
		return p54.name.value
	end)
	local v56 = {}
	for _, v57 in ipairs(p51.args) do
		local v58 = v57.name
		local v59 = v57.type
		local v60 = v55[v58]
		if v60 then
			local v61 = v60.value
			local v62 = v61.kind == v_u_11.NULL
			local v63
			if v61.kind == v_u_11.VARIABLE then
				local v64 = v61.name.value
				if p53 == nil or not v_u_21(p53, v64) then
					if v57.defaultValue == nil then
						if not v_u_16(v59) then
							continue
						end
						error(v_u_9.new(("Argument \"%s\" of required type \"%s\" "):format(v58, v_u_7(v59)) .. ("was provided the variable \"$%s\" which was not provided a runtime value."):format(v64), v61))
					else
						v56[v58] = v57.defaultValue
					end
				else
					v62 = v_u_5(p53[v64])
					if v62 and v_u_16(v59) then
						error(v_u_9.new(("Argument \"%s\" of non-null type \"%s\" "):format(v58, v_u_7(v59)) .. "must not be null.", v61))
					end
					v63 = v_u_18(v61, v59, p53)
					if v63 == nil then
						error(v_u_9.new(("Argument \"%s\" has invalid value %s."):format(v58, v_u_12(v61)), v61))
					end
					v56[v58] = v63
				end
			else
				if v62 and v_u_16(v59) then
					error(v_u_9.new(("Argument \"%s\" of non-null type \"%s\" "):format(v58, v_u_7(v59)) .. "must not be null.", v61))
				end
				v63 = v_u_18(v61, v59, p53)
				if v63 == nil then
					error(v_u_9.new(("Argument \"%s\" has invalid value %s."):format(v58, v_u_12(v61)), v61))
				end
				v56[v58] = v63
			end
		elseif v57.defaultValue == nil then
			if not v_u_16(v59) then
				continue
			end
			error(v_u_9.new(("Argument \"%s\" of required type \"%s\" "):format(v58, v_u_7(v59)) .. "was not provided.", p52))
		else
			v56[v58] = v57.defaultValue
		end
	end
	return v56
end
local function v71(p_u_66, p67, p68)
	-- upvalues: (copy) v_u_3, (ref) v_u_65
	local v69
	if p67.directives then
		v69 = v_u_3.find(p67.directives, function(p70)
			-- upvalues: (copy) p_u_66
			return p70.name.value == p_u_66.name
		end)
	else
		v69 = nil
	end
	if v69 then
		return v_u_65(p_u_66, v69, p68)
	else
		return nil
	end
end
v_u_21 = function(p72, p73) -- name: hasOwnProperty
	return p72[p73] ~= nil
end
return {
	["getVariableValues"] = v34,
	["getArgumentValues"] = v_u_65,
	["getDirectiveValues"] = v71
}