-- Path: CoreGui.RobloxGui.Modules.Stats.DecoratedValueLabel
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v1.RobloxGui.Modules.Stats.StatsUtils)
require(v2.Workspace.Packages.RobloxTranslator)
local v_u_4 = {}
v_u_4.__index = v_u_4
function v_u_4.new(p5, p6) -- name: new
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	local v7 = {}
	local v8 = v_u_4
	setmetatable(v7, v8)
	v7._frame = Instance.new("Frame")
	v7._frame.Name = "PS_DecoratedValueLabel"
	v7._frame.BackgroundTransparency = 1
	v7._valueName = p6
	v7._statType = p5
	v7._decorationFrame = Instance.new("Frame")
	v7._decorationFrame.Name = "PS_Decoration"
	v7._decorationFrame.Parent = v7._frame
	v7._decorationFrame.Position = UDim2.new(0, 0, 0.5, -v_u_3.DecorationSize / 2)
	v7._decorationFrame.Size = UDim2.new(0, v_u_3.DecorationSize, 0, v_u_3.DecorationSize)
	v7._decorationFrame.BackgroundTransparency = 1
	v7._label = Instance.new("TextLabel")
	v7._label.Name = "Label"
	v7._label.Parent = v7._frame
	v7._label.Position = UDim2.new(0, v_u_3.DecorationSize + v_u_3.DecorationMargin, 0, 0)
	v7._label.Size = UDim2.new(1, -(v_u_3.DecorationSize + v_u_3.DecorationMargin), 1, 0)
	v7._label.FontSize = v_u_3.PanelValueFontSize
	v7._label.TextXAlignment = Enum.TextXAlignment.Left
	v7._label.TextYAlignment = Enum.TextYAlignment.Center
	v_u_3.StyleTextWidget(v7._label)
	return v7
end
function v_u_4.SetZIndex(p9, p10) -- name: SetZIndex
	p9._frame.ZIndex = p10
	p9._decorationFrame.ZIndex = p10
	p9._label.ZIndex = p10
end
function v_u_4.PlaceInParent(p11, p12, p13, p14) -- name: PlaceInParent
	p11._frame.Parent = p12
	p11._frame.Size = p13
	p11._frame.Position = p14
end
function v_u_4.GetDecorationFrame(p15) -- name: GetDecorationFrame
	return p15._decorationFrame
end
function v_u_4.SetValue(p16, p17) -- name: SetValue
	-- upvalues: (copy) v_u_3
	local v18 = v_u_3.FormatTypedValue(p17, p16._statType)
	p16._label.Text = string.format("%s: %s", p16._valueName, v18)
end
return v_u_4