-- Path: CoreGui.RobloxGui.Modules.TopBar.Actions.UpdateCoreGuiEnabled
local v1 = game:GetService("CorePackages")
local v2 = script.Parent.Parent
local v3 = require(v2.Flags.FFlagTopBarDeprecateCoreGuiRodux)
local v4 = require(v1.Packages.Rodux).makeActionCreator
if v3 then
	return nil
else
	return v4(script.Name, function(p5, p6)
		return {
			["coreGuiType"] = p5,
			["enabled"] = p6
		}
	end)
end