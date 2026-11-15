-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.PlayerProfile.ProfileHeader
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v_u_3 = require(v1.Packages.Foundation).View
local v_u_4 = require(v1.Workspace.Packages.ProfilePlatform.Enums)
local v_u_5 = require(v1.Workspace.Packages.ProfilePlatform.useProfileJsonComponent)
local v_u_6 = require(v1.Workspace.Packages.ProfilePlatform.ProfileWrapperContext)
local v_u_7 = require(v1.Workspace.Packages.ProfilePlatform.AvatarHeadshotComponent)
local v_u_8 = require(v1.Workspace.Packages.ProfilePlatform.SocialChipCountsRow)
return v_u_2.memo(function(p9) -- name: ProfileHeader
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_5, (copy) v_u_4, (copy) v_u_3, (copy) v_u_7, (copy) v_u_8
	local v10 = v_u_2.useContext(v_u_6)
	local v11 = v_u_5(v_u_4.Components.UserProfileHeader)
	local v12 = v11.counts ~= nil
	local v13 = v_u_2.createElement
	local v14 = v_u_3
	local v15 = {
		["tag"] = "size-full-0 auto-y col gap-large",
		["LayoutOrder"] = nil,
		["LayoutOrder"] = p9.layoutOrder
	}
	local v16 = {}
	local v17 = v_u_2.createElement
	local v18 = v_u_7
	local v19 = {
		["userId"] = nil,
		["primaryName"] = nil,
		["username"] = nil,
		["isPremium"] = nil,
		["isVerified"] = nil,
		["isRobloxAdmin"] = nil,
		["layoutOrder"] = 1,
		["userId"] = p9.profileId
	}
	local v20 = v11.names.primaryName or ""
	local _ = v10.profileUserNickname
	v19.primaryName = v20
	v19.username = v11.names.username
	v19.isPremium = v11.isPremium
	v19.isVerified = v11.isVerified
	v19.isRobloxAdmin = v11.isRobloxAdmin
	v16.AvatarHeadshotComponent = v17(v18, v19)
	local v21
	if v12 then
		v21 = v_u_2.createElement(v_u_8, {
			["size"] = nil,
			["layoutOrder"] = 2,
			["size"] = UDim2.fromScale(1, 0)
		})
	else
		v21 = nil
	end
	v16.SocialCountsRow = v21
	return v13(v14, v15, v16)
end)