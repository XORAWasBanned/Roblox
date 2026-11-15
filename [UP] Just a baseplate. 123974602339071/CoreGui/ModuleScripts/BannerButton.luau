-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.BannerButton
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v_u_3 = require(script.Parent.Parent.Immutable)
local v4 = require(script.Parent.Parent.Constants)
local v_u_5 = v4.GeneralFormatting.LineWidth
local v_u_6 = v4.GeneralFormatting.LineColor
local v_u_7 = v4.GeneralFormatting.ArrowWidth
local v_u_8 = v4.Image.RightArrow
local v_u_9 = v4.Image.DownArrow
local v10 = v_u_2.Component:extend("BannerButton")
function v10.render(p11) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_9, (copy) v_u_8, (copy) v_u_7, (copy) v_u_5, (copy) v_u_6, (copy) v_u_3
	local v12 = p11.props[v_u_2.Children] or {}
	local v13 = p11.props.size
	local v14 = p11.props.pos
	local v15 = p11.props.isExpandable
	local v16 = p11.props.isExpanded
	local v17 = p11.props.layoutOrder
	local v18 = p11.props.inset or 0
	local v19 = p11.props.hideLines
	local v20 = p11.props.onButtonPress
	local v21 = p11.props.onMouseEnter
	local v22 = p11.props.onMouseLeave
	local v23 = p11.props.onMouseMove
	local v24 = p11.props.onMouse2Click
	local v25 = {}
	local v26
	if v20 then
		v26 = v_u_2.createElement("ImageLabel", {
			["Visible"] = nil,
			["Image"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Position"] = nil,
			["Visible"] = v15,
			["Image"] = v16 and v_u_9 or v_u_8,
			["Size"] = UDim2.new(0, v_u_7, 0, v_u_7),
			["Position"] = UDim2.new(0, v18, 0.5, -v_u_7 / 2)
		})
	else
		v26 = v20
	end
	v25.BannerButtonArrow = v26
	if not v19 then
		v25.HorizontalLineTop = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(1, 0, 0, v_u_5),
			["BackgroundColor3"] = v_u_6
		})
		v25.HorizontalLineBottom = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(1, 0, 0, v_u_5),
			["Position"] = UDim2.new(0, 0, 1, -v_u_5),
			["BackgroundColor3"] = v_u_6
		})
	end
	return v_u_2.createElement("ImageButton", {
		["Size"] = v13,
		["Position"] = v14,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = v17,
		[v_u_2.Event.Activated] = v20,
		[v_u_2.Event.MouseEnter] = v21,
		[v_u_2.Event.MouseLeave] = v22,
		[v_u_2.Event.MouseMoved] = v23,
		[v_u_2.Event.MouseButton2Click] = v24
	}, v_u_3.JoinDictionaries(v25, v12))
end
return v10