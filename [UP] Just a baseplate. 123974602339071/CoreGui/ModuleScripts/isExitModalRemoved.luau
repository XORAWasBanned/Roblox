-- Path: CoreGui.RobloxGui.Modules.Settings.Flags.isExitModalRemoved
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.PioneerUtils).isPioneerLaunch
return game:DefineFastFlag("RemoveExitModal", false) or v2()