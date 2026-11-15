-- Path: CoreGui.RobloxGui.Modules.Stats.ClientMemoryAnalyzer
local v_u_1 = game:GetService("Stats")
local v2 = game:GetService("CoreGui")
local v_u_3 = require(v2.RobloxGui.Modules.Stats.BaseMemoryAnalyzer)
local v_u_4 = require(v2.RobloxGui.Modules.Common.CommonUtil)
local v_u_5 = require(v2.RobloxGui.Modules.Stats.StatsUtils)
local v_u_6 = require(v2.RobloxGui.Modules.Stats.TreeViewItem)
local function v_u_13(p7, p8) -- name: __FillInMemoryUsageTreeRecursive
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_13
	local v9 = p8.Name
	p7:setLabelAndValue(v_u_5.GetMemoryAnalyzerStatName(v9), (p8:GetValue()))
	local v10 = p8:GetChildren()
	local v11 = v_u_4.SortByName(v10)
	for _, v12 in ipairs(v11) do
		v_u_13(p7:getOrMakeChildById(v12.Name), v12)
	end
end
local v_u_14 = {}
setmetatable(v_u_14, v_u_3)
v_u_14.__index = v_u_14
function v_u_14.new(p15) -- name: new
	-- upvalues: (copy) v_u_3, (copy) v_u_14
	local v16 = v_u_3.new(p15)
	local v17 = v_u_14
	setmetatable(v16, v17)
	v16._rootTreeViewItem = nil
	v16._shouldListenForUpdates = false
	v16._spawnedLoopScheduled = false
	return v16
end
function v_u_14.startListeningForUpdates(p_u_18) -- name: startListeningForUpdates
	p_u_18._shouldListenForUpdates = true
	if not p_u_18._spawnedLoopScheduled then
		p_u_18._spawnedLoopScheduled = true
		spawn(function()
			-- upvalues: (copy) p_u_18
			while p_u_18._shouldListenForUpdates do
				p_u_18:refreshMemoryUsageTree()
				p_u_18:renderUpdates()
				wait(1)
			end
			p_u_18._spawnedLoopScheduled = false
		end)
	end
end
function v_u_14.stopListeningForUpdates(p19) -- name: stopListeningForUpdates
	p19._shouldListenForUpdates = false
end
function v_u_14.refreshMemoryUsageTree(p20) -- name: refreshMemoryUsageTree
	-- upvalues: (copy) v_u_6, (copy) v_u_1, (copy) v_u_5, (copy) v_u_13
	if p20._rootTreeViewItem == nil then
		p20._rootTreeViewItem = v_u_6.new("root", nil)
	end
	local v21 = v_u_1
	if v21 then
		v21 = v_u_1:FindFirstChild("PerformanceStats")
	end
	local v22
	if v21 == nil then
		v22 = nil
	else
		v22 = v21:FindFirstChild(v_u_5.StatNames[v_u_5.StatType_Memory])
	end
	if v22 == nil then
		return nil
	end
	v_u_13(p20._rootTreeViewItem, v22)
end
function v_u_14.getMemoryUsageTree(p23) -- name: getMemoryUsageTree
	return p23._rootTreeViewItem
end
return v_u_14