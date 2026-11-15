-- Path: CoreGui.RobloxGui.Modules.TopBar.Flags.FFlagAddTopBarScrim
local v1 = game:GetService("CorePackages")
return require(v1.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls and game:DefineFastFlag("AddTopBarScrim", false)