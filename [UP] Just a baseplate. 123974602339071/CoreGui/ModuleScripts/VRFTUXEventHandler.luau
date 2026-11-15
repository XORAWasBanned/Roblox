-- Path: CoreGui.RobloxGui.Modules.FTUX.Events.VR.VRFTUXEventHandler
local v1 = script.Parent.Parent.Parent
local v_u_2 = require(v1.Events.VR.FirstPersonToggleEvent)
local v_u_3 = require(v1.Events.VR.HapticFeedbackEvent)
local v_u_4 = require(v1.Events.VR.HapticFeedbackTwiceEvent)
local v_u_5 = require(v1.Events.VR.SoundFeedbackEvent)
local v_u_6 = require(v1.Events.VR.JumpEvent)
local v_u_7 = require(v1.Events.VR.MoveToGoalEvent)
local v_u_8 = require(v1.Events.VR.PerspectiveTooltipEvent)
local v_u_9 = require(v1.Events.VR.MovementTooltipEvent)
local v_u_10 = require(v1.Events.VR.LeaveGameIconHighlightEvent)
local v11 = require(v1.Enums.PlatformEnum)
local v12 = require(v1.Resources.FTUXEventTypes)
require(script.Parent.Parent.EventType)
local v_u_13 = v12[v11.QuestVR]
return {
	["Name"] = "VRFTUXEventHandler",
	["StartEvent"] = function(p14, p15) -- name: StartEvent
		-- upvalues: (copy) v_u_13, (copy) v_u_2, (copy) v_u_7, (copy) v_u_6, (copy) v_u_8, (copy) v_u_9, (copy) v_u_3, (copy) v_u_5, (copy) v_u_4, (copy) v_u_10
		if p14 == v_u_13.FirstPersonToggleEvent then
			task.spawn(v_u_2.StartEvent, p15)
			return
		elseif p14 == v_u_13.MoveToGoalEvent then
			task.spawn(v_u_7.StartEvent, p15)
			return
		elseif p14 == v_u_13.JumpEvent then
			task.spawn(v_u_6.StartEvent, p15)
			return
		elseif p14 == v_u_13.PerspectiveTooltipEvent then
			task.spawn(v_u_8.StartEvent)
			return
		elseif p14 == v_u_13.MovementTooltipEvent then
			task.spawn(v_u_9.StartEvent)
			return
		elseif p14 == v_u_13.HapticFeedbackEvent then
			task.spawn(v_u_3.StartEvent)
			return
		elseif p14 == v_u_13.SoundFeedbackEvent then
			task.spawn(v_u_5.StartEvent)
			return
		elseif p14 == v_u_13.HapticFeedbackTwiceEvent then
			task.spawn(v_u_4.StartEvent)
			return
		elseif p14 == v_u_13.LeaveGameIconHighlightEvent then
			task.spawn(v_u_10.StartEvent)
		else
			warn("Unmapped VRFTUX event type: " .. tostring(p14))
		end
	end,
	["StopEvent"] = function(p16) -- name: StopEvent
		-- upvalues: (copy) v_u_13, (copy) v_u_2, (copy) v_u_7, (copy) v_u_6, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10
		if p16 == v_u_13.FirstPersonToggleEvent then
			task.spawn(v_u_2.StopEvent)
			return
		elseif p16 == v_u_13.MoveToGoalEvent then
			task.spawn(v_u_7.StopEvent)
			return
		elseif p16 == v_u_13.JumpEvent then
			task.spawn(v_u_6.StopEvent)
			return
		elseif p16 == v_u_13.PerspectiveTooltipEvent then
			task.spawn(v_u_8.StopEvent)
			return
		elseif p16 == v_u_13.MovementTooltipEvent then
			task.spawn(v_u_9.StopEvent)
			return
		elseif p16 == v_u_13.LeaveGameIconHighlightEvent then
			task.spawn(v_u_10.StopEvent)
			return
		elseif p16 == v_u_13.HapticFeedbackTwiceEvent then
			return
		elseif p16 == v_u_13.HapticFeedbackEvent then
			return
		elseif p16 ~= v_u_13.SoundFeedbackEvent then
			warn("Unmapped VRFTUX event type: " .. tostring(p16))
		end
	end
}