-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.port.LinkedHashMap
local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new() -- name: new
	-- upvalues: (copy) v_u_1
	local v2 = v_u_1
	return setmetatable({
		["_keys"] = {},
		["_present"] = {},
		["_values"] = {}
	}, v2)
end
function v_u_1.newMap(p3) -- name: newMap
	-- upvalues: (copy) v_u_1
	local v4 = v_u_1.new()
	for v5, v6 in p3:entrySet() do
		v4:put(v5, v6)
	end
	return v4
end
local v7 = table.freeze
local v8 = {
	["_keys"] = table.freeze({}),
	["_present"] = table.freeze({}),
	["_values"] = table.freeze({})
}
local v_u_9 = v7((setmetatable(v8, v_u_1)))
function v_u_1.of() -- name: of
	-- upvalues: (copy) v_u_9
	return v_u_9
end
function v_u_1.put(p10, p11, p12) -- name: put
	local v13 = p10._values[p11]
	if p10._present[p11] == nil then
		local v14 = p10._keys
		table.insert(v14, p11)
		p10._present[p11] = true
	end
	p10._values[p11] = p12
	return v13
end
function v_u_1.remove(p15, p16) -- name: remove
	if p15._present[p16] == nil then
		return nil
	end
	local v17 = p15._values[p16]
	table.remove(p15._keys, table.find(p15._keys, p16))
	p15._present[p16] = nil
	p15._values[p16] = nil
	return v17
end
function v_u_1.get(p18, p19) -- name: get
	return p18._values[p19]
end
function v_u_1.containsKey(p20, p21) -- name: containsKey
	return p20._present[p21] ~= nil
end
function v_u_1.size(p22) -- name: size
	return #p22._keys
end
function v_u_1.isEmpty(p23) -- name: isEmpty
	return #p23._keys == 0
end
function v_u_1.entrySet(p24) -- name: entrySet
	local v_u_25 = p24._keys
	local v_u_26 = p24._values
	local v_u_27 = 0
	return function()
		-- upvalues: (ref) v_u_27, (copy) v_u_25, (copy) v_u_26
		v_u_27 = v_u_27 + 1
		local v28 = v_u_25[v_u_27]
		if v28 == nil then
			return nil, nil
		else
			return v28, v_u_26[v28]
		end
	end
end
return v_u_1