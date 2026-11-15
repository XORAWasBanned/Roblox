-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Components.Header
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_3 = require(v1.Packages.Roact)
local v4 = v2.Modules.Settings.Pages.ShareGame
local v_u_5 = require(v2.Modules.Settings.Theme)
local v_u_6 = require(v4.Constants)
local v_u_7 = require(v4.Components.BackButton)
local v_u_8 = require(v4.Components.SearchArea)
local v_u_9 = require(v4.getTranslator)()
local v10 = v_u_3.PureComponent:extend("Header")
function v10.render(p11) -- name: render
	-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_3, (copy) v_u_9, (copy) v_u_5, (copy) v_u_8
	local v12 = p11.props.deviceLayout
	local v13 = p11.props.size
	local v14 = p11.props.layoutOrder
	local v15 = p11.props.zIndex
	local v16 = p11.props.closePage
	local v17 = p11.props.searchAreaActive
	local v18 = p11.props.analytics
	local v19 = p11.props.toggleSearchIcon
	local v20 = p11.props.iconType
	local v21 = v_u_6.LayoutSpecific[v12]
	local v22 = v12 == v_u_6.DeviceLayout.DESKTOP
	local v23 = v19 and v17
	local v24
	if v20 == v_u_7.IconType.None then
		v24 = v21.BACK_BUTTON_WIDTH
	else
		v24 = v21.BACK_BUTTON_MODAL_WIDTH
	end
	local v25 = v_u_3.createElement
	local v26 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["AnchorPoint"] = nil,
		["LayoutOrder"] = nil,
		["ZIndex"] = nil,
		["Position"] = nil,
		["Size"] = v13,
		["AnchorPoint"] = Vector2.new(0, 1),
		["LayoutOrder"] = v14,
		["ZIndex"] = v15,
		["Position"] = UDim2.new(0, 0, 0, 4)
	}
	local v27 = {
		["Title"] = v_u_3.createElement("TextLabel", {
			["BackgroundTransparency"] = 1,
			["Visible"] = nil,
			["Position"] = nil,
			["Text"] = nil,
			["TextSize"] = nil,
			["TextColor3"] = nil,
			["Font"] = nil,
			["ZIndex"] = nil,
			["Visible"] = not v23,
			["Position"] = UDim2.new(0.5, 0, 0.5, 0),
			["Text"] = v_u_9:FormatByKey("Feature.SettingsHub.Heading.InviteFriends"),
			["TextSize"] = v_u_5.textSize(v21.PAGE_TITLE_TEXT_SIZE),
			["TextColor3"] = v_u_6.Color.WHITE,
			["Font"] = v_u_5.font(Enum.Font.SourceSansSemibold, "Semibold"),
			["ZIndex"] = v15
		}),
		["BackButton"] = v_u_3.createElement(v_u_7, {
			["visible"] = true,
			["iconType"] = nil,
			["position"] = nil,
			["size"] = nil,
			["anchorPoint"] = nil,
			["zIndex"] = nil,
			["onClick"] = nil,
			["iconType"] = v20,
			["position"] = UDim2.new(0, 0, 0.5, 0),
			["size"] = UDim2.new(0, v24 or v21.BACK_BUTTON_WIDTH, 0, v21.BACK_BUTTON_HEIGHT),
			["anchorPoint"] = Vector2.new(0, 0.5),
			["zIndex"] = v15,
			["onClick"] = v16
		}),
		["SearchArea"] = v_u_3.createElement(v_u_8, {
			["fullWidthSearchBar"] = v19 or not v22,
			["searchBoxMargin"] = v21.SEARCH_BOX_MARGIN,
			["anchorPoint"] = Vector2.new(1, 0.5),
			["position"] = UDim2.new(1, 0, 0.5, 0),
			["size"] = UDim2.new(1, -v24, 1, 0),
			["zIndex"] = v15,
			["analytics"] = v18
		})
	}
	return v25("Frame", v26, v27)
end
return v10