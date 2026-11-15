-- Path: CorePackages.Packages._Index.Graphing.Graphing.Components.ScaleTick.ScaleTick
local v1 = script:FindFirstAncestor("Graphing")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Types)
local v_u_5 = require(v1.Components.SidePositioner)
local v_u_6 = require(v1.Util.GridUtil)
local v_u_7 = require(v1.Util.StyleUtil)
function ScaleTick(p8) -- name: ScaleTick
	-- upvalues: (copy) v_u_7, (copy) v_u_6, (copy) v_u_4, (copy) v_u_3, (copy) v_u_5
	local v9 = p8.Length
	local v10 = p8.Thickness or v_u_7.SCALE_TICK_THICKNESS
	local v11 = p8.TextPadding or v_u_7.SCALE_TICK_LABEL_PADDING
	local v12 = p8.HasLabel == nil and true or p8.HasLabel
	local v13 = v_u_6.getAnchorPointForSide(p8.Side)
	local v14, v15 = v_u_6.getTextAlignmentsFromAnchorPoint(v13)
	local v16 = p8.Side
	local v17
	if v16 == v_u_4.SIDE_TOP and true or v16 == v_u_4.SIDE_BOTTOM then
		v17 = UDim2.fromOffset(v10, v9)
	else
		v17 = UDim2.fromOffset(v9, v10)
	end
	local v18 = v9 + v11
	local v19 = UDim2.fromOffset(-2 * v18 * v13.X + v18, -2 * v18 * v13.Y + v18)
	local v20 = v_u_3.createElement
	local v21 = v_u_5
	local v22 = {
		["Side"] = p8.Side,
		["Position"] = p8.Position,
		["ZIndex"] = p8.ZIndex
	}
	local v23 = {
		["Tick"] = v_u_3.createElement("Frame", {
			["AnchorPoint"] = nil,
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["AnchorPoint"] = v13,
			["Size"] = v17,
			["BackgroundColor3"] = p8.Color3 or v_u_7.SCALE_TICK_COLOR3
		}, p8.children)
	}
	if v12 then
		local v24 = v_u_3.createElement
		local v25 = "TextLabel"
		local v26 = {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Text"] = nil,
			["TextXAlignment"] = nil,
			["TextYAlignment"] = nil,
			["BackgroundTransparency"] = 1,
			["TextColor3"] = nil,
			["TextSize"] = nil,
			["AnchorPoint"] = v13,
			["Position"] = v19
		}
		local v27
		if p8.Formatter then
			v27 = p8.Formatter(p8.Position)
		else
			local v28 = p8.Position
			v27 = tostring(v28)
		end
		v26.Text = v27
		v26.TextXAlignment = v14
		v26.TextYAlignment = v15
		v26.TextColor3 = p8.Color3 or v_u_7.SCALE_TICK_LABEL_COLOR3
		v26.TextSize = p8.TextSize or v_u_7.SCALE_TICK_LABEL_SIZE
		v12 = v24(v25, v26)
	end
	v23.Label = v12
	return v20(v21, v22, v23)
end
return ScaleTick