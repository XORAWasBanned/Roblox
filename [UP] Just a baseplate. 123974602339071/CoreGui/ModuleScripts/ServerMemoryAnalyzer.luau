-- Path: CoreGui.RobloxGui.Modules.Stats.ServerMemoryAnalyzer
local v1 = game:GetService("CoreGui")
local v_u_2 = require(v1.RobloxGui.Modules.Stats.BaseMemoryAnalyzer)
local v_u_3 = require(v1.RobloxGui.Modules.Stats.TreeViewItem)
require(v1.RobloxGui.Modules.Common.CommonUtil)
local function v_u_10(p4, p5) -- name: __ReadAndSumValues
	local v6 = 0
	for v7, v8 in pairs(p5) do
		local v9 = v8 / 1048576
		v6 = v6 + v9
		p4:getOrMakeChildById(v7):setLabelAndValue(v7, v9)
	end
	return v6
end
local v_u_11 = {}
setmetatable(v_u_11, v_u_2)
v_u_11.__index = v_u_11
function v_u_11.new(p12) -- name: new
	-- upvalues: (copy) v_u_2, (copy) v_u_11
	local v13 = v_u_2.new(p12)
	local v14 = v_u_11
	setmetatable(v13, v14)
	v13._cachedRootTreeViewItem = nil
	v13._coreTreeViewItem = nil
	v13._placeTreeViewItem = nil
	v13._untrackedTreeViewItem = nil
	v13._isVisible = false
	return v13
end
function v_u_11.filterServerMemoryTreeStats(_, p15) -- name: filterServerMemoryTreeStats
	return p15.ServerMemoryTree == nil and {} or p15.ServerMemoryTree
end
function v_u_11.updateWithTreeStats(p16, p17) -- name: updateWithTreeStats
	-- upvalues: (copy) v_u_3, (copy) v_u_10
	local v18 = 0
	if p16._cachedRootTreeViewItem == nil then
		p16._cachedRootTreeViewItem = v_u_3.new("root", nil)
		p16._coreTreeViewItem = p16._cachedRootTreeViewItem:getOrMakeChildById("CoreMemory")
		p16._placeTreeViewItem = p16._cachedRootTreeViewItem:getOrMakeChildById("PlaceMemory")
		p16._untrackedTreeViewItem = p16._cachedRootTreeViewItem:getOrMakeChildById("UntrackedMemory")
	end
	for v19, v20 in pairs(p17) do
		if v19 == "totalServerMemory" then
			v18 = v20 / 1048576
		elseif v19 == "developerTags" then
			local v21 = v_u_10(p16._placeTreeViewItem, v20)
			p16._placeTreeViewItem:setLabelAndValue("PlaceMemory", v21)
		else
			if v19 ~= "internalCategories" then
				continue
			end
			local v22 = v_u_10(p16._coreTreeViewItem, v20)
			p16._coreTreeViewItem:setLabelAndValue("CoreMemory", v22)
		end
	end
	p16._cachedRootTreeViewItem:setLabelAndValue("Memory", v18)
	local v23 = v18 - (p16._coreTreeViewItem:getValue() + p16._placeTreeViewItem:getValue())
	p16._untrackedTreeViewItem:setLabelAndValue("UntrackedMemory", v23)
	p16:renderUpdates()
end
function v_u_11.getMemoryUsageTree(p24) -- name: getMemoryUsageTree
	return p24._cachedRootTreeViewItem
end
function v_u_11.setVisible(p25, p26) -- name: setVisible
	p25._isVisible = p26
	if p25._isVisible then
		p25:renderUpdates()
	end
end
return v_u_11