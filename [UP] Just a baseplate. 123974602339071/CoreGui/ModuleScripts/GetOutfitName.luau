-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Network.GetOutfitName
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("HttpRbxApiService")
local v3 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v4 = require(v3.Modules.Common.httpRequest)
local v_u_5 = require(v1.Workspace.Packages.Http).Url
local v_u_6 = v4(v2)
return function(p7)
	-- upvalues: (copy) v_u_5, (copy) v_u_6
	return v_u_6(string.format("%s/v3/outfits/%s/details", v_u_5.AVATAR_URL, (tostring(p7))), "GET"):andThen(function(p8)
		return p8.responseBody.name
	end)
end