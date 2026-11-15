-- Path: CoreGui.RobloxGui.Modules.Settings.Flags.FFlagAddTraversalHistoryReactMenuButtons
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.CoreScriptsRoactCommon).Traversal.Flags.FFlagAddTraversalHistory
if v2 then
	v2 = game:DefineFastFlag("AddTraversalHistoryReactMenuButtons", false)
end
return v2