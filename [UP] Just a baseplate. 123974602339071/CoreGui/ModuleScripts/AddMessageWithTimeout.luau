-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.Actions.AddMessageWithTimeout
local v_u_1 = game:GetService("RbxAnalyticsService")
local v2 = game:GetService("CorePackages")
require(v2.Packages.Cryo)
local v_u_3 = require(script.Parent.Parent.Types)
local v_u_4 = require(script.Parent.Parent.Helpers.maybeAssert)
local v_u_5 = require(script.Parent.AddMessage)
local v_u_6 = require(script.Parent.RemoveMessage)
local v_u_7 = require(script.Parent.Parent.Helpers.getSettingsForMessage)
local v_u_8 = game:DefineFastInt("BubbleChatAddMessageRolloutPercent", 100)
return function(p_u_9) -- name: addMessageWithTimeout
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_5, (copy) v_u_7, (copy) v_u_6, (copy) v_u_1, (copy) v_u_8
	v_u_4(v_u_3.IMessage(p_u_9))
	return function(p10)
		-- upvalues: (ref) v_u_5, (copy) p_u_9, (ref) v_u_7, (ref) v_u_6, (ref) v_u_1, (ref) v_u_8
		p10:dispatch(v_u_5(p_u_9))
		local v11 = v_u_7(p10:getState().chatSettings, p_u_9)
		local v12 = p10:getState().userMessages[p_u_9.userId]
		local v13 = p10:getState().messages
		for v14 = 1, #v12 - v11.MaxBubbles do
			p10:dispatch(v_u_6(v13[v12[v14]]))
		end
		v_u_1:ReportCounter("RoactBubbleChat-MessagesSent")
		if v_u_8 >= math.random(1, 100) then
			v_u_1:SendEventDeferred("client", "bubbleChatMetric", "messageAdded", {
				["placeId"] = game.PlaceId,
				["senderUserId"] = p_u_9.userId
			})
		end
		wait(v11.BubbleDuration)
		p10:dispatch(v_u_6(p_u_9))
	end
end