-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Reducers.Toasts
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame
local v_u_3 = require(v1.Workspace.Packages.AppCommonLib).Immutable
local v_u_4 = require(v2.Actions.ReceivedUserInviteStatus)
local v_u_5 = require(v2.Actions.StoppedToastTimer)
local v_u_6 = require(v2.Constants).InviteStatus
return function(p7, p8)
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_3, (copy) v_u_5
	if not p7 then
		p7 = {
			["failedInvites"] = {}
		}
	end
	if p8.type == v_u_4.name then
		local v9 = p8.inviteStatus
		if v9 == v_u_6.Moderated or v9 == v_u_6.Failed then
			local v10 = {
				["timeStamp"] = tick(),
				["userId"] = p8.userId,
				["status"] = v9
			}
			return v_u_3.JoinDictionaries(p7, {
				["failedInvites"] = v_u_3.JoinDictionaries(p7.failedInvites, v_u_3.Append(p7.failedInvites, v10))
			})
		end
	elseif p8.type == v_u_5.name then
		p7 = v_u_3.JoinDictionaries(p7, {
			["failedInvites"] = {}
		})
	end
	return p7
end