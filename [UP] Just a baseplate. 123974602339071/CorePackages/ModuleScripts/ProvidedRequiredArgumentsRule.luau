-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.ProvidedRequiredArgumentsRule
local v1 = script.Parent.Parent.Parent
local v2 = v1.jsutils
local v3 = v1.Parent
local v4 = require(v3.LuauPolyfill)
local v_u_5 = v4.Array
local v_u_6 = v4.Object
local v_u_7 = require(v2.inspect).inspect
local v_u_8 = require(v2.keyMap).keyMap
local v_u_9 = require(v1.error.GraphQLError).GraphQLError
local v10 = v1.language
local v_u_11 = require(v10.kinds).Kind
local v_u_12 = require(v10.printer).print
local v13 = require(v1.type.definition)
local v_u_14 = v13.isType
local v_u_15 = v13.isRequiredArgument
local v_u_16 = require(v1.type.directives).specifiedDirectives
local v_u_43 = {
	["ProvidedRequiredArgumentsRule"] = function(p_u_17) -- name: ProvidedRequiredArgumentsRule
		-- upvalues: (copy) v_u_6, (copy) v_u_43, (copy) v_u_8, (copy) v_u_15, (copy) v_u_7, (copy) v_u_9
		local v24 = {
			["Field"] = {
				["leave"] = function(_, p18) -- name: leave
					-- upvalues: (copy) p_u_17, (ref) v_u_8, (ref) v_u_15, (ref) v_u_7, (ref) v_u_9
					local v19 = p_u_17:getFieldDef()
					if not v19 then
						return false
					end
					local v21 = v_u_8(p18.arguments or {}, function(p20)
						return p20.name.value
					end)
					for _, v22 in ipairs(v19.args) do
						if v21[v22.name] or not v_u_15(v22) then
							continue
						end
						local v23 = v_u_7(v22.type)
						p_u_17:reportError(v_u_9.new(("Field \"%s\" argument \"%s\" of type \"%s\" is required, but it was not provided."):format(v19.name, v22.name, v23), p18))
					end
				end
			}
		}
		return v_u_6.assign({}, v_u_43.ProvidedRequiredArgumentsOnDirectivesRule(p_u_17), v24)
	end,
	["ProvidedRequiredArgumentsOnDirectivesRule"] = function(p_u_25) -- name: ProvidedRequiredArgumentsOnDirectivesRule
		-- upvalues: (copy) v_u_16, (copy) v_u_8, (copy) v_u_5, (copy) v_u_15, (copy) v_u_11, (copy) v_u_6, (copy) v_u_14, (copy) v_u_7, (copy) v_u_12, (copy) v_u_9
		local v_u_26 = {}
		local v27 = p_u_25:getSchema()
		local v28 = v_u_16
		if v27 then
			v28 = v27:getDirectives()
		end
		for _, v29 in ipairs(v28) do
			v_u_26[v29.name] = v_u_8(v_u_5.filter(v29.args, v_u_15), function(p30)
				return p30.name
			end)
		end
		local v31 = p_u_25:getDocument().definitions
		for _, v32 in ipairs(v31) do
			if v32.kind ~= v_u_11.DIRECTIVE_DEFINITION then
				continue
			end
			local v33 = v32.arguments or {}
			v_u_26[v32.name.value] = v_u_8(v_u_5.filter(v33, isRequiredArgumentNode), function(p34)
				return p34.name.value
			end)
		end
		return {
			["Directive"] = {
				["leave"] = function(_, p35) -- name: leave
					-- upvalues: (copy) v_u_26, (ref) v_u_8, (ref) v_u_6, (ref) v_u_14, (ref) v_u_7, (ref) v_u_12, (copy) p_u_25, (ref) v_u_9
					local v36 = p35.name.value
					local v37 = v_u_26[v36]
					if v37 then
						local v39 = v_u_8(p35.arguments or {}, function(p38)
							return p38.name.value
						end)
						for _, v40 in ipairs(v_u_6.keys(v37)) do
							if v39[v40] then
								continue
							end
							local v41 = v37[v40].type
							local v42 = v_u_14(v41) and v_u_7(v41) or v_u_12(v41)
							p_u_25:reportError(v_u_9.new(("Directive \"@%s\" argument \"%s\" of type \"%s\" is required, but it was not provided."):format(v36, v40, v42), p35))
						end
					end
				end
			}
		}
	end
}
function isRequiredArgumentNode(p44) -- name: isRequiredArgumentNode
	-- upvalues: (copy) v_u_11
	local v45
	if p44.type.kind == v_u_11.NON_NULL_TYPE then
		v45 = p44.defaultValue == nil
	else
		v45 = false
	end
	return v45
end
return v_u_43