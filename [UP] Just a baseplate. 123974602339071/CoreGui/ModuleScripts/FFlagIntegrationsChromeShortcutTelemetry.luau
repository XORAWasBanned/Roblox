-- Path: CoreGui.RobloxGui.Modules.Chrome.Flags.FFlagIntegrationsChromeShortcutTelemetry
local v1 = script.Parent.Parent.Parent.Chrome
return require(v1.Flags.EnrolledConsoleExperienceControls) or game:DefineFastFlag("IntegrationsChromeShortcutTelemetry", false)