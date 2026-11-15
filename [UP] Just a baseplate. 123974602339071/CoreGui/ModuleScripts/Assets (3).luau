-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Resources.Assets
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.UIBlox)
local v3 = v2.App.ImageSet.Images
local v4 = v2.App.ImageSet.getIconSize
local v5 = v2.App.ImageSet.Enum.IconSize
local v6 = {}
local v7 = {
	["MuteIcon"] = {
		["Size"] = nil,
		["Image"] = "rbxasset://textures/ui/VoiceChat/SpeakerLight/Unmuted0.png",
		["Size"] = UDim2.fromOffset(v4(v5.Medium), v4(v5.Medium))
	},
	["BlockIcon"] = {
		["Size"] = UDim2.fromOffset(v4(v5.Medium), v4(v5.Medium)),
		["Image"] = v3["icons/actions/block"]
	},
	["VoiceChatIcon"] = {
		["Size"] = nil,
		["Image"] = "rbxasset://textures/ui/VoiceChat/SpeakerLight/Unmuted0.png",
		["Size"] = UDim2.fromOffset(v4(v5.Medium), v4(v5.Medium))
	},
	["TextChatIcon"] = {
		["Size"] = nil,
		["Image"] = "rbxasset://textures/ui/TopBar/chatOff.png",
		["Size"] = UDim2.fromOffset(v4(v5.Medium), v4(v5.Medium))
	},
	["OtherIcon"] = {
		["Size"] = UDim2.fromOffset(v4(v5.Medium), v4(v5.Medium)),
		["Image"] = v3["icons/menu/help"]
	},
	["RoundedRect"] = {
		["ScaleType"] = Enum.ScaleType.Slice,
		["SliceCenter"] = Rect.new(8, 8, 9, 9),
		["Image"] = v3["component_assets/circle_17"]
	}
}
v6.Images = v7
return v6