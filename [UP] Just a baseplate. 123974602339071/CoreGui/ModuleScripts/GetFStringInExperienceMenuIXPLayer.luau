-- Path: CoreGui.RobloxGui.Modules.Settings.Flags.GetFStringInExperienceMenuIXPLayer
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.ExperimentLayers).AppUserLayers
game:DefineFastString("InExperienceMenuIXPLayer", v2.ExperienceMenuSettingsExposureLayer)
return function()
	return game:GetFastString("InExperienceMenuIXPLayer")
end