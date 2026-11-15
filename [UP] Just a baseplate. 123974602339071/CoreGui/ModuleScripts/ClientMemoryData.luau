-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.Memory.ClientMemoryData
local v_u_1 = require(script.Parent.Flags.FFlagDevConsoleKeyCollisionFix)
local v_u_2 = require(script.Parent.Parent.Parent.Signal)
local v_u_3 = game:GetService("SoundService")
local v_u_4 = game:GetService("TextService")
local v_u_5 = game:GetService("MeshContentProvider")
local v_u_6 = game:GetService("KeyframeSequenceProvider")
local v_u_7 = game:GetService("Stats")
local v_u_8 = require(script.Parent.Parent.Parent.Parent.Stats.StatsUtils)
local v_u_9 = require(script.Parent.Parent.Parent.CircularBuffer)
local v_u_10 = require(script.Parent.Parent.Parent.Constants).MemoryFormatting.ChartHeaderNames
local v11 = settings()
local v_u_12 = tonumber(v11:GetFVariable("NewDevConsoleMaxGraphCount"))
local v_u_17 = {
	[v_u_10[1]] = function(p13, p14)
		return p13.name < p14.name
	end,
	[v_u_10[2]] = function(p15, p16)
		return p15.dataStats.dataSet:back().data < p16.dataStats.dataSet:back().data
	end
}
local v_u_18 = {}
v_u_18.__index = v_u_18
function v_u_18.new() -- name: new
	-- upvalues: (copy) v_u_18, (copy) v_u_2, (copy) v_u_10
	local v19 = {}
	local v20 = v_u_18
	setmetatable(v19, v20)
	v19._pollingId = 0
	v19._totalMemory = 0
	v19._memoryData = {}
	v19._memoryDataSorted = {}
	v19._treeViewUpdatedSignal = v_u_2.new()
	v19._totalMemoryUpdated = v_u_2.new()
	v19._sortType = v_u_10[1]
	v19._isRunning = false
	v19._doGranularMemUpdate = {}
	v19._granularMemTable = {}
	return v19
end
local function v_u_27() -- name: fetchSoundMemoryData
	-- upvalues: (copy) v_u_3
	local v21 = v_u_3:GetSoundMemoryData()
	local v22 = {}
	for v23, v24 in pairs(v21) do
		table.insert(v22, {
			["name"] = v23,
			["value"] = v24
		})
	end
	table.sort(v22, function(p25, p26)
		return p25.value > p26.value
	end)
	return v22
end
local function v_u_39() -- name: fetchGraphicsTextureMemoryData
	-- upvalues: (copy) v_u_7
	local v28 = v_u_7:GetPaginatedMemoryByTexture(Enum.TextureQueryType.NonHumanoid, 0, 100)
	local v29 = v_u_7:GetPaginatedMemoryByTexture(Enum.TextureQueryType.NonHumanoidOrphaned, 0, 100)
	local v30 = {}
	local function v36(p31, p32) -- name: aggregateData
		for _, v33 in ipairs(p32.Results) do
			local v34 = v33.MemoryInBytes / 1048576
			local v35 = {
				["name"] = v33.TextureId,
				["value"] = v34
			}
			table.insert(p31, v35)
		end
	end
	v36(v30, v28)
	v36(v30, v29)
	table.sort(v30, function(p37, p38)
		return p37.value > p38.value
	end)
	return v30
end
local function v_u_60() -- name: fetchGraphicsTextureCharacterMemoryData
	-- upvalues: (copy) v_u_7, (copy) v_u_1
	local v40 = v_u_7:GetPaginatedMemoryByTexture(Enum.TextureQueryType.Humanoid, 0, 100)
	local v41 = v_u_7:GetPaginatedMemoryByTexture(Enum.TextureQueryType.HumanoidOrphaned, 0, 100)
	local v42 = {}
	local function v59(p43, p44) -- name: aggregateData
		-- upvalues: (ref) v_u_1
		for _, v45 in ipairs(p44.Results) do
			local v46 = v45.MemoryInBytes / 1048576
			local v47 = v45.TextureId
			local v48 = {}
			local v49 = {}
			for _, v50 in pairs(string.split(v47, " ")) do
				if string.sub(v50, 1, 2) ~= "T[" then
					continue
				end
				table.insert(v48, v50)
			end
			local v51 = {}
			for _, v52 in pairs(v48) do
				local v53 = string.split(v52, ".mesh:")[2]
				local v54 = string.find(v53, ":", 12)
				if v54 ~= nil then
					v54 = v54 - 1
				end
				v51[string.sub(v53, 1, v54)] = true
			end
			for v55, _ in pairs(v51) do
				table.insert(v49, {
					["name"] = v55
				})
			end
			table.sort(v49, function(p56, p57)
				return p56.name < p57.name
			end)
			if v_u_1 then
				local v58 = {
					["name"] = "Composite Texture",
					["id"] = nil,
					["value"] = nil,
					["moreInfo"] = nil,
					["id"] = v45.TextureId,
					["value"] = v46,
					["moreInfo"] = v49
				}
				table.insert(p43, v58)
			else
				table.insert(p43, {
					["name"] = "Composite Texture",
					["value"] = nil,
					["moreInfo"] = nil,
					["value"] = v46,
					["moreInfo"] = v49
				})
			end
		end
	end
	v59(v42, v40)
	v59(v42, v41)
	return v42
end
local function v_u_68() -- name: fetchGraphicsMeshPartsMemoryData
	-- upvalues: (copy) v_u_5
	local v61 = v_u_5:getContentMemoryData()
	local v62 = {}
	for v63, v64 in pairs(v61) do
		local v65 = {
			["name"] = v63,
			["value"] = v64 / 1048576
		}
		table.insert(v62, v65)
	end
	table.sort(v62, function(p66, p67)
		return p66.value > p67.value
	end)
	return v62
end
local function v_u_76() -- name: fetchFuncAnimation
	-- upvalues: (copy) v_u_6
	local v69 = v_u_6:GetMemStats()
	local v70 = {}
	for v71, v72 in pairs(v69) do
		local v73 = {
			["name"] = v71,
			["value"] = v72 / 1048576
		}
		table.insert(v70, v73)
	end
	table.sort(v70, function(p74, p75)
		return p74.value > p75.value
	end)
	return v70
end
local function v_u_84() -- name: fetchFontMemoryData
	-- upvalues: (copy) v_u_4
	local v77 = v_u_4:GetFontMemoryData()
	local v78 = {}
	for v79, v80 in pairs(v77) do
		local v81 = {
			["name"] = v79,
			["value"] = v80 / 1048576
		}
		table.insert(v78, v81)
	end
	table.sort(v78, function(p82, p83)
		return p82.value > p83.value
	end)
	return v78
end
function v_u_18.updateCachedData(p85, p86, p87) -- name: updateCachedData
	if p85._doGranularMemUpdate[p86] then
		p85._doGranularMemUpdate[p86] = false
		p85._granularMemTable[p86] = p87()
	end
end
function v_u_18.getAdditionalMemoryFunc(p_u_88, p_u_89) -- name: getAdditionalMemoryFunc
	-- upvalues: (copy) v_u_27, (copy) v_u_39, (copy) v_u_60, (copy) v_u_68, (copy) v_u_76, (copy) v_u_84
	local v_u_90 = nil
	if p_u_89 == "Sounds" then
		v_u_90 = v_u_27
	elseif p_u_89 == "GraphicsTexture" then
		v_u_90 = v_u_39
	elseif p_u_89 == "GraphicsTextureCharacter" then
		v_u_90 = v_u_60
	elseif p_u_89 == "GraphicsMeshParts" then
		v_u_90 = v_u_68
	elseif p_u_89 ~= "csgDictionary" then
		if p_u_89 == "Animation" then
			v_u_90 = v_u_76
		elseif p_u_89 == "gui/FontData" and game:GetEngineFeature("TextServiceGetFontMemoryData") then
			v_u_90 = v_u_84
		end
	end
	return v_u_90 and function()
		-- upvalues: (copy) p_u_88, (copy) p_u_89, (ref) v_u_90
		p_u_88:updateCachedData(p_u_89, v_u_90)
		return p_u_88._granularMemTable[p_u_89]
	end or nil
end
function v_u_18.recursiveUpdateEntry(p91, p92, p93, p94) -- name: recursiveUpdateEntry
	-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_12
	local v95 = v_u_8.GetMemoryAnalyzerStatName(p94.DisplayName)
	local v96 = p94:GetValue()
	local v97 = p94:GetChildren()
	if p92[v95] then
		local v98 = p92[v95].max
		local v99 = p92[v95].min
		local v100 = {
			["data"] = v96,
			["time"] = p91._lastUpdate
		}
		if p92[v95].additionalInfoFunc and p92[v95].dataSet:back().data ~= v100.data then
			p91._doGranularMemUpdate[v95] = true
		end
		local v101 = p92[v95].dataSet:push_back(v100)
		if v101 then
			local v102 = p92[v95].dataSet:iterator()
			local v103 = v102:next()
			if v98 == v101.data then
				local v104 = v99
				while v103 do
					v99 = v103.data < v99 and v99 and v99 or v103.data
					v103 = v102:next()
				end
				v98 = v99
				v99 = v104
			end
			if v99 == v101.data then
				local v105 = v98
				while v103 do
					v98 = v98 < v103.data and v98 and v98 or v103.data
					v103 = v102:next()
				end
				v99 = v98
				v98 = v105
			end
		end
		p92[v95].max = v98 < v96 and v96 and v96 or v98
		local v106 = p92[v95]
		if v99 < v96 then
			v96 = v99 or v96
		end
		v106.min = v96
	else
		local v107 = v_u_9.new(v_u_12)
		v107:push_back({
			["data"] = v96,
			["time"] = p91._lastUpdate
		})
		p92[v95] = {
			["min"] = v96,
			["max"] = v96,
			["dataSet"] = v107,
			["children"] = #v97 > 0 and {} or false,
			["sortedChildren"] = #v97 > 0 and {} or false
		}
		local v108 = p91:getAdditionalMemoryFunc(v95)
		if v108 then
			p92[v95].additionalInfoFunc = v108
			p91._doGranularMemUpdate[v95] = true
		end
		local v109 = {
			["name"] = v95,
			["dataStats"] = p92[v95]
		}
		table.insert(p93, v109)
	end
	local v110 = p92[v95]
	local v111 = {}
	for _, v112 in ipairs(v97) do
		v111[v112.DisplayName] = true
		p91:recursiveUpdateEntry(v110.children, v110.sortedChildren, v112)
	end
	if v110.children then
		for v113, _ in pairs(v110.children) do
			if v111[v113] ~= nil then
				continue
			end
			v110.children[v113] = nil
			for v114, v115 in ipairs(v110.sortedChildren) do
				if v113 ~= v115.name then
					continue
				end
				table.remove(v110.sortedChildren, v114)
			end
		end
	end
end
function v_u_18.totalMemSignal(p116) -- name: totalMemSignal
	return p116._totalMemoryUpdated
end
function v_u_18.treeUpdatedSignal(p117) -- name: treeUpdatedSignal
	return p117._treeViewUpdatedSignal
end
function v_u_18.getSortType(p118) -- name: getSortType
	return p118._sortType
end
local function v_u_122(p119, p120) -- name: recursiveSort
	-- upvalues: (copy) v_u_122
	table.sort(p119, p120)
	for _, v121 in pairs(p119) do
		if not v121.dataStats.sortedChildren then
			continue
		end
		v_u_122(v121.dataStats.sortedChildren, p120)
	end
end
function v_u_18.setSortType(p123, p124) -- name: setSortType
	-- upvalues: (copy) v_u_17, (copy) v_u_122
	if v_u_17[p124] then
		p123._sortType = p124
		v_u_122(p123._memoryDataSorted, v_u_17[p123._sortType])
	else
		error(string.format("attempted to pass invalid sortType: %s", (tostring(p124))), 2)
	end
end
function v_u_18.getMemoryData(p125) -- name: getMemoryData
	return p125._memoryDataSorted
end
function v_u_18.isRunning(p126) -- name: isRunning
	return p126._isRunning
end
function v_u_18.start(p_u_127) -- name: start
	-- upvalues: (copy) v_u_7, (copy) v_u_8
	spawn(function()
		-- upvalues: (copy) p_u_127, (ref) v_u_7, (ref) v_u_8
		p_u_127._pollingId = p_u_127._pollingId + 1
		local v128 = p_u_127._pollingId
		p_u_127._isRunning = true
		while v128 == p_u_127._pollingId do
			local v129 = v_u_7
			if v129 then
				v129 = v_u_7:FindFirstChild("PerformanceStats")
			end
			local v130
			if v129 then
				v130 = v129:FindFirstChild(v_u_8.StatNames[v_u_8.StatType_Memory])
			else
				v130 = nil
			end
			if not v130 then
				return
			end
			p_u_127._lastUpdate = os.time()
			p_u_127:recursiveUpdateEntry(p_u_127._memoryData, p_u_127._memoryDataSorted, v130)
			if p_u_127._totalMemory ~= v130:getValue() then
				p_u_127._totalMemory = v130:getValue()
				p_u_127._totalMemoryUpdated:Fire(p_u_127._totalMemory)
			end
			p_u_127._treeViewUpdatedSignal:Fire(p_u_127._memoryDataSorted)
			wait(3)
		end
		p_u_127._isRunning = false
	end)
end
function v_u_18.stop(p131) -- name: stop
	p131._pollingId = p131._pollingId + 1
end
return v_u_18