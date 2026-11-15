-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Presentation.GamepadMenu.ChatIcon
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.t)
local v4 = require(v1.Packages.UIBlox)
local v5 = require(v1.Packages.RoactRodux)
local v_u_6 = v4.Core.Style.withStyle
local v7 = v4.App.ImageSet.Images
local v_u_8 = v4.Core.ImageSet.ImageSetLabel
local v_u_9 = v4.App.Indicator.Badge
local v_u_10 = v7["icons/menu/chat_on"]
local v_u_11 = v7["icons/menu/chat_off"]
local v12 = v_u_2.PureComponent:extend("ChatIcon")
v12.validateProps = v3.strictInterface({
	["chatVisible"] = v3.boolean,
	["unreadMessages"] = v3.integer
})
function v12.render(p_u_13) -- name: render
	-- upvalues: (copy) v_u_6, (copy) v_u_10, (copy) v_u_11, (copy) v_u_2, (copy) v_u_8, (copy) v_u_9
	return v_u_6(function(p14)
		-- upvalues: (ref) v_u_10, (copy) p_u_13, (ref) v_u_11, (ref) v_u_2, (ref) v_u_8, (ref) v_u_9
		local v15 = p14.Theme
		local v16 = v_u_10
		if not p_u_13.props.chatVisible then
			v16 = v_u_11
		end
		local v17 = v_u_2.createElement
		local v18 = v_u_8
		local v19 = {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["ImageColor3"] = nil,
			["ImageTransparency"] = nil,
			["ZIndex"] = 2,
			["Size"] = UDim2.fromScale(1, 1),
			["Image"] = v16,
			["ImageColor3"] = v15.IconEmphasis.Color,
			["ImageTransparency"] = v15.IconEmphasis.Transparency
		}
		local v20 = {}
		local v21
		if p_u_13.props.unreadMessages > 0 then
			v21 = v_u_2.createElement(v_u_9, {
				["position"] = nil,
				["anchorPoint"] = nil,
				["hasShadow"] = false,
				["value"] = nil,
				["position"] = UDim2.new(0, 24, 0.5, 0),
				["anchorPoint"] = Vector2.new(0, 0.5),
				["value"] = p_u_13.props.unreadMessages
			})
		else
			v21 = false
		end
		v20.Badge = v21
		return v17(v18, v19, v20)
	end)
end
return v5.UNSTABLE_connect2(function(p22) -- name: mapStateToProps
	return {
		["chatVisible"] = p22.chat.visible,
		["unreadMessages"] = p22.chat.unreadMessages
	}
end, nil)(v12)