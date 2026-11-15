-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.getCustomizedInvitePromptParams
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v3 = v1.RobloxGui.Modules
local v_u_4 = require(v3.Settings.Pages.ShareGame.Constants)
local v_u_5 = require(v2.Workspace.Packages.SharedFlags).FFlagFixPromptGameInviteUIMissingDisplayName
return function(p6, p7)
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	local v8
	if p6 and p6.InviteUser ~= 0 then
		v8 = p6.InviteUser
	else
		v8 = nil
	end
	local v9
	if v8 then
		v9 = v_u_4.Triggers.DeveloperSingle
	else
		v9 = v_u_4.Triggers.DeveloperMultiple
	end
	local v10, v11 = p7(v9, v8)
	if not v10 then
		return nil
	end
	local v12 = {}
	if v_u_5 and v8 then
		v12.inviteUserId = v8
	end
	if v11 and p6 then
		if p6.InviteMessageId ~= "" then
			v12.inviteMessageId = p6.InviteMessageId
		end
		if p6.InviteUser ~= 0 then
			v12.inviteUserId = p6.InviteUser
		end
		if p6.PromptMessage ~= "" then
			v12.promptMessage = p6.PromptMessage
		end
		if p6.LaunchData ~= "" then
			v12.launchData = p6.LaunchData
		end
	end
	return v12
end