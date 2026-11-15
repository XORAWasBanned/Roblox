-- Path: CoreGui.RobloxGui.Modules.Stats.StatsTextPanel
local v1 = game:GetService("CoreGui")
game:GetService("CorePackages")
local v_u_2 = require(v1.RobloxGui.Modules.Stats.StatsUtils)
require(v1.RobloxGui.Modules.Stats.StatsAggregator)
local v_u_3 = require(v1.RobloxGui.Modules.Stats.DecoratedValueLabel)
local v4 = v_u_2.TextPanelTopMarginPix
local v_u_5 = UDim2.new(0, v_u_2.TextPanelLeftMarginPix, 0, v4)
local v6 = v4 + v_u_2.TextPanelTitleHeightY
local v_u_7 = UDim2.new(0, v_u_2.TextPanelLeftMarginPix, 0, v6)
local v8 = v6 + v_u_2.TextPanelLegendItemHeightY
local v_u_9 = UDim2.new(0, v_u_2.TextPanelLeftMarginPix, 0, v8)
local v10 = v8 + v_u_2.TextPanelLegendItemHeightY
local v_u_11 = UDim2.new(0, v_u_2.TextPanelLeftMarginPix, 0, v10)
local v_u_12 = UDim2.new(1, -v_u_2.TextPanelLeftMarginPix * 2, 0, v_u_2.TextPanelTitleHeightY)
local v_u_13 = UDim2.new(1, -v_u_2.TextPanelLeftMarginPix * 2, 0, v_u_2.TextPanelLegendItemHeightY)
local v_u_14 = {}
v_u_14.__index = v_u_14
function v_u_14.new(p15) -- name: new
	-- upvalues: (copy) v_u_14, (copy) v_u_2, (copy) v_u_12, (copy) v_u_5
	local v16 = {}
	local v17 = v_u_14
	setmetatable(v16, v17)
	v16._statType = p15
	v16._frame = Instance.new("Frame")
	v16._frame.BackgroundTransparency = 1
	v16._frame.ZIndex = v_u_2.TextZIndex
	v16._titleLabel = Instance.new("TextLabel")
	v_u_2.StyleTextWidget(v16._titleLabel)
	v16._titleLabel.FontSize = v_u_2.PanelTitleFontSize
	v16._titleLabel.Text = v16:_getTitle()
	v16._titleLabel.Parent = v16._frame
	v16._titleLabel.Size = v_u_12
	v16._titleLabel.Position = v_u_5
	v16._titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	v16._titleLabel.TextYAlignment = Enum.TextYAlignment.Top
	v16:_addCurrentValueWidget()
	v16:_addTargetValueWidget()
	v16:_addAverageValueWidget()
	return v16
end
function v_u_14._getTarget(p18) -- name: _getTarget
	if p18._performanceStats == nil then
		return 0
	end
	local v19 = p18._performanceStats:FindFirstChild(p18._statMaxName)
	return v19 == nil and 0 or v19:GetValue()
end
function v_u_14._addCurrentValueWidget(p20) -- name: _addCurrentValueWidget
	-- upvalues: (copy) v_u_3, (copy) v_u_13, (copy) v_u_7, (copy) v_u_2
	p20._currentValueWidget = v_u_3.new(p20._statType, "Current")
	p20._currentValueWidget:PlaceInParent(p20._frame, v_u_13, v_u_7)
	local v21 = p20._currentValueWidget:GetDecorationFrame()
	local v22 = Instance.new("ImageLabel")
	v22.Position = UDim2.new(0.5, -v_u_2.OvalKeySize / 2, 0.5, -v_u_2.OvalKeySize / 2)
	v22.Size = UDim2.new(0, v_u_2.OvalKeySize, 0, v_u_2.OvalKeySize)
	v22.Parent = v21
	v22.BackgroundTransparency = 1
	v22.Image = "rbxasset://textures/ui/PerformanceStats/OvalKey.png"
	v22.BorderSizePixel = 0
	p20._currentValueDecoration = v22
end
function v_u_14._addTargetValueWidget(p23) -- name: _addTargetValueWidget
	-- upvalues: (copy) v_u_3, (copy) v_u_13, (copy) v_u_9, (copy) v_u_2
	p23._targetValueWidget = v_u_3.new(p23._statType, "Target")
	p23._targetValueWidget:PlaceInParent(p23._frame, v_u_13, v_u_9)
	local v24 = p23._targetValueWidget:GetDecorationFrame()
	local v25 = Instance.new("ImageLabel")
	v25.Position = UDim2.new(0.5, -v_u_2.TargetKeyWidth / 2, 0.5, -v_u_2.TargetKeyHeight / 2)
	v25.Size = UDim2.new(0, v_u_2.TargetKeyWidth, 0, v_u_2.TargetKeyHeight)
	v25.Parent = v24
	v25.BackgroundTransparency = 1
	v25.Image = "rbxasset://textures/ui/PerformanceStats/TargetKey.png"
end
function v_u_14._addAverageValueWidget(p26) -- name: _addAverageValueWidget
	-- upvalues: (copy) v_u_3, (copy) v_u_13, (copy) v_u_11, (copy) v_u_2
	p26._averageValueWidget = v_u_3.new(p26._statType, "Average")
	p26._averageValueWidget:PlaceInParent(p26._frame, v_u_13, v_u_11)
	local v27 = p26._averageValueWidget:GetDecorationFrame()
	local v28 = Instance.new("Frame")
	v28.Position = UDim2.new(0, 0, 0.5, -v_u_2.GraphAverageLineTotalThickness / 2)
	v28.Size = UDim2.new(1, 0, 0, v_u_2.GraphAverageLineInnerThickness)
	v28.Parent = v27
	v_u_2.StyleAverageLine(v28)
end
function v_u_14._getTitle(p29) -- name: _getTitle
	-- upvalues: (copy) v_u_2
	return v_u_2.TypeToName[p29._statType]
end
function v_u_14.PlaceInParent(p30, p31, p32, p33) -- name: PlaceInParent
	p30._frame.Position = p33
	p30._frame.Size = p32
	p30._frame.Parent = p31
end
function v_u_14.SetStatsAggregator(p34, p35) -- name: SetStatsAggregator
	if p34._aggregator then
		p34._aggregator:RemoveListener(p34._listenerId)
		p34._listenerId = nil
		p34._aggregator = nil
	end
	p34._aggregator = p35
	p34:_refreshVisibility()
end
function v_u_14.SetVisible(p36, p37) -- name: SetVisible
	p36._frame.Visible = p37
	p36:_refreshVisibility()
end
function v_u_14._shouldBeVisible(p38) -- name: _shouldBeVisible
	-- upvalues: (copy) v_u_2
	if v_u_2.PerformanceStatsShouldBeVisible() then
		return p38._frame.Visible
	else
		return false
	end
end
function v_u_14._refreshVisibility(p39) -- name: _refreshVisibility
	if p39:_shouldBeVisible() then
		p39:_startListening()
		p39:_updateFromAggregator()
	else
		p39:_stopListening()
	end
end
function v_u_14.OnPerformanceStatsShouldBeVisibleChanged(p40) -- name: OnPerformanceStatsShouldBeVisibleChanged
	p40:_refreshVisibility()
end
function v_u_14._stopListening(p41) -- name: _stopListening
	if p41._aggregator == nil then
		return
	elseif p41._listenerId ~= nil then
		p41._aggregator:RemoveListener(p41._listenerId)
		p41._listenerId = nil
	end
end
function v_u_14._startListening(p_u_42) -- name: _startListening
	if p_u_42._aggregator == nil then
		return
	elseif p_u_42._listenerId == nil then
		p_u_42._listenerId = p_u_42._aggregator:AddListener(function()
			-- upvalues: (copy) p_u_42
			p_u_42:_updateFromAggregator()
		end)
	end
end
function v_u_14._updateFromAggregator(p43) -- name: _updateFromAggregator
	-- upvalues: (copy) v_u_2
	local v44, v45, v46
	if p43._aggregator == nil then
		v44 = 0
		v45 = 0
		v46 = 0
	else
		v44 = p43._aggregator:GetLatestValue()
		v46 = p43._aggregator:GetAverage()
		v45 = p43._aggregator:GetTarget()
	end
	p43._currentValueWidget:SetValue(v44)
	p43._targetValueWidget:SetValue(v45)
	p43._averageValueWidget:SetValue(v46)
	p43._currentValueDecoration.ImageColor3 = v_u_2.GetColorForValue(v44, v45)
end
function v_u_14.SetZIndex(p47, p48) -- name: SetZIndex
	p47._frame.ZIndex = p48
	p47._titleLabel.ZIndex = p48
	p47._currentValueWidget:SetZIndex(p48)
	p47._averageValueWidget:SetZIndex(p48)
end
return v_u_14