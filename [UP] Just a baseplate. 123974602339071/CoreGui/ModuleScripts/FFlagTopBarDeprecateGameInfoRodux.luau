-- Path: CoreGui.RobloxGui.Modules.TopBar.Flags.FFlagTopBarDeprecateGameInfoRodux
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v3 = require(v1.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local v4 = require(v2.Modules.isNewInGameMenuEnabled)
local v5 = game:DefineFastFlag("TopBarDeprecateGameInfoRodux", false)
if v5 then
	if v3 then
		v3 = not v4
	end
else
	v3 = v5
end
return v3