-- Path: CoreGui.RobloxGui.Modules.TopBar.Flags.FFlagLoggingGamepadOpenExpControlsMenu
local v1 = script.Parent.Parent.Parent.Chrome
return require(v1.Flags.EnrolledConsoleExperienceControls) and game:DefineFastFlag("LoggingGamepadOpenExpControlsMenu", false)