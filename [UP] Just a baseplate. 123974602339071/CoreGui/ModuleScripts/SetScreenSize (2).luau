-- Path: CoreGui.RobloxGui.Modules.TopBar.Actions.SetScreenSize
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux).makeActionCreator
if require(v1.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize then
	return nil
else
	return v2(script.Name, function(p3)
		return {
			["screenSize"] = p3
		}
	end)
end