-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.utilities.graphql.transform
local v1 = script.Parent.Parent.Parent
local v2 = v1.Parent
local v3 = require(v2.LuauPolyfill)
local v_u_4 = v3.Array
local v_u_5 = v3.Object
local v_u_6 = v3.Boolean
local v_u_7 = v3.String
local v8 = {}
local v9 = require(v2.GraphQL)
local v_u_10 = v9.visit
local v_u_11 = v9.REMOVE
local v_u_12 = require(v1.jsutils.invariant).invariant
local v13 = require(script.Parent.getFromAST)
local v_u_14 = v13.checkDocument
local v_u_15 = v13.getOperationDefinition
local v_u_16 = v13.getFragmentDefinition
local v_u_17 = v13.getFragmentDefinitions
local v_u_18 = v13.getMainDefinition
local v_u_19 = require(script.Parent.Parent.common.filterInPlace).filterInPlace
local v20 = require(script.Parent.storeUtils)
local v_u_21 = v20.isField
local v_u_22 = v20.isInlineFragment
local v_u_23 = nil
local v_u_24 = nil
local v_u_25 = nil
local v_u_26 = nil
local v_u_27 = {
	["kind"] = "Field",
	["name"] = nil,
	["name"] = {
		["kind"] = "Name",
		["value"] = "__typename"
	}
}
local function v_u_32(p28, p_u_29) -- name: isEmpty
	-- upvalues: (copy) v_u_4, (copy) v_u_32
	return v_u_4.every(p28.selectionSet.selections, function(p30)
		-- upvalues: (ref) v_u_32, (copy) p_u_29
		local v31
		if p30.kind == "FragmentSpread" then
			v31 = v_u_32(p_u_29[p30.name.value], p_u_29)
		else
			v31 = false
		end
		return v31
	end, nil)
end
local function v_u_70(p_u_33, p34) -- name: removeDirectivesFromDocument
	-- upvalues: (copy) v_u_10, (copy) v_u_6, (copy) v_u_4, (ref) v_u_26, (copy) v_u_11, (copy) v_u_15, (copy) v_u_16, (copy) v_u_17, (copy) v_u_32, (copy) v_u_19, (ref) v_u_24, (ref) v_u_25
	local v_u_35 = {}
	local v_u_36 = {}
	local v_u_37 = {}
	local v_u_38 = {}
	local v59 = v_u_10(p34, {
		["Variable"] = {
			["enter"] = function(_, p39, _, p40) -- name: enter
				-- upvalues: (copy) v_u_35
				if p40.kind ~= "VariableDefinition" then
					v_u_35[p39.name.value] = true
				end
				return nil
			end
		},
		["Field"] = {
			["enter"] = function(_, p41) -- name: enter
				-- upvalues: (ref) v_u_6, (copy) p_u_33, (ref) v_u_4, (copy) v_u_36, (ref) v_u_26, (copy) v_u_38, (ref) v_u_11
				if v_u_6.toJSBoolean(p_u_33) and (v_u_6.toJSBoolean(p41.directives) and (v_u_4.some(p_u_33, function(p42)
					return p42.remove
				end) and p41.directives)) then
					local v_u_43 = p_u_33
					if v_u_4.some(p41.directives, function(p_u_44)
						-- upvalues: (ref) v_u_4, (copy) v_u_43, (ref) v_u_6
						return v_u_4.some(v_u_43, function(p45)
							-- upvalues: (ref) v_u_6, (copy) p_u_44
							local v46 = ((not v_u_6.toJSBoolean(p45.name) or p45.name ~= p_u_44.name.value) and true or false) and v_u_6.toJSBoolean(p45.test)
							if v46 then
								v46 = p45:test(p_u_44)
							end
							return v46
						end)
					end) then
						if p41.arguments then
							v_u_4.forEach(p41.arguments, function(p47)
								-- upvalues: (ref) v_u_36
								if p47.value.kind == "Variable" then
									local v48 = v_u_36
									local v49 = {
										["name"] = p47.value.name.value
									}
									table.insert(v48, v49)
								end
							end)
						end
						if p41.selectionSet then
							v_u_4.forEach(v_u_26(p41.selectionSet), function(p50)
								-- upvalues: (ref) v_u_38
								local v51 = v_u_38
								local v52 = {
									["name"] = p50.name.value
								}
								table.insert(v51, v52)
							end)
						end
						return v_u_11
					end
				end
				return nil
			end
		},
		["FragmentSpread"] = {
			["enter"] = function(_, p53) -- name: enter
				-- upvalues: (copy) v_u_37
				v_u_37[p53.name.value] = true
			end
		},
		["Directive"] = {
			["enter"] = function(_, p54) -- name: enter
				-- upvalues: (ref) v_u_6, (copy) p_u_33, (ref) v_u_4, (ref) v_u_11
				local v_u_55 = p_u_33
				if v_u_6.toJSBoolean((function(p_u_56)
					-- upvalues: (ref) v_u_4, (copy) v_u_55, (ref) v_u_6
					return v_u_4.some(v_u_55, function(p57)
						-- upvalues: (ref) v_u_6, (copy) p_u_56
						local v58 = ((not v_u_6.toJSBoolean(p57.name) or p57.name ~= p_u_56.name.value) and true or false) and v_u_6.toJSBoolean(p57.test)
						if v58 then
							v58 = p57:test(p_u_56)
						end
						return v58
					end)
				end)(p54)) then
					return v_u_11
				else
					return nil
				end
			end
		}
	})
	local v60 = v_u_15(v59) or v_u_16(v59)
	local v61 = v_u_17(v59)
	local v_u_62 = {}
	v_u_4.forEach(v61, function(p63)
		-- upvalues: (copy) v_u_62
		v_u_62[p63.name.value] = p63
	end)
	if v_u_4.every(v60.selectionSet.selections, function(p64)
		-- upvalues: (ref) v_u_32, (copy) v_u_62
		local v65
		if p64.kind == "FragmentSpread" then
			v65 = v_u_32(v_u_62[p64.name.value], v_u_62)
		else
			v65 = false
		end
		return v65
	end, nil) then
		v59 = nil
	end
	if v_u_6.toJSBoolean(v59) and v_u_6.toJSBoolean(#v_u_19(v_u_36, function(p66)
		-- upvalues: (ref) v_u_6, (copy) v_u_35
		local v67 = v_u_6.toJSBoolean(p66.name) and true or false
		if v67 then
			v67 = not v_u_35[p66.name]
		end
		return v67
	end)) then
		v59 = v_u_24(v_u_36, v59)
	end
	if v_u_6.toJSBoolean(v59) and v_u_6.toJSBoolean(#v_u_19(v_u_38, function(p68)
		-- upvalues: (ref) v_u_6, (copy) v_u_37
		local v69 = v_u_6.toJSBoolean(p68.name) and true or false
		if v69 then
			v69 = not v_u_37[p68.name]
		end
		return v69
	end)) then
		v59 = v_u_25(v_u_38, v59)
	end
	return v59
end
v8.removeDirectivesFromDocument = v_u_70
v8.addTypenameToDocument = v_u_5.assign(setmetatable({}, {
	["__call"] = function(_, p71) -- name: __call
		-- upvalues: (copy) v_u_10, (copy) v_u_14, (copy) v_u_6, (copy) v_u_4, (copy) v_u_21, (copy) v_u_7, (copy) v_u_5, (copy) v_u_27
		local v81 = {
			["SelectionSet"] = {
				["enter"] = function(_, p72, _, p73) -- name: enter
					-- upvalues: (ref) v_u_6, (ref) v_u_4, (ref) v_u_21, (ref) v_u_7, (ref) v_u_5, (ref) v_u_27
					if v_u_6.toJSBoolean(p73) and p73.kind == "OperationDefinition" then
						return
					else
						local v74 = p72.selections
						if v_u_6.toJSBoolean(v74) then
							if not v_u_4.some(v74, function(p75)
								-- upvalues: (ref) v_u_21, (ref) v_u_7
								local v76 = v_u_21(p75)
								if v76 then
									v76 = p75.name.value == "__typename" and true or v_u_7.lastIndexOf(p75.name.value, "__", 1) == 1
								end
								return v76
							end) then
								if not (v_u_21(p73) and (v_u_6.toJSBoolean(p73.directives) and v_u_6.toJSBoolean(v_u_4.some(p73.directives, function(p77)
									return p77.name.value == "export"
								end)))) then
									local v78 = v_u_5.assign
									local v79 = {}
									local v80 = { v_u_27 }
									v79.selections = v_u_4.concat({}, v74, v80)
									return v78({}, p72, v79)
								end
							end
						else
							return
						end
					end
				end
			}
		}
		return v_u_10(v_u_14(p71), v81)
	end
}), {
	["added"] = function(_, p82) -- name: added
		-- upvalues: (copy) v_u_27
		return p82 == v_u_27
	end
})
local v_u_86 = {
	["test"] = function(_, p83) -- name: test
		-- upvalues: (copy) v_u_6, (copy) v_u_4, (copy) v_u_12
		local v84 = p83.name.value == "connection"
		if v84 and (not v_u_6.toJSBoolean(p83.arguments) or v_u_4.some(p83.arguments, function(p85)
			return p85.name.value == "key"
		end)) then
			v_u_12.warn("Removing an @connection directive even though it does not have a key. You may want to use the key parameter to specify a store key.")
		end
		return v84
	end
}
function v8.removeConnectionDirectiveFromDocument(p87) -- name: removeConnectionDirectiveFromDocument
	-- upvalues: (copy) v_u_70, (copy) v_u_86, (copy) v_u_14
	return v_u_70({ v_u_86 }, v_u_14(p87))
end
v_u_23 = function(p_u_88, p89, p90) -- name: hasDirectivesInSelection
	-- upvalues: (copy) v_u_21, (copy) v_u_4, (copy) v_u_6, (ref) v_u_23
	local v91 = p90 == nil and true or p90
	if not v_u_21(p89) then
		return true
	end
	if not p89.directives then
		return false
	end
	local v95 = v_u_4.some(p89.directives, function(p_u_92)
		-- upvalues: (ref) v_u_4, (copy) p_u_88, (ref) v_u_6
		return v_u_4.some(p_u_88, function(p93)
			-- upvalues: (ref) v_u_6, (copy) p_u_92
			local v94 = ((not v_u_6.toJSBoolean(p93.name) or p93.name ~= p_u_92.name.value) and true or false) and v_u_6.toJSBoolean(p93.test)
			if v94 then
				v94 = p93:test(p_u_92)
			end
			return v94
		end)
	end)
	if not v95 then
		if v91 then
			local v96 = p89.selectionSet
			local v97 = v91
			local v_u_98 = v97 == nil and true or v97
			v95 = v96 and (v96.selections and v_u_4.some(v96.selections, function(p99)
				-- upvalues: (ref) v_u_23, (copy) p_u_88, (ref) v_u_98
				return v_u_23(p_u_88, p99, v_u_98)
			end)) or false or false
		else
			v95 = false
		end
	end
	return v95
end
v_u_24 = function(p_u_100, p101) -- name: removeArgumentsFromDocument
	-- upvalues: (copy) v_u_4, (copy) v_u_10, (copy) v_u_5, (copy) v_u_11, (copy) v_u_6, (copy) v_u_15, (copy) v_u_16, (copy) v_u_17, (copy) v_u_32
	local function v_u_104(p_u_102)
		-- upvalues: (ref) v_u_4, (copy) p_u_100
		return v_u_4.some(p_u_100, function(p103)
			-- upvalues: (copy) p_u_102
			return p_u_102.value and (p_u_102.value.kind == "Variable" and (p_u_102.value.name and (p103.name == p_u_102.value.name.value or p103.test and p103.test(p103, p_u_102)))) or false
		end)
	end
	local v113 = v_u_10(p101, {
		["OperationDefinition"] = {
			["enter"] = function(_, p105) -- name: enter
				-- upvalues: (ref) v_u_5, (ref) v_u_4, (copy) p_u_100
				return v_u_5.assign({}, p105, {
					["variableDefinitions"] = p105.variableDefinitions and v_u_4.filter(p105.variableDefinitions, function(p_u_106)
						-- upvalues: (ref) v_u_4, (ref) p_u_100
						return not v_u_4.some(p_u_100, function(p107)
							-- upvalues: (copy) p_u_106
							return p107.name == p_u_106.variable.name.value
						end)
					end) or {}
				})
			end
		},
		["Field"] = {
			["enter"] = function(_, p108) -- name: enter
				-- upvalues: (ref) v_u_4, (copy) p_u_100, (copy) v_u_104, (ref) v_u_11
				if v_u_4.some(p_u_100, function(p109)
					return p109.remove
				end) then
					local v_u_110 = 0
					if p108.arguments then
						v_u_4.forEach(p108.arguments, function(p111)
							-- upvalues: (ref) v_u_104, (ref) v_u_110
							if v_u_104(p111) then
								v_u_110 = v_u_110 + 1
							end
						end)
					end
					if v_u_110 == 1 then
						return v_u_11
					end
				end
				return nil
			end
		},
		["Argument"] = {
			["enter"] = function(_, p112) -- name: enter
				-- upvalues: (ref) v_u_6, (copy) v_u_104, (ref) v_u_11
				if v_u_6.toJSBoolean(v_u_104(p112)) then
					return v_u_11
				else
					return nil
				end
			end
		}
	})
	local v114 = v_u_15(v113) or v_u_16(v113)
	local v115 = v_u_17(v113)
	local v_u_116 = {}
	v_u_4.forEach(v115, function(p117)
		-- upvalues: (copy) v_u_116
		v_u_116[p117.name.value] = p117
	end)
	if v_u_4.every(v114.selectionSet.selections, function(p118)
		-- upvalues: (ref) v_u_32, (copy) v_u_116
		local v119
		if p118.kind == "FragmentSpread" then
			v119 = v_u_32(v_u_116[p118.name.value], v_u_116)
		else
			v119 = false
		end
		return v119
	end, nil) then
		return nil
	else
		return v113
	end
end
v8.removeArgumentsFromDocument = v_u_24
v_u_25 = function(p_u_120, p121) -- name: removeFragmentSpreadFromDocument
	-- upvalues: (copy) v_u_4, (copy) v_u_11, (copy) v_u_10, (copy) v_u_15, (copy) v_u_16, (copy) v_u_17, (copy) v_u_32
	local function v124(_, p_u_122) -- name: enter
		-- upvalues: (ref) v_u_4, (copy) p_u_120, (ref) v_u_11
		if v_u_4.some(p_u_120, function(p123)
			-- upvalues: (copy) p_u_122
			return p123.name == p_u_122.name.value
		end) then
			return v_u_11
		else
			return nil
		end
	end
	local v125 = v_u_10(p121, {
		["FragmentSpread"] = {
			["enter"] = v124
		},
		["FragmentDefinition"] = {
			["enter"] = v124
		}
	})
	local v126 = v_u_15(v125) or v_u_16(v125)
	local v127 = v_u_17(v125)
	local v_u_128 = {}
	v_u_4.forEach(v127, function(p129)
		-- upvalues: (copy) v_u_128
		v_u_128[p129.name.value] = p129
	end)
	if v_u_4.every(v126.selectionSet.selections, function(p130)
		-- upvalues: (ref) v_u_32, (copy) v_u_128
		local v131
		if p130.kind == "FragmentSpread" then
			v131 = v_u_32(v_u_128[p130.name.value], v_u_128)
		else
			v131 = false
		end
		return v131
	end, nil) then
		return nil
	else
		return v125
	end
end
v8.removeFragmentSpreadFromDocument = v_u_25
v_u_26 = function(p132) -- name: getAllFragmentSpreadsFromSelectionSet
	-- upvalues: (copy) v_u_4, (copy) v_u_21, (copy) v_u_22, (ref) v_u_26
	local v_u_133 = {}
	v_u_4.forEach(p132.selections, function(p134)
		-- upvalues: (ref) v_u_21, (ref) v_u_22, (ref) v_u_4, (ref) v_u_26, (copy) v_u_133
		if (v_u_21(p134) or v_u_22(p134)) and p134.selectionSet then
			v_u_4.forEach(v_u_26(p134.selectionSet), function(p135)
				-- upvalues: (ref) v_u_133
				local v136 = v_u_133
				table.insert(v136, p135)
			end)
		elseif p134.kind == "FragmentSpread" then
			local v137 = v_u_133
			table.insert(v137, p134)
		end
	end)
	return v_u_133
end
function v8.buildQueryFromSelectionSet(p138) -- name: buildQueryFromSelectionSet
	-- upvalues: (copy) v_u_18, (copy) v_u_10, (copy) v_u_5
	if v_u_18(p138).operation == "query" then
		return p138
	end
	local v140 = {
		["OperationDefinition"] = {
			["enter"] = function(_, p139) -- name: enter
				-- upvalues: (ref) v_u_5
				return v_u_5.assign({}, p139, {
					["operation"] = "query"
				})
			end
		}
	}
	return v_u_10(p138, v140)
end
function v8.removeClientSetsFromDocument(p141) -- name: removeClientSetsFromDocument
	-- upvalues: (copy) v_u_14, (copy) v_u_70, (copy) v_u_6, (copy) v_u_10, (copy) v_u_4, (copy) v_u_21, (copy) v_u_11
	v_u_14(p141)
	local v143 = v_u_70({
		{
			["test"] = nil,
			["remove"] = true,
			["test"] = function(_, p142) -- name: test
				return p142.name.value == "client"
			end
		}
	}, p141)
	if v_u_6.toJSBoolean(v143) then
		local v148 = {
			["FragmentDefinition"] = {
				["enter"] = function(_, p144) -- name: enter
					-- upvalues: (ref) v_u_4, (ref) v_u_21, (ref) v_u_6, (ref) v_u_11
					if p144.selectionSet then
						local v147 = v_u_4.every(p144.selectionSet.selections, function(p145)
							-- upvalues: (ref) v_u_21
							local v146 = v_u_21(p145)
							if v146 then
								v146 = p145.name.value == "__typename"
							end
							return v146
						end)
						if v_u_6.toJSBoolean(v147) then
							return v_u_11
						end
					end
					return nil
				end
			}
		}
		v143 = v_u_10(v143, v148)
	end
	return v143
end
return v8