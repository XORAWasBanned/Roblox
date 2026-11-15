-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Components.Notification
local v1 = game:GetService("CorePackages")
local v2 = script.Parent.Parent
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v_u_5 = require(v1.Workspace.Packages.Style).AppFonts
local v_u_6 = require(v2.Colors)
local v_u_7 = require(v1.Workspace.Packages.RobloxTranslator)
local v8 = v_u_3.PureComponent:extend("Notification")
function v8.render(p9) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_6, (copy) v_u_5, (copy) v_u_7
	local v10 = p9.props.locale
	local v11 = p9.props.noticeKey
	local v12 = v_u_3.createElement
	local v13 = {
		["Size"] = nil,
		["LayoutOrder"] = 0,
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.new(1, -10, 0, 45)
	}
	local v14 = {
		["UIListLayout"] = v_u_3.createElement("UIListLayout", {
			["Padding"] = UDim.new(0, 10),
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center
		}),
		["ExclamationPoint"] = v_u_3.createElement("ImageLabel", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Image"] = "rbxasset://textures/ui/InspectMenu/ico_alert_tilt.png",
			["ImageColor3"] = nil,
			["LayoutOrder"] = 1,
			["Size"] = UDim2.new(0, 16, 0, 16),
			["ImageColor3"] = v_u_6.White
		}),
		["PartOfBundleText"] = v_u_3.createElement("TextLabel", {
			["Size"] = nil,
			["TextColor3"] = nil,
			["BorderSizePixel"] = 0,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 2,
			["TextWrapped"] = true,
			["TextScaled"] = true,
			["TextSize"] = 12,
			["TextXAlignment"] = nil,
			["Font"] = nil,
			["Text"] = nil,
			["Size"] = UDim2.new(1, -30, 1, 0),
			["TextColor3"] = v_u_6.White,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["Font"] = v_u_5.default:getDefault(),
			["Text"] = v_u_7:FormatByKeyForLocale(v11, v10)
		}, {
			["UITextSizeConstraint"] = v_u_3.createElement("UITextSizeConstraint", {
				["MaxTextSize"] = 16
			})
		})
	}
	return v12("Frame", v13, v14)
end
return v4.UNSTABLE_connect2(function(p15, _)
	return {
		["locale"] = p15.locale
	}
end)(v8)