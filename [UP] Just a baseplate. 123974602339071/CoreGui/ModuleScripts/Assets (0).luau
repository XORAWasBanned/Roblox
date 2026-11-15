-- Path: CoreGui.RobloxGui.Modules.Feedback.Resources.Assets
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.UIBlox)
local v3 = v2.App.ImageSet.Images
local v4 = v2.App.ImageSet.getIconSize
local v5 = v2.App.ImageSet.Enum.IconSize
local v6 = {}
local v7 = {
	["RoundedRect"] = {
		["ScaleType"] = Enum.ScaleType.Slice,
		["SliceCenter"] = Rect.new(8, 8, 9, 9),
		["Image"] = v3["component_assets/circle_17"]
	},
	["BiometricIcon"] = {
		["Size"] = UDim2.fromOffset(v4(v5.Medium), v4(v5.Medium)),
		["Image"] = v3["icons/menu/biometric"]
	},
	["FeedbackBarHintIcon"] = {
		["Size"] = UDim2.fromOffset(v4(v5.Medium), v4(v5.Medium)),
		["Image"] = v3["icons/actions/edit/add"]
	}
}
v6.Images = v7
return v6