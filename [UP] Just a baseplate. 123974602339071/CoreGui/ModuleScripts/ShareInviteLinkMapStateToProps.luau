-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Components.ShareInviteLinkMapStateToProps
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.NotificationsCommon).ReducerDependencies
local v_u_3 = v2.ShareLinksNetworking
local v_u_4 = v2.ShareLinksRodux
return function(p5)
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v6 = {
		["shareInviteLink"] = p5.ShareLinks.Invites.ShareInviteLink,
		["fetchShareInviteLinkNetworkStatus"] = v_u_3.GenerateLink.getStatus(p5, {
			["linkType"] = v_u_4.Enums.LinkType.ExperienceInvite.rawValue()
		})
	}
	return v6
end