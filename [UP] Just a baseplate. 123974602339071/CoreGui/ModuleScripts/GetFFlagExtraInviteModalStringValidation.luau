-- Path: CoreGui.RobloxGui.Modules.Flags.GetFFlagExtraInviteModalStringValidation
game:DefineFastFlag("LuaAppExtraInviteModalStringValidation", false)
return function()
	return game:GetFastFlag("LuaAppExtraInviteModalStringValidation")
end