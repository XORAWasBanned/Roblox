-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.node.DefinitionMap
local v1 = script:FindFirstAncestor("CommonMark")
local v_u_2 = require(v1.internal.util.Escaping)
local v_u_3 = {}
v_u_3.__index = v_u_3
function v_u_3.new(p4) -- name: new
	-- upvalues: (copy) v_u_3
	local v5 = v_u_3
	return setmetatable({
		["_type"] = p4,
		["_keys"] = {},
		["_definitions"] = {}
	}, v5)
end
function v_u_3.getType(p6) -- name: getType
	return p6._type
end
function v_u_3.addAll(p7, p8) -- name: addAll
	for _, v9 in ipairs(p8._keys) do
		local v10 = p8._definitions[v9]
		if p7._definitions[v9] ~= nil then
			continue
		end
		local v11 = p7._keys
		table.insert(v11, v9)
		p7._definitions[v9] = v10
	end
end
function v_u_3.putIfAbsent(p12, p13, p14) -- name: putIfAbsent
	-- upvalues: (copy) v_u_2
	local v15 = v_u_2.normalizeLabelContent(p13)
	local v16 = p12._definitions[v15]
	if v16 ~= nil then
		return v16
	end
	local v17 = p12._keys
	table.insert(v17, v15)
	p12._definitions[v15] = p14
	return nil
end
function v_u_3.get(p18, p19) -- name: get
	-- upvalues: (copy) v_u_2
	local v20 = v_u_2.normalizeLabelContent(p19)
	return p18._definitions[v20]
end
function v_u_3.keySet(p21) -- name: keySet
	return table.clone(p21._keys)
end
function v_u_3.values(p22) -- name: values
	local v23 = table.create(#p22._keys)
	for v24, v25 in ipairs(p22._keys) do
		v23[v24] = p22._definitions[v25]
	end
	return v23
end
return v_u_3