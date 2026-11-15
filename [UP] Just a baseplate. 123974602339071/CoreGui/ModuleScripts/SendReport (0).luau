-- Path: CoreGui.RobloxGui.Modules.TrustAndSafety.Thunks.SendReport
game:GetService("Players")
local v1 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
require(v1.Modules.VoiceChat.ReportAbuseLogic)
local v2 = script.Parent.Parent
local v_u_3 = require(v2.Resources.Constants)
local v_u_4 = require(v2.Actions.ShowToast)
local v_u_5 = require(v2.Actions.OpenReportSentDialog)
local v_u_6 = require(v2.Actions.EndReportFlow)
local v_u_7 = require(v2.Utility.ReportManager)
return function(p_u_8, p_u_9, p_u_10, p_u_11, p_u_12, p_u_13, p_u_14)
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_5, (copy) v_u_4, (copy) v_u_6
	return function(p_u_15)
		-- upvalues: (copy) p_u_8, (ref) v_u_3, (ref) v_u_7, (copy) p_u_12, (copy) p_u_9, (copy) p_u_10, (copy) p_u_11, (ref) v_u_5, (ref) v_u_4, (copy) p_u_13, (copy) p_u_14, (ref) v_u_6
		local v16 = p_u_15:getState()
		if p_u_8 == v_u_3.ReportType.Player then
			v_u_7.submitUserAbuseReport({
				["reportCategory"] = p_u_12,
				["abusingPlayer"] = p_u_9,
				["reason"] = p_u_10,
				["comment"] = p_u_11,
				["beginningTimestamp"] = v16.report.beginningTimestamp,
				["sortedUserIds"] = v16.report.sortedUserIds
			}, function()
				-- upvalues: (copy) p_u_15, (ref) v_u_5, (ref) p_u_8, (ref) p_u_9
				p_u_15:dispatch(v_u_5(p_u_8, p_u_9))
			end)
		elseif p_u_8 == v_u_3.ReportType.Place then
			v_u_7.submitPlaceAbuseReport({
				["placeId"] = game.PlaceId,
				["placeName"] = v16.placeInfo.name,
				["placeDescription"] = v16.placeInfo.description,
				["reason"] = p_u_10,
				["comment"] = p_u_11
			}, function()
				-- upvalues: (copy) p_u_15, (ref) v_u_4, (ref) p_u_13, (ref) p_u_14
				p_u_15:dispatch(v_u_4(p_u_13, p_u_14))
			end)
			p_u_15:dispatch(v_u_6())
		end
	end
end