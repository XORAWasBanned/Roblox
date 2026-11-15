-- Path: CoreGui.RobloxGui.Modules.Stats.StatsButton
local v1 = game:GetService("CoreGui")
local v_u_2 = require(v1.RobloxGui.Modules.StyleWidgets)
local v_u_3 = require(v1.RobloxGui.Modules.Stats.StatsUtils)
local v_u_4 = require(v1.RobloxGui.Modules.Stats.StatsMiniTextPanel)
local v_u_5 = require(v1.RobloxGui.Modules.Stats.StatsAnnotatedGraph)
local v_u_6 = UDim2.new(0, 0, 0, 0)
local v_u_7 = UDim2.new(0.5, 0, 1, -v_u_2.TabSelectionHeight)
local v_u_8 = UDim2.new(0.5, 0, 0, 0)
local v_u_9 = UDim2.new(0.5, 0, 1, -v_u_2.TabSelectionHeight)
local v_u_10 = {}
v_u_10.__index = v_u_10
function v_u_10.new(p11) -- name: new
	-- upvalues: (copy) v_u_10, (copy) v_u_3, (copy) v_u_4, (copy) v_u_7, (copy) v_u_6, (copy) v_u_5, (copy) v_u_9, (copy) v_u_8, (copy) v_u_2
	local v12 = {}
	local v13 = v_u_10
	setmetatable(v12, v13)
	v12._statType = p11
	v12._button = Instance.new("TextButton")
	v12._button.Name = "PS_Button"
	v12._button.Text = ""
	v_u_3.StyleButton(v12._button)
	v12._textPanel = v_u_4.new(p11)
	v12._textPanel:PlaceInParent(v12._button, v_u_7, v_u_6)
	v12._graph = v_u_5.new(p11, false)
	v12._graph:PlaceInParent(v12._button, v_u_9, v_u_8)
	v12._textPanel:SetZIndex(v_u_3.TextZIndex)
	v12._graph:SetZIndex(v_u_3.GraphZIndex)
	v12._tabSelection = v_u_2.MakeTabSelectionWidget(v12._button)
	v12._isSelected = false
	v12:_updateTabSelectionState()
	return v12
end
function v_u_10.OnPerformanceStatsShouldBeVisibleChanged(p14) -- name: OnPerformanceStatsShouldBeVisibleChanged
	if p14._graph then
		p14._graph:OnPerformanceStatsShouldBeVisibleChanged()
	end
	if p14._textPanel then
		p14._textPanel:OnPerformanceStatsShouldBeVisibleChanged()
	end
end
function v_u_10.SetToggleCallbackFunction(p_u_15, p_u_16) -- name: SetToggleCallbackFunction
	p_u_15._button.MouseButton1Click:connect(function()
		-- upvalues: (copy) p_u_16, (copy) p_u_15
		p_u_16(p_u_15._statType)
	end)
end
function v_u_10.SetSizeAndPosition(p17, p18, p19) -- name: SetSizeAndPosition
	p17._button.Size = p18
	p17._button.Position = p19
end
function v_u_10.SetIsSelected(p20, p21) -- name: SetIsSelected
	p20._isSelected = p21
	p20:_updateTabSelectionState()
end
function v_u_10._updateTabSelectionState(p22) -- name: _updateTabSelectionState
	p22._tabSelection.Visible = p22._isSelected
end
function v_u_10.SetParent(p23, p24) -- name: SetParent
	p23._button.Parent = p24
end
function v_u_10.SetStatsAggregator(p25, p26) -- name: SetStatsAggregator
	p25._textPanel:SetStatsAggregator(p26)
	p25._graph:SetStatsAggregator(p26)
end
return v_u_10