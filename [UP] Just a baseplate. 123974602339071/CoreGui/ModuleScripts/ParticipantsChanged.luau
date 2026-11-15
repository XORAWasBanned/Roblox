-- Path: CoreGui.RobloxGui.Modules.VoiceChat.Actions.ParticipantsChanged
local v1 = game:GetService("CorePackages")
return require(v1.Packages.Rodux).makeActionCreator(script.Name, function(p2)
	return {
		["newParticipants"] = p2
	}
end)