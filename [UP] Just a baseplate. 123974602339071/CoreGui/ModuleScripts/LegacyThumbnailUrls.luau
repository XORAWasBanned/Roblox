-- Path: CoreGui.RobloxGui.Modules.Common.LegacyThumbnailUrls
local v1 = game:GetService("ContentProvider").BaseUrl:lower()
local v2 = string.gsub(v1, "/m.", "/www.")
local v3 = string.gsub(v2, "/www.", "/thumbnails.")
return {
	["Headshot"] = "rbxthumb://type=AvatarHeadShot&id=%d&w=%d&h=%d",
	["Bust"] = nil,
	["Thumbnail"] = "rbxthumb://type=Avatar&id=%d&w=%d&h=%d",
	["Bust"] = string.gsub(v3, "http:", "https:") .. "v1/users/avatar-bust?userIds=%d&size=%dx%d&format=Png&isCircular=false"
}