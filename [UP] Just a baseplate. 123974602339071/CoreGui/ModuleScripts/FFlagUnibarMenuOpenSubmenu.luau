-- Path: CoreGui.RobloxGui.Modules.Chrome.Flags.FFlagUnibarMenuOpenSubmenu
local v1 = game:GetService("CorePackages")
return require(v1.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls and game:DefineFastFlag("UnibarMenuOpenSubmenu", false)