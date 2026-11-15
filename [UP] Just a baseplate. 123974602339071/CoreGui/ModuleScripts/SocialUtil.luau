-- Path: CoreGui.RobloxGui.Modules.SocialUtil
local v1 = {}
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local v_u_4 = require(v2.Workspace.Packages.UserLib).Utils.Constants
local v_u_5 = Enum.ThumbnailSize.Size100x100
local v_u_6 = Enum.ThumbnailType.AvatarThumbnail
function v1.GetPlayerImage(p7, p8, p9, _) -- name: GetPlayerImage
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_3, (copy) v_u_4
	local v10 = p8 or v_u_5
	local v11 = p9 or v_u_6
	local v12 = 0
	if v11 == Enum.ThumbnailType.HeadShot or v11 == Enum.ThumbnailType.AvatarBust then
		local v13 = v10 == Enum.ThumbnailSize.Size48x48 and 48 or (v10 == Enum.ThumbnailSize.Size60x60 and 60 or 150)
		return v_u_3(p7, v_u_4.RbxthumbTypes.AvatarHeadShot, v13)
	end
	if v11 ~= Enum.ThumbnailType.AvatarThumbnail then
		return "ThumbnailErrorForSocialUtil.GetPlayerImage"
	end
	local v14 = (v10 == Enum.ThumbnailSize.Size48x48 or (v10 == Enum.ThumbnailSize.Size60x60 or v10 == Enum.ThumbnailSize.Size100x100)) and 100 or ((v10 == Enum.ThumbnailSize.Size150x150 or (v10 == Enum.ThumbnailSize.Size180x180 or v10 == Enum.ThumbnailSize.Size352x352)) and 352 or (v10 == Enum.ThumbnailSize.Size420x420 and 720 or v12))
	return v_u_3(p7, v_u_4.RbxthumbTypes.Avatar, v14)
end
return v1