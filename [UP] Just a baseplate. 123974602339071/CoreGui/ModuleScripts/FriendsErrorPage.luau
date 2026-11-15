-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Components.FriendsErrorPage
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v3 = v2.Modules.Settings.Pages.ShareGame
local v_u_4 = require(v1.Packages.Roact)
local v_u_5 = require(v3.Constants)
local v_u_6 = require(v2.Modules.Settings.Theme)
local v_u_7 = require(v3.getTranslator)()
local v8 = v_u_4.PureComponent:extend("FriendsErrorPage")
function v8.render(p9) -- name: render
	-- upvalues: (copy) v_u_4, (copy) v_u_7, (copy) v_u_5, (copy) v_u_6
	local v10 = p9.props.LayoutOrder
	local v11 = p9.props.ZIndex
	local v12 = 0
	local v13 = v_u_4.createElement
	local v14 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["ZIndex"] = nil,
		["Size"] = UDim2.new(1, 0, 1, 0),
		["LayoutOrder"] = v10,
		["ZIndex"] = v11
	}
	local v15 = {
		["listLayout"] = v_u_4.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
	}
	local v16 = v_u_4.createElement
	local v17 = {
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
		["Text"] = v_u_7:FormatByKey("Feature.SettingsHub.Label.LoadingFriendsListFailed"),
		["TextColor3"] = v_u_5.Color.GRAY5,
		["TextSize"] = v_u_6.textSize(21),
		["Font"] = v_u_6.font(Enum.Font.SourceSans)
	}
	v12 = v12 + 1
	v17.LayoutOrder = v12
	v17.Size = UDim2.new(0, 280, 0, 42)
	v17.TextYAlignment = Enum.TextYAlignment.Top
	v17.ZIndex = v11
	v15.subtitle = v16("TextLabel", v17)
	return v13("Frame", v14, v15)
end
return v8