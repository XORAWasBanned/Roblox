-- Path: CoreGui.RobloxGui.Modules.Stats.StatsMiniTextPanel
local v_u_1 = UDim2.new(0, 10, 0.15, 0)
local v_u_2 = UDim2.new(1, -20, 0.4, 0)
local v_u_3 = UDim2.new(0, 10, 0.55, 0)
local v_u_4 = UDim2.new(1, -20, 0.3, 0)
local v5 = game:GetService("CoreGui")
local v_u_6 = require(v5.RobloxGui.Modules.Stats.StatsUtils)
require(v5.RobloxGui.Modules.Stats.StatsAggregator)
local v_u_7 = {}
v_u_7.__index = v_u_7
function v_u_7.new(p8) -- name: new
	-- upvalues: (copy) v_u_7, (copy) v_u_6, (copy) v_u_2, (copy) v_u_1, (copy) v_u_4, (copy) v_u_3
	local v9 = {}
	local v10 = v_u_7
	setmetatable(v9, v10)
	v9._statType = p8
	v9._frame = Instance.new("Frame")
	v9._frame.Name = "StatsMiniTextPanelClass"
	v9._frame.BackgroundTransparency = 1
	v9._frame.ZIndex = v_u_6.TextZIndex
	v9._titleLabel = Instance.new("TextLabel")
	v9._titleLabel.Name = "TitleLabel"
	v9._valueLabel = Instance.new("TextLabel")
	v9._valueLabel.Name = "ValueLabel"
	v_u_6.StyleTextWidget(v9._titleLabel)
	v_u_6.StyleTextWidget(v9._valueLabel)
	v9._titleLabel.FontSize = v_u_6.MiniPanelTitleFontSize
	v9._titleLabel.Text = v9:_getTitle()
	v9._titleLabel.Parent = v9._frame
	v9._titleLabel.Size = v_u_2
	v9._titleLabel.Position = v_u_1
	v9._titleLabel.TextXAlignment = Enum.TextXAlignment.Left
	v9._valueLabel.FontSize = v_u_6.MiniPanelValueFontSize
	v9._valueLabel.Text = "0"
	v9._valueLabel.Parent = v9._frame
	v9._valueLabel.Size = v_u_4
	v9._valueLabel.Position = v_u_3
	v9._valueLabel.TextXAlignment = Enum.TextXAlignment.Left
	return v9
end
function v_u_7.SetZIndex(p11, p12) -- name: SetZIndex
	p11._frame.ZIndex = p12
	p11._titleLabel.ZIndex = p12
	p11.ZIndex = p12
end
function v_u_7._getTitle(p13) -- name: _getTitle
	-- upvalues: (copy) v_u_6
	return v_u_6.TypeToShortName[p13._statType]
end
function v_u_7.PlaceInParent(p14, p15, p16, p17) -- name: PlaceInParent
	p14._frame.Position = p17
	p14._frame.Size = p16
	p14._frame.Parent = p15
end
function v_u_7.SetStatsAggregator(p18, p19) -- name: SetStatsAggregator
	if p18._aggregator then
		p18._aggregator:RemoveListener(p18._listenerId)
		p18._listenerId = nil
		p18._aggregator = nil
	end
	p18._aggregator = p19
	p18:_refreshVisibility()
end
function v_u_7.SetVisible(p20, p21) -- name: SetVisible
	p20.frame.Visible = p21
	p20:_refreshVisibility()
end
function v_u_7._shouldBeVisible(p22) -- name: _shouldBeVisible
	-- upvalues: (copy) v_u_6
	if v_u_6.PerformanceStatsShouldBeVisible() then
		return p22._frame.Visible
	else
		return false
	end
end
function v_u_7._refreshVisibility(p23) -- name: _refreshVisibility
	if p23:_shouldBeVisible() then
		p23:_startListening()
		p23:_updateFromAggregator()
	else
		p23:_stopListening()
	end
end
function v_u_7._stopListening(p24) -- name: _stopListening
	if p24._aggregator == nil then
		return
	elseif p24._listenerId ~= nil then
		p24._aggregator:RemoveListener(p24._listenerId)
		p24._listenerId = nil
	end
end
function v_u_7._startListening(p_u_25) -- name: _startListening
	if p_u_25._aggregator == nil then
		return
	elseif p_u_25._listenerId == nil then
		p_u_25._listenerId = p_u_25._aggregator:AddListener(function()
			-- upvalues: (copy) p_u_25
			p_u_25:_updateFromAggregator()
		end)
	end
end
function v_u_7.OnPerformanceStatsShouldBeVisibleChanged(p26) -- name: OnPerformanceStatsShouldBeVisibleChanged
	p26:_refreshVisibility()
end
function v_u_7._updateFromAggregator(p27) -- name: _updateFromAggregator
	-- upvalues: (copy) v_u_6
	local v28 = p27._aggregator == nil and 0 or p27._aggregator:GetLatestValue()
	p27._valueLabel.Text = v_u_6.FormatTypedValue(v28, p27._statType)
end
return v_u_7