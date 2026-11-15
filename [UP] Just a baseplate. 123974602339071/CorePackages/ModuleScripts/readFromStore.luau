-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.cache.inmemory.readFromStore
local v1 = script.Parent.Parent.Parent
local v2 = v1.Parent
local v3 = require(v2.LuauPolyfill)
local v_u_4 = v3.Array
local v_u_5 = v3.Object
local v_u_6 = v3.Boolean
local v_u_7 = v3.Set
local v_u_8 = v3.WeakMap
local v_u_9 = game:GetService("HttpService")
local v_u_10 = require(v1.utilities).NULL
local v_u_11 = nil
local v12 = {}
require(v2.GraphQL)
local v_u_13 = require(v1.optimism).wrap
local v14 = require(v1.jsutils.invariant)
local v_u_15 = v14.invariant
local v_u_16 = v14.InvariantError
local v17 = require(script.Parent.Parent.Parent.utilities)
local v_u_18 = v17.isField
local v_u_19 = v17.resultKeyNameFromField
local v_u_20 = v17.isReference
local v_u_21 = v17.makeReference
local v_u_22 = v17.createFragmentMap
local v_u_23 = v17.shouldInclude
local v_u_24 = v17.addTypenameToDocument
local v_u_25 = v17.getDefaultValues
local v_u_26 = v17.getFragmentDefinitions
local v_u_27 = v17.getMainDefinition
local v_u_28 = v17.getQueryDefinition
local v_u_29 = v17.mergeDeepArray
local v_u_30 = v17.getFragmentFromSelection
local v_u_31 = v17.maybeDeepFreeze
local v_u_32 = v17.isNonNullObject
local _ = v17.canUseWeakMap
require(script.Parent.Parent.core.types.Cache)
require(script.Parent.types)
local v33 = require(script.Parent.entityStore)
local v_u_34 = v33.maybeDependOnExistenceOfEntity
local v_u_35 = v33.supportsResultCaching
local v_u_36 = require(script.Parent.helpers).getTypenameFromStoreObject
require(script.Parent.policies)
local v_u_37 = require(script.Parent.Parent.core.types.common).MissingFieldError
local v38 = require(script.Parent["object-canon"])
local v_u_39 = v38.canonicalStringify
local v_u_40 = v38.ObjectCanon
local function v_u_43(p41, p42) -- name: missingFromInvariant
	-- upvalues: (copy) v_u_37, (copy) v_u_4
	return v_u_37.new(p41.message, v_u_4.slice(p42.path), p42.query, p42.variables)
end
local v_u_44 = {}
v_u_44.__index = v_u_44
function v_u_44.resetCanon(p45) -- name: resetCanon
	-- upvalues: (copy) v_u_40
	p45.canon = v_u_40.new()
end
local function v_u_51(_, p46, p47, p48, p49) -- name: makeSelectionSetCacheKey
	-- upvalues: (copy) v_u_35, (copy) v_u_20
	if not v_u_35(p48.store) then
		return nil
	end
	local v50 = p48.store
	if v_u_20(p47) then
		p47 = p47.__ref or p47
	end
	return v50:makeCacheKey(p46, p47, p48.varString, p49)
end
local function v_u_56(_, p52) -- name: makeSubSelectedCacheKey
	-- upvalues: (copy) v_u_35
	local v53 = p52.field
	local v54 = p52.array
	local v55 = p52.context
	if v_u_35(v55.store) then
		return v55.store:makeCacheKey(v53, v54, v55.varString)
	else
		return nil
	end
end
function v_u_44.new(p57) -- name: new
	-- upvalues: (copy) v_u_44, (copy) v_u_8, (copy) v_u_5, (copy) v_u_40, (copy) v_u_13, (copy) v_u_34, (copy) v_u_51, (copy) v_u_56
	local v58 = v_u_44
	local v_u_59 = setmetatable({}, v58)
	v_u_59.knownResults = v_u_8.new()
	v_u_59.config = v_u_5.assign(table.clone(p57), {
		["addTypename"] = p57.addTypename ~= false
	})
	v_u_59.canon = p57.canon or v_u_40.new()
	v_u_59.executeSelectionSet = v_u_13(function(_, p60)
		-- upvalues: (copy) v_u_59, (ref) v_u_5, (ref) v_u_34
		local v61 = p60.context.canonizeResults
		local v62 = {
			p60.selectionSet,
			p60.objectOrReference,
			p60.context,
			p60.context.canonizeResults,
			[4] = not v61
		}
		local v63 = v_u_59.executeSelectionSet:peek(table.unpack(v62))
		if v63 == nil then
			v_u_34(p60.context.store, p60.enclosingRef.__ref)
			return v_u_59:execSelectionSetImpl(p60)
		elseif v61 then
			return v_u_5.assign(table.clone(v63), {
				["result"] = v_u_59.canon:admit(v63.result)
			})
		else
			return v63
		end
	end, {
		["max"] = v_u_59.config.resultCacheMaxSize,
		["keyArgs"] = function(_, ...) -- name: keyArgs
			local v64 = ...
			return {
				v64.selectionSet,
				v64.objectOrReference,
				v64.context,
				v64.context.canonizeResults
			}
		end,
		["makeCacheKey"] = v_u_51
	}, v_u_59)
	v_u_59.executeSubSelectedArray = v_u_13(function(_, p65)
		-- upvalues: (ref) v_u_34, (copy) v_u_59
		v_u_34(p65.context.store, p65.enclosingRef.__ref)
		return v_u_59:execSubSelectedArrayImpl(p65)
	end, {
		["max"] = v_u_59.config.resultCacheMaxSize,
		["makeCacheKey"] = v_u_56
	}, v_u_59)
	return v_u_59
end
function v_u_44.diffQueryAgainstStore(p66, p67) -- name: diffQueryAgainstStore
	-- upvalues: (copy) v_u_5, (copy) v_u_25, (copy) v_u_28, (copy) v_u_21, (copy) v_u_27, (copy) v_u_39, (copy) v_u_22, (copy) v_u_26
	local v68 = p67.store
	local v69 = p67.query
	local v70 = p67.rootId
	local v71 = p67.variables
	local v72 = p67.returnPartialData
	local v73 = p67.canonizeResults
	local v74 = v70 == nil and "ROOT_QUERY" or v70
	local v75 = v72 == nil and true or v72
	local v76 = v73 == nil and true or v73
	local v77 = p66.config.cache.policies
	local v78 = v_u_5.assign({}, v_u_25(v_u_28(v69)), v71)
	local v79 = v_u_21(v74)
	local v80 = p66:executeSelectionSet({
		["selectionSet"] = v_u_27(v69).selectionSet,
		["objectOrReference"] = v79,
		["enclosingRef"] = v79,
		["context"] = {
			["store"] = v68,
			["query"] = v69,
			["policies"] = v77,
			["variables"] = v78,
			["varString"] = v_u_39(v78),
			["canonizeResults"] = v76,
			["fragmentMap"] = v_u_22(v_u_26(v69)),
			["path"] = {}
		}
	})
	local v81 = v80.missing
	if v81 then
		v81 = #v80.missing > 0
	end
	if v81 and not v75 then
		error(v80.missing[1])
	end
	return {
		["result"] = v80.result,
		["missing"] = v80.missing,
		["complete"] = not v81
	}
end
function v_u_44.isFresh(p82, p83, p84, p85, p86) -- name: isFresh
	-- upvalues: (copy) v_u_35
	if v_u_35(p86.store) and p82.knownResults:get(p83) == p85 then
		local v87 = p82.executeSelectionSet:peek(p85, p84, p86, p82.canon:isKnown(p83))
		if v87 and p83 == v87.result then
			return true
		end
	end
	return false
end
function v_u_44.execSelectionSetImpl(p88, p89) -- name: execSelectionSetImpl
	-- upvalues: (copy) v_u_43, (copy) v_u_16, (copy) v_u_10, (copy) v_u_7, (copy) v_u_23, (copy) v_u_18, (copy) v_u_19, (copy) v_u_24, (copy) v_u_20, (copy) v_u_9, (copy) v_u_4, (copy) v_u_15, (copy) v_u_30, (copy) v_u_29, (copy) v_u_31
	local v90 = p89.selectionSet
	local v91 = p89.objectOrReference
	local v92 = p89.enclosingRef
	local v93 = p89.context
	if v91.__ref and not (v93.policies.rootTypenamesById[v91.__ref] or v93.store:has(v91.__ref)) then
		return {
			["result"] = p88.canon.empty,
			["missing"] = { v_u_43(v_u_16.new(("Dangling reference to missing %s object"):format(v91.__ref)), v93) }
		}
	end
	local v94 = v93.variables
	local v95 = v93.policies
	local v96 = {}
	local v97 = {
		["result"] = v_u_10
	}
	local v98 = v93.store:getFieldValue(v91, "__typename")
	if p88.config.addTypename and (type(v98) == "string" and not v95.rootIdsByTypename[v98]) then
		table.insert(v96, {
			["__typename"] = v98
		})
	end
	local v99 = v_u_7.new(v90.selections)
	for _, v100 in v99 do
		if not v_u_23(v100, v94) then
			continue
		end
		if v_u_18(v100) then
			local v101 = v95:readField({
				["fieldName"] = v100.name.value,
				["field"] = v100,
				["variables"] = v93.variables,
				["from"] = v91
			}, v93)
			local v102 = v_u_19(v100)
			local v103 = v93.path
			table.insert(v103, v102)
			if v101 == nil then
				if not v_u_24:added(v100) then
					if not v97.missing then
						v97.missing = {}
					end
					local v104 = v97.missing
					local v105 = v_u_43
					local v106 = v_u_16.new(("Can\'t find field \'%s\' on %s"):format(v100.name.value, v_u_20(v91) and v91.__ref .. " object" or "object " .. v_u_9:JSONEncode(v91)))
					table.insert(v104, v105(v106, v93))
				end
			elseif v_u_4.isArray(v101) then
				local v107 = p88:executeSubSelectedArray({
					["field"] = v100,
					["array"] = v101,
					["enclosingRef"] = v92,
					["context"] = v93
				})
				if v107.missing then
					if not v97.missing then
						v97.missing = {}
					end
					local v108 = v97.missing
					for _, v109 in v107.missing do
						table.insert(v108, v109)
					end
				end
				v101 = v107.result
			elseif v100.selectionSet then
				if v101 ~= v_u_10 then
					local v110 = {
						["selectionSet"] = v100.selectionSet,
						["objectOrReference"] = v101
					}
					local v111
					if v_u_20(v101) then
						v111 = v101 or v92
					else
						v111 = v92
					end
					v110.enclosingRef = v111
					v110.context = v93
					local v112 = p88:executeSelectionSet(v110)
					if v112.missing then
						if not v97.missing then
							v97.missing = {}
						end
						local v113 = v97.missing
						for _, v114 in v112.missing do
							table.insert(v113, v114)
						end
					end
					v101 = v112.result
				end
			elseif v93.canonizeResults then
				v101 = p88.canon:pass(v101)
			end
			if v101 ~= nil then
				table.insert(v96, {
					[v102] = v101
				})
			end
			local v115 = table.remove(v93.path) == v102
			if v115 then
				continue
			end
			v_u_15(v115)
		else
			local v116 = v_u_30(v100, v93.fragmentMap)
			if not (v116 and v95:fragmentMatches(v116, v98)) then
				continue
			end
			v_u_4.forEach(v116.selectionSet.selections, v99.add, v99)
		end
	end
	local v117 = v_u_29(v96)
	if v93.canonizeResults then
		v97.result = p88.canon:admit(v117)
	else
		v97.result = v_u_31(v117)
	end
	p88.knownResults:set(v97.result, v90)
	return v97
end
function v_u_44.execSubSelectedArrayImpl(p_u_118, p119) -- name: execSubSelectedArrayImpl
	-- upvalues: (copy) v_u_15, (copy) v_u_4, (copy) v_u_10, (copy) v_u_6, (copy) v_u_20, (ref) v_u_11
	local v_u_120 = p119.field
	local v121 = p119.array
	local v_u_122 = p119.enclosingRef
	local v_u_123 = p119.context
	local v_u_124 = nil
	local function v_u_131(p125, p126) -- name: handleMissing
		-- upvalues: (ref) v_u_124, (ref) v_u_15, (copy) v_u_123
		if p125.missing then
			v_u_124 = v_u_124 or {}
			local v127 = p125.missing
			for v128 = 1, #v127 do
				local v129 = v_u_124
				local v130 = v127[v128]
				table.insert(v129, v130)
			end
		end
		v_u_15(table.remove(v_u_123.path) == p126)
		return p125.result
	end
	if v_u_120.selectionSet then
		v121 = v_u_4.filter(v121, function(p132)
			-- upvalues: (copy) v_u_123
			return v_u_123.store:canRead(p132)
		end)
	end
	local v137 = v_u_4.map(v121, function(p133, p134)
		-- upvalues: (ref) v_u_10, (copy) v_u_123, (ref) v_u_4, (copy) v_u_131, (copy) p_u_118, (copy) v_u_120, (copy) v_u_122, (ref) v_u_6, (ref) v_u_20, (ref) v_u_11, (ref) v_u_15
		if p133 == v_u_10 then
			return v_u_10
		end
		local v135 = v_u_123.path
		table.insert(v135, p134)
		if v_u_4.isArray(p133) and #p133 > 0 then
			return v_u_131(p_u_118:executeSubSelectedArray({
				["field"] = v_u_120,
				["array"] = p133,
				["enclosingRef"] = v_u_122,
				["context"] = v_u_123
			}), p134)
		end
		if v_u_6.toJSBoolean(v_u_120.selectionSet) then
			return v_u_131(p_u_118:executeSelectionSet({
				["selectionSet"] = v_u_120.selectionSet,
				["objectOrReference"] = p133,
				["enclosingRef"] = v_u_20(p133) and p133 and p133 or v_u_122,
				["context"] = v_u_123
			}), p134)
		end
		if _G.__DEV__ then
			v_u_11(v_u_123.store, v_u_120, p133)
		end
		local v136 = table.remove(v_u_123.path) == p134
		if not v136 then
			v_u_15(v136)
		end
		return p133
	end)
	local v138 = {}
	if v_u_123.canonizeResults then
		v137 = p_u_118.canon:admit(v137)
	end
	v138.result = v137
	v138.missing = v_u_124
	return v138
end
v12.StoreReader = v_u_44
v_u_11 = function(p139, p140, p141) -- name: assertSelectionSetForIdValue
	-- upvalues: (copy) v_u_7, (copy) v_u_32, (copy) v_u_15, (copy) v_u_20, (copy) v_u_36, (copy) v_u_4, (copy) v_u_5
	if not p140.selectionSet then
		local v142 = v_u_7.new({ p141 })
		for _, v143 in v142 do
			if not v_u_32(v143) then
				continue
			end
			v_u_15(not v_u_20(v143), ("Missing selection set for object of type %s returned for query field %s"):format(v_u_36(p139, v143) or "nil", p140.name.value))
			v_u_4.forEach(v_u_5.values(v143), v142.add, v142)
		end
	end
end
return v12