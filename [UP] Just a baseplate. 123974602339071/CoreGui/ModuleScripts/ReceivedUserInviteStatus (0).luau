-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Actions.ReceivedUserInviteStatus
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2, p3)
	return {
		["userId"] = tostring(p2),
		["inviteStatus"] = p3
	}
end)