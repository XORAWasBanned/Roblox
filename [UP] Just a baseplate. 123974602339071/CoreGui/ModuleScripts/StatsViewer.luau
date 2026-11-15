-- Path: CoreGui.RobloxGui.Modules.Stats.StatsViewer
local v1 = game:GetService("CoreGui")
local v_u_2 = require(v1.RobloxGui.Modules.Stats.StatsUtils)
local v_u_3 = require(v1.RobloxGui.Modules.Stats.StatsTextPanel)
local v_u_4 = require(v1.RobloxGui.Modules.Stats.StatsAnnotatedGraph)
local v_u_5 = UDim2.new(0, 0, 0, 0)
local v_u_6 = UDim2.new(0.4, 0, 1, 0)
local v_u_7 = UDim2.new(0.4, 0, 0, 0)
local v_u_8 = UDim2.new(0.6, 0, 1, 0)
local v_u_9 = {}
v_u_9.__index = v_u_9
function v_u_9.new() -- name: new
	-- upvalues: (copy) v_u_9, (copy) v_u_2
	local v10 = {}
	local v11 = v_u_9
	setmetatable(v10, v11)
	v10._frameImageLabel = Instance.new("ImageLabel")
	v10._frameImageLabel.Name = "PS_Viewer"
	v10._frameImageLabel.Image = "rbxasset://textures/ui/PerformanceStats/BackgroundRounded.png"
	v10._frameImageLabel.ScaleType = Enum.ScaleType.Slice
	v10._frameImageLabel.SliceCenter = Rect.new(10, 10, 22, 22)
	v10._frameImageLabel.BackgroundTransparency = 1
	v10._frameImageLabel.ImageColor3 = v_u_2.NormalColor
	v10._frameImageLabel.ImageTransparency = v_u_2.Transparency
	v10._textPanel = nil
	v10._statType = nil
	v10._graph = nil
	return v10
end
function v_u_9.OnPerformanceStatsShouldBeVisibleChanged(p12) -- name: OnPerformanceStatsShouldBeVisibleChanged
	if p12._graph then
		p12._graph:OnPerformanceStatsShouldBeVisibleChanged()
	end
	if p12._textPanel then
		p12._textPanel:OnPerformanceStatsShouldBeVisibleChanged()
	end
end
function v_u_9.GetIsVisible(p13) -- name: GetIsVisible
	return p13._frameImageLabel.Visible
end
function v_u_9.GetStatType(p14) -- name: GetStatType
	return p14._statType
end
function v_u_9.SetSizeAndPosition(p15, p16, p17) -- name: SetSizeAndPosition
	p15._frameImageLabel.Size = p16
	p15._frameImageLabel.Position = p17
end
function v_u_9.SetParent(p18, p19) -- name: SetParent
	p18._frameImageLabel.Parent = p19
end
function v_u_9.SetVisible(p20, p21) -- name: SetVisible
	p20._frameImageLabel.Visible = p21
	if p20._graph then
		p20._graph:SetVisible(p21)
	end
	if p20._textPanel then
		p20._textPanel:SetVisible(p21)
	end
end
function v_u_9.SetStatType(p22, p23) -- name: SetStatType
	-- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) v_u_5, (copy) v_u_4, (copy) v_u_8, (copy) v_u_7, (copy) v_u_2
	p22._statType = p23
	p22._frameImageLabel:ClearAllChildren()
	if p22._textPanel then
		p22._textPanel:SetVisible(false)
		p22._textPanel = nil
	end
	p22._textPanel = v_u_3.new(p23)
	p22._textPanel:PlaceInParent(p22._frameImageLabel, v_u_6, v_u_5)
	p22._graph = v_u_4.new(p23, true)
	p22._graph:PlaceInParent(p22._frameImageLabel, v_u_8, v_u_7)
	p22._textPanel:SetZIndex(v_u_2.TextZIndex)
	p22._graph:SetZIndex(v_u_2.GraphZIndex)
	p22._graph:SetVisible(p22._frameImageLabel.Visible)
	p22._textPanel:SetVisible(p22._frameImageLabel.Visible)
	p22:_applyStatsAggregator()
end
function v_u_9._applyStatsAggregator(p24) -- name: _applyStatsAggregator
	if p24._aggregator ~= nil then
		if p24._textPanel then
			p24._textPanel:SetStatsAggregator(p24._aggregator)
		end
		if p24._graph then
			p24._graph:SetStatsAggregator(p24._aggregator)
		end
	end
end
function v_u_9.SetStatsAggregator(p25, p26) -- name: SetStatsAggregator
	p25._aggregator = p26
	p25:_applyStatsAggregator()
end
return v_u_9