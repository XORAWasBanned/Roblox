-- Path: CoreGui.RobloxGui.Modules.VoiceChat.Helpers.showUFRVoiceRestriction
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("Players")
require(v1.Workspace.Packages.VoiceChat.createVoiceRestrictionController)
local v_u_3 = require(v1.Workspace.Packages.UniversalFeatureRestrictions)
return function(p4) -- name: showUFRVoiceRestriction
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v5 = v_u_2.LocalPlayer
	if v5 then
		local v_u_6 = v5.UserId
		local v7 = p4.manager
		local v_u_8 = v7.Analytics
		local v_u_9 = p4.settings.banReason
		local v_u_10 = not v7.service and "" or v7.previousSessionId
		local v_u_11 = false
		local v_u_12 = false
		local v_u_13 = false
		v_u_3.showFeatureRestriction(v_u_3.AbuseVector.Voice, {
			["onShown"] = function() -- name: onShown
				-- upvalues: (ref) v_u_11, (copy) v_u_8, (copy) v_u_9, (copy) v_u_6, (copy) v_u_10
				if not v_u_11 then
					v_u_11 = true
					v_u_8:reportBanMessageEvent("Shown")
					v_u_8:reportBanMessageEventV2("Shown", v_u_9, v_u_6, v_u_10)
				end
			end,
			["onAppeal"] = function() -- name: onAppeal
				-- upvalues: (ref) v_u_12, (copy) v_u_8, (copy) v_u_9, (copy) v_u_6, (copy) v_u_10
				v_u_12 = true
				v_u_8:reportBanMessageEvent("Denied")
				v_u_8:reportBanMessageEventV2("Denied", v_u_9, v_u_6, v_u_10)
			end,
			["onDismiss"] = function() -- name: onDismiss
				-- upvalues: (ref) v_u_13, (ref) v_u_12, (copy) v_u_8, (copy) v_u_9, (copy) v_u_6, (copy) v_u_10
				if not v_u_13 then
					v_u_13 = true
					if not v_u_12 then
						v_u_8:reportBanMessageEvent("Acknowledged")
						v_u_8:reportBanMessageEventV2("Acknowledged", v_u_9, v_u_6, v_u_10)
					end
				end
			end,
			["onAcknowledgementSuccess"] = p4.onAcknowledgementSuccess
		})
	end
end