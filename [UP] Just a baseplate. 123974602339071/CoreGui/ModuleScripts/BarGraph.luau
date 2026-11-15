-- Path: CoreGui.RobloxGui.Modules.Stats.BarGraph
local v1 = game:GetService("CoreGui")
local v_u_2 = require(v1.RobloxGui.Modules.Stats.StatsUtils)
local v_u_3 = {}
v_u_3.__index = v_u_3
function v_u_3.new(p4) -- name: new
	-- upvalues: (copy) v_u_3
	local v5 = {}
	local v6 = v_u_3
	setmetatable(v5, v6)
	v5._barFrame = Instance.new("Frame")
	v5._barFrame.Name = "PS_BarFrame"
	v5._barFrame.BackgroundTransparency = 1
	v5._lineFrame = Instance.new("Frame")
	v5._lineFrame.Name = "PS_LineFrame"
	v5._lineFrame.BackgroundTransparency = 1
	v5._showExtras = p4
	v5._values = {}
	v5._bars = {}
	v5._average = 0
	v5._target = 0
	if v5._showExtras then
		v5:_addGraphTarget()
		v5:_addGraphAverage()
	end
	return v5
end
function v_u_3.SetZIndex(p7, p8) -- name: SetZIndex
	p7._barFrame.ZIndex = p8
	p7._lineFrame.ZIndex = p8 + 1
	if p7._showExtras then
		p7._targetLine.ZIndex = p7._lineFrame.ZIndex
		p7._averageLine.ZIndex = p7._lineFrame.ZIndex
	end
end
function v_u_3.PlaceInParent(p9, p10, p11, p12) -- name: PlaceInParent
	p9._barFrame.Position = p12
	p9._barFrame.Size = p11
	p9._barFrame.Parent = p10
	p9._lineFrame.Position = p12
	p9._lineFrame.Size = p11
	p9._lineFrame.Parent = p10
end
function v_u_3.SetAxisMax(p13, p14) -- name: SetAxisMax
	p13._axisMax = p14
end
function v_u_3.SetValues(p15, p16) -- name: SetValues
	p15._values = p16
end
function v_u_3.SetAverage(p17, p18) -- name: SetAverage
	p17._average = p18
end
function v_u_3.SetTarget(p19, p20) -- name: SetTarget
	p19._target = p20
	p19:_moveGraphTarget()
end
function v_u_3._updateBarCount(p21, p22) -- name: _updateBarCount
	local v23 = #p21._bars
	local v24 = {}
	for v25 = 1, v23 do
		if v25 <= v23 then
			local v26 = p21._bars[v25]
			table.insert(v24, v26)
		else
			p21._bars[v25].Destroy()
		end
	end
	for v27 = v23 + 1, p22 do
		table.insert(v24, p21:_makeNthBar(v27))
	end
	p21._bars = v24
end
function v_u_3.Render(p28) -- name: Render
	local v29 = #p28._values
	p28:_updateBarCount(v29)
	for v30, v31 in ipairs(p28._values) do
		p28:_updateBar(v30, v31, v29)
	end
	if p28._showExtras then
		p28:_moveGraphAverage()
	end
end
function v_u_3._addGraphTarget(p_u_32) -- name: _addGraphTarget
	-- upvalues: (copy) v_u_2
	local v33 = Instance.new("ImageLabel")
	v33.Name = "TargetLine"
	v33.Size = UDim2.new(1, 0, 0, v_u_2.GraphTargetLineInnerThickness)
	v33.Image = "rbxasset://textures/ui/PerformanceStats/TargetLine.png"
	v33.BackgroundTransparency = 1
	v33.Parent = p_u_32._lineFrame
	v33.ZIndex = p_u_32._lineFrame.ZIndex
	v33.BorderSizePixel = 0
	v33.Changed:connect(function()
		-- upvalues: (copy) p_u_32
		p_u_32:_updateTargetLineImageSize()
	end)
	p_u_32._targetLine = v33
	p_u_32:_updateTargetLineImageSize()
end
function v_u_3._updateTargetLineImageSize(p34) -- name: _updateTargetLineImageSize
	p34._targetLine.ImageRectSize = p34._targetLine.AbsoluteSize
end
function v_u_3._addGraphAverage(p35) -- name: _addGraphAverage
	-- upvalues: (copy) v_u_2
	local v36 = Instance.new("Frame")
	v36.Name = "AverageLine"
	v36.Size = UDim2.new(1, 0, 0, v_u_2.GraphAverageLineInnerThickness)
	v36.Parent = p35._lineFrame
	v36.ZIndex = p35._lineFrame.ZIndex
	v_u_2.StyleAverageLine(v36)
	p35._averageLine = v36
end
function v_u_3._moveGraphTarget(p37) -- name: _moveGraphTarget
	-- upvalues: (copy) v_u_2
	if p37._targetLine ~= nil then
		p37._targetLine.Position = UDim2.new(0, 0, (p37._axisMax - p37._target) / p37._axisMax, -v_u_2.GraphTargetLineInnerThickness / 2)
	end
end
function v_u_3._moveGraphAverage(p38) -- name: _moveGraphAverage
	-- upvalues: (copy) v_u_2
	if p38._averageLine ~= nil then
		local v39 = p38._average
		local v40 = p38._axisMax
		local v41 = math.min(v39, v40)
		p38._averageLine.Position = UDim2.new(0, 0, (p38._axisMax - v41) / p38._axisMax, -v_u_2.GraphAverageLineTotalThickness / 2)
	end
end
function v_u_3._makeNthBar(p42, p43) -- name: _makeNthBar
	local v44 = p43 - 1
	local v45 = Instance.new("Frame")
	v45.Name = string.format("Bar_%d", v44)
	v45.Parent = p42._barFrame
	v45.ZIndex = p42._barFrame.ZIndex
	v45.BorderSizePixel = 0
	return v45
end
function v_u_3._updateBar(p46, p47, p48, p49) -- name: _updateBar
	-- upvalues: (copy) v_u_2
	local v50 = p46._bars[p47]
	local v51 = p47 - 1
	local v52 = p46._axisMax
	local v53 = math.min(p48, v52)
	local v54 = math.max(0, v53)
	v50.Position = UDim2.new(v51 / p49, 0, (p46._axisMax - v54) / p46._axisMax, 0)
	v50.Size = UDim2.new(1 / p49, 0, v54 / p46._axisMax, 0)
	v50.BackgroundColor3 = v_u_2.GetColorForValue(p48, p46._target)
end
return v_u_3