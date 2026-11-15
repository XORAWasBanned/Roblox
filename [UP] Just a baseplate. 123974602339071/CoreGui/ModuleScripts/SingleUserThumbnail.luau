-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Components.SingleUserThumbnail
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v3 = game:GetService("CoreGui").RobloxGui.Modules
local v_u_4 = require(v1.Workspace.Packages.CoreScriptsCommon).Constants.COLORS
local v_u_5 = require(v3.Settings.Pages.ShareGame.Constants)
local v_u_6 = require(v1.Workspace.Packages.UserLib).Utils.Constants
local v_u_7 = require(v1.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local v_u_8 = v_u_5.InviteAvatarThumbnailSize
return function(p9)
	-- upvalues: (copy) v_u_6, (copy) v_u_8, (copy) v_u_7, (copy) v_u_5, (copy) v_u_2, (copy) v_u_4
	local v10 = p9.user
	local v11
	if v10 then
		local v12 = v_u_6.RbxThumbnailSizeToNumberSize[v_u_8]
		v11 = v_u_7(v10.id, v_u_5.InviteAvatarRbxthumbType, v12)
	else
		v11 = nil
	end
	local v13 = v_u_2.createElement
	local v14 = "ImageLabel"
	local v15 = {
		["Size"] = nil,
		["Position"] = nil,
		["AnchorPoint"] = nil,
		["Image"] = nil,
		["BorderSizePixel"] = 0,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = nil,
		["Size"] = p9.size,
		["Position"] = p9.position,
		["AnchorPoint"] = p9.anchorPoint,
		["Image"] = v11 or "rbxasset://textures/ui/LuaApp/graphic/ph-avatar-portrait.png",
		["BackgroundColor3"] = v_u_4.FLINT,
		["BackgroundTransparency"] = p9.backgroundTransparency
	}
	local v16 = {}
	local v17
	if p9.square then
		v17 = nil
	else
		v17 = v_u_2.createElement("UICorner", {
			["CornerRadius"] = UDim.new(0.5, 0)
		})
	end
	v16.Corner = v17
	return v13(v14, v15, v16)
end