-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.ServerStats.ServerStatsData
local v_u_1 = require(script.Parent.Parent.Parent.CircularBuffer)
local v_u_2 = require(script.Parent.Parent.Parent.Signal)
local v3 = settings()
local v_u_4 = tonumber(v3:GetFVariable("NewDevConsoleMaxGraphCount"))
local v_u_5 = require(script.Parent.Parent.Parent.Util.getClientReplicator)
local v_u_6 = {}
v_u_6.__index = v_u_6
function v_u_6.new() -- name: new
	-- upvalues: (copy) v_u_6, (copy) v_u_2
	local v7 = {}
	local v8 = v_u_6
	setmetatable(v7, v8)
	v7._serverStatsUpdated = v_u_2.new()
	v7._serverStatsPing = v_u_2.new()
	v7._serverStatsData = {}
	v7._serverStatsDataCount = 0
	v7._lastUpdateTime = 0
	v7._isRunning = false
	return v7
end
function v_u_6.avgPing(p9) -- name: avgPing
	return p9._serverStatsPing
end
function v_u_6.Signal(p10) -- name: Signal
	return p10._serverStatsUpdated
end
function v_u_6.getCurrentData(p11) -- name: getCurrentData
	return p11._serverStatsData
end
function v_u_6.updateValue(p12, p13, p14) -- name: updateValue
	-- upvalues: (copy) v_u_1, (copy) v_u_4
	if p12._serverStatsData[p13] then
		local v15 = p12._serverStatsData[p13]
		local v16 = v15.max
		local v17 = v15.min
		local v18 = {
			["value"] = p14,
			["time"] = p12._lastUpdateTime
		}
		local v19 = p12._serverStatsData[p13].dataSet:push_back(v18)
		if v19 then
			local v20 = p12._serverStatsData[p13].dataSet:iterator()
			local v21 = v20:next()
			if v16 == v19.value then
				local v22 = v17
				while v21 do
					v17 = v21.value < v17 and v17 and v17 or v21.value
					v21 = v20:next()
				end
				v16 = v17
				v17 = v22
			end
			if v17 == v19.value then
				local v23 = v16
				while v21 do
					v16 = v16 < v21.value and v16 and v16 or v21.value
					v21 = v20:next()
				end
				v17 = v16
				v16 = v23
			end
		end
		p12._serverStatsData[p13].max = v16 < p14 and p14 and p14 or v16
		local v24 = p12._serverStatsData[p13]
		if v17 < p14 then
			p14 = v17 or p14
		end
		v24.min = p14
	else
		local v25 = v_u_1.new(v_u_4)
		v25:push_back({
			["value"] = p14,
			["time"] = p12._lastUpdateTime
		})
		p12._serverStatsData[p13] = {
			["max"] = p14,
			["min"] = p14,
			["dataSet"] = v25
		}
	end
end
function v_u_6.isRunning(p26) -- name: isRunning
	return p26._isRunning
end
function v_u_6.start(p_u_27) -- name: start
	-- upvalues: (copy) v_u_5
	local v28 = v_u_5()
	if v28 and not p_u_27._statsListenerConnection then
		p_u_27._statsListenerConnection = v28.StatsReceived:connect(function(p29)
			-- upvalues: (copy) p_u_27
			if p29 then
				p_u_27._lastUpdateTime = os.time()
				local v30 = 0
				for v31, v32 in pairs(p29) do
					if type(v32) ~= "number" then
						continue
					end
					p_u_27:updateValue(v31, v32)
					v30 = v30 + 1
				end
				p_u_27._serverStatsDataCount = v30
				p_u_27._serverStatsUpdated:Fire(p_u_27._serverStatsData)
				if p_u_27._serverStatsData["Avg Data Ping ms"] then
					p_u_27._serverStatsPing:Fire(p_u_27._serverStatsData["Avg Data Ping ms"].dataSet:back().value)
				end
			end
		end)
		v28:RequestServerStats(true)
		p_u_27._isRunning = true
	end
end
function v_u_6.stop(p33) -- name: stop
	if p33._statsListenerConnection then
		p33._statsListenerConnection:Disconnect()
		p33._statsListenerConnection = nil
	end
	p33._isRunning = false
end
return v_u_6