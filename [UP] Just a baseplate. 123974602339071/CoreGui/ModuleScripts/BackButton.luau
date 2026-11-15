-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Components.BackButton
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v3 = v2.Modules.Settings.Pages.ShareGame
local v_u_4 = require(v3.Components.RectangleButton)
local v_u_5 = require(v3.Components.IconButton)
local v_u_6 = require(v1.Packages.Roact)
local v_u_7 = require(v3.Constants)
local v_u_8 = require(v2.Modules.Settings.Pages.ShareGame.Spritesheets.ShareGameIcons)
local v_u_9 = require(v2.Modules.Settings.Theme)
local v_u_10 = require(v3.getTranslator)()
local v_u_11 = v_u_6.PureComponent:extend("BackButton")
v_u_11.IconType = {
	["Arrow"] = "Arrow",
	["Cross"] = "Cross",
	["None"] = "None"
}
v_u_11.defaultProps = {
	["iconType"] = v_u_11.IconType.None
}
local v_u_12 = {
	[v_u_11.IconType.Arrow] = "back",
	[v_u_11.IconType.Cross] = "cross"
}
local function v_u_24(p13)
	-- upvalues: (copy) v_u_12, (copy) v_u_8, (copy) v_u_6, (copy) v_u_5
	local v14 = p13.iconType
	local v15 = p13.visible
	local v16 = p13.anchorPoint
	local v17 = p13.position
	local v18 = p13.size
	local v19 = p13.zIndex
	local v20 = p13.onClick
	local v21 = v_u_12[v14]
	if v21 then
		local v22 = v_u_8:GetImagePath()
		local v23 = v_u_8:GetFrame(v21)
		return v_u_6.createElement(v_u_5, {
			["visible"] = v15,
			["anchorPoint"] = v16,
			["position"] = v17,
			["size"] = v18,
			["zIndex"] = v19,
			["onClick"] = v20,
			["iconHorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["iconSpritePath"] = v22,
			["iconSpriteFrame"] = v23
		})
	end
end
function v_u_11.render(p25) -- name: render
	-- upvalues: (copy) v_u_11, (copy) v_u_6, (copy) v_u_4, (copy) v_u_10, (copy) v_u_9, (copy) v_u_7, (copy) v_u_24
	local v26 = p25.props.iconType
	local v27 = p25.props.zIndex
	if v26 ~= v_u_11.IconType.None then
		return v_u_24(p25.props)
	end
	local v28 = v_u_6.createElement
	local v29 = v_u_4
	local v30 = p25.props
	local v31 = {
		["TextLabel"] = v_u_6.createElement("TextLabel", {
			["Position"] = UDim2.new(0.5, 0, 0.5, 0),
			["Text"] = v_u_10:FormatByKey("Feature.SettingsHub.Action.InviteFriendsBack"),
			["TextSize"] = v_u_9.textSize(24, "BackButton"),
			["TextColor3"] = v_u_7.Color.WHITE,
			["Font"] = v_u_9.font(Enum.Font.SourceSansSemibold, "BackButton"),
			["ZIndex"] = v27
		})
	}
	return v28(v29, v30, v31)
end
return v_u_11