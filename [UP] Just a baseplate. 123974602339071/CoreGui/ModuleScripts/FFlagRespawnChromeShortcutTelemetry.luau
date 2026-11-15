-- Path: CoreGui.RobloxGui.Modules.Chrome.Flags.FFlagRespawnChromeShortcutTelemetry
local v1 = script.Parent.Parent.Parent.Chrome
return require(v1.Flags.EnrolledConsoleExperienceControls) and game:DefineFastFlag("RespawnChromeShortcutTelemetry", false)