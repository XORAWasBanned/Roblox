-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Components.EmoteThumbnailParameters
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.t)
local v4 = {
	["validate"] = v2.strictInterface({
		["thumbnailKeyframe"] = v2.number,
		["thumbnailTime"] = v2.number,
		["thumbnailZoom"] = v2.number,
		["thumbnailVerticalOffset"] = v2.number,
		["thumbnailHorizontalOffset"] = v2.number,
		["thumbnailCharacterRotation"] = v2.number
	}),
	["defaultParameters"] = {
		["thumbnailKeyframe"] = 1,
		["thumbnailTime"] = 0,
		["thumbnailZoom"] = 1,
		["thumbnailVerticalOffset"] = 0,
		["thumbnailHorizontalOffset"] = 0,
		["thumbnailCharacterRotation"] = 0
	},
	["encodeAsATable"] = function(p3)
		return {
			["ThumbnailBundleId"] = 515,
			["ThumbnailCharacterRotation"] = p3.thumbnailCharacterRotation,
			["ThumbnailHorizontalOffset"] = p3.thumbnailHorizontalOffset,
			["ThumbnailVerticalOffset"] = p3.thumbnailVerticalOffset,
			["ThumbnailZoom"] = p3.thumbnailZoom,
			["ThumbnailKeyframe"] = p3.thumbnailKeyframe,
			["ThumbnailTime"] = p3.thumbnailTime
		}
	end
}
return v4