-- Path: CoreGui.RobloxGui.Modules.FTUX.Events.Events
local v1 = script.Parent.Parent
local v2 = require(v1.Enums.PlatformEnum)
local v3 = require(v1.Resources.FTUXEventTypes)[v2.QuestVR]
return {
	[v2.QuestVR] = {
		{ v3.PerspectiveTooltipEvent, v3.FirstPersonToggleEvent, v3.HapticFeedbackEvent },
		{
			v3.MovementTooltipEvent,
			v3.MoveToGoalEvent,
			v3.SoundFeedbackEvent,
			v3.HapticFeedbackTwiceEvent
		},
		{ v3.HapticFeedbackEvent, v3.SoundFeedbackEvent },
		{ v3.SoundFeedbackEvent, v3.LeaveGameIconHighlightEvent }
	}
}