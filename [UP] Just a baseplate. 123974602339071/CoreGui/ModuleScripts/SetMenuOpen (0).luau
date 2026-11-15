-- Path: CoreGui.RobloxGui.Modules.TopBar.Actions.SetMenuOpen
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux).makeActionCreator
if require(v1.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeMenuOpen then
	return nil
else
	return v2(script.Name, function(p3)
		return {
			["menuOpen"] = p3
		}
	end)
end