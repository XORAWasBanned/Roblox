-- Path: CoreGui.RobloxGui.Modules.FTUX.Resources.FTUXEventTypes
local v1 = script.Parent.Parent
return {
	[require(v1.Enums.PlatformEnum).QuestVR] = {
		["FirstPersonToggleEvent"] = "FirstPersonToggleEvent",
		["MoveToGoalEvent"] = "MoveToGoalEvent",
		["HapticFeedbackEvent"] = "HapticFeedbackEvent",
		["HapticFeedbackTwiceEvent"] = "HapticFeedbackTwiceEvent",
		["SoundFeedbackEvent"] = "SoundFeedbackEvent",
		["JumpEvent"] = "JumpEvent",
		["PerspectiveTooltipEvent"] = "PerspectiveTooltipEvent",
		["MovementTooltipEvent"] = "MovementTooltipEvent",
		["LeaveGameIconHighlightEvent"] = "LeaveGameIconHighlightEvent"
	}
}