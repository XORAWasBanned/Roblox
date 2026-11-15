-- Path: CorePackages.Packages._Index.MomentScenes.MomentScenes.Builders.AvatarMoment.Flags
local v1 = script:FindFirstAncestor("MomentScenes").Parent
return {
	["MomentScenesAvatarMomentUserId"] = require(v1.SafeFlags).createGetFFlag("MomentScenesAvatarMomentUserId")()
}