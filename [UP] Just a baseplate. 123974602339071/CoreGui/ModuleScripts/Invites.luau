-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Reducers.Invites
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame
local v_u_3 = require(v1.Workspace.Packages.AppCommonLib).Immutable
local v_u_4 = require(v2.Actions.ReceivedUserInviteStatus)
return function(p5, p6)
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	local v7 = p5 or {}
	if p6.type == v_u_4.name then
		v7 = v_u_3.Set(v7, p6.userId, p6.inviteStatus)
	end
	return v7
end