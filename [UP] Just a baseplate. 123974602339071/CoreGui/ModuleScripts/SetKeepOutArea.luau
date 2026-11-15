-- Path: CoreGui.RobloxGui.Modules.TopBar.Actions.SetKeepOutArea
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux).makeActionCreator
if require(v1.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeKeepOutAreas then
	return nil
else
	return v2(script.Name, function(p3, p4, p5)
		return {
			["id"] = p3,
			["position"] = p4,
			["size"] = p5
		}
	end)
end