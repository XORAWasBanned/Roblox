-- Path: CoreGui.RobloxGui.Modules.Chrome.Flags.FFlagUnibarMenuOpenHamburger
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.SharedFlags)
local v3 = v2.FFlagEnableConsoleExpControls
local v4 = v2.FFlagUnibarMenuOpenHamburgerGamepadIXP
local v5 = game:DefineFastFlag("UnibarMenuOpenHamburger", false)
if v3 then
	v3 = v4 or v5
end
return v3