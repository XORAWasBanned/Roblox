-- Path: CoreGui.RobloxGui.Modules.Chrome.Flags.FFlagLeaveActionChromeShortcutTelemetry
local v1 = script.Parent.Parent.Parent.Chrome
return require(v1.Flags.EnrolledConsoleExperienceControls) and game:DefineFastFlag("LeaveActionChromeShortcutTelemetry", false)