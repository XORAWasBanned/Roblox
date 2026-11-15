-- Path: CoreGui.RobloxGui.Modules.TopBar.Actions.SetIsDead
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeHealthBar
local v3 = require(v1.Packages.Rodux).makeActionCreator
if v2 then
	return nil
else
	return v3(script.Name, function(p4)
		return {
			["isDead"] = p4
		}
	end)
end