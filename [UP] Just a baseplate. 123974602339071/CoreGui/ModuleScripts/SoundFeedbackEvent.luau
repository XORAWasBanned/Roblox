-- Path: CoreGui.RobloxGui.Modules.FTUX.Events.VR.SoundFeedbackEvent
require(script.Parent.Parent.EventType)
return {
	["Name"] = "SoundFeedbackEvent",
	["StartEvent"] = function() -- name: StartEvent
		local v1 = Instance.new("Sound")
		v1.Parent = game.Workspace
		v1.SoundId = "rbxassetid://10066947742"
		v1.Volume = 1
		v1:Play()
	end
}