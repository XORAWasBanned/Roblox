-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.Actions.AddMessageFromEvent
local v_u_1 = game:GetService("Players")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Workspace.Packages.ExpChat)
local v_u_4 = require(script.Parent.Parent.Types)
local v_u_5 = require(script.Parent.Parent.Helpers.maybeAssert)
local v_u_6 = require(script.Parent.AddMessageWithTimeout)
return function(p_u_7) -- name: addMessageFromEvent
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_1, (copy) v_u_3, (copy) v_u_6
	v_u_5(v_u_4.IMessageData(p_u_7))
	return function(p8)
		-- upvalues: (ref) v_u_1, (copy) p_u_7, (ref) v_u_3, (ref) v_u_6
		local function v9()
			-- upvalues: (ref) v_u_1, (ref) p_u_7
			return v_u_1:GetPlayerByUserId(p_u_7.SpeakerUserId)
		end
		local v10, v11 = pcall(v9)
		local v12 = v10 and (v11 and v11.Character)
		if v12 then
			local v13 = {}
			local v14 = p_u_7.ID
			v13.id = tostring(v14)
			local v15 = p_u_7.SpeakerUserId
			v13.userId = tostring(v15)
			v13.name = p_u_7.FromSpeaker
			v13.text = p_u_7.Message or ""
			v13.timestamp = p_u_7.Time
			v13.adornee = v12
			v_u_3.Events.LegacyBubbleCreated(v13)
			return p8:dispatch(v_u_6(v13))
		end
	end
end