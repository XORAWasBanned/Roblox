-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.DebugVisualizations.DebugVisualizationsData
local v_u_1 = require(script.Parent.Parent.Parent.Signal)
local v_u_2 = require(script.Parent.Parent.Parent.Constants).DebugVisualizationsFormatting.ChartHeaderNames
local v_u_3 = require(script.Parent.DebugVisualizationsStaticContent)
local v_u_4 = game:DefineFastFlag("SlimDevConsole2", false)
local v_u_5 = game:DefineFastFlag("SlimTintContextFilter", false)
local v_u_6 = game:DefineFastFlag("SlimTintModeTelemetry", false)
local v_u_7 = require(script.Parent.DebugVisualizationsTelemetry)
local v_u_16 = {
	[v_u_2[1]] = function(p8, p9)
		return p8.name < p9.name
	end,
	[v_u_2[2]] = function(p10, p11)
		if p10.settingInfo.Value == p11.settingInfo.Value then
			return p10.name < p11.name
		else
			return p10.settingInfo.Value
		end
	end,
	[v_u_2[3]] = function(p12, p13)
		if p12.settingInfo.Type == p13.settingInfo.Type then
			return p12.name < p13.name
		else
			return p12.settingInfo.Type < p13.settingInfo.Type
		end
	end,
	[v_u_2[4]] = function(p14, p15)
		return p14.name < p15.name
	end
}
local v_u_17 = {}
v_u_17.__index = v_u_17
function v_u_17.new() -- name: new
	-- upvalues: (copy) v_u_17, (copy) v_u_1, (copy) v_u_2
	local v18 = {}
	local v19 = v_u_17
	setmetatable(v18, v19)
	v18._visualizationsUpdated = v_u_1.new()
	v18._visualizationsData = {}
	v18._visualizationCounter = 0
	v18._sortedVisualizationData = {}
	v18._sortType = v_u_2[3]
	v18._isRunning = false
	return v18
end
function v_u_17.setSortType(p20, p21) -- name: setSortType
	-- upvalues: (copy) v_u_16
	if v_u_16[p21] then
		p20._sortType = p21
		table.sort(p20._sortedVisualizationData, v_u_16[p20._sortType])
		p20._visualizationsUpdated:Fire(p20._sortedVisualizationData)
	else
		error(string.format("attempted to pass invalid sortType: %s", (tostring(p21))), 2)
	end
end
function v_u_17.getSortType(p22) -- name: getSortType
	return p22._sortType
end
function v_u_17.Signal(p23) -- name: Signal
	return p23._visualizationsUpdated
end
function v_u_17.getCurrentData(p24) -- name: getCurrentData
	return p24._sortedVisualizationData
end
function v_u_17.updateDebugVisualizationDataEntry(p_u_25, p26, p27) -- name: updateDebugVisualizationDataEntry
	if p27 == nil then
		p_u_25._visualizationsData[p26] = nil
		for v28, v29 in pairs(p_u_25._sortedVisualizationData) do
			if v29.name ~= p26 then
				continue
			end
			table.remove(p_u_25._sortedVisualizationData, v28)
			return
		end
		return
	elseif p_u_25._visualizationsData[p26] then
		p_u_25._visualizationsData[p26] = p27
	else
		p_u_25._visualizationCounter = p_u_25._visualizationCounter + 1
		p_u_25._visualizationsData[p26] = p27
		local v32 = {
			["name"] = p26,
			["settingInfo"] = p_u_25._visualizationsData[p26],
			["valueChangeCallback"] = function(p30, p31) -- name: valueChangeCallback
				-- upvalues: (copy) p_u_25
				p_u_25:_toggleValue(p30, p31)
			end,
			["counter"] = p_u_25._visualizationCounter
		}
		local v33 = p_u_25._sortedVisualizationData
		table.insert(v33, v32)
	end
end
function v_u_17.isRunning(p34) -- name: isRunning
	return p34._isRunning
end
function v_u_17._toggleValue(p35, p36, p37) -- name: _toggleValue
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_7, (copy) v_u_16
	if v_u_4 then
		local v38 = p35._visualizationsData[p36]
		if v38 and v38.Kind == "Dropdown" then
			local v39 = settings():GetService(v38.Service)
			v39[v38.Setter](v39, p37)
			v38.Value = p37
			if v_u_6 and p36 == "SlimTintMode" then
				v_u_7.logSlimTintModeSelected(p37)
			end
			table.sort(p35._sortedVisualizationData, v_u_16[p35._sortType])
			p35._visualizationsUpdated:Fire(p35._sortedVisualizationData)
			return
		end
	end
	local v40 = settings().Physics
	if v40[p36] ~= nil then
		if p37 and p35._visualizationsData[p36].Type == "Box" then
			for _, v41 in pairs(p35._visualizationsData) do
				if v41.Type ~= "Box" or v40[v41.Name] == nil then
					continue
				end
				v40[v41.Name] = false
				p35._visualizationsData[v41.Name].Value = false
			end
		end
		v40[p36] = p37
		p35._visualizationsData[p36].Value = p37
		table.sort(p35._sortedVisualizationData, v_u_16[p35._sortType])
		p35._visualizationsUpdated:Fire(p35._sortedVisualizationData)
	end
end
function _constructInfo(p42, p_u_43) -- name: _constructInfo
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	local v44 = nil
	local v45 = nil
	local v46 = nil
	if v_u_4 and p_u_43.kind == "Dropdown" then
		local v47, v48 = pcall(function()
			-- upvalues: (copy) p_u_43
			return settings():GetService(p_u_43.service)
		end)
		if v47 and v48 then
			v44 = v48[p_u_43.getter](v48)
			if v_u_5 then
				local v49 = v48:GetAvailableTintModes(Enum.SlimViewContext.Player, true)
				v46 = {}
				v45 = {}
				for v50, v51 in ipairs(v49) do
					v46[v50] = Enum.SlimTintMode[v51]
					v45[v50] = v51
				end
			else
				v46 = v44.EnumType:GetEnumItems()
				v45 = {}
				for v52, v53 in ipairs(v46) do
					v45[v52] = v53.Name
				end
			end
		end
	else
		local v54 = settings().Physics
		if v54[p42] == nil then
			v44 = false
		else
			v44 = v54[p42]
		end
	end
	local v55 = ""
	for v56, v57 in ipairs(p_u_43.tags) do
		v55 = (v55 .. v57) .. (v56 == #p_u_43.tags and "" or ", ")
	end
	local v58 = {
		["Name"] = p_u_43.name,
		["Value"] = v44,
		["Type"] = p_u_43.type
	}
	local v59
	if v_u_4 then
		v59 = p_u_43.kind
	else
		v59 = nil
	end
	v58.Kind = v59
	v58.Tags = p_u_43.tags
	v58.Tagstring = v55
	v58.Description = p_u_43.description
	local v60
	if v_u_4 then
		v60 = p_u_43.learnMoreUrl
	else
		v60 = nil
	end
	v58.LearnMoreUrl = v60
	if v_u_4 and p_u_43.kind == "Dropdown" then
		v58.DropDownList = v45
		v58.EnumItems = v46
		v58.Service = p_u_43.service
		v58.Setter = p_u_43.setter
	end
	return v58
end
function v_u_17.start(p61) -- name: start
	-- upvalues: (copy) v_u_3, (copy) v_u_16
	for v62, v63 in pairs(v_u_3) do
		p61:updateDebugVisualizationDataEntry(v62, _constructInfo(v62, v63))
	end
	table.sort(p61._sortedVisualizationData, v_u_16[p61._sortType])
	p61._isRunning = true
end
function v_u_17.stop(p64) -- name: stop
	p64._isRunning = false
end
return v_u_17