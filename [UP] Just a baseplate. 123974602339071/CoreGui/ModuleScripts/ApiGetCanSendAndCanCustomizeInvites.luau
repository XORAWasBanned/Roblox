-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Thunks.ApiGetCanSendAndCanCustomizeInvites
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.GameInvite).GetCanSendAndCanCustomizeInvites
local v_u_3 = game:GetService("HttpRbxApiService")
local v4 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_5 = require(v4.Modules.Common.httpRequest)
return function(p6, p7)
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_2
	local v8, v9 = v_u_2(v_u_5(v_u_3), p6, p7):await()
	if v8 and (v9 and v9.responseBody) then
		return v9.responseBody.canPrompt, v9.responseBody.canCustomize
	else
		return false, false
	end
end