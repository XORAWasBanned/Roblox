-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.cache.inmemory.entityStore
local v1 = {}
local v2 = script.Parent.Parent.Parent
local v3 = v2.Parent
local v4 = require(v3.LuauPolyfill)
local v_u_5 = v4.Array
local v_u_6 = v4.Boolean
local v_u_7 = v4.instanceof
local v_u_8 = v4.Object
local v_u_9 = v4.Set
local v_u_10 = require(v2.luaUtils.isCallable)
local v_u_11 = require(v2.luaUtils.objectKeysForEach)
local v_u_12 = require(v2.optimism).dep
local v_u_13 = require(v2.jsutils.invariant).invariant
local v_u_14 = require(v2.jsutils.equal)
local v_u_15 = require(v2.wry.trie).Trie
local v16 = require(script.Parent.Parent.Parent.utilities)
local v_u_17 = v16.isReference
local v_u_18 = v16.makeReference
local v_u_19 = v16.DeepMerger
local v_u_20 = v16.maybeDeepFreeze
local v_u_21 = v16.canUseWeakMap
local v_u_22 = v16.isNonNullObject
require(script.Parent.types)
local v23 = require(script.Parent.helpers)
local v_u_24 = v23.hasOwn
local v_u_25 = v23.fieldNameFromStoreName
require(script.Parent.policies)
require(script.Parent.Parent.core.types.Cache)
require(script.Parent.Parent.core.types.common)
local v_u_26 = {}
local function v_u_27() -- name: delModifier
	-- upvalues: (copy) v_u_26
	return v_u_26
end
local v_u_28 = {}
local v_u_29 = nil
local v_u_30 = nil
local v_u_31 = nil
local v_u_32 = nil
local v_u_33 = nil
local v_u_34 = {}
v_u_34.__index = v_u_34
function v_u_34.new(p35, p36) -- name: new
	-- upvalues: (copy) v_u_34, (copy) v_u_20, (copy) v_u_17, (copy) v_u_18
	local v37 = v_u_34
	local v_u_38 = setmetatable({}, v37)
	v_u_38.policies = p35
	v_u_38.group = p36
	v_u_38.data = {}
	v_u_38.rootIds = {}
	v_u_38.refs = {}
	function v_u_38.getFieldValue(_, p39, p40)
		-- upvalues: (ref) v_u_20, (ref) v_u_17, (copy) v_u_38
		local v41 = v_u_20
		if v_u_17(p39) then
			p39 = v_u_38:get(p39.__ref, p40)
		elseif p39 then
			p39 = p39[p40]
		end
		return v41(p39)
	end
	function v_u_38.canRead(_, p42)
		-- upvalues: (ref) v_u_17, (copy) v_u_38
		if v_u_17(p42) then
			return v_u_38:has(p42.__ref)
		else
			return typeof(p42) == "table"
		end
	end
	function v_u_38.toReference(_, p43, p44)
		-- upvalues: (ref) v_u_18, (ref) v_u_17, (copy) v_u_38
		if type(p43) == "string" then
			return v_u_18(p43)
		end
		if v_u_17(p43) then
			return p43
		end
		local v45 = v_u_38.policies:identify(p43)
		local v46 = table.unpack(v45, 1, 1)
		if v46 then
			local v47 = v_u_18(v46)
			if p44 then
				v_u_38:merge(v46, p43)
			end
			return v47
		end
	end
	return v_u_38
end
function v_u_34.addLayer(_, _, _) -- name: addLayer
	error("not implemented abstract method")
end
function v_u_34.removeLayer(_, _) -- name: removeLayer
	error("not implemented abstract method")
end
function v_u_34.toObject(p48) -- name: toObject
	return table.clone(p48.data)
end
function v_u_34.has(p49, p50) -- name: has
	return p49:lookup(p50, true) ~= nil
end
function v_u_34.get(p51, p52, p53) -- name: get
	-- upvalues: (copy) v_u_24, (copy) v_u_6, (copy) v_u_7, (ref) v_u_29
	p51.group:depend(p52, p53)
	if v_u_24(p51.data, p52) then
		local v54 = p51.data[p52]
		if v_u_6.toJSBoolean(v54) and v_u_24(v54, p53) then
			return v54[p53]
		end
	end
	if p53 == "__typename" and v_u_24(p51.policies.rootTypenamesById, p52) then
		return p51.policies.rootTypenamesById[p52]
	elseif v_u_7(p51, v_u_29) then
		return p51.parent:get(p52, p53)
	else
		return nil
	end
end
function v_u_34.lookup(p55, p56, p57) -- name: lookup
	-- upvalues: (copy) v_u_24, (copy) v_u_7, (ref) v_u_29
	if p57 then
		p55.group:depend(p56, "__exists")
	end
	if v_u_24(p55.data, p56) then
		return p55.data[p56]
	elseif v_u_7(p55, v_u_29) then
		return p55.parent:lookup(p56, p57)
	else
		return p55.policies.rootTypenamesById[p56] and {} or nil
	end
end
function v_u_34.merge(p_u_58, p59, p_u_60) -- name: merge
	-- upvalues: (copy) v_u_17, (copy) v_u_13, (copy) v_u_19, (ref) v_u_32, (copy) v_u_11, (copy) v_u_25, (copy) v_u_7, (ref) v_u_29
	local v61 = nil
	if v_u_17(p59) then
		p59 = p59.__ref
	end
	if v_u_17(p_u_60) then
		p_u_60 = p_u_60.__ref
	end
	local v_u_62
	if type(p59) == "string" then
		v_u_62 = p_u_58:lookup(p59)
	else
		v_u_62 = p59
		p59 = v61
	end
	local v63
	if type(p_u_60) == "string" then
		v63 = p_u_58:lookup(p_u_60)
	else
		v63 = p_u_60
		p_u_60 = p59
	end
	if v63 then
		v_u_13(typeof(p_u_60) == "string", "store.merge expects a string ID")
		local v_u_64 = v_u_19.new(v_u_32):merge(v_u_62, v63)
		p_u_58.data[p_u_60] = v_u_64
		if v_u_64 ~= v_u_62 then
			p_u_58.refs[p_u_60] = nil
			if p_u_58.group.caching then
				local v_u_65 = {}
				if not v_u_62 then
					v_u_65.__exists = 1
				end
				v_u_11(v63, function(p66)
					-- upvalues: (ref) v_u_62, (copy) v_u_64, (copy) v_u_65, (ref) v_u_25, (copy) p_u_58, (ref) v_u_7, (ref) v_u_29
					if not v_u_62 or v_u_62[p66] ~= v_u_64[p66] then
						v_u_65[p66] = 1
						local v67 = v_u_25(p66)
						if v67 ~= p66 and not p_u_58.policies:hasKeyArgs(v_u_64.__typename, v67) then
							v_u_65[v67] = 1
						end
						if v_u_64[p66] == nil and not v_u_7(p_u_58, v_u_29) then
							v_u_64[p66] = nil
						end
					end
				end)
				if v_u_65.__typename and not (v_u_62 and v_u_62.__typename) and p_u_58.policies.rootTypenamesById[p_u_60] == v_u_64.__typename then
					v_u_65.__typename = nil
				end
				v_u_11(v_u_65, function(p68)
					-- upvalues: (copy) p_u_58, (ref) p_u_60
					return p_u_58.group:dirty(p_u_60, p68)
				end)
			end
		end
	end
end
function v_u_34.modify(p_u_69, p_u_70, p_u_71) -- name: modify
	-- upvalues: (copy) v_u_26, (copy) v_u_28, (copy) v_u_17, (copy) v_u_18, (copy) v_u_11, (copy) v_u_25, (copy) v_u_10, (ref) v_u_27, (copy) v_u_20, (copy) v_u_8, (copy) v_u_19, (copy) v_u_7, (ref) v_u_29
	local v_u_72 = p_u_69:lookup(p_u_70)
	if v_u_72 then
		local v_u_73 = {}
		local v_u_74 = false
		local v_u_75 = true
		local v_u_79 = {
			["DELETE"] = v_u_26,
			["INVALIDATE"] = v_u_28,
			["isReference"] = function(_, ...) -- name: isReference
				-- upvalues: (ref) v_u_17
				return v_u_17(...)
			end,
			["toReference"] = p_u_69.toReference,
			["canRead"] = p_u_69.canRead,
			["readField"] = function(_, p76, p77) -- name: readField
				-- upvalues: (copy) p_u_69, (ref) v_u_18, (copy) p_u_70
				local v78 = p_u_69.policies
				if typeof(p76) == "string" then
					p76 = {
						["fieldName"] = p76,
						["from"] = p77 or v_u_18(p_u_70)
					} or p76
				end
				return v78:readField(p76, {
					["store"] = p_u_69
				})
			end
		}
		v_u_11(v_u_72, function(p80)
			-- upvalues: (ref) v_u_25, (copy) v_u_72, (ref) v_u_10, (copy) p_u_71, (ref) v_u_27, (ref) v_u_26, (ref) v_u_20, (ref) v_u_8, (copy) v_u_79, (copy) p_u_69, (copy) p_u_70, (ref) v_u_28, (ref) v_u_19, (copy) v_u_73, (ref) v_u_74, (ref) v_u_75
			local v81 = v_u_25(p80)
			local v82 = v_u_72[p80]
			if v82 ~= nil then
				local v83
				if v_u_10(p_u_71) then
					v83 = p_u_71
				else
					local v84 = p_u_71
					v83 = v84[p80] or v84[v81]
				end
				if v83 then
					local v85
					if v83 == v_u_27 then
						v85 = v_u_26
					else
						local v86
						if v_u_10(p_u_71) then
							v86 = nil
						else
							v86 = p_u_71 or nil
						end
						v85 = v83(v86, v_u_20(v82), v_u_8.assign(table.clone(v_u_79), {
							["fieldName"] = v81,
							["storeFieldName"] = p80,
							["storage"] = p_u_69:getStorage(p_u_70, p80)
						}))
					end
					if v85 == v_u_28 then
						p_u_69.group:dirty(p_u_70, p80)
					else
						if v85 == v_u_26 then
							v85 = v_u_19.None
						end
						if v85 ~= v82 then
							v_u_73[p80] = v85
							v_u_74 = true
							v82 = v85
						end
					end
				end
				if v82 ~= nil and v82 ~= v_u_19.None then
					v_u_75 = false
				end
			end
		end)
		if v_u_74 then
			p_u_69:merge(p_u_70, v_u_73)
			if v_u_75 then
				if v_u_7(p_u_69, v_u_29) then
					p_u_69.data[p_u_70] = nil
				else
					p_u_69.data[p_u_70] = nil
				end
				p_u_69.group:dirty(p_u_70, "__exists")
			end
			return true
		end
	end
	return false
end
function v_u_34.delete(p87, p88, p89, p90) -- name: delete
	-- upvalues: (ref) v_u_27
	local v91 = p87:lookup(p88)
	if not v91 then
		return false
	end
	local v92 = p87:getFieldValue(v91, "__typename")
	if p89 and p90 then
		p89 = p87.policies:getStoreFieldName({
			["typename"] = v92,
			["fieldName"] = p89,
			["args"] = p90
		})
	end
	local v93
	if p89 then
		v93 = {
			[p89] = v_u_27
		}
	else
		v93 = v_u_27
	end
	return p87:modify(p88, v93)
end
function v_u_34.evict(p94, p95) -- name: evict
	-- upvalues: (copy) v_u_24, (copy) v_u_7, (ref) v_u_29
	local v96 = false
	if p95.id then
		if v_u_24(p94.data, p95.id) then
			v96 = p94:delete(p95.id, p95.fieldName, p95.args)
		end
		if v_u_7(p94, v_u_29) then
			v96 = p94.parent:evict(p95) or v96
		end
		if p95.fieldName or v96 then
			p94.group:dirty(p95.id, p95.fieldName or "__exists")
		end
	end
	return v96
end
function v_u_34.clear(p97) -- name: clear
	p97:replace(nil)
end
function v_u_34.extract(p_u_98) -- name: extract
	-- upvalues: (copy) v_u_24, (copy) v_u_5
	local v99 = p_u_98:toObject()
	local v_u_100 = {}
	p_u_98:getRootIdSet():forEach(function(p101)
		-- upvalues: (ref) v_u_24, (copy) p_u_98, (copy) v_u_100
		if not v_u_24(p_u_98.policies.rootTypenamesById, p101) then
			local v102 = v_u_100
			table.insert(v102, p101)
		end
	end)
	if #v_u_100 > 0 then
		v99.__META = {
			["extraRootIds"] = v_u_5.sort(v_u_100)
		}
	end
	return v99
end
function v_u_34.replace(p_u_103, p_u_104) -- name: replace
	-- upvalues: (copy) v_u_11, (copy) v_u_24, (copy) v_u_8, (copy) v_u_5
	v_u_11(p_u_103.data, function(p105)
		-- upvalues: (copy) p_u_104, (ref) v_u_24, (copy) p_u_103
		if not (p_u_104 and v_u_24(p_u_104, p105)) then
			p_u_103:delete(p105)
		end
	end)
	if p_u_104 ~= nil then
		local v106 = p_u_104.__META
		local v_u_107 = v_u_8.assign(table.clone(p_u_104), {
			["__META"] = v_u_8.None
		})
		v_u_11(v_u_107, function(p108)
			-- upvalues: (copy) p_u_103, (copy) v_u_107
			p_u_103:merge(p108, v_u_107[p108])
		end)
		if v106 ~= nil then
			v_u_5.forEach(v106.extraRootIds, p_u_103.retain, p_u_103)
		end
	end
end
function v_u_34.getStorage(_, _, ...) -- name: getStorage
	error("not implemented abstract method")
end
function v_u_34.retain(p109, p110) -- name: retain
	-- upvalues: (copy) v_u_6
	p109.rootIds[p110] = (not v_u_6.toJSBoolean(p109.rootIds[p110]) and 0 or p109.rootIds[p110]) + 1
	return p109.rootIds[p110]
end
function v_u_34.release(p111, p112) -- name: release
	-- upvalues: (copy) v_u_6
	if p111.rootIds[p112] <= 0 then
		return 0
	end
	local v113 = p111.rootIds
	v113[p112] = v113[p112] - 1
	local v114 = p111.rootIds[p112]
	if not v_u_6.toJSBoolean(v114) then
		p111.rootIds[p112] = nil
	end
	return v114
end
function v_u_34.getRootIdSet(p115, p116) -- name: getRootIdSet
	-- upvalues: (copy) v_u_9, (copy) v_u_5, (copy) v_u_8, (copy) v_u_7, (ref) v_u_29
	if p116 == nil then
		p116 = v_u_9.new()
	end
	v_u_5.forEach(v_u_8.keys(p115.rootIds), p116.add, p116)
	if v_u_7(p115, v_u_29) then
		p115.parent:getRootIdSet(p116)
		return p116
	else
		v_u_5.forEach(v_u_8.keys(p115.policies.rootTypenamesById), p116.add, p116)
		return p116
	end
end
function v_u_34.gc(p_u_117) -- name: gc
	-- upvalues: (copy) v_u_24, (copy) v_u_5, (copy) v_u_8, (copy) v_u_6, (copy) v_u_7, (ref) v_u_29
	local v118 = p_u_117:getRootIdSet()
	local v119 = p_u_117:toObject()
	for _, v120 in v118 do
		if not v_u_24(v119, v120) then
			continue
		end
		v_u_5.forEach(v_u_8.keys(p_u_117:findChildRefIds(v120)), v118.add, v118)
		v119[v120] = nil
	end
	local v121 = v_u_8.keys(v119)
	if v_u_6.toJSBoolean(#v121) then
		while v_u_7(p_u_117, v_u_29) do
			p_u_117 = p_u_117.parent
		end
		v_u_5.forEach(v121, function(p122)
			-- upvalues: (ref) p_u_117
			return p_u_117:delete(p122)
		end)
	end
	return v121
end
function v_u_34.findChildRefIds(p123, p124) -- name: findChildRefIds
	-- upvalues: (copy) v_u_24, (copy) v_u_9, (copy) v_u_17, (copy) v_u_22, (copy) v_u_11
	if not v_u_24(p123.refs, p124) then
		p123.refs[p124] = {}
		local v125 = p123.refs[p124]
		local v126 = p123.data[p124]
		if not v126 then
			return v125
		end
		local v_u_127 = v_u_9.new({ v126 })
		for _, v_u_128 in v_u_127 do
			if v_u_17(v_u_128) then
				v125[v_u_128.__ref] = true
			end
			if not v_u_22(v_u_128) then
				continue
			end
			v_u_11(v_u_128, function(p129)
				-- upvalues: (copy) v_u_128, (ref) v_u_22, (copy) v_u_127
				local v130 = v_u_128[p129]
				if v_u_22(v130) then
					v_u_127:add(v130)
				end
			end)
		end
	end
	return p123.refs[p124]
end
function v_u_34.makeCacheKey(p131, ...) -- name: makeCacheKey
	return p131.group.keyMaker:lookupArray({ ... })
end
v1.EntityStore = v_u_34
local v_u_132 = {}
v_u_132.__index = v_u_132
function v_u_132.new(p133, p134) -- name: new
	-- upvalues: (copy) v_u_132
	local v135 = v_u_132
	local v136 = setmetatable({}, v135)
	v136.caching = p133
	v136.parent = p134
	v136.d = nil
	v136:resetCaching()
	return v136
end
function v_u_132.resetCaching(p137) -- name: resetCaching
	-- upvalues: (copy) v_u_12, (copy) v_u_15, (copy) v_u_21
	local v138
	if p137.caching then
		v138 = v_u_12()
	else
		v138 = nil
	end
	p137.d = v138
	p137.keyMaker = v_u_15.new(v_u_21)
end
function v_u_132.depend(p139, p140, p141) -- name: depend
	-- upvalues: (ref) v_u_31, (copy) v_u_25
	if p139.d then
		p139.d(v_u_31(p140, p141))
		local v142 = v_u_25(p141)
		if v142 ~= p141 then
			p139.d(v_u_31(p140, v142))
		end
		if p139.parent then
			p139.parent:depend(p140, p141)
		end
	end
end
function v_u_132.dirty(p143, p144, p145) -- name: dirty
	-- upvalues: (ref) v_u_31
	if p143.d then
		p143.d:dirty(v_u_31(p144, p145), p145 == "__exists" and "forget" or "setDirty")
	end
end
v_u_31 = function(p146, p147) -- name: makeDepKey
	return p147 .. "#" .. p146
end
function v1.maybeDependOnExistenceOfEntity(p148, p149) -- name: maybeDependOnExistenceOfEntity
	-- upvalues: (ref) v_u_33
	if v_u_33(p148) then
		p148.group:depend(p149, "__exists")
	end
end
local v_u_150 = setmetatable({}, {
	["__index"] = v_u_34
})
v_u_150.__index = v_u_150
function v_u_150.new(p151) -- name: new
	-- upvalues: (copy) v_u_34, (copy) v_u_132, (copy) v_u_150, (ref) v_u_30, (copy) v_u_15, (copy) v_u_21
	local v152 = p151.policies
	local v153 = p151.resultCaching
	local v154 = p151.seed
	local v155 = p151.resultCaching == nil and true or v153
	local v156 = v_u_34.new(v152, v_u_132.new(v155))
	local v157 = v_u_150
	local v158 = setmetatable(v156, v157)
	v158.stump = v_u_30.new(v158)
	v158.storageTrie = v_u_15.new(v_u_21)
	if v154 then
		v158:replace(v154)
	end
	return v158
end
function v_u_150.addLayer(p159, p160, p161) -- name: addLayer
	return p159.stump:addLayer(p160, p161)
end
function v_u_150.removeLayer(p162) -- name: removeLayer
	return p162
end
function v_u_150.getStorage(p163, ...) -- name: getStorage
	return p163.storageTrie:lookupArray({ ... })
end
v1.EntityStore_Root = v_u_150
v_u_29 = setmetatable({}, {
	["__index"] = v_u_34
})
v_u_29.__index = v_u_29
function v_u_29.new(p164, p165, p166, p167) -- name: new
	-- upvalues: (copy) v_u_34, (ref) v_u_29
	local v168 = v_u_34.new(p165.policies, p167)
	local v169 = v_u_29
	local v170 = setmetatable(v168, v169)
	v170.id = p164
	v170.parent = p165
	v170.replay = p166
	v170.group = p167
	p166(v170, v170)
	return v170
end
function v_u_29.addLayer(p171, p172, p173) -- name: addLayer
	-- upvalues: (ref) v_u_29
	return v_u_29.new(p172, p171, p173, p171.group)
end
function v_u_29.removeLayer(p_u_174, p175) -- name: removeLayer
	-- upvalues: (copy) v_u_11, (copy) v_u_14
	local v_u_176 = p_u_174.parent:removeLayer(p175)
	if p175 == p_u_174.id then
		if p_u_174.group.caching then
			v_u_11(p_u_174.data, function(p_u_177)
				-- upvalues: (copy) p_u_174, (copy) v_u_176, (ref) v_u_11, (ref) v_u_14
				local v_u_178 = p_u_174.data[p_u_177]
				local v_u_179 = v_u_176.lookup(v_u_176, p_u_177)
				if v_u_179 then
					if v_u_178 then
						if v_u_178 ~= v_u_179 then
							v_u_11(v_u_178, function(p180)
								-- upvalues: (ref) v_u_14, (copy) v_u_178, (copy) v_u_179, (ref) p_u_174, (copy) p_u_177
								if not v_u_14(v_u_178[p180], v_u_179[p180]) then
									p_u_174.group:dirty(p_u_177, p180)
								end
							end)
						end
					else
						p_u_174.group:dirty(p_u_177, "__exists")
						v_u_11(v_u_179, function(p181)
							-- upvalues: (ref) p_u_174, (copy) p_u_177
							p_u_174.group:dirty(p_u_177, p181)
						end)
					end
				else
					p_u_174:delete(p_u_177)
					return
				end
			end)
		end
		return v_u_176
	elseif v_u_176 == p_u_174.parent then
		return p_u_174
	else
		return v_u_176:addLayer(p_u_174.id, p_u_174.replay)
	end
end
function v_u_29.toObject(p182) -- name: toObject
	-- upvalues: (copy) v_u_8
	return v_u_8.assign({}, p182.parent:toObject(), p182.data)
end
function v_u_29.findChildRefIds(p183, p184) -- name: findChildRefIds
	-- upvalues: (copy) v_u_24, (copy) v_u_8
	local v185 = p183.parent:findChildRefIds(p184)
	local v186 = getmetatable(p183)
	local v187 = getmetatable(v186).__index
	if v_u_24(p183.data, p184) then
		v185 = v_u_8.assign({}, v185, v187.findChildRefIds(p183, p184)) or v185
	end
	return v185
end
function v_u_29.getStorage(p188, ...) -- name: getStorage
	local v189 = p188.parent
	while v189.parent do
		v189 = v189.parent
	end
	return v189:getStorage(...)
end
local v190 = {
	["__index"] = v_u_29
}
v_u_30 = setmetatable({}, v190)
v_u_30.__index = v_u_30
function v_u_30.new(p191) -- name: new
	-- upvalues: (ref) v_u_29, (copy) v_u_132, (ref) v_u_30
	local v192 = v_u_29.new("EntityStore.Stump", p191, function() end, v_u_132.new(p191.group.caching, p191.group))
	local v193 = v_u_30
	return setmetatable(v192, v193)
end
function v_u_30.removeLayer(p194) -- name: removeLayer
	return p194
end
function v_u_30.merge(p195, ...) -- name: merge
	return p195.parent:merge(...)
end
v_u_32 = function(_, p196, p197, p198) -- name: storeObjectReconciler
	-- upvalues: (copy) v_u_14
	local v199 = p196[p198]
	local v200 = p197[p198]
	if v_u_14(v199, v200) then
		return v199
	else
		return v200
	end
end
v_u_33 = function(p201) -- name: supportsResultCaching
	local v202
	if type(p201) == "table" then
		local v203 = p201.group
		if type(v203) == "table" then
			v202 = p201.group.caching == true
		else
			v202 = false
		end
	else
		v202 = false
	end
	return v202
end
v1.supportsResultCaching = v_u_33
return v1