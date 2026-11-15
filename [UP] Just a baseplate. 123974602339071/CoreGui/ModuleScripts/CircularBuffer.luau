-- Path: CoreGui.RobloxGui.Modules.DevConsole.CircularBuffer
local v1 = require(script.Parent.Components.VoiceDebug.GetFFlagVoiceDebugConsoleV2)
local v_u_2 = {}
v_u_2.__index = v_u_2
function v_u_2.new(p3) -- name: new
	-- upvalues: (copy) v_u_2
	assert(p3, "Cannot initialize CircularBuffer with nil")
	local v4 = p3 > 0
	assert(v4, "Cannot initialize CircularBuffer to size < 1")
	local v5 = {}
	local v6 = v_u_2
	setmetatable(v5, v6)
	v5._data = {}
	v5._backIndex = 0
	v5._maxSize = p3
	return v5
end
function v_u_2.reset(p7) -- name: reset
	p7._data = {}
	p7._backIndex = 0
end
function v_u_2.getSize(p8) -- name: getSize
	return #p8._data
end
function v_u_2.getMaxSize(p9) -- name: getMaxSize
	return p9._maxSize
end
function v_u_2.setSize(p10, p11) -- name: setSize
	assert(p11, "Cannot set CircularBuffer with nil")
	local v12 = p11 > 0
	assert(v12, "Cannot set CircularBuffer to size < 1")
	if p11 ~= p10._maxSize then
		local v13 = p10:iterator()
		local v14 = v13:next()
		local v15 = 0
		local v16 = {}
		while v14 and v15 < p11 do
			local v17 = v15 + 1
			v16[v17] = {
				["entry"] = v14
			}
			if v16[v15] then
				v16[v15]._next = v16[v17]
			end
			v14 = v13:next()
			v15 = v17
		end
		p10._data = v16
		p10._backIndex = v15
		p10._maxSize = p11
	end
end
function v_u_2.getFrontIndex(p18) -- name: getFrontIndex
	local v19 = p18._backIndex + 1
	return not p18._data[v19] and 1 or v19
end
function v_u_2.front(p20) -- name: front
	local v21 = p20:getFrontIndex()
	if p20._data[v21] then
		return p20._data[v21].entry
	else
		return nil
	end
end
function v_u_2.back(p22) -- name: back
	if p22._data[p22._backIndex] then
		return p22._data[p22._backIndex].entry
	else
		return nil
	end
end
function v_u_2.iterator(p23) -- name: iterator
	return {
		["data"] = p23._data[p23:getFrontIndex()],
		["next"] = function(p24) -- name: next
			local v25 = p24.data
			if v25 then
				p24.data = p24.data._next
			end
			if v25 then
				v25 = v25.entry
			end
			return v25
		end
	}
end
function v_u_2.getData(p26) -- name: getData
	return p26._data
end
if v1() then
	function v_u_2.clone(p27) -- name: clone
		-- upvalues: (copy) v_u_2
		local v28 = v_u_2.new(p27._maxSize)
		local v29 = {}
		for v30, v31 in p27._data do
			v29[v30] = {
				["entry"] = v31.entry
			}
		end
		for v32, v33 in p27._data do
			if not v33._next then
				continue
			end
			local v34 = v32 % p27._maxSize + 1
			v29[v32]._next = v29[v34]
		end
		v28._data = v29
		v28._backIndex = p27._backIndex
		return v28
	end
end
function v_u_2.at(p35, p36) -- name: at
	assert(p36, "Cannot index CircularBuffer with nil")
	local v37 = (p35:getFrontIndex() + p36 - 2) % p35._maxSize + 1
	if p35._data[v37] then
		return p35._data[v37].entry
	else
		return nil
	end
end
function v_u_2.reverseAt(p38, p39) -- name: reverseAt
	local v40 = (p38._backIndex - p39) % p38._maxSize + 1
	if p38._data[v40] then
		return p38._data[v40].entry
	else
		return nil
	end
end
function v_u_2.push_back(p41, p42) -- name: push_back
	local v43 = p41._backIndex
	local v44 = p41._backIndex + 1
	local v45 = p41._maxSize < v44 and 1 or v44
	local v46 = p41._data[v45]
	p41._data[v45] = {
		["entry"] = p42
	}
	if v43 > 0 then
		p41._data[v43]._next = p41._data[v45]
		if v46 then
			v46._next = nil
		end
	end
	p41._backIndex = v45
	if v46 then
		v46 = v46.entry
	end
	return v46
end
return v_u_2