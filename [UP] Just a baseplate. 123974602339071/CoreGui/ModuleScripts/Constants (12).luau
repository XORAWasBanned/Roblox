-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Constants
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.UserLib).Models.UserModel
local v3 = require(v1.Workspace.Packages.UserLib).Utils.ThumbnailRequest
local v4 = require(v1.Workspace.Packages.UserLib).Utils.Constants
local v5 = {
	["PHONE_PORTRAIT"] = "PHONE_PORTRAIT",
	["PHONE_LANDSCAPE"] = "PHONE_LANDSCAPE",
	["TABLET_PORTRAIT"] = "TABLET_PORTRAIT",
	["TABLET_LANDSCAPE"] = "TABLET_LANDSCAPE",
	["DESKTOP"] = "DESKTOP"
}
local v6 = {
	["WHITE"] = Color3.fromRGB(255, 255, 255),
	["GRAY1"] = Color3.fromRGB(25, 25, 25),
	["GRAY2"] = Color3.fromRGB(117, 117, 117),
	["GRAY3"] = Color3.fromRGB(184, 184, 184),
	["GRAY4"] = Color3.fromRGB(227, 227, 227),
	["GRAY5"] = Color3.fromRGB(242, 242, 242),
	["GRAY6"] = Color3.fromRGB(245, 245, 245),
	["RED"] = Color3.fromRGB(254, 68, 72)
}
local v7 = {
	["Color"] = nil,
	["PresenceColors"] = nil,
	["PresenceTextKey"] = nil,
	["InviteStatus"] = nil,
	["DeviceOrientation"] = nil,
	["PageRoute"] = nil,
	["SHARE_GAME_Z_INDEX"] = 2,
	["DeviceLayout"] = nil,
	["LayoutSpecific"] = nil,
	["Triggers"] = nil,
	["Color"] = v6,
	["PresenceColors"] = {
		[v2.PresenceType.ONLINE] = Color3.fromRGB(0, 162, 255),
		[v2.PresenceType.IN_GAME] = Color3.fromRGB(2, 183, 87),
		[v2.PresenceType.IN_STUDIO] = Color3.fromRGB(246, 136, 2),
		[v2.PresenceType.OFFLINE] = v6.GRAY3
	},
	["PresenceTextKey"] = {
		[v2.PresenceType.ONLINE] = "InGame.Presence.Label.Online",
		[v2.PresenceType.IN_GAME] = "InGame.Presence.Label.InGame",
		[v2.PresenceType.IN_STUDIO] = "InGame.Presence.Label.InStudio",
		[v2.PresenceType.OFFLINE] = "InGame.Presence.Label.Offline"
	},
	["InviteStatus"] = {
		["Success"] = "Success",
		["Moderated"] = "Moderated",
		["Failed"] = "Failed",
		["Pending"] = "Pending"
	},
	["DeviceOrientation"] = {
		["PORTRAIT"] = "PORTRAIT",
		["LANDSCAPE"] = "LANDSCAPE",
		["INVALID"] = "INVALID"
	},
	["PageRoute"] = {
		["NONE"] = "NONE",
		["SETTINGS_HUB"] = "SETTINGS_HUB",
		["SHARE_GAME"] = "SHARE_GAME"
	},
	["DeviceLayout"] = v5,
	["LayoutSpecific"] = {
		[v5.PHONE_LANDSCAPE] = {
			["HEADER_HEIGHT"] = 40,
			["PAGE_TITLE_TEXT_SIZE"] = 23,
			["SEARCH_BOX_MARGIN"] = 12,
			["PAGE_SIDE_MARGINS"] = 7,
			["BACK_BUTTON_HEIGHT"] = 44,
			["BACK_BUTTON_WIDTH"] = 44,
			["BACK_BUTTON_MODAL_WIDTH"] = 44,
			["EXTEND_BOTTOM_SIZE"] = 0,
			["TOAST_HEIGHT"] = 40
		},
		[v5.PHONE_PORTRAIT] = {
			["HEADER_HEIGHT"] = 40,
			["PAGE_TITLE_TEXT_SIZE"] = 23,
			["SEARCH_BOX_MARGIN"] = 15,
			["PAGE_SIDE_MARGINS"] = 5,
			["BACK_BUTTON_HEIGHT"] = 44,
			["BACK_BUTTON_WIDTH"] = 44,
			["BACK_BUTTON_MODAL_WIDTH"] = 44,
			["EXTEND_BOTTOM_SIZE"] = 0,
			["TOAST_HEIGHT"] = 40
		},
		[v5.TABLET_PORTRAIT] = {
			["HEADER_HEIGHT"] = 40,
			["PAGE_TITLE_TEXT_SIZE"] = 23,
			["SEARCH_BOX_MARGIN"] = 15,
			["PAGE_SIDE_MARGINS"] = 15,
			["BACK_BUTTON_HEIGHT"] = 44,
			["BACK_BUTTON_WIDTH"] = 44,
			["BACK_BUTTON_MODAL_WIDTH"] = 44,
			["EXTEND_BOTTOM_SIZE"] = 0,
			["TOAST_HEIGHT"] = 80
		},
		[v5.TABLET_LANDSCAPE] = {
			["HEADER_HEIGHT"] = 60,
			["PAGE_TITLE_TEXT_SIZE"] = 23,
			["SEARCH_BOX_MARGIN"] = 15,
			["PAGE_SIDE_MARGINS"] = 5,
			["BACK_BUTTON_HEIGHT"] = 44,
			["BACK_BUTTON_WIDTH"] = 44,
			["BACK_BUTTON_MODAL_WIDTH"] = 44,
			["EXTEND_BOTTOM_SIZE"] = 68,
			["TOAST_HEIGHT"] = 80
		},
		[v5.DESKTOP] = {
			["HEADER_HEIGHT"] = 60,
			["PAGE_TITLE_TEXT_SIZE"] = 29,
			["SEARCH_BOX_MARGIN"] = 0,
			["PAGE_SIDE_MARGINS"] = 0,
			["BACK_BUTTON_HEIGHT"] = 44,
			["BACK_BUTTON_WIDTH"] = 154,
			["BACK_BUTTON_MODAL_WIDTH"] = 44,
			["EXTEND_BOTTOM_SIZE"] = 68,
			["TOAST_HEIGHT"] = 80
		}
	},
	["Triggers"] = {
		["DeveloperMultiple"] = "DeveloperMultiple",
		["DeveloperSingle"] = "DeveloperSingle",
		["GameMenu"] = "GameMenu"
	},
	["InviteAvatarThumbnailType"] = v4.RbxAvatarThumbnailTypesFromEnum.HeadShot,
	["InviteAvatarThumbnailSize"] = v4.RbxThumbnailSizes.Size150x150,
	["InviteAvatarRbxthumbType"] = v4.RbxthumbTypes.AvatarHeadShot
}
v7.ThumbnailRequest = {
	["InviteToGame"] = { v3.fromData(v7.InviteAvatarThumbnailType, v7.InviteAvatarThumbnailSize) }
}
return v7