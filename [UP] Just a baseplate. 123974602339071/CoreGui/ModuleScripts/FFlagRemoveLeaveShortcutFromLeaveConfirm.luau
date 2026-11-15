-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Flags.FFlagRemoveLeaveShortcutFromLeaveConfirm
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
if v2 then
	v2 = game:DefineFastFlag("RemoveLeaveShortcutFromLeaveConfirm", false)
end
return v2