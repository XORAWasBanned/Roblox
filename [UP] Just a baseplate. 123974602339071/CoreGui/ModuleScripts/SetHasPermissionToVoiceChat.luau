-- Path: CoreGui.RobloxGui.Modules.PlayerList.Actions.SetHasPermissionToVoiceChat
return require(script.Parent.Parent.ActionCreator)("SetHasPermissionToVoiceChat", function(p1)
	return {
		["hasPermissionToVoiceChat"] = p1
	}
end)