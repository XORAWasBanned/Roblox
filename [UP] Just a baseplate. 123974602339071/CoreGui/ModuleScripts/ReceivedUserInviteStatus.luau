-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Actions.ReceivedUserInviteStatus
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator("RECEIVED_USER_INVITE_STATUS", function(p2, p3)
	return {
		["userId"] = tostring(p2),
		["inviteStatus"] = p3
	}
end)