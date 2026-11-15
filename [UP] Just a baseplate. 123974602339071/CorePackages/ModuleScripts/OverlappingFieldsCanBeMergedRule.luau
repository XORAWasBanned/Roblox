-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.validation.rules.OverlappingFieldsCanBeMergedRule
local v1 = script.Parent.Parent.Parent
local v2 = v1.Parent
local v3 = require(v2.LuauPolyfill)
local v_u_4 = v3.Array
local v_u_5 = v3.Map
local v_u_6 = v3.Object
local v_u_7 = require(v1.luaUtils.null)
local v8 = v1.jsutils
local v9 = v1.language
local v_u_10 = require(v1.error.GraphQLError).GraphQLError
local v_u_11 = require(v8.inspect).inspect
local v_u_12 = require(v9.kinds).Kind
local v_u_13 = require(v9.printer).print
local v14 = require(v1.type.definition)
local v_u_15 = v14.getNamedType
local v_u_16 = v14.isNonNullType
local v_u_17 = v14.isLeafType
local v_u_18 = v14.isObjectType
local v_u_19 = v14.isListType
local v_u_20 = v14.isInterfaceType
local v_u_21 = require(v1.utilities.typeFromAST).typeFromAST
local v22 = {}
local v_u_23 = nil
local v_u_24 = nil
local v_u_25 = nil
local v_u_26 = nil
local v_u_27 = nil
local v_u_28 = nil
local v_u_29 = nil
local v_u_30 = nil
local v_u_31 = nil
local v_u_32 = nil
local v_u_33 = nil
local v_u_34 = nil
local function v_u_39(p35) -- name: reasonMessage
	-- upvalues: (copy) v_u_4, (copy) v_u_39
	if v_u_4.isArray(p35) then
		return table.concat(v_u_4.map(p35, function(p36)
			-- upvalues: (ref) v_u_39
			local v37 = p36[1]
			local v38 = p36[2]
			return ("subfields \"%s\" conflict because "):format(v37) .. v_u_39(v38)
		end), " and ")
	else
		return p35
	end
end
function v22.OverlappingFieldsCanBeMergedRule(p_u_40)
	-- upvalues: (ref) v_u_34, (ref) v_u_23, (copy) v_u_4, (copy) v_u_39, (copy) v_u_10
	local v_u_41 = v_u_34.new()
	local v_u_42 = {}
	return {
		["SelectionSet"] = function(_, p43) -- name: SelectionSet
			-- upvalues: (ref) v_u_23, (copy) p_u_40, (copy) v_u_42, (copy) v_u_41, (ref) v_u_4, (ref) v_u_39, (ref) v_u_10
			local v44 = v_u_23(p_u_40, v_u_42, v_u_41, p_u_40:getParentType(), p43)
			for _, v45 in ipairs(v44) do
				local v46 = v45[1]
				local v47 = v46[1]
				local v48 = v46[2]
				local v49 = v45[2]
				local v50 = v45[3]
				if v_u_4.isArray(v48) then
					v48 = table.concat(v_u_4.map(v48, function(p51)
						-- upvalues: (ref) v_u_39
						local v52 = p51[1]
						local v53 = p51[2]
						return ("subfields \"%s\" conflict because "):format(v52) .. v_u_39(v53)
					end), " and ")
				end
				p_u_40:reportError(v_u_10.new(("Fields \"%s\" conflict because %s. Use different aliases on the fields to fetch both if this was intentional."):format(v47, v48), v_u_4.concat(v49, v50)))
			end
		end
	}
end
v_u_23 = function(p54, p55, p56, p57, p58) -- name: findConflictsWithinSelectionSet
	-- upvalues: (ref) v_u_28, (ref) v_u_26, (ref) v_u_24, (ref) v_u_27
	local v59 = {}
	local v60 = v_u_28(p54, p55, p57, p58)
	local v61 = v60[1]
	local v62 = v60[2]
	v_u_26(p54, v59, p55, p56, v61)
	if #v62 ~= 0 then
		for v63 = 1, #v62 do
			v_u_24(p54, v59, p55, p56, false, v61, v62[v63])
			for v64 = v63 + 1, #v62 do
				v_u_27(p54, v59, p55, p56, false, v62[v63], v62[v64])
			end
		end
	end
	return v59
end
v_u_24 = function(p65, p66, p67, p68, p69, p70, p71) -- name: collectConflictsBetweenFieldsAndFragment
	-- upvalues: (ref) v_u_29, (ref) v_u_25, (ref) v_u_24
	local v72 = p65:getFragment(p71)
	if v72 then
		local v73 = v_u_29(p65, p67, v72)
		local v74 = v73[1]
		local v75 = v73[2]
		if p70 ~= v74 then
			v_u_25(p65, p66, p67, p68, p69, p70, v74)
			for v76 = 1, #v75 do
				v_u_24(p65, p66, p67, p68, p69, p70, v75[v76])
			end
		end
	else
		return
	end
end
v_u_27 = function(p77, p78, p79, p80, p81, p82, p83) -- name: collectConflictsBetweenFragments
	-- upvalues: (ref) v_u_29, (ref) v_u_25, (ref) v_u_27
	if p82 == p83 then
		return
	elseif p80:has(p82, p83, p81) then
		return
	else
		p80:add(p82, p83, p81)
		local v84 = p77:getFragment(p82)
		local v85 = p77:getFragment(p83)
		if v84 and v85 then
			local v86 = v_u_29(p77, p79, v84)
			local v87 = v86[1]
			local v88 = v86[2]
			local v89 = v_u_29(p77, p79, v85)
			local v90 = v89[1]
			local v91 = v89[2]
			v_u_25(p77, p78, p79, p80, p81, v87, v90)
			for v92 = 1, #v91 do
				v_u_27(p77, p78, p79, p80, p81, p82, v91[v92])
			end
			for v93 = 1, #v88 do
				v_u_27(p77, p78, p79, p80, p81, v88[v93], p83)
			end
		end
	end
end
local function v_u_113(p94, p95, p96, p97, p98, p99, p100, p101) -- name: findConflictsBetweenSubSelectionSets
	-- upvalues: (ref) v_u_28, (ref) v_u_25, (ref) v_u_24, (ref) v_u_27
	local v102 = {}
	local v103 = v_u_28(p94, p95, p98, p99)
	local v104 = v103[1]
	local v105 = v103[2]
	local v106 = v_u_28(p94, p95, p100, p101)
	local v107 = v106[1]
	local v108 = v106[2]
	v_u_25(p94, v102, p95, p96, p97, v104, v107)
	if #v108 ~= 0 then
		for v109 = 1, #v108 do
			v_u_24(p94, v102, p95, p96, p97, v104, v108[v109])
		end
	end
	if #v105 ~= 0 then
		for v110 = 1, #v105 do
			v_u_24(p94, v102, p95, p96, p97, v107, v105[v110])
		end
	end
	for v111 = 1, #v105 do
		for v112 = 1, #v108 do
			v_u_27(p94, v102, p95, p96, p97, v105[v111], v108[v112])
		end
	end
	return v102
end
v_u_26 = function(p114, p115, p116, p117, p118) -- name: collectConflictsWithin
	-- upvalues: (ref) v_u_30
	for _, v119 in p118 do
		local v120 = v119[1]
		local v121 = v119[2]
		if #v121 <= 1 then
			continue
		end
		for v122 = 1, #v121 do
			for v123 = v122 + 1, #v121 do
				local v124 = v_u_30(p114, p116, p117, false, v120, v121[v122], v121[v123])
				if not v124 then
					continue
				end
				table.insert(p115, v124)
			end
		end
	end
end
v_u_25 = function(p125, p126, p127, p128, p129, p130, p131) -- name: collectConflictsBetween
	-- upvalues: (ref) v_u_30
	for _, v132 in ipairs(p130:keys()) do
		local v133 = p131[v132]
		if not v133 then
			continue
		end
		local v134 = p130[v132]
		for v135 = 1, #v134 do
			for v136 = 1, #v133 do
				local v137 = v_u_30(p125, p127, p128, p129, v132, v134[v135], v133[v136])
				if not v137 then
					continue
				end
				table.insert(p126, v137)
			end
		end
	end
end
v_u_30 = function(p138, p139, p140, p141, p142, p143, p144) -- name: findConflict
	-- upvalues: (copy) v_u_18, (ref) v_u_31, (ref) v_u_32, (copy) v_u_11, (copy) v_u_113, (copy) v_u_15, (ref) v_u_33
	local v145 = p143[1]
	local v146 = p143[2]
	local v147 = p143[3]
	local v148 = p144[1]
	local v149 = p144[2]
	local v150 = p144[3]
	local v151 = not p141 and (v145 ~= v148 and v_u_18(v145))
	if v151 then
		v151 = v_u_18(v148)
	end
	if not v151 then
		local v152 = v146.name.value
		local v153 = v149.name.value
		if v152 ~= v153 then
			return {
				{ p142, ("\"%s\" and \"%s\" are different fields"):format(v152, v153) },
				{ v146 },
				{ v149 }
			}
		end
		if not v_u_31(v146.arguments or {}, v149.arguments or {}) then
			return {
				{ p142, "they have differing arguments" },
				{ v146 },
				{ v149 }
			}
		end
	end
	if v147 then
		v147 = v147.type
	end
	if v150 then
		v150 = v150.type
	end
	if v147 and (v150 and v_u_32(v147, v150)) then
		return {
			{ p142, ("they return conflicting types \"%s\" and \"%s\""):format(v_u_11(v147), v_u_11(v150)) },
			{ v146 },
			{ v149 }
		}
	else
		local v154 = v146.selectionSet
		local v155 = v149.selectionSet
		if v154 and v155 then
			return v_u_33(v_u_113(p138, p139, p140, v151, v_u_15(v147), v154, v_u_15(v150), v155), p142, v146, v149)
		else
			return nil
		end
	end
end
local v_u_156 = nil
local v_u_157 = nil
v_u_31 = function(p158, p_u_159) -- name: sameArguments
	-- upvalues: (copy) v_u_4, (ref) v_u_156
	if #p158 == #p_u_159 then
		return v_u_4.every(p158, function(p_u_160)
			-- upvalues: (ref) v_u_4, (copy) p_u_159, (ref) v_u_156
			local v162 = v_u_4.find(p_u_159, function(p161)
				-- upvalues: (copy) p_u_160
				return p161.name.value == p_u_160.name.value
			end)
			if v162 then
				return v_u_156(p_u_160.value, v162.value)
			else
				return false
			end
		end)
	else
		return false
	end
end
v_u_156 = function(p163, p164) -- name: sameValue
	-- upvalues: (copy) v_u_13
	return v_u_13(p163) == v_u_13(p164)
end
v_u_32 = function(p165, p166) -- name: doTypesConflict
	-- upvalues: (copy) v_u_19, (ref) v_u_32, (copy) v_u_16, (copy) v_u_17
	if v_u_19(p165) then
		return not v_u_19(p166) and true or v_u_32(p165.ofType, p166.ofType)
	elseif v_u_19(p166) then
		return true
	elseif v_u_16(p165) then
		return not v_u_16(p166) and true or v_u_32(p165.ofType, p166.ofType)
	elseif v_u_16(p166) then
		return true
	elseif v_u_17(p165) or v_u_17(p166) then
		return p165 ~= p166
	else
		return false
	end
end
v_u_28 = function(p167, p168, p169, p170) -- name: getFieldsAndFragmentNames
	-- upvalues: (copy) v_u_5, (ref) v_u_157, (copy) v_u_6
	local v171 = p168[p170]
	if not v171 then
		local v172 = v_u_5.new()
		local v173 = {}
		v_u_157(p167, p169, p170, v172, v173)
		v171 = { v172, v_u_6.keys(v173) }
		p168[p170] = v171
	end
	return v171
end
v_u_29 = function(p174, p175, p176) -- name: getReferencedFieldsAndFragmentNames
	-- upvalues: (copy) v_u_21, (ref) v_u_28
	return p175[p176.selectionSet] or v_u_28(p174, p175, v_u_21(p174:getSchema(), p176.typeCondition), p176.selectionSet)
end
v_u_157 = function(p177, p178, p179, p180, p181) -- name: _collectFieldsAndFragmentNames
	-- upvalues: (copy) v_u_12, (copy) v_u_18, (copy) v_u_20, (copy) v_u_7, (copy) v_u_21, (ref) v_u_157
	for _, v182 in ipairs(p179.selections) do
		local v183 = v182.kind
		if v183 == v_u_12.FIELD then
			local v184 = v182.name.value
			local v185
			if v_u_18(p178) or v_u_20(p178) then
				v185 = p178:getFields():get(v184)
			else
				v185 = nil
			end
			if v182.alias then
				v184 = v182.alias.value
			end
			if not p180[v184] then
				p180[v184] = {}
			end
			local v186 = p180[v184]
			local v187 = { p178 or v_u_7, v182 or v_u_7, v185 or v_u_7 }
			table.insert(v186, v187)
		elseif v183 == v_u_12.FRAGMENT_SPREAD then
			p181[v182.name.value] = true
		else
			if v183 ~= v_u_12.INLINE_FRAGMENT then
				continue
			end
			local v188 = v182.typeCondition
			local v189
			if v188 then
				v189 = v_u_21(p177:getSchema(), v188)
			else
				v189 = p178
			end
			v_u_157(p177, v189, v182.selectionSet, p180, p181)
		end
	end
end
v_u_33 = function(p190, p191, p192, p193) -- name: subfieldConflicts
	-- upvalues: (copy) v_u_4
	return #p190 > 0 and {
		{ p191, v_u_4.map(p190, function(p194)
				return p194[1]
			end) },
		v_u_4.reduce(p190, function(p195, p196)
			-- upvalues: (ref) v_u_4
			local v197 = p196[2]
			return v_u_4.concat(p195, v197)
		end, { p192 }),
		v_u_4.reduce(p190, function(p198, p199)
			-- upvalues: (ref) v_u_4
			local v200 = p199[3]
			return v_u_4.concat(p198, v200)
		end, { p193 })
	} or nil
end
v_u_34 = {}
local v_u_201 = {
	["__index"] = v_u_34
}
function v_u_34.new() -- name: new
	-- upvalues: (copy) v_u_201
	local v202 = v_u_201
	local v203 = setmetatable({}, v202)
	v203._data = {}
	return v203
end
function v_u_34.has(p204, p205, p206, p207) -- name: has
	local v208 = p204._data[p205]
	if v208 then
		v208 = v208[p206]
	end
	if v208 == nil then
		return false
	else
		return p207 ~= false and true or v208 == false
	end
end
function v_u_34.add(p209, p210, p211, p212) -- name: add
	p209:_pairSetAdd(p210, p211, p212)
	p209:_pairSetAdd(p211, p210, p212)
end
function v_u_34._pairSetAdd(p213, p214, p215, p216) -- name: _pairSetAdd
	local v217 = p213._data[p214]
	if not v217 then
		v217 = {}
		p213._data[p214] = v217
	end
	v217[p215] = p216
end
return v22