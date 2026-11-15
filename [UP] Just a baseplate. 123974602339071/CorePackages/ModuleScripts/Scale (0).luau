-- Path: CorePackages.Packages._Index.Graphing.Graphing.Components.Scale.Scale
local v1 = script:FindFirstAncestor("Graphing")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.SignalsReact)
local v_u_5 = require(v1.CanvasContext)
local v_u_6 = require(v1.Types)
local v_u_7 = require(v1.Components.ScaleTick)
local v_u_8 = require(v1.Util.GridUtil)
local v_u_9 = require(v1.Util.StyleUtil)
function Scale(p10) -- name: Scale
	-- upvalues: (copy) v_u_9, (copy) v_u_3, (copy) v_u_5, (copy) v_u_4, (copy) v_u_6, (copy) v_u_8, (copy) v_u_7
	local v11 = p10.Size or v_u_9.SCALE_SIZE
	local v12 = v_u_3.useContext(v_u_5)
	v_u_4.useSignalState(v12.viewportRectGetter)
	local v13 = p10.Side
	local v14
	if v13 == v_u_6.SIDE_TOP and true or v13 == v_u_6.SIDE_BOTTOM then
		v14 = v_u_6.AXIS_X
	else
		v14 = v_u_6.AXIS_Y
	end
	local v15 = UDim2.fromScale(0, 0)
	if p10.Side == v_u_6.SIDE_LEFT then
		v15 = UDim2.new(-v11, UDim.new(0, 0))
	elseif p10.Side == v_u_6.SIDE_RIGHT then
		v15 = UDim2.fromScale(1, 0)
	elseif p10.Side == v_u_6.SIDE_TOP then
		v15 = UDim2.new(UDim.new(0, 0), -v11)
	elseif p10.Side == v_u_6.SIDE_BOTTOM then
		v15 = UDim2.fromScale(0, 1)
	else
		local v16 = ("Invalid side %*"):format(p10.Side)
		assert(false, v16)
	end
	local v17 = p10.Side
	local v18
	if v17 == v_u_6.SIDE_TOP and true or v17 == v_u_6.SIDE_BOTTOM then
		v18 = UDim2.new(UDim.new(1, 0), v11)
	else
		v18 = UDim2.new(v11, UDim.new(1, 0))
	end
	local v19 = v_u_8.getValues(v14, p10.Schema, v12)
	local v20 = not p10.SchemaMinor and {} or v_u_8.getValues(v14, p10.SchemaMinor, v12, v19)
	local v21 = p10.Formatter or v_u_8.trimRoundingError
	local v22 = p10.TickLength or v_u_9.SCALE_TICK_LENGTH
	local v23 = p10.TickLengthMinor or v_u_9.SCALE_TICK_LENGTH_MINOR
	local v24 = {}
	for _, v25 in v19 do
		v24[("Tick%*"):format(v25)] = v_u_3.createElement(v_u_7, {
			["Side"] = p10.Side,
			["Position"] = v25,
			["Length"] = v22,
			["Thickness"] = p10.TickThickness,
			["TextPadding"] = p10.TickTextPadding,
			["TextSize"] = p10.TickTextSize,
			["Color3"] = p10.TickColor,
			["Formatter"] = v21
		})
	end
	for _, v26 in v20 do
		v24[("TickM%*"):format(v26)] = v_u_3.createElement(v_u_7, {
			["Side"] = nil,
			["Position"] = nil,
			["Length"] = nil,
			["Thickness"] = nil,
			["TextPadding"] = nil,
			["Color3"] = nil,
			["HasLabel"] = false,
			["Side"] = p10.Side,
			["Position"] = v26,
			["Length"] = v23,
			["Thickness"] = p10.TickThickness,
			["TextPadding"] = p10.TickTextPadding,
			["Color3"] = p10.TickColor
		})
	end
	v24.Body = v_u_3.createElement("Frame", {
		["Position"] = nil,
		["Size"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = nil,
		["BorderSizePixel"] = 0,
		["ZIndex"] = -1,
		["Position"] = v15,
		["Size"] = v18,
		["BackgroundColor3"] = p10.BackgroundColor3 or v_u_9.SCALE_BACKGROUND_COLOR3,
		["BackgroundTransparency"] = p10.BackgroundTransparency or v_u_9.SCALE_BACKGROUND_TRANSPARENCY
	}, p10.children)
	return v_u_3.createElement("Frame", {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["ZIndex"] = nil,
		["Size"] = UDim2.fromScale(1, 1),
		["ZIndex"] = p10.ZIndex
	}, v24)
end
return Scale