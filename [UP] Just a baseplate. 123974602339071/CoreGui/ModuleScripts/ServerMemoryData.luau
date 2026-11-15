-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.Memory.ServerMemoryData
local v_u_1 = require(script.Parent.Parent.Parent.Signal)
local v_u_2 = require(script.Parent.Parent.Parent.CircularBuffer)
local v_u_3 = require(script.Parent.Parent.Parent.Constants).MemoryFormatting.ChartHeaderNames
local v4 = settings()
local v_u_5 = tonumber(v4:GetFVariable("NewDevConsoleMaxGraphCount"))
local v_u_10 = {
	[v_u_3[1]] = function(p6, p7)
		return p6.name < p7.name
	end,
	[v_u_3[2]] = function(p8, p9)
		return p8.dataStats.dataSet:back().data < p9.dataStats.dataSet:back().data
	end
}
local v_u_11 = require(script.Parent.Parent.Parent.Util.getClientReplicator)
local v_u_12 = {}
v_u_12.__index = v_u_12
function v_u_12.new() -- name: new
	-- upvalues: (copy) v_u_12, (copy) v_u_1, (copy) v_u_3
	local v13 = {}
	local v14 = v_u_12
	setmetatable(v13, v14)
	v13._init = false
	v13._isRunning = false
	v13._totalMemory = 0
	v13._memoryData = {}
	v13._memoryDataSorted = {}
	v13._coreTreeData = {}
	v13._coreTreeDataSorted = {}
	v13._placeTreeData = {}
	v13._placeTreeDataSorted = {}
	v13._placeScriptTreeData = {}
	v13._placeScriptTreeDataSorted = {}
	v13._coreScriptTreeData = {}
	v13._coreScriptTreeDataSorted = {}
	v13._treeViewUpdated = v_u_1.new()
	v13._sortType = v_u_3[1]
	return v13
end
function v_u_12.updateEntry(p15, p16, p17, p18, p19) -- name: updateEntry
	-- upvalues: (copy) v_u_2, (copy) v_u_5
	if p16[p18] then
		local v20 = p16[p18].max
		local v21 = p16[p18].min
		local v22 = {
			["data"] = p19,
			["time"] = p15._lastUpdate
		}
		local v23 = p16[p18].dataSet:push_back(v22)
		if v23 then
			local v24 = p16[p18].dataSet:iterator()
			local v25 = v24:next()
			if v20 == v23.data then
				local v26 = v21
				while v25 do
					v21 = v25.data < v21 and v21 and v21 or v25.data
					v25 = v24:next()
				end
				v20 = v21
				v21 = v26
			end
			if v21 == v23.data then
				local v27 = v20
				while v25 do
					v20 = v20 < v25.data and v20 and v20 or v25.data
					v25 = v24:next()
				end
				v21 = v20
				v20 = v27
			end
		end
		p16[p18].max = v20 < p19 and p19 and p19 or v20
		local v28 = p16[p18]
		if v21 < p19 then
			p19 = v21 or p19
		end
		v28.min = p19
	else
		local v29 = v_u_2.new(v_u_5)
		v29:push_back({
			["data"] = p19,
			["time"] = p15._lastUpdate
		})
		p16[p18] = {
			["min"] = p19,
			["max"] = p19,
			["dataSet"] = v29
		}
		local v30 = {
			["name"] = p18,
			["dataStats"] = p16[p18]
		}
		table.insert(p17, v30)
	end
end
function v_u_12.updateEntryList(p31, p32, p33, p34) -- name: updateEntryList
	local v35 = 0
	for v36, v37 in pairs(p34) do
		local v38 = v37 / 1048576
		v35 = v35 + v38
		p31:updateEntry(p32, p33, v36, v38)
	end
	for v39, _ in pairs(p32) do
		if p34[v39] ~= nil then
			continue
		end
		p32[v39] = nil
		for v40, v41 in ipairs(p33) do
			if v39 ~= v41.name then
				continue
			end
			table.remove(p33, v40)
		end
	end
	return v35
end
function v_u_12.updateWithTreeStats(p42, p43) -- name: updateWithTreeStats
	local v44 = {
		["PlaceMemory"] = 0,
		["CoreMemory"] = 0,
		["UntrackedMemory"] = 0,
		["PlaceScriptMemory"] = 0,
		["CoreScriptMemory"] = 0
	}
	for v45, v46 in pairs(p43) do
		if v45 == "totalServerMemory" then
			p42._totalMemory = v46 / 1048576
		elseif v45 == "developerTags" then
			v44.PlaceMemory = p42:updateEntryList(p42._placeTreeData, p42._placeTreeDataSorted, v46)
		elseif v45 == "internalCategories" then
			v44.CoreMemory = p42:updateEntryList(p42._coreTreeData, p42._coreTreeDataSorted, v46)
		elseif v45 == "placeScriptMemoryCategories" then
			v44.PlaceScriptMemory = p42:updateEntryList(p42._placeScriptTreeData, p42._placeScriptTreeDataSorted, v46)
		else
			if v45 ~= "coreScriptMemoryCategories" then
				continue
			end
			v44.CoreScriptMemory = p42:updateEntryList(p42._coreScriptTreeData, p42._coreScriptTreeDataSorted, v46)
		end
	end
	v44.UntrackedMemory = p42._totalMemory - v44.PlaceMemory - v44.CoreMemory
	if p42._init then
		for v47, v48 in pairs(v44) do
			p42:updateEntry(p42._memoryData.Memory.children, p42._memoryData.Memory.sortedChildren, v47, v48)
		end
		p42:updateEntry(p42._memoryData, p42._memoryDataSorted, "Memory", p42._totalMemory)
	else
		local v49 = {}
		local v50 = {}
		for v51, v52 in pairs(v44) do
			p42:updateEntry(v49, v50, v51, v52)
		end
		p42:updateEntry(p42._memoryData, p42._memoryDataSorted, "Memory", p42._totalMemory)
		v49.PlaceMemory.children = p42._placeTreeData
		v49.PlaceMemory.sortedChildren = p42._placeTreeDataSorted
		v49.CoreMemory.children = p42._coreTreeData
		v49.CoreMemory.sortedChildren = p42._coreTreeDataSorted
		v49.PlaceScriptMemory.children = p42._placeScriptTreeData
		v49.PlaceScriptMemory.sortedChildren = p42._placeScriptTreeDataSorted
		v49.CoreScriptMemory.children = p42._coreScriptTreeData
		v49.CoreScriptMemory.sortedChildren = p42._coreScriptTreeDataSorted
		p42._memoryData.Memory.children = v49
		p42._memoryData.Memory.sortedChildren = v50
		p42._init = true
	end
end
function v_u_12.totalMemSignal(p53) -- name: totalMemSignal
	return p53._totalMemoryUpdated
end
function v_u_12.treeUpdatedSignal(p54) -- name: treeUpdatedSignal
	return p54._treeViewUpdated
end
function v_u_12.getSortType(p55) -- name: getSortType
	return p55._sortType
end
local function v_u_59(p56, p57) -- name: recursiveSort
	-- upvalues: (copy) v_u_59
	table.sort(p56, p57)
	for _, v58 in pairs(p56) do
		if not v58.dataStats.sortedChildren then
			continue
		end
		v_u_59(v58.dataStats.sortedChildren, p57)
	end
end
function v_u_12.setSortType(p60, p61) -- name: setSortType
	-- upvalues: (copy) v_u_10, (copy) v_u_59
	if v_u_10[p61] then
		p60._sortType = p61
		v_u_59(p60._memoryDataSorted, v_u_10[p60._sortType])
	else
		error(string.format("attempted to pass invalid sortType: %s", (tostring(p61))), 2)
	end
end
function v_u_12.getMemoryData(p62) -- name: getMemoryData
	return p62._memoryDataSorted
end
function v_u_12.isRunning(p63) -- name: isRunning
	return p63._isRunning
end
function v_u_12.start(p_u_64) -- name: start
	-- upvalues: (copy) v_u_11
	local v65 = v_u_11()
	if v65 and not p_u_64._statsListenerConnection then
		p_u_64._statsListenerConnection = v65.StatsReceived:connect(function(p66)
			-- upvalues: (copy) p_u_64
			if p66.ServerMemoryTree then
				p_u_64._lastUpdate = os.time()
				local v67 = p66.ServerMemoryTree
				if v67 then
					p_u_64:updateWithTreeStats(v67)
					p_u_64._treeViewUpdated:Fire(p_u_64._memoryDataSorted)
				end
			end
		end)
		v65:RequestServerStats(true)
		p_u_64._isRunning = true
	end
end
function v_u_12.stop(p68) -- name: stop
	-- upvalues: (copy) v_u_11
	local v69 = v_u_11()
	if v69 then
		v69:RequestServerStats(false)
		p68._statsListenerConnection:Disconnect()
		p68._isRunning = false
	end
end
return v_u_12