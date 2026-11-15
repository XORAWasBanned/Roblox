-- Path: CoreGui.RobloxGui.Modules.Stats.StatsAggregator
local v1 = game:GetService("CoreGui")
local v_u_2 = require(v1.RobloxGui.Modules.Stats.StatsUtils)
local v_u_3 = {}
v_u_3.__index = v_u_3
function v_u_3.new(p4, p5, p6) -- name: new
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v7 = {}
	local v8 = v_u_3
	setmetatable(v7, v8)
	v7._statType = p4
	v7._numSamples = p5
	v7._pauseBetweenSamples = p6
	v7._statName = v_u_2.StatNames[v7._statType]
	v7._statMaxName = v_u_2.StatMaxNames[v7._statType]
	v7._samples = {}
	for v9 = 0, p5 - 1 do
		v7._samples[v9] = 0
	end
	v7._oldestIndex = 0
	v7._listeners = {}
	v7._nextListenerId = 1001
	return v7
end
function v_u_3.AddListener(p10, p11) -- name: AddListener
	local v12 = p10._nextListenerId
	p10._nextListenerId = p10._nextListenerId + 1
	p10._listeners[v12] = p11
	return v12
end
function v_u_3.RemoveListener(p13, p14) -- name: RemoveListener
	p13._listeners[p14] = nil
end
function v_u_3._notifyAllListeners(p15) -- name: _notifyAllListeners
	for _, v16 in pairs(p15._listeners) do
		v16()
	end
end
function v_u_3.StartListening(p_u_17) -- name: StartListening
	if p_u_17._listening ~= true then
		spawn(function()
			-- upvalues: (copy) p_u_17
			p_u_17._listening = true
			while p_u_17._listening do
				p_u_17:_storeStatValue((p_u_17:_getStatValue()))
				p_u_17:_notifyAllListeners()
				wait(p_u_17._pauseBetweenSamples)
			end
		end)
	end
end
function v_u_3.StopListening(p18) -- name: StopListening
	p18._listening = false
end
function v_u_3.GetValues(p19) -- name: GetValues
	local v20 = {}
	for v21 = 0, p19._numSamples - 1 do
		local v22 = (p19._oldestIndex + v21) % p19._numSamples
		v20[v21 + 1] = p19._samples[v22]
	end
	return v20
end
function v_u_3.GetAverage(p23) -- name: GetAverage
	local v24 = 0
	for v25 = 0, p23._numSamples - 1 do
		v24 = v24 + p23._samples[v25]
	end
	return v24 / p23._numSamples
end
function v_u_3.GetLatestValue(p26) -- name: GetLatestValue
	local v27 = (p26._oldestIndex + p26._numSamples - 1) % p26._numSamples
	return p26._samples[v27]
end
function v_u_3._storeStatValue(p28, p29) -- name: _storeStatValue
	p28._samples[p28._oldestIndex] = p29
	p28._oldestIndex = (p28._oldestIndex + 1) % p28._numSamples
end
function v_u_3._getStatValue(p30) -- name: _getStatValue
	local v31 = game:GetService("Stats")
	if v31 == nil then
		return 0
	end
	local v32 = v31:FindFirstChild("PerformanceStats")
	if v32 == nil then
		return 0
	end
	local v33 = v32:FindFirstChild(p30._statName)
	return v33 == nil and 0 or v33:GetValue()
end
function v_u_3.GetTarget(p34) -- name: GetTarget
	local v35 = game:GetService("Stats")
	if v35 == nil then
		return 0
	end
	local v36 = v35:FindFirstChild("PerformanceStats")
	if v36 == nil then
		return 0
	end
	local v37 = v36:FindFirstChild(p34._statMaxName)
	return v37 == nil and 0 or v37:GetValue()
end
return v_u_3