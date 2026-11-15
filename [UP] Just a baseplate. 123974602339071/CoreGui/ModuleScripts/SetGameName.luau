-- Path: CoreGui.RobloxGui.Modules.TopBar.Actions.SetGameName
local v1 = game:GetService("CorePackages")
local v2 = script.Parent.Parent
local v3 = require(v2.Flags.FFlagTopBarDeprecateGameInfoRodux)
local v4 = require(v1.Packages.Rodux).makeActionCreator
if v3 then
	return nil
else
	return v4(script.Name, function(p5)
		return {
			["gameName"] = p5
		}
	end)
end