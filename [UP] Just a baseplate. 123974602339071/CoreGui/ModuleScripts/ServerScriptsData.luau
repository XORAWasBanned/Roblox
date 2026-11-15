-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.Scripts.ServerScriptsData
local v_u_1 = require(script.Parent.Parent.Parent.CircularBuffer)
local v_u_2 = require(script.Parent.Parent.Parent.Signal)
local v3 = require(script.Parent.Parent.Parent.Constants)
local v4 = settings()
local v_u_5 = tonumber(v4:GetFVariable("NewDevConsoleMaxGraphCount"))
local v_u_6 = v3.ServerScriptsFormatting.ChartHeaderNames
local v_u_13 = {
	[v_u_6[1]] = function(p7, p8)
		return p7.dataStats.dataSet:back().name < p8.dataStats.dataSet:back().name
	end,
	[v_u_6[2]] = function(p9, p10)
		return p9.dataStats.dataSet:back().data[1] < p10.dataStats.dataSet:back().data[1]
	end,
	[v_u_6[3]] = function(p11, p12)
		return p11.dataStats.dataSet:back().data[2] < p12.dataStats.dataSet:back().data[2]
	end
}
local v_u_14 = require(script.Parent.Parent.Parent.Util.minOfTable)
local v_u_15 = require(script.Parent.Parent.Parent.Util.maxOfTable)
local v_u_16 = require(script.Parent.Parent.Parent.Util.getClientReplicator)
local v_u_17 = {}
v_u_17.__index = v_u_17
function v_u_17.new() -- name: new
	-- upvalues: (copy) v_u_17, (copy) v_u_2, (copy) v_u_6
	local v18 = {}
	local v19 = v_u_17
	setmetatable(v18, v19)
	v18._serverScriptsUpdated = v_u_2.new()
	v18._serverScriptsData = {}
	v18._lastUpdate = 0
	v18._sortedScriptsData = {}
	v18._sortType = v_u_6[1]
	v18._isRunning = false
	return v18
end
function v_u_17.setSortType(p20, p21) -- name: setSortType
	-- upvalues: (copy) v_u_13
	if v_u_13[p21] then
		p20._sortType = p21
		table.sort(p20._sortedScriptsData, v_u_13[p20._sortType])
	else
		error(string.format("attempted to pass invalid sortType: %s", (tostring(p21))), 2)
	end
end
function v_u_17.getSortType(p22) -- name: getSortType
	return p22._sortType
end
function v_u_17.Signal(p23) -- name: Signal
	return p23._serverScriptsUpdated
end
function v_u_17.getCurrentData(p24) -- name: getCurrentData
	return p24._sortedScriptsData
end
function v_u_17.updateScriptsData(p25, p26) -- name: updateScriptsData
	-- upvalues: (copy) v_u_1, (copy) v_u_5, (copy) v_u_15, (copy) v_u_14
	p25._lastUpdate = os.time()
	for v27, v28 in pairs(p26) do
		if p25._serverScriptsData[v27] then
			local v29 = {}
			for v30, v31 in pairs(p25._serverScriptsData[v27].max) do
				v29[v30] = v31
			end
			local v32 = {}
			for v33, v34 in pairs(p25._serverScriptsData[v27].min) do
				v32[v33] = v34
			end
			local v35 = {
				["data"] = v28,
				["time"] = p25._lastUpdate
			}
			local v36 = p25._serverScriptsData[v27].dataSet:push_back(v35)
			if v36 then
				for v37, v38 in pairs(v36.data) do
					if v29[v37] ~= v38 then
						continue
					end
					local v39 = p25._serverScriptsData[v27].dataSet:iterator()
					local v40 = v39:next()
					v29[v37] = v32[v37]
					while v40 do
						v29[v37] = v40.data[v37] < v29[v37] and v29[v37] or v40.data[v37]
						v40 = v39:next()
					end
				end
				for v41, v42 in pairs(v36.data) do
					if v32[v41] ~= v42 then
						continue
					end
					local v43 = p25._serverScriptsData[v27].dataSet:iterator()
					local v44 = v43:next()
					v32[v41] = v29[v41]
					while v44 do
						v32[v41] = v32[v41] < v44.data[v41] and v32[v41] or v44.data[v41]
						v44 = v43:next()
					end
				end
			end
			p25._serverScriptsData[v27].max = v_u_15(v29, v28)
			p25._serverScriptsData[v27].min = v_u_14(v32, v28)
		else
			local v45 = v_u_1.new(v_u_5)
			v45:push_back({
				["data"] = v28,
				["time"] = p25._lastUpdate
			})
			p25._serverScriptsData[v27] = {
				["max"] = v28,
				["min"] = v28,
				["dataSet"] = v45
			}
			local v46 = {
				["name"] = v27,
				["dataStats"] = p25._serverScriptsData[v27]
			}
			local v47 = p25._sortedScriptsData
			table.insert(v47, v46)
		end
	end
end
function v_u_17.isRunning(p48) -- name: isRunning
	return p48._isRunning
end
function v_u_17.start(p_u_49) -- name: start
	-- upvalues: (copy) v_u_16
	local v50 = v_u_16()
	if v50 and not p_u_49._statsListenerConnection then
		p_u_49._statsListenerConnection = v50.StatsReceived:connect(function(p51)
			-- upvalues: (copy) p_u_49
			if p51 then
				p_u_49._lastUpdate = os.time()
				local v52 = p51.Scripts
				if v52 then
					p_u_49:updateScriptsData(v52)
				end
				p_u_49._serverScriptsUpdated:Fire(p_u_49._sortedScriptsData)
			end
		end)
		v50:RequestServerStats(true)
		p_u_49._isRunning = true
	end
end
function v_u_17.stop(p53) -- name: stop
	if p53._statsListenerConnection then
		p53._statsListenerConnection:Disconnect()
		p53._statsListenerConnection = nil
	end
	p53._isRunning = false
end
return v_u_17