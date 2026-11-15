-- Path: CorePackages.Packages._Index.Merge.Merge.typedefs-mergers.merge-nodes
local v1 = script.Parent.Parent.Parent
local v2 = require(v1.LuauPolyfill)
local v_u_3 = v2.Array
local v_u_4 = v2.Boolean
local v_u_5 = v2.Object
local v_u_6 = v2.Map
local v7 = {}
require(script.Parent["merge-typedefs_types"])
local v_u_8 = require(v1.GraphQL).Kind
local v_u_9 = require(script.Parent.type).mergeType
local v_u_10 = require(script.Parent.enum).mergeEnum
local v_u_11 = require(script.Parent.scalar).mergeScalar
local v_u_12 = require(script.Parent.union).mergeUnion
local v_u_13 = require(script.Parent["input-type"]).mergeInputType
local v_u_14 = require(script.Parent.interface).mergeInterface
local v_u_15 = require(script.Parent.directives).mergeDirective
local v_u_16 = require(script.Parent["schema-def"]).mergeSchemaDefs
local v_u_17 = require(v1.Utils).collectComment
v7.schemaDefSymbol = "SCHEMA_DEF_SYMBOL"
function v7.isNamedDefinitionNode(p18) -- name: isNamedDefinitionNode
	-- upvalues: (copy) v_u_3, (copy) v_u_5
	return v_u_3.indexOf(v_u_5.keys(p18), "name") ~= -1
end
function v7.mergeGraphQLNodes(p19, p20) -- name: mergeGraphQLNodes
	-- upvalues: (copy) v_u_6, (copy) v_u_4, (copy) v_u_3, (copy) v_u_5, (copy) v_u_17, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_12, (copy) v_u_11, (copy) v_u_13, (copy) v_u_14, (copy) v_u_15, (copy) v_u_16
	local v21 = v_u_6.new()
	for _, v22 in p19 do
		if v_u_4.toJSBoolean(v_u_3.indexOf(v_u_5.keys(v22), "name") ~= -1) then
			local v23 = v22.name
			local v24
			if typeof(v23) == "table" then
				v24 = v22.name.value
			else
				v24 = nil
			end
			if p20 and v_u_4.toJSBoolean(p20.commentDescriptions) then
				v_u_17(v22)
			end
			if v24 == nil then
				continue
			end
			local v25
			if p20 then
				local v26 = p20.exclusions
				if typeof(v26) == "table" and v_u_3.includes(p20.exclusions, v24 .. ".*") then
					v21:delete(v24)
				elseif p20 then
					::l19::
					local v27 = p20.exclusions
					if typeof(v27) == "table" and v_u_3.includes(p20.exclusions, v24) then
						v21:delete(v24)
					else
						v25 = v22.kind
						if v25 == v_u_8.OBJECT_TYPE_DEFINITION or v25 == v_u_8.OBJECT_TYPE_EXTENSION then
							v21:set(v24, v_u_9(v22, v21:get(v24), p20))
						elseif v25 == v_u_8.ENUM_TYPE_DEFINITION or v25 == v_u_8.ENUM_TYPE_EXTENSION then
							v21:set(v24, v_u_10(v22, v21:get(v24), p20))
						elseif v25 == v_u_8.UNION_TYPE_DEFINITION or v25 == v_u_8.UNION_TYPE_EXTENSION then
							v21:set(v24, v_u_12(v22, v21:get(v24), p20))
						elseif v25 == v_u_8.SCALAR_TYPE_DEFINITION or v25 == v_u_8.SCALAR_TYPE_EXTENSION then
							v21:set(v24, v_u_11(v22, v21:get(v24), p20))
						elseif v25 == v_u_8.INPUT_OBJECT_TYPE_DEFINITION or v25 == v_u_8.INPUT_OBJECT_TYPE_EXTENSION then
							v21:set(v24, v_u_13(v22, v21:get(v24), p20))
						elseif v25 == v_u_8.INTERFACE_TYPE_DEFINITION or v25 == v_u_8.INTERFACE_TYPE_EXTENSION then
							v21:set(v24, v_u_14(v22, v21:get(v24), p20))
						else
							if v25 ~= v_u_8.DIRECTIVE_DEFINITION then
								continue
							end
							v21:set(v24, v_u_15(v22, (v21:get(v24))))
						end
					end
				else
					v25 = v22.kind
					if v25 == v_u_8.OBJECT_TYPE_DEFINITION or v25 == v_u_8.OBJECT_TYPE_EXTENSION then
						v21:set(v24, v_u_9(v22, v21:get(v24), p20))
					elseif v25 == v_u_8.ENUM_TYPE_DEFINITION or v25 == v_u_8.ENUM_TYPE_EXTENSION then
						v21:set(v24, v_u_10(v22, v21:get(v24), p20))
					elseif v25 == v_u_8.UNION_TYPE_DEFINITION or v25 == v_u_8.UNION_TYPE_EXTENSION then
						v21:set(v24, v_u_12(v22, v21:get(v24), p20))
					elseif v25 == v_u_8.SCALAR_TYPE_DEFINITION or v25 == v_u_8.SCALAR_TYPE_EXTENSION then
						v21:set(v24, v_u_11(v22, v21:get(v24), p20))
					elseif v25 == v_u_8.INPUT_OBJECT_TYPE_DEFINITION or v25 == v_u_8.INPUT_OBJECT_TYPE_EXTENSION then
						v21:set(v24, v_u_13(v22, v21:get(v24), p20))
					elseif v25 == v_u_8.INTERFACE_TYPE_DEFINITION or v25 == v_u_8.INTERFACE_TYPE_EXTENSION then
						v21:set(v24, v_u_14(v22, v21:get(v24), p20))
					else
						if v25 ~= v_u_8.DIRECTIVE_DEFINITION then
							continue
						end
						v21:set(v24, v_u_15(v22, (v21:get(v24))))
					end
				end
			else
				if p20 then
					goto l19
				end
				v25 = v22.kind
				if v25 == v_u_8.OBJECT_TYPE_DEFINITION or v25 == v_u_8.OBJECT_TYPE_EXTENSION then
					v21:set(v24, v_u_9(v22, v21:get(v24), p20))
				elseif v25 == v_u_8.ENUM_TYPE_DEFINITION or v25 == v_u_8.ENUM_TYPE_EXTENSION then
					v21:set(v24, v_u_10(v22, v21:get(v24), p20))
				elseif v25 == v_u_8.UNION_TYPE_DEFINITION or v25 == v_u_8.UNION_TYPE_EXTENSION then
					v21:set(v24, v_u_12(v22, v21:get(v24), p20))
				elseif v25 == v_u_8.SCALAR_TYPE_DEFINITION or v25 == v_u_8.SCALAR_TYPE_EXTENSION then
					v21:set(v24, v_u_11(v22, v21:get(v24), p20))
				elseif v25 == v_u_8.INPUT_OBJECT_TYPE_DEFINITION or v25 == v_u_8.INPUT_OBJECT_TYPE_EXTENSION then
					v21:set(v24, v_u_13(v22, v21:get(v24), p20))
				elseif v25 == v_u_8.INTERFACE_TYPE_DEFINITION or v25 == v_u_8.INTERFACE_TYPE_EXTENSION then
					v21:set(v24, v_u_14(v22, v21:get(v24), p20))
				else
					if v25 ~= v_u_8.DIRECTIVE_DEFINITION then
						continue
					end
					v21:set(v24, v_u_15(v22, (v21:get(v24))))
				end
			end
		else
			if v22.kind ~= v_u_8.SCHEMA_DEFINITION and v22.kind ~= v_u_8.SCHEMA_EXTENSION then
				continue
			end
			v21:set("SCHEMA_DEF_SYMBOL", v_u_16(v22, v21:get("SCHEMA_DEF_SYMBOL"), p20))
		end
	end
	return v21
end
return v7