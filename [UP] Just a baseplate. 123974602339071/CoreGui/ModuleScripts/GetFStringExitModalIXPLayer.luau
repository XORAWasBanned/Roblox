-- Path: CoreGui.RobloxGui.Modules.Settings.Flags.GetFStringExitModalIXPLayer
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.ExperimentLayers).AppUserLayers
game:DefineFastString("ExitModalIXPLayer", v2.ExperienceMenuExitModalLayer)
return function()
	return game:GetFastString("ExitModalIXPLayer")
end