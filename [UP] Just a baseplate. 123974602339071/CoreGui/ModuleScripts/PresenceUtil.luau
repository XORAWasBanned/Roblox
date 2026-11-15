-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.PresenceUtil
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v3 = require(v1.Packages.UIBlox)
local v_u_4 = v3.Core.ImageSet.ImageSetLabel
local v_u_5 = v3.App.Constant.IconSize
local v_u_6 = v3.App.ImageSet.Images
local v7 = {
	["Offline"] = "OFFLINE",
	["Online"] = "ONLINE",
	["InGame"] = "IN_GAME",
	["InStudio"] = "IN_STUDIO"
}
local v_u_8 = {
	[v7.Online] = {
		["Image"] = "component_assets/circle_16",
		["Color"] = nil,
		["Size"] = nil,
		["Color"] = Color3.fromRGB(0, 180, 109),
		["Size"] = UDim2.new(0, 12, 0, 12)
	},
	[v7.InGame] = {
		["Image"] = "icons/menu/games_small"
	},
	[v7.InStudio] = {
		["Image"] = "icons/logo/studiologo_small"
	}
}
return {
	["PresenceType"] = v7,
	["GetIcon"] = function(p9) -- name: GetIcon
		-- upvalues: (copy) v_u_8, (copy) v_u_2, (copy) v_u_4, (copy) v_u_6, (copy) v_u_5
		local v10 = v_u_8[p9]
		if v10 then
			return v_u_2.createElement(v_u_4, {
				["Image"] = nil,
				["BackgroundTransparency"] = 1,
				["ImageColor3"] = nil,
				["Size"] = nil,
				["Image"] = v_u_6[v10.Image],
				["ImageColor3"] = v10.Color,
				["Size"] = v10.Size or UDim2.new(0, v_u_5.Small, 0, v_u_5.Small)
			})
		end
	end
}