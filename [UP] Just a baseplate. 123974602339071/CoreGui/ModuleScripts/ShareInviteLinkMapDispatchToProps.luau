-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Components.ShareInviteLinkMapDispatchToProps
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.NotificationsCommon).ReducerDependencies
local v_u_3 = v2.ShareLinksNetworking
local v_u_4 = v2.ShareLinksRodux
return function(p_u_5)
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	return {
		["fetchShareInviteLink"] = function() -- name: fetchShareInviteLink
			-- upvalues: (copy) p_u_5, (ref) v_u_3, (ref) v_u_4
			p_u_5(v_u_3.GenerateLink.API({
				["linkType"] = v_u_4.Enums.LinkType.ExperienceInvite.rawValue()
			}))
		end
	}
end