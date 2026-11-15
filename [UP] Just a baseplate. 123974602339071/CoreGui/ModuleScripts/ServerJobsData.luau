-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.ServerJobs.ServerJobsData
local v_u_1 = require(script.Parent.Parent.Parent.CircularBuffer)
local v_u_2 = require(script.Parent.Parent.Parent.Signal)
local v_u_3 = require(script.Parent.Parent.Parent.Constants).ServerJobsFormatting.ChartHeaderNames
local v4 = settings()
local v_u_5 = tonumber(v4:GetFVariable("NewDevConsoleMaxGraphCount"))
local v_u_14 = {
	[v_u_3[1]] = function(p6, p7)
		return p6.name < p7.name
	end,
	[v_u_3[2]] = function(p8, p9)
		return p8.dataStats.dataSet:back().data[1] < p9.dataStats.dataSet:back().data[1]
	end,
	[v_u_3[3]] = function(p10, p11)
		return p10.dataStats.dataSet:back().data[2] < p11.dataStats.dataSet:back().data[2]
	end,
	[v_u_3[4]] = function(p12, p13)
		return p12.dataStats.dataSet:back().data[3] < p13.dataStats.dataSet:back().data[3]
	end
}
local v_u_15 = require(script.Parent.Parent.Parent.Util.minOfTable)
local v_u_16 = require(script.Parent.Parent.Parent.Util.maxOfTable)
local v_u_17 = require(script.Parent.Parent.Parent.Util.getClientReplicator)
local v_u_18 = {}
v_u_18.__index = v_u_18
function v_u_18.new() -- name: new
	-- upvalues: (copy) v_u_18, (copy) v_u_2, (copy) v_u_3
	local v19 = {}
	local v20 = v_u_18
	setmetatable(v19, v20)
	v19._serverJobsUpdated = v_u_2.new()
	v19._serverJobsData = {}
	v19._sortedJobsData = {}
	v19._sortType = v_u_3[1]
	v19._lastUpdate = 0
	v19._isRunning = false
	return v19
end
function v_u_18.setSortType(p21, p22) -- name: setSortType
	-- upvalues: (copy) v_u_14
	if v_u_14[p22] then
		p21._sortType = p22
		table.sort(p21._sortedJobsData, v_u_14[p21._sortType])
	else
		error(string.format("attempted to pass invalid sortType: %s", (tostring(p22))), 2)
	end
end
function v_u_18.getSortType(p23) -- name: getSortType
	return p23._sortType
end
function v_u_18.Signal(p24) -- name: Signal
	return p24._serverJobsUpdated
end
function v_u_18.getCurrentData(p25) -- name: getCurrentData
	return p25._sortedJobsData
end
function v_u_18.updateServerJobsData(p26, p27) -- name: updateServerJobsData
	-- upvalues: (copy) v_u_1, (copy) v_u_5, (copy) v_u_16, (copy) v_u_15
	p26._lastUpdate = os.time()
	for v28, v29 in pairs(p27) do
		if p26._serverJobsData[v28] then
			local v30 = {}
			for v31, v32 in pairs(p26._serverJobsData[v28].max) do
				v30[v31] = v32
			end
			local v33 = {}
			for v34, v35 in pairs(p26._serverJobsData[v28].min) do
				v33[v34] = v35
			end
			local v36 = {
				["data"] = v29,
				["time"] = p26._lastUpdate
			}
			local v37 = p26._serverJobsData[v28].dataSet:push_back(v36)
			if v37 then
				for v38, v39 in pairs(v37.data) do
					if v30[v38] ~= v39 then
						continue
					end
					local v40 = p26._serverJobsData[v28].dataSet:iterator()
					local v41 = v40:next()
					v30[v38] = v33[v38]
					while v41 do
						v30[v38] = v41.data[v38] < v30[v38] and v30[v38] or v41.data[v38]
						v41 = v40:next()
					end
				end
				for v42, v43 in pairs(v37.data) do
					if v33[v42] ~= v43 then
						continue
					end
					local v44 = p26._serverJobsData[v28].dataSet:iterator()
					local v45 = v44:next()
					v33[v42] = v30[v42]
					while v45 do
						v33[v42] = v33[v42] < v45.data[v42] and v33[v42] or v45.data[v42]
						v45 = v44:next()
					end
				end
			end
			p26._serverJobsData[v28].max = v_u_16(v30, v29)
			p26._serverJobsData[v28].min = v_u_15(v33, v29)
		else
			local v46 = v_u_1.new(v_u_5)
			v46:push_back({
				["data"] = v29,
				["time"] = p26._lastUpdate
			})
			p26._serverJobsData[v28] = {
				["max"] = v29,
				["min"] = v29,
				["dataSet"] = v46
			}
			local v47 = {
				["name"] = v28,
				["dataStats"] = p26._serverJobsData[v28]
			}
			local v48 = p26._sortedJobsData
			table.insert(v48, v47)
		end
	end
end
function v_u_18.isRunning(p49) -- name: isRunning
	return p49._isRunning
end
function v_u_18.start(p_u_50) -- name: start
	-- upvalues: (copy) v_u_17
	local v51 = v_u_17()
	if v51 and not p_u_50._statsListenerConnection then
		p_u_50._statsListenerConnection = v51.StatsReceived:connect(function(p52)
			-- upvalues: (copy) p_u_50
			local v53 = p52.Jobs
			if v53 then
				p_u_50:updateServerJobsData(v53)
				p_u_50._serverJobsUpdated:Fire(p_u_50._sortedJobsData)
			end
		end)
		v51:RequestServerStats(true)
		p_u_50._isRunning = true
	end
end
function v_u_18.stop(p54) -- name: stop
	if p54._statsListenerConnection then
		p54._statsListenerConnection:Disconnect()
		p54._statsListenerConnection = nil
		p54._isRunning = false
	end
end
return v_u_18