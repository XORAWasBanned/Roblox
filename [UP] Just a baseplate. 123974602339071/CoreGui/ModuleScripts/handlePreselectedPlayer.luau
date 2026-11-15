-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.Utility.handlePreselectedPlayer
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v2 = game:GetService("CoreGui").RobloxGui
local v_u_3 = require(v1.Components.Constants)
local v_u_4 = require(v1.IXP.TnSIXPWrapper)
local v_u_5 = require(v2.Modules.VoiceChat.VoiceChatServiceManager).default
function handlePreselectedPlayer(p6, p7, p8, p9) -- name: handlePreselectedPlayer
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_4
	if p7 then
		local v10 = v_u_5:getRecentUsersInteractionData()
		local v11 = p6.UserId
		if v10[tostring(v11)] ~= nil then
			p8({
				["type"] = v_u_3.PlayerMenuActions.UpdateMethodOfAbuse,
				["methodOfAbuse"] = v_u_3.AbuseMethods.VoiceChat
			})
			p9({
				["type"] = v_u_3.AnalyticsActions.SetTypeOfAbuseSelection,
				["selection"] = v_u_3.AbuseMethods.VoiceChat
			})
			p9({
				["type"] = v_u_3.AnalyticsActions.SetPreselectedAbuseSelection,
				["selection"] = v_u_3.AbuseMethods.VoiceChat
			})
			p8({
				["type"] = v_u_3.PlayerMenuActions.SetPreselectedPlayer,
				["player"] = p6
			})
		else
			if v_u_4.getReportAnythingAvatarEnabled() then
				p8({
					["type"] = v_u_3.PlayerMenuActions.UpdateMethodOfAbuse,
					["methodOfAbuse"] = v_u_3.AbuseMethods.TextChat
				})
				p9({
					["type"] = v_u_3.AnalyticsActions.SetTypeOfAbuseSelection,
					["selection"] = v_u_3.AbuseMethods.TextChat
				})
				p9({
					["type"] = v_u_3.AnalyticsActions.SetPreselectedAbuseSelection,
					["selection"] = v_u_3.AbuseMethods.TextChat
				})
			else
				p9({
					["type"] = nil,
					["selection"] = "None",
					["type"] = v_u_3.AnalyticsActions.SetPreselectedAbuseSelection
				})
			end
			p8({
				["type"] = v_u_3.PlayerMenuActions.SetPreselectedPlayer,
				["player"] = p6
			})
		end
	else
		if v_u_4.getReportAnythingAvatarEnabled() then
			p8({
				["type"] = v_u_3.PlayerMenuActions.UpdateMethodOfAbuse,
				["methodOfAbuse"] = v_u_3.AbuseMethods.TextChat
			})
			p9({
				["type"] = v_u_3.AnalyticsActions.SetTypeOfAbuseSelection,
				["selection"] = v_u_3.AbuseMethods.TextChat
			})
			p9({
				["type"] = v_u_3.AnalyticsActions.SetPreselectedAbuseSelection,
				["selection"] = v_u_3.AbuseMethods.TextChat
			})
		else
			p9({
				["type"] = nil,
				["selection"] = "None",
				["type"] = v_u_3.AnalyticsActions.SetPreselectedAbuseSelection
			})
		end
		p8({
			["type"] = v_u_3.PlayerMenuActions.SetPreselectedPlayer,
			["player"] = p6
		})
		return
	end
end
return handlePreselectedPlayer