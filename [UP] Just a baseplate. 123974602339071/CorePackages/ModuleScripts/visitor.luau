-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.language.visitor
local v1 = script.Parent.Parent
local v2 = require(v1.Parent.LuauPolyfill)
local v_u_3 = v2.Array
local v4 = v2.Object
local v_u_5 = require(v1.jsutils.inspect).inspect
require(v1.language.ast)
local v_u_6 = require(script.Parent.ast).isNode
local v_u_7 = {
	["Name"] = {},
	["Document"] = { "definitions" },
	["OperationDefinition"] = {
		"name",
		"variableDefinitions",
		"directives",
		"selectionSet"
	},
	["VariableDefinition"] = {
		"variable",
		"type",
		"defaultValue",
		"directives"
	},
	["Variable"] = { "name" },
	["SelectionSet"] = { "selections" },
	["Field"] = {
		"alias",
		"name",
		"arguments",
		"directives",
		"selectionSet"
	},
	["Argument"] = { "name", "value" },
	["FragmentSpread"] = { "name", "directives" },
	["InlineFragment"] = { "typeCondition", "directives", "selectionSet" },
	["FragmentDefinition"] = {
		"name",
		"variableDefinitions",
		"typeCondition",
		"directives",
		"selectionSet"
	},
	["IntValue"] = {},
	["FloatValue"] = {},
	["StringValue"] = {},
	["BooleanValue"] = {},
	["NullValue"] = {},
	["EnumValue"] = {},
	["ListValue"] = { "values" },
	["ObjectValue"] = { "fields" },
	["ObjectField"] = { "name", "value" },
	["Directive"] = { "name", "arguments" },
	["NamedType"] = { "name" },
	["ListType"] = { "type" },
	["NonNullType"] = { "type" },
	["SchemaDefinition"] = { "description", "directives", "operationTypes" },
	["OperationTypeDefinition"] = { "type" },
	["ScalarTypeDefinition"] = { "description", "name", "directives" },
	["ObjectTypeDefinition"] = {
		"description",
		"name",
		"interfaces",
		"directives",
		"fields"
	},
	["FieldDefinition"] = {
		"description",
		"name",
		"arguments",
		"type",
		"directives"
	},
	["InputValueDefinition"] = {
		"description",
		"name",
		"type",
		"defaultValue",
		"directives"
	},
	["InterfaceTypeDefinition"] = {
		"description",
		"name",
		"interfaces",
		"directives",
		"fields"
	},
	["UnionTypeDefinition"] = {
		"description",
		"name",
		"directives",
		"types"
	},
	["EnumTypeDefinition"] = {
		"description",
		"name",
		"directives",
		"values"
	},
	["EnumValueDefinition"] = { "description", "name", "directives" },
	["InputObjectTypeDefinition"] = {
		"description",
		"name",
		"directives",
		"fields"
	},
	["DirectiveDefinition"] = {
		"description",
		"name",
		"arguments",
		"locations"
	},
	["SchemaExtension"] = { "directives", "operationTypes" },
	["ScalarTypeExtension"] = { "name", "directives" },
	["ObjectTypeExtension"] = {
		"name",
		"interfaces",
		"directives",
		"fields"
	},
	["InterfaceTypeExtension"] = {
		"name",
		"interfaces",
		"directives",
		"fields"
	},
	["UnionTypeExtension"] = { "name", "directives", "types" },
	["EnumTypeExtension"] = { "name", "directives", "values" },
	["InputObjectTypeExtension"] = { "name", "directives", "fields" }
}
local v_u_8 = v4.freeze({})
local v_u_9 = require(v1.luaUtils.null)
local v_u_10 = nil
local function v36(p11, p12, p13) -- name: visit
	-- upvalues: (copy) v_u_7, (copy) v_u_3, (copy) v_u_9, (copy) v_u_6, (copy) v_u_5, (ref) v_u_10, (copy) v_u_8
	local v14 = p13 or v_u_7
	local v15 = v_u_3.isArray(p11)
	local v16 = 0
	local v17 = { p11 }
	local v18 = {}
	local v19 = nil
	local v20 = nil
	local v21 = {}
	local v22 = {}
	while true do
		local v23, v24, v25, v26
		while true do
			if false then
				if #v21 ~= 0 then
					p11 = v21[#v21][2]
				end
				return p11
			end
			if true then
				v16 = v16 + 1
				local v27 = v16 == #v17 + 1
				local v28
				if v27 then
					v28 = #v21 ~= 0
				else
					v28 = v27
				end
			end
			if v27 then
				break
			end
			if v19 then
				if v15 then
					v23 = v16
				else
					v23 = v17[v16]
				end
			else
				v23 = nil
			end
			if v19 then
				v24 = v19[v23]
			else
				v24 = p11
			end
			if v24 == nil or v24 == v_u_9 then
				v29 = v19
				if v20 == nil then
					break
				end
				v19 = v29
			else
				if v19 then
					table.insert(v18, v23)
					v29 = v19
				else
					v29 = v19
				end
				v35 = nil
				if v_u_3.isArray(v24) then
					v25 = v24
					if v35 == nil and v28 then
						table.insert(v21, { v23, v25 })
					end
					if v27 then
						table.remove(v18)
					else
						v20 = {
							["inArray"] = v15,
							["index"] = v16,
							["keys"] = v17,
							["edits"] = v21,
							["prev"] = v20
						}
						v15 = v_u_3.isArray(v25)
						v17 = not v15 and (v14[v25.kind] or {}) or v25
						v16 = 0
						v21 = {}
						if v29 then
							table.insert(v22, v29)
							v29 = v25
						else
							v29 = v25
						end
					end
					if v20 == nil then
						break
					end
					v19 = v29
				else
					if not v_u_6(v24) then
						error("Invalid AST Node: " .. v_u_5(v24) .. ".")
					end
					v26 = v_u_10(p12, v24.kind, v27)
					if v26 then
						v25 = v26(p12, v24, v23, v29, v18, v22)
						if v25 == v_u_8 then
							break
						end
						if v25 == false then
							if v27 then
								v35 = v25
								v25 = v24
								if v35 == nil and v28 then
									table.insert(v21, { v23, v25 })
								end
								if v27 then
									table.remove(v18)
								else
									v20 = {
										["inArray"] = v15,
										["index"] = v16,
										["keys"] = v17,
										["edits"] = v21,
										["prev"] = v20
									}
									v15 = v_u_3.isArray(v25)
									v17 = not v15 and (v14[v25.kind] or {}) or v25
									v16 = 0
									v21 = {}
									if v29 then
										table.insert(v22, v29)
										v29 = v25
									else
										v29 = v25
									end
								end
								if v20 == nil then
									break
								end
								v19 = v29
							else
								table.remove(v18)
								if v20 == nil then
									break
								end
								v19 = v29
							end
						elseif v25 == nil and v25 ~= v_u_9 then
							v35 = v25
							v25 = v24
							if v35 == nil and v28 then
								table.insert(v21, { v23, v25 })
							end
							if v27 then
								table.remove(v18)
							else
								v20 = {
									["inArray"] = v15,
									["index"] = v16,
									["keys"] = v17,
									["edits"] = v21,
									["prev"] = v20
								}
								v15 = v_u_3.isArray(v25)
								v17 = not v15 and (v14[v25.kind] or {}) or v25
								v16 = 0
								v21 = {}
								if v29 then
									table.insert(v22, v29)
									v29 = v25
								else
									v29 = v25
								end
							end
							if v20 == nil then
								break
							end
							v19 = v29
						else
							if v25 == v_u_9 then
								v25 = nil
							end
							table.insert(v21, { v23, v25 })
							if v27 then
								v35 = v25
								v25 = v24
								if v35 == nil and v28 then
									table.insert(v21, { v23, v25 })
								end
								if v27 then
									table.remove(v18)
								else
									v20 = {
										["inArray"] = v15,
										["index"] = v16,
										["keys"] = v17,
										["edits"] = v21,
										["prev"] = v20
									}
									v15 = v_u_3.isArray(v25)
									v17 = not v15 and (v14[v25.kind] or {}) or v25
									v16 = 0
									v21 = {}
									if v29 then
										table.insert(v22, v29)
										v29 = v25
									else
										v29 = v25
									end
								end
								if v20 == nil then
									break
								end
								v19 = v29
							elseif v_u_6(v25) then
								v35 = v25
								if v35 == nil and v28 then
									table.insert(v21, { v23, v25 })
								end
								if v27 then
									table.remove(v18)
								else
									v20 = {
										["inArray"] = v15,
										["index"] = v16,
										["keys"] = v17,
										["edits"] = v21,
										["prev"] = v20
									}
									v15 = v_u_3.isArray(v25)
									v17 = not v15 and (v14[v25.kind] or {}) or v25
									v16 = 0
									v21 = {}
									if v29 then
										table.insert(v22, v29)
										v29 = v25
									else
										v29 = v25
									end
								end
								if v20 == nil then
									break
								end
								v19 = v29
							else
								table.remove(v18)
								if v20 == nil then
									break
								end
								v19 = v29
							end
						end
					else
						v25 = v24
						if v35 == nil and v28 then
							table.insert(v21, { v23, v25 })
						end
						if v27 then
							table.remove(v18)
						else
							v20 = {
								["inArray"] = v15,
								["index"] = v16,
								["keys"] = v17,
								["edits"] = v21,
								["prev"] = v20
							}
							v15 = v_u_3.isArray(v25)
							v17 = not v15 and (v14[v25.kind] or {}) or v25
							v16 = 0
							v21 = {}
							if v29 then
								table.insert(v22, v29)
								v29 = v25
							else
								v29 = v25
							end
						end
						if v20 == nil then
							break
						end
						v19 = v29
					end
				end
			end
		end
		if #v22 == 0 then
			v23 = nil
		else
			v23 = v18[#v18]
		end
		local v29 = table.remove(v22)
		if v28 then
			if v15 then
				v24 = v_u_3.slice(v19)
			else
				v24 = {}
				for v30 in pairs(v19) do
					v24[v30] = v19[v30]
				end
			end
			local v31 = 0
			for v32 = 1, #v21 do
				local v33 = v21[v32][1]
				local v34 = v21[v32][2]
				if v15 then
					v33 = v33 - v31
				end
				if v15 and v34 == nil then
					v_u_3.splice(v24, v33, 1)
					v31 = v31 + 1
				else
					v24[v33] = v34
				end
			end
		else
			v24 = v19
		end
		v16 = v20.index
		v17 = v20.keys
		v21 = v20.edits
		v15 = v20.inArray
		v20 = v20.prev
		local v35 = nil
		if v_u_3.isArray(v24) then
			v25 = v24
			if v35 == nil and v28 then
				table.insert(v21, { v23, v25 })
			end
			if v27 then
				table.remove(v18)
			else
				v20 = {
					["inArray"] = v15,
					["index"] = v16,
					["keys"] = v17,
					["edits"] = v21,
					["prev"] = v20
				}
				v15 = v_u_3.isArray(v25)
				v17 = not v15 and (v14[v25.kind] or {}) or v25
				v16 = 0
				v21 = {}
				if v29 then
					table.insert(v22, v29)
					v29 = v25
				else
					v29 = v25
				end
			end
			if v20 == nil then
				break
			end
			v19 = v29
		else
			if not v_u_6(v24) then
				error("Invalid AST Node: " .. v_u_5(v24) .. ".")
			end
			v26 = v_u_10(p12, v24.kind, v27)
			if v26 then
				v25 = v26(p12, v24, v23, v29, v18, v22)
				if v25 == v_u_8 then
					break
				end
				if v25 == false then
					if v27 then
						v35 = v25
						v25 = v24
						if v35 == nil and v28 then
							table.insert(v21, { v23, v25 })
						end
						if v27 then
							table.remove(v18)
						else
							v20 = {
								["inArray"] = v15,
								["index"] = v16,
								["keys"] = v17,
								["edits"] = v21,
								["prev"] = v20
							}
							v15 = v_u_3.isArray(v25)
							v17 = not v15 and (v14[v25.kind] or {}) or v25
							v16 = 0
							v21 = {}
							if v29 then
								table.insert(v22, v29)
								v29 = v25
							else
								v29 = v25
							end
						end
						if v20 == nil then
							break
						end
						v19 = v29
					else
						table.remove(v18)
						if v20 == nil then
							break
						end
						v19 = v29
					end
				elseif v25 == nil and v25 ~= v_u_9 then
					v35 = v25
					v25 = v24
					if v35 == nil and v28 then
						table.insert(v21, { v23, v25 })
					end
					if v27 then
						table.remove(v18)
					else
						v20 = {
							["inArray"] = v15,
							["index"] = v16,
							["keys"] = v17,
							["edits"] = v21,
							["prev"] = v20
						}
						v15 = v_u_3.isArray(v25)
						v17 = not v15 and (v14[v25.kind] or {}) or v25
						v16 = 0
						v21 = {}
						if v29 then
							table.insert(v22, v29)
							v29 = v25
						else
							v29 = v25
						end
					end
					if v20 == nil then
						break
					end
					v19 = v29
				else
					if v25 == v_u_9 then
						v25 = nil
					end
					table.insert(v21, { v23, v25 })
					if v27 then
						v35 = v25
						v25 = v24
						if v35 == nil and v28 then
							table.insert(v21, { v23, v25 })
						end
						if v27 then
							table.remove(v18)
						else
							v20 = {
								["inArray"] = v15,
								["index"] = v16,
								["keys"] = v17,
								["edits"] = v21,
								["prev"] = v20
							}
							v15 = v_u_3.isArray(v25)
							v17 = not v15 and (v14[v25.kind] or {}) or v25
							v16 = 0
							v21 = {}
							if v29 then
								table.insert(v22, v29)
								v29 = v25
							else
								v29 = v25
							end
						end
						if v20 == nil then
							break
						end
						v19 = v29
					elseif v_u_6(v25) then
						v35 = v25
						if v35 == nil and v28 then
							table.insert(v21, { v23, v25 })
						end
						if v27 then
							table.remove(v18)
						else
							v20 = {
								["inArray"] = v15,
								["index"] = v16,
								["keys"] = v17,
								["edits"] = v21,
								["prev"] = v20
							}
							v15 = v_u_3.isArray(v25)
							v17 = not v15 and (v14[v25.kind] or {}) or v25
							v16 = 0
							v21 = {}
							if v29 then
								table.insert(v22, v29)
								v29 = v25
							else
								v29 = v25
							end
						end
						if v20 == nil then
							break
						end
						v19 = v29
					else
						table.remove(v18)
						if v20 == nil then
							break
						end
						v19 = v29
					end
				end
			else
				v25 = v24
				if v35 == nil and v28 then
					table.insert(v21, { v23, v25 })
				end
				if v27 then
					table.remove(v18)
				else
					v20 = {
						["inArray"] = v15,
						["index"] = v16,
						["keys"] = v17,
						["edits"] = v21,
						["prev"] = v20
					}
					v15 = v_u_3.isArray(v25)
					v17 = not v15 and (v14[v25.kind] or {}) or v25
					v16 = 0
					v21 = {}
					if v29 then
						table.insert(v22, v29)
						v29 = v25
					else
						v29 = v25
					end
				end
				if v20 == nil then
					break
				end
				v19 = v29
			end
		end
	end
end
local function v47(p_u_37) -- name: visitInParallel
	-- upvalues: (ref) v_u_10, (copy) v_u_8
	local v_u_38 = {}
	return {
		["enter"] = function(_, p39, ...) -- name: enter
			-- upvalues: (copy) p_u_37, (copy) v_u_38, (ref) v_u_10, (ref) v_u_8
			for v40 = 1, #p_u_37 do
				if v_u_38[v40] ~= nil then
					continue
				end
				local v41 = v_u_10(p_u_37[v40], p39.kind, false)
				if not v41 then
					continue
				end
				local v42 = v41(p_u_37[v40], p39, ...)
				if v42 == false then
					v_u_38[v40] = p39
				else
					if v42 ~= v_u_8 then
						if v42 == nil then
							continue
						end
						return v42
					end
					v_u_38[v40] = v_u_8
				end
			end
		end,
		["leave"] = function(_, ...) -- name: leave
			-- upvalues: (copy) p_u_37, (copy) v_u_38, (ref) v_u_10, (ref) v_u_8
			local v43 = ...
			for v44 = 1, #p_u_37 do
				if v_u_38[v44] == nil then
					local v45 = v_u_10(p_u_37[v44], v43.kind, true)
					if not v45 then
						continue
					end
					local v46 = v45(p_u_37[v44], ...)
					if v46 ~= v_u_8 then
						if v46 == nil or v46 == false then
							continue
						end
						return v46
					end
					v_u_38[v44] = v_u_8
				else
					if v_u_38[v44] ~= v43 then
						continue
					end
					v_u_38[v44] = nil
				end
			end
		end
	}
end
v_u_10 = function(p48, p49, p50) -- name: getVisitFn
	local v51 = p48[p49]
	if v51 then
		if not p50 and type(v51) == "function" then
			return v51
		end
		local v52
		if typeof(v51) == "function" then
			v52 = nil
		elseif p50 then
			v52 = v51.leave
		else
			v52 = v51.enter
		end
		if type(v52) == "function" then
			return v52
		end
	else
		local v53
		if p50 then
			v53 = p48.leave
		else
			v53 = p48.enter
		end
		if v53 then
			if type(v53) == "function" then
				return v53
			end
			local v54 = v53[p49]
			if type(v54) == "function" then
				return v54
			end
		end
	end
end
return {
	["BREAK"] = v_u_8,
	["REMOVE"] = v_u_9,
	["visit"] = v36,
	["visitInParallel"] = v47,
	["getVisitFn"] = v_u_10,
	["QueryDocumentKeys"] = v_u_7
}