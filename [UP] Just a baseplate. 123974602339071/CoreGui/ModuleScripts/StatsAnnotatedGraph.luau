-- Path: CoreGui.RobloxGui.Modules.Stats.StatsAnnotatedGraph
local v1 = game:GetService("CoreGui")
local v_u_2 = require(v1.RobloxGui.Modules.Stats.StatsUtils)
local v_u_3 = require(v1.RobloxGui.Modules.Stats.BarGraph)
local v_u_4 = {}
v_u_4.__index = v_u_4
function v_u_4.new(p5, p6) -- name: new
	-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_3
	local v7 = {}
	local v8 = v_u_4
	setmetatable(v7, v8)
	v7._statType = p5
	v7._statMaxName = v_u_2.StatMaxNames[p5]
	v7._isMaximized = p6
	v7._values = {}
	v7._average = 0
	v7._target = 0
	v7._axisMax = 0
	v7._frame = Instance.new("Frame")
	v7._frame.Name = "PS_AnnotatedGraph"
	v7._frame.BackgroundTransparency = 1
	v7._frame.ZIndex = v_u_2.GraphZIndex
	v7._topLabel = Instance.new("TextLabel")
	v7._topLabel.Name = "PS_TopAxisLabel"
	v7._topLabel.Parent = v7._frame
	v7._topLabel.TextXAlignment = Enum.TextXAlignment.Left
	v7._topLabel.TextYAlignment = Enum.TextYAlignment.Top
	v7._topLabel.FontSize = v_u_2.PanelGraphFontSize
	v7._bottomLabel = Instance.new("TextLabel")
	v7._bottomLabel.Name = "PS_BottomAxisLabel"
	v7._bottomLabel.Parent = v7._frame
	v7._bottomLabel.TextXAlignment = Enum.TextXAlignment.Left
	v7._bottomLabel.TextYAlignment = Enum.TextYAlignment.Bottom
	v7._bottomLabel.FontSize = v_u_2.PanelGraphFontSize
	v7._graph = v_u_3.new(p6)
	v_u_2.StyleTextWidget(v7._topLabel)
	v_u_2.StyleTextWidget(v7._bottomLabel)
	v7:_layoutElements()
	return v7
end
function v_u_4.SetZIndex(p9, p10) -- name: SetZIndex
	p9._frame.ZIndex = p10
	p9._topLabel.ZIndex = p10
	p9._bottomLabel.ZIndex = p10
	p9._graph:SetZIndex(p10)
end
function v_u_4._layoutElements(p11) -- name: _layoutElements
	local v12
	if p11._isMaximized then
		p11._topLabel.Visible = true
		p11._bottomLabel.Visible = true
		v12 = 30
	else
		p11._topLabel.Visible = false
		p11._bottomLabel.Visible = false
		v12 = 0
	end
	local v13 = UDim2.new(0, 10, 0, 10)
	local v14 = UDim2.new(1, -(20 + v12), 1, -20)
	local v15 = UDim2.new(1, -(10 + v12), 0, 10)
	local v16 = UDim2.new(0, v12, 0.333, -20)
	local v17 = UDim2.new(1, -(10 + v12), 0.666, 10)
	local v18 = UDim2.new(0, v12, 0.333, -20)
	p11._topLabel.Size = v16
	p11._topLabel.Position = v15
	p11._bottomLabel.Size = v18
	p11._bottomLabel.Position = v17
	p11._graph:PlaceInParent(p11._frame, v14, v13)
end
function v_u_4.PlaceInParent(p19, p20, p21, p22) -- name: PlaceInParent
	p19._frame.Position = p22
	p19._frame.Size = p21
	p19._frame.Parent = p20
end
function v_u_4._getTarget(p23) -- name: _getTarget
	if p23._performanceStats == nil then
		return 0
	end
	local v24 = p23._performanceStats:FindFirstChild(p23._statMaxName)
	return v24 == nil and 0 or v24:GetValue()
end
function v_u_4._render(p25) -- name: _render
	p25._graph:SetAxisMax(p25._axisMax)
	p25._graph:SetValues(p25._values)
	p25._graph:SetAverage(p25._average)
	p25._graph:SetTarget(p25._target)
	p25._graph:Render()
	p25._topLabel.Text = string.format("%.2f", p25._axisMax)
	p25._bottomLabel.Text = string.format("%.2f", 0)
end
function v_u_4._calculateAxisMax(p26) -- name: _calculateAxisMax
	local v27 = p26._target * 2
	local v28 = p26:_recursiveGetOrderOfMagnitude(1, v27)
	local v29 = 0.5 + v27 / v28
	p26._axisMax = math.floor(v29) * v28
end
function v_u_4.SetStatsAggregator(p30, p31) -- name: SetStatsAggregator
	if p30._aggregator then
		p30._aggregator:RemoveListener(p30._listenerId)
		p30._listenerId = nil
		p30._aggregator = nil
	end
	p30._aggregator = p31
	p30:_refreshVisibility()
end
function v_u_4._stopListening(p32) -- name: _stopListening
	if p32._aggregator == nil then
		return
	elseif p32._listenerId ~= nil then
		p32._aggregator:RemoveListener(p32._listenerId)
		p32._listenerId = nil
	end
end
function v_u_4._startListening(p_u_33) -- name: _startListening
	if p_u_33._aggregator == nil then
		return
	elseif p_u_33._listenerId == nil then
		p_u_33._listenerId = p_u_33._aggregator:AddListener(function()
			-- upvalues: (copy) p_u_33
			p_u_33:_updateValuesAndRender()
		end)
	end
end
function v_u_4._shouldBeVisible(p34) -- name: _shouldBeVisible
	-- upvalues: (copy) v_u_2
	if v_u_2.PerformanceStatsShouldBeVisible() then
		return p34._frame.Visible
	else
		return false
	end
end
function v_u_4.SetVisible(p35, p36) -- name: SetVisible
	p35._frame.Visible = p36
	p35:_refreshVisibility()
end
function v_u_4._refreshVisibility(p37) -- name: _refreshVisibility
	if p37:_shouldBeVisible() then
		p37:_startListening()
		p37:_updateValuesAndRender()
	else
		p37:_stopListening()
	end
end
function v_u_4.OnPerformanceStatsShouldBeVisibleChanged(p38) -- name: OnPerformanceStatsShouldBeVisibleChanged
	p38:_refreshVisibility()
end
function v_u_4._recursiveGetOrderOfMagnitude(p39, p40, p41) -- name: _recursiveGetOrderOfMagnitude
	if p41 < p40 then
		return p39:_recursiveGetOrderOfMagnitude(p40 / 10, p41)
	elseif p41 <= p40 * 10 then
		return p40
	else
		return p39:_recursiveGetOrderOfMagnitude(p40 * 10, p41)
	end
end
function v_u_4._updateValuesAndRender(p42) -- name: _updateValuesAndRender
	p42._values = {}
	p42._average = 0
	p42._target = 0
	if p42._aggregator ~= nil then
		p42._values = p42._aggregator:GetValues()
		p42._average = p42._aggregator:GetAverage()
		p42._target = p42._aggregator:GetTarget()
	end
	p42:_calculateAxisMax()
	p42:_render()
end
return v_u_4