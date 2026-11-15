-- Path: CoreGui.RobloxGui.Modules.shouldSaveScreenshotToAlbum
local v1 = game:GetService("CoreGui")
local v_u_2 = game:GetService("UserInputService")
local v3 = game:GetService("CorePackages")
local v4 = v1:WaitForChild("RobloxGui")
local v_u_5 = require(v3.Workspace.Packages.CachedPolicyService)
local v_u_6 = require(v4.Modules.Flags.GetFFlagScreenshotHudApi)
return function()
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_5
	local v7 = v_u_2:GetPlatform()
	local v8 = v7 == Enum.Platform.IOS and true or v7 == Enum.Platform.Android
	return v_u_6() and (v8 and not v_u_5:IsSubjectToChinaPolicies()) and true or false
end