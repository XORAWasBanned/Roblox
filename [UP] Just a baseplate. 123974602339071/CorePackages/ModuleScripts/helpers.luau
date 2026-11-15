-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.cache.inmemory.helpers
local v1 = script.Parent.Parent.Parent
local v2 = v1.Parent
local v_u_3 = require(v2.LuauPolyfill).Array
local v4 = require(v2.LuauRegExp)
require(v2.GraphQL)
require(script.Parent.types)
local v5 = require(v1.utilities)
local v_u_6 = v5.isReference
local v_u_7 = v5.isField
local v_u_8 = v5.DeepMerger
local v_u_9 = v5.resultKeyNameFromFieldf
local v_u_10 = v5.shouldInclude
local v_u_11 = v5.isNonNullObject
local v12 = {}
local v_u_13 = require(v1.luaUtils.hasOwnProperty)
v12.hasOwn = v_u_13
function v12.getTypenameFromStoreObject(p14, p15) -- name: getTypenameFromStoreObject
	-- upvalues: (copy) v_u_6
	if v_u_6(p15) then
		return p14:get(p15.__ref, "__typename")
	elseif p15 then
		return p15.__typename
	else
		return nil
	end
end
v12.TypeOrFieldNameRegExp = v4("^[_a-zA-Z][_0-9a-zA-Z]*", "i")
local v_u_16 = {}
function v12.fieldNameFromStoreName(p17) -- name: fieldNameFromStoreName
	-- upvalues: (copy) v_u_16
	if v_u_16[p17] then
		return v_u_16[p17]
	end
	local v18 = string.match(p17, "^[_a-zA-Z][_0-9a-zA-Z]*") or p17
	v_u_16[p17] = v18
	return v18
end
local function v_u_26(p_u_19, p_u_20, p_u_21) -- name: selectionSetMatchesResult
	-- upvalues: (copy) v_u_11, (copy) v_u_3, (copy) v_u_26, (copy) v_u_7, (copy) v_u_10, (copy) v_u_9, (copy) v_u_13
	if v_u_11(p_u_20) then
		if v_u_3.isArray(p_u_20) then
			return v_u_3.every(p_u_20, function(p22)
				-- upvalues: (ref) v_u_26, (copy) p_u_19, (copy) p_u_21
				return v_u_26(p_u_19, p22, p_u_21)
			end)
		else
			return v_u_3.every(p_u_19.selections, function(p23)
				-- upvalues: (ref) v_u_7, (ref) v_u_10, (copy) p_u_21, (ref) v_u_9, (ref) v_u_13, (copy) p_u_20, (ref) v_u_26
				if not (v_u_7(p23) and v_u_10(p23, p_u_21)) then
					return true
				end
				local v24 = v_u_9(p23)
				local v25 = v_u_13(p_u_20, v24)
				if v25 then
					v25 = not p23.selectionSet or v_u_26(p23.selectionSet, p_u_20[v24], p_u_21)
				end
				return v25
			end)
		end
	else
		return false
	end
end
v12.selectionSetMatchesResult = v_u_26
function v12.storeValueIsStoreObject(p27) -- name: storeValueIsStoreObject
	-- upvalues: (copy) v_u_11, (copy) v_u_6, (copy) v_u_3
	local v28 = v_u_11(p27) and not v_u_6(p27)
	if v28 then
		v28 = not v_u_3.isArray(p27)
	end
	return v28
end
function v12.makeProcessedFieldsMerger() -- name: makeProcessedFieldsMerger
	-- upvalues: (copy) v_u_8
	return v_u_8.new()
end
return v12