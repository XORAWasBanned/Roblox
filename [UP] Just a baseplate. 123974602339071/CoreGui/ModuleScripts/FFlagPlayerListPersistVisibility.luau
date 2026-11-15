-- Path: CoreGui.RobloxGui.Modules.PlayerList.Flags.FFlagPlayerListPersistVisibility
local v1 = game:DefineFastFlag("PlayerListPersistVisibility", false)
if v1 then
	v1 = game:GetEngineFeature("AddPlayerListVisibleSettings")
end
return v1