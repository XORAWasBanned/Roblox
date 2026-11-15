-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Components.InviteButton
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_3 = require(v1.Packages.Roact)
local v4 = v2.Modules.Settings.Pages.ShareGame
local v_u_5 = require(v1.Workspace.Packages.AppCommonLib).Immutable
local v_u_6 = require(v4.Constants)
local v_u_7 = require(v4.Components.RectangleButton)
local v8 = require(v2.Modules.Settings.Theme)
local v_u_9 = v8.font(Enum.Font.SourceSansSemibold, "Semibold")
local v_u_10 = v8.textSize(19)
local v_u_11 = v_u_6.InviteStatus
local v_u_12 = {
	[v_u_11.Success] = "Feature.SettingsHub.Label.Invited",
	[v_u_11.Moderated] = "Feature.SettingsHub.Label.Moderated",
	[v_u_11.Pending] = "Feature.SettingsHub.Label.Sending"
}
local v_u_13 = require(v4.getTranslator)()
local v14 = v_u_3.PureComponent:extend("InviteButton")
function v14.render(p15) -- name: render
	-- upvalues: (copy) v_u_11, (copy) v_u_5, (copy) v_u_3, (copy) v_u_7, (copy) v_u_9, (copy) v_u_13, (copy) v_u_10, (copy) v_u_6, (copy) v_u_12
	local v16 = p15.props.anchorPoint
	local v17 = p15.props.position
	local v18 = p15.props.size
	local v19 = p15.props.layoutOrder
	local v20 = p15.props.zIndex
	local v_u_21 = p15.props.onInvite
	local v22 = p15.props.inviteStatus
	if v22 and v22 ~= v_u_11.Failed then
		local v23 = v_u_12[v22] or "Feature.SettingsHub.Label.Moderated"
		return v_u_3.createElement("TextLabel", {
			["BackgroundTransparency"] = 1,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["Font"] = nil,
			["Text"] = nil,
			["TextSize"] = nil,
			["TextColor3"] = nil,
			["TextXAlignment"] = nil,
			["LayoutOrder"] = nil,
			["ZIndex"] = nil,
			["AnchorPoint"] = v16,
			["Position"] = v17,
			["Size"] = v18,
			["Font"] = v_u_9,
			["Text"] = v_u_13:FormatByKey(v23),
			["TextSize"] = v_u_10,
			["TextColor3"] = v_u_6.Color.WHITE,
			["TextXAlignment"] = Enum.TextXAlignment.Center,
			["LayoutOrder"] = v19,
			["ZIndex"] = v20
		})
	else
		local v24 = v_u_5.Set(p15.props, "onClick", function()
			-- upvalues: (copy) v_u_21
			v_u_21()
		end)
		return v_u_3.createElement(v_u_7, v24, {
			["InviteText"] = v_u_3.createElement("TextLabel", {
				["BackgroundTransparency"] = 1,
				["Position"] = nil,
				["Font"] = nil,
				["Text"] = nil,
				["TextSize"] = nil,
				["TextColor3"] = nil,
				["ZIndex"] = nil,
				["Position"] = UDim2.new(0.5, 0, 0.5, 0),
				["Font"] = v_u_9,
				["Text"] = v_u_13:FormatByKey("Feature.SettingsHub.Action.InviteFriend"),
				["TextSize"] = v_u_10,
				["TextColor3"] = v_u_6.Color.WHITE,
				["ZIndex"] = v20
			})
		})
	end
end
return v14