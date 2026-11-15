-- Path: CoreGui.RobloxGui.Modules.Stats.StatsAggregatorManager
local v1 = game:GetService("CoreGui")
local v_u_2 = require(v1.RobloxGui.Modules.Stats.StatsUtils)
local v_u_3 = require(v1.RobloxGui.Modules.Stats.StatsAggregator)
local v_u_4 = require(v1.RobloxGui.Modules.Flags.GetFFlagLazyPerfStatsInit)
local v_u_5 = {}
v_u_5.__index = v_u_5
v_u_5.SecondsBetweenUpdate = 1
v_u_5.NumSamplesToKeep = 20
local v_u_6 = nil
function v_u_5.getSingleton() -- name: getSingleton
	-- upvalues: (ref) v_u_6, (copy) v_u_5, (copy) v_u_4
	if v_u_6 == nil then
		v_u_6 = v_u_5.__new()
		if not v_u_4() then
			v_u_6:StartListening()
		end
	end
	return v_u_6
end
function v_u_5.__new() -- name: __new
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_3
	local v7 = {}
	local v8 = v_u_5
	setmetatable(v7, v8)
	v7._statsAggregators = {}
	for _, v9 in ipairs(v_u_2.AllStatTypes) do
		local v10 = v_u_3.new(v9, v_u_5.NumSamplesToKeep, v_u_5.SecondsBetweenUpdate)
		v7._statsAggregators[v9] = v10
	end
	return v7
end
function v_u_5.StartListening(p11) -- name: StartListening
	for _, v12 in pairs(p11._statsAggregators) do
		v12:StartListening()
	end
end
function v_u_5.StopListening(p13) -- name: StopListening
	for _, v14 in pairs(p13._statsAggregators) do
		v14:StopListening()
	end
end
function v_u_5.GetAggregator(p15, p16) -- name: GetAggregator
	return p15._statsAggregators[p16]
end
return v_u_5