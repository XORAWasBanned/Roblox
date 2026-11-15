-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Components.NoFriendsPage
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v3 = v2.Modules.Settings.Pages.ShareGame
local v_u_4 = require(v1.Packages.Roact)
local v_u_5 = require(v3.Constants)
local v6 = require(v3.Spritesheets.ShareGameIcons)
local v_u_7 = v6:GetFrame("friends")
local v_u_8 = v6:GetImagePath()
local v_u_9 = require(v2.Modules.Settings.Theme)
local v_u_10 = require(v3.getTranslator)()
local v11 = v_u_4.PureComponent:extend("NoFriendsPage")
function v11.render(p12) -- name: render
	-- upvalues: (copy) v_u_4, (copy) v_u_8, (copy) v_u_7, (copy) v_u_10, (copy) v_u_5, (copy) v_u_9
	local v13 = p12.props.LayoutOrder
	local v14 = p12.props.ZIndex
	local v15 = p12.props.Position
	local v16 = 0
	local v17 = v_u_4.createElement
	local v18 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["ZIndex"] = nil,
		["Position"] = nil,
		["Size"] = UDim2.new(1, 0, 1, 0),
		["LayoutOrder"] = v13,
		["ZIndex"] = v14,
		["Position"] = v15
	}
	local v19 = {
		["listLayout"] = v_u_4.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
	}
	local v20 = v_u_4.createElement
	local v21 = {
		["BackgroundTransparency"] = 1,
		["Image"] = nil,
		["ImageRectOffset"] = nil,
		["ImageRectSize"] = nil,
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["ZIndex"] = nil,
		["Image"] = v_u_8,
		["ImageRectOffset"] = v_u_7.offset,
		["ImageRectSize"] = v_u_7.size,
		["Size"] = UDim2.new(0, 72, 0, 72)
	}
	v16 = v16 + 1
	v21.LayoutOrder = v16
	v21.ZIndex = v14
	v19.friendsIcon = v20("ImageLabel", v21)
	local v22 = v_u_4.createElement
	local v23 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["ZIndex"] = nil,
		["Size"] = UDim2.new(0, 0, 0, 34)
	}
	v16 = v16 + 1
	v23.LayoutOrder = v16
	v23.ZIndex = v14
	v19.iconToSubtitleSpacer = v22("Frame", v23)
	local v24 = v_u_4.createElement
	local v25 = {
		["BackgroundTransparency"] = 1,
		["Text"] = nil,
		["TextColor3"] = nil,
		["TextTransparency"] = 0.22,
		["TextSize"] = nil,
		["TextWrapped"] = true,
		["Font"] = nil,
		["LayoutOrder"] = nil,
		["Size"] = nil,
		["TextYAlignment"] = nil,
		["ZIndex"] = nil,
		["Text"] = v_u_10:FormatByKey("Feature.SettingsHub.Label.NoFriendsScreen"),
		["TextColor3"] = v_u_5.Color.GRAY5,
		["TextSize"] = v_u_9.textSize(21),
		["Font"] = v_u_9.font(Enum.Font.SourceSans)
	}
	v16 = v16 + 1
	v25.LayoutOrder = v16
	v25.Size = UDim2.new(0, 280, 0, 42)
	v25.TextYAlignment = Enum.TextYAlignment.Top
	v25.ZIndex = v14
	v19.subtitle = v24("TextLabel", v25)
	local v26 = v_u_4.createElement
	local v27 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["ZIndex"] = nil,
		["Size"] = UDim2.new(0, 0, 0, 120)
	}
	v16 = v16 + 1
	v27.LayoutOrder = v16
	v27.ZIndex = v14
	v19.bottomSpacer = v26("Frame", v27)
	return v17("Frame", v18, v19)
end
return v11