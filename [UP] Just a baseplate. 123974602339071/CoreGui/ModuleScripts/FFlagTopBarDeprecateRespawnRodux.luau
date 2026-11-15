-- Path: CoreGui.RobloxGui.Modules.TopBar.Flags.FFlagTopBarDeprecateRespawnRodux
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local v3 = require(v1.Workspace.Packages.Chrome).Enabled
local v4 = game:DefineFastFlag("TopBarDeprecateRespawnRodux2", false)
if v4 then
	if v2 then
		v2 = v3()
	end
else
	v2 = v4
end
return v2