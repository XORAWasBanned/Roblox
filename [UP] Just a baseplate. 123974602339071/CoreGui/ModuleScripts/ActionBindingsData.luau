-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.ActionBindings.ActionBindingsData
local v_u_1 = game:GetService("ContextActionService")
local v_u_2 = require(script.Parent.Parent.Parent.Signal)
local v_u_3 = require(script.Parent.Parent.Parent.Constants).ActionBindingsFormatting.ChartHeaderNames
local v_u_17 = {
	[v_u_3[1]] = function(p4, p5)
		return p4.counter < p5.counter
	end,
	[v_u_3[2]] = function(p6, p7)
		if p6.actionInfo.priorityLevel == p7.actionInfo.priorityLevel then
			return p6.counter < p7.counter
		else
			return p6.actionInfo.priorityLevel < p7.actionInfo.priorityLevel
		end
	end,
	[v_u_3[3]] = function(p8, p9)
		if p8.actionInfo.isCore == p9.actionInfo.isCore then
			return p8.counter < p9.counter
		else
			return p8.actionInfo.isCore
		end
	end,
	[v_u_3[4]] = function(p10, p11)
		return p10.name:lower() < p11.name:lower()
	end,
	[v_u_3[5]] = function(p12, p13)
		local v14 = p12.actionInfo.inputTypes[1]
		local v15 = tostring(v14)
		local v16 = p13.actionInfo.inputTypes[1]
		return v15 < tostring(v16)
	end
}
local v_u_18 = {}
v_u_18.__index = v_u_18
function v_u_18.new() -- name: new
	-- upvalues: (copy) v_u_18, (copy) v_u_2, (copy) v_u_3
	local v19 = {}
	local v20 = v_u_18
	setmetatable(v19, v20)
	v19._bindingsUpdated = v_u_2.new()
	v19._bindingsData = {}
	v19._bindingCounter = 0
	v19._sortedBindingData = {}
	v19._sortType = v_u_3[1]
	v19._isRunning = false
	return v19
end
function v_u_18.setSortType(p21, p22) -- name: setSortType
	-- upvalues: (copy) v_u_17
	if v_u_17[p22] then
		p21._sortType = p22
		table.sort(p21._sortedBindingData, v_u_17[p21._sortType])
		p21._bindingsUpdated:Fire(p21._sortedBindingData)
	else
		error(string.format("attempted to pass invalid sortType: %s", (tostring(p22))), 2)
	end
end
function v_u_18.getSortType(p23) -- name: getSortType
	return p23._sortType
end
function v_u_18.Signal(p24) -- name: Signal
	return p24._bindingsUpdated
end
function v_u_18.getCurrentData(p25) -- name: getCurrentData
	return p25._sortedBindingData
end
function v_u_18.updateBindingDataEntry(p26, p27, p28) -- name: updateBindingDataEntry
	if p28 == nil then
		p26._bindingsData[p27] = nil
		for v29, v30 in pairs(p26._sortedBindingData) do
			if v30.name ~= p27 then
				continue
			end
			table.remove(p26._sortedBindingData, v29)
			return
		end
		return
	elseif p26._bindingsData[p27] then
		p26._bindingsData[p27] = p28
	else
		p26._bindingCounter = p26._bindingCounter + 1
		p26._bindingsData[p27] = p28
		local v31 = {
			["name"] = p27,
			["actionInfo"] = p26._bindingsData[p27],
			["counter"] = p26._bindingCounter
		}
		local v32 = p26._sortedBindingData
		table.insert(v32, v31)
	end
end
function v_u_18.isRunning(p33) -- name: isRunning
	return p33._isRunning
end
function v_u_18.start(p_u_34) -- name: start
	-- upvalues: (copy) v_u_1
	local v35 = v_u_1:GetAllBoundActionInfo()
	for v36, v37 in pairs(v35) do
		v37.isCore = false
		p_u_34:updateBindingDataEntry(v36, v37)
	end
	local v38 = v_u_1:GetAllBoundCoreActionInfo()
	for v39, v40 in pairs(v38) do
		v40.isCore = true
		p_u_34:updateBindingDataEntry(v39, v40)
	end
	if not p_u_34._actionChangedConnection then
		p_u_34._actionChangedConnection = v_u_1.BoundActionChanged:connect(function(p41, p42, p43)
			-- upvalues: (copy) p_u_34
			p_u_34:updateBindingDataEntry(p41, nil)
			p_u_34:updateBindingDataEntry(p42, p43)
			p_u_34._bindingsUpdated:Fire(p_u_34._sortedBindingData)
		end)
	end
	if not p_u_34._actionAddedConnection then
		p_u_34._actionAddedConnection = v_u_1.BoundActionAdded:connect(function(p44, _, p45, p46)
			-- upvalues: (copy) p_u_34
			p45.isCore = p46
			p_u_34:updateBindingDataEntry(p44, p45)
			p_u_34._bindingsUpdated:Fire(p_u_34._sortedBindingData)
		end)
	end
	if not p_u_34._actionRemovedConnection then
		p_u_34._actionRemovedConnection = v_u_1.BoundActionRemoved:connect(function(p47, _, _)
			-- upvalues: (copy) p_u_34
			p_u_34:updateBindingDataEntry(p47, nil)
			p_u_34._bindingsUpdated:Fire(p_u_34._sortedBindingData)
		end)
	end
	p_u_34._isRunning = true
end
function v_u_18.stop(p48) -- name: stop
	if p48.actionChangedConnector then
		p48.actionChangedConnector:Disconnect()
		p48.actionChangedConnector = nil
	end
	if p48.actionAddedConnector then
		p48.actionAddedConnector:Disconnect()
		p48.actionAddedConnector = nil
	end
	if p48.actionRemovedConnector then
		p48.actionRemovedConnector:Disconnect()
		p48.actionRemovedConnector = nil
	end
	p48._isRunning = false
end
return v_u_18