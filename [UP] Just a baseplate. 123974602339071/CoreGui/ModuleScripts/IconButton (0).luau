-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Components.IconButton
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = v_u_2.PureComponent:extend("IconButton")
function v3.render(p4) -- name: render
	-- upvalues: (copy) v_u_2
	local v5 = p4.props.visible
	local v6 = p4.props.anchorPoint
	local v7 = p4.props.position
	local v8 = p4.props.size
	local v9 = p4.props.zIndex
	local v10 = p4.props.onClick
	local v11 = p4.props.iconHorizontalAlignment or Enum.HorizontalAlignment.Center
	local v12 = p4.props.iconVerticalAlignment or Enum.VerticalAlignment.Center
	local v13 = p4.props.iconSpritePath
	local v14 = p4.props.iconSpriteFrame
	local v15 = p4.props.horizontalInset or 12
	local v16 = 0
	local v17 = 1
	if v11 == Enum.HorizontalAlignment.Center then
		v15 = 0
	elseif v11 == Enum.HorizontalAlignment.Left then
		v7 = UDim2.new(v7.X.Scale, v7.X.Offset - v15, v7.Y.Scale, v7.Y.Offset)
	elseif v11 == Enum.HorizontalAlignment.Right then
		v7 = UDim2.new(v7.X.Scale, v7.X.Offset + v15, v7.Y.Scale, v7.Y.Offset)
		v16 = 1
		v17 = 0
	end
	local v18 = UDim2.new(v8.X.Scale, v8.X.Offset + v15, v8.Y.Scale, v8.Y.Offset)
	return v_u_2.createElement("ImageButton", {
		["Visible"] = v5,
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["AnchorPoint"] = v6,
		["Position"] = v7,
		["Size"] = v18,
		["ZIndex"] = v9,
		[v_u_2.Event.Activated] = v10
	}, {
		["IconLayout"] = v_u_2.createElement("UIListLayout", {
			["HorizontalAlignment"] = v11,
			["VerticalAlignment"] = v12,
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["Offset"] = v_u_2.createElement("Frame", {
			["BorderSizePixel"] = 0,
			["LayoutOrder"] = nil,
			["Size"] = nil,
			["LayoutOrder"] = v16,
			["Size"] = UDim2.new(0, v15, 0, 0)
		}),
		["BackIcon"] = v_u_2.createElement("ImageLabel", {
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["Size"] = nil,
			["Image"] = nil,
			["ImageRectOffset"] = nil,
			["ImageRectSize"] = nil,
			["ZIndex"] = nil,
			["LayoutOrder"] = nil,
			["Size"] = UDim2.new(0, v14.size.X, 0, v14.size.Y),
			["Image"] = v13,
			["ImageRectOffset"] = v14.offset,
			["ImageRectSize"] = v14.size,
			["ZIndex"] = v9,
			["LayoutOrder"] = v17
		})
	})
end
return v3