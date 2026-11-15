-- Path: CoreGui.RobloxGui.Modules.TopBar.Flags.FFlagTopBarDeprecateCoreGuiRodux
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local v3 = require(v1.Workspace.Packages.Chrome).Enabled
local v4 = require(v1.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeHealthBar
local v5 = game:DefineFastFlag("TopBarDeprecateCoreGuiRodux2", false)
if v5 then
	if v4 then
		if v2 then
			v2 = v3()
		end
	else
		v2 = v4
	end
else
	v2 = v5
end
return v2