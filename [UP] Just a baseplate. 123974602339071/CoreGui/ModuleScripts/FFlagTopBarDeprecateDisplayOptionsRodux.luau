-- Path: CoreGui.RobloxGui.Modules.TopBar.Flags.FFlagTopBarDeprecateDisplayOptionsRodux
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local v3 = require(v1.Workspace.Packages.Chrome).Enabled
local v4 = require(script.Parent.FFlagTopBarDeprecateGamepadNavigationDialogRodux)
local v5 = require(v1.Workspace.Packages.CoreGuiCommon)
local v6 = v5.Flags.FFlagTopBarSignalizeMenuOpen
local v7 = v5.Flags.FFlagTopBarSignalizeKeepOutAreas
local v8 = v5.Flags.FFlagTopBarSignalizeScreenSize
local v9 = game:DefineFastFlag("TopBarDeprecateDisplayOptionsRodux2", false) and v3()
if v9 then
	if v2 then
		if v4 then
			if v6 then
				if not v7 then
					v8 = v7
				end
			else
				v8 = v6
			end
		else
			v8 = v4
		end
	else
		v8 = v2
	end
else
	v8 = v9
end
return v8