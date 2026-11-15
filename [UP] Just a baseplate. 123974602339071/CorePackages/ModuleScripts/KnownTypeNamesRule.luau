-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.KnownTypeNamesRule
local v1 = script.Parent.Parent.Parent
local v2 = v1.Parent
local v3 = v1.jsutils
local v4 = require(v2.LuauPolyfill)
local v_u_5 = v4.Array
local v_u_6 = v4.Map
local v_u_7 = v4.Object
local v_u_8 = require(v3.didYouMean).didYouMean
local v_u_9 = require(v3.suggestionList).suggestionList
local v_u_10 = require(v1.error.GraphQLError).GraphQLError
local v11 = v1.language
local v12 = require(v11.predicates)
local v_u_13 = v12.isTypeDefinitionNode
local v_u_14 = v12.isTypeSystemDefinitionNode
local v_u_15 = v12.isTypeSystemExtensionNode
local v16 = v1.type
local v17 = require(v16.scalars).specifiedScalarTypes
local v18 = require(v16.introspection).introspectionTypes
local v19 = {}
local v_u_20 = nil
local v_u_21 = nil
local v_u_22 = nil
function v19.KnownTypeNamesRule(p_u_23)
	-- upvalues: (copy) v_u_6, (copy) v_u_13, (copy) v_u_5, (copy) v_u_7, (ref) v_u_22, (ref) v_u_21, (copy) v_u_9, (ref) v_u_20, (copy) v_u_10, (copy) v_u_8
	local v24 = p_u_23:getSchema()
	local v_u_25 = v_u_6.new()
	if v24 then
		v_u_25 = v24:getTypeMap()
	end
	local v_u_26 = {}
	for _, v27 in ipairs(p_u_23:getDocument().definitions) do
		if not v_u_13(v27) then
			continue
		end
		v_u_26[v27.name.value] = true
	end
	local v_u_28 = v_u_5.concat(v_u_25:keys(), v_u_7.keys(v_u_26))
	return {
		["NamedType"] = function(_, p29, _, p30, _, p31) -- name: NamedType
			-- upvalues: (ref) v_u_25, (copy) v_u_26, (ref) v_u_22, (ref) v_u_21, (ref) v_u_9, (ref) v_u_5, (ref) v_u_20, (copy) v_u_28, (copy) p_u_23, (ref) v_u_10, (ref) v_u_8
			local v32 = p29.name.value
			if not (v_u_25:get(v32) or v_u_26[v32]) then
				local v33 = p31[3] or p30
				local v34
				if v33 == nil then
					v34 = false
				else
					v34 = v_u_22(v33)
				end
				if v34 and v_u_21(v32) then
					return
				end
				local v35 = v_u_9(v32, v34 and v_u_5.concat(v_u_20, v_u_28) or v_u_28)
				p_u_23:reportError(v_u_10.new(("Unknown type \"%s\"."):format(v32) .. v_u_8(v35), p29))
			end
		end
	}
end
v_u_20 = v_u_5.map(v_u_5.concat(v17, v18), function(p36)
	return p36.name
end)
v_u_21 = function(p37) -- name: isStandardTypeName
	-- upvalues: (copy) v_u_5, (ref) v_u_20
	return v_u_5.indexOf(v_u_20, p37) ~= -1
end
v_u_22 = function(p38) -- name: isSDLNode
	-- upvalues: (copy) v_u_5, (copy) v_u_14, (copy) v_u_15
	local v39 = not v_u_5.isArray(p38)
	if v39 then
		v39 = v_u_14(p38) or v_u_15(p38)
	end
	return v39
end
return v19