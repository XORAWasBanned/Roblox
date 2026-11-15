-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.DataStores.DataStoresData
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
	v7._dataStoresUpdated = v_u_2.new()
	v7._dataStoresData = {}
	v7._dataStoresDataCount = 0
	v7._lastUpdateTime = 0
	v7._isRunning = false
	return v7
end
function v_u_6.Signal(p9) -- name: Signal
	return p9._dataStoresUpdated
end
function v_u_6.getCurrentData(p10) -- name: getCurrentData
	return p10._dataStoresData, p10._dataStoresDataCount
end
function v_u_6.updateValue(p11, p12, p13) -- name: updateValue
	-- upvalues: (copy) v_u_1, (copy) v_u_4
	if p11._dataStoresData[p12] then
		local v14 = p11._dataStoresData[p12]
		local v15 = v14.max
		local v16 = v14.min
		local v17 = {
			["value"] = p13,
			["time"] = p11._lastUpdateTime
		}
		local v18 = p11._dataStoresData[p12].dataSet:push_back(v17)
		if v18 then
			local v19 = p11._dataStoresData[p12].dataSet:iterator()
			local v20 = v19:next()
			if v15 == v18.value then
				local v21 = v16
				while v20 do
					v16 = v20.value < v16 and v16 and v16 or v20.value
					v20 = v19:next()
				end
				v15 = v16
				v16 = v21
			end
			if v16 == v18.value then
				local v22 = v15
				while v20 do
					v15 = v15 < v20.value and v15 and v15 or v20.value
					v20 = v19:next()
				end
				v16 = v15
				v15 = v22
			end
		end
		p11._dataStoresData[p12].max = v15 < p13 and p13 and p13 or v15
		local v23 = p11._dataStoresData[p12]
		if v16 < p13 then
			p13 = v16 or p13
		end
		v23.min = p13
	else
		local v24 = v_u_1.new(v_u_4)
		v24:push_back({
			["value"] = p13,
			["time"] = p11._lastUpdateTime
		})
		p11._dataStoresData[p12] = {
			["max"] = p13,
			["min"] = p13,
			["dataSet"] = v24
		}
	end
end
function v_u_6.isRunning(p25) -- name: isRunning
	return p25._isRunning
end
function v_u_6.start(p_u_26) -- name: start
	-- upvalues: (copy) v_u_5
	local v27 = v_u_5()
	if v27 and not p_u_26._statsListenerConnection then
		p_u_26._statsListenerConnection = v27.StatsReceived:connect(function(p28)
			-- upvalues: (copy) p_u_26
			local v29 = p28.DataStoreBudget
			p_u_26._lastUpdateTime = os.time()
			if v29 then
				local v30 = 0
				for v31, v32 in pairs(v29) do
					if type(v32) ~= "number" then
						continue
					end
					p_u_26:updateValue(v31, v32)
					v30 = v30 + 1
				end
				p_u_26._dataStoresDataCount = v30
				p_u_26._dataStoresUpdated:Fire(p_u_26._dataStoresData, p_u_26._dataStoresDataCount)
			end
		end)
		v27:RequestServerStats(true)
		p_u_26._isRunning = true
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