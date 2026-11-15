-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Components.ConversationDetails
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_3 = require(v1.Packages.Roact)
local v4 = v2.Modules.Settings.Pages.ShareGame
local v_u_5 = require(v4.Constants)
local v6 = require(v2.Modules.Settings.Theme)
local v_u_7 = v6.font(Enum.Font.SourceSans, "ConversationDetails")
local v_u_8 = v_u_5.Color.WHITE
local v_u_9 = v6.textSize(19)
local v_u_10 = v6.font(Enum.Font.SourceSans, "ConversationDetails")
local v_u_11 = v_u_5.Color.GRAY3
local v_u_12 = v6.textSize(16, "ConversationDetails")
local v_u_13 = v6.font(Enum.Font.SourceSans, "ConversationDetails")
local v_u_14 = v6.textSize(16, "ConversationDetails")
local v_u_15 = require(v4.getTranslator)()
local v16 = v_u_3.PureComponent:extend("ConversationDetails")
function v16.render(p17) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_12, (copy) v_u_10, (copy) v_u_11, (copy) v_u_14, (copy) v_u_15, (copy) v_u_5, (copy) v_u_13, (copy) v_u_9, (copy) v_u_7, (copy) v_u_8
	local v18 = p17.props.title
	local v19 = p17.props.subtitle
	local v20 = p17.props.presence
	local v21 = p17.props.size
	local v22 = p17.props.layoutOrder
	local v23 = p17.props.zIndex
	local v24
	if v19 == nil then
		v24 = nil
	else
		v24 = v_u_3.createElement("TextLabel", {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Text"] = nil,
			["Font"] = nil,
			["TextColor3"] = nil,
			["TextSize"] = nil,
			["TextXAlignment"] = nil,
			["TextWrapped"] = true,
			["LayoutOrder"] = 1,
			["ZIndex"] = nil,
			["Size"] = UDim2.new(1, 0, 0, v_u_12),
			["Text"] = v19,
			["Font"] = v_u_10,
			["TextColor3"] = v_u_11,
			["TextSize"] = v_u_12,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["ZIndex"] = v23
		})
	end
	local v25
	if v20 == nil then
		v25 = nil
	else
		v25 = v_u_3.createElement("TextLabel", {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Text"] = nil,
			["Font"] = nil,
			["TextColor3"] = nil,
			["TextSize"] = nil,
			["TextXAlignment"] = nil,
			["LayoutOrder"] = 2,
			["ZIndex"] = nil,
			["Size"] = UDim2.new(1, 0, 0, v_u_14),
			["Text"] = v_u_15:FormatByKey(v_u_5.PresenceTextKey[v20]),
			["Font"] = v_u_13,
			["TextColor3"] = v_u_5.PresenceColors[v20],
			["TextSize"] = v_u_14,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["ZIndex"] = v23
		})
	end
	local v26 = v_u_3.createElement
	local v27 = {
		["UIListLayout"] = v_u_3.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["Padding"] = UDim.new(0, 2)
		}),
		["Title"] = v_u_3.createElement("TextLabel", {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Text"] = nil,
			["Font"] = nil,
			["TextColor3"] = nil,
			["TextSize"] = nil,
			["TextXAlignment"] = nil,
			["TextWrapped"] = true,
			["LayoutOrder"] = 0,
			["ZIndex"] = nil,
			["Size"] = UDim2.new(1, 0, 0, v_u_9),
			["Text"] = v18 or "",
			["Font"] = v_u_7,
			["TextColor3"] = v_u_8,
			["TextSize"] = v_u_9,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["ZIndex"] = v23
		}),
		["Subtitle"] = v24,
		["Presence"] = v25
	}
	return v26("Frame", {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["ZIndex"] = nil,
		["Size"] = v21,
		["LayoutOrder"] = v22,
		["ZIndex"] = v23
	}, v27)
end
return v16