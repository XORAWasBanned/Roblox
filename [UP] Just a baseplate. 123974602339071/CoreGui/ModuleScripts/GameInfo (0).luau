-- Path: CoreGui.RobloxGui.Modules.TopBar.Reducer.GameInfo
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v3 = require(v1.Workspace.Packages.RobloxTranslator)
local v4 = script.Parent.Parent.Actions
local v5 = require(v4.SetGameName)
local v6 = script.Parent.Parent
if require(v6.Flags.FFlagTopBarDeprecateGameInfoRodux) then
	return nil
else
	return v2.createReducer({
		["name"] = v3:FormatByKey("CoreScripts.TopBar.GameNamePlaceHolder")
	}, {
		[v5.name] = function(_, p7)
			return {
				["name"] = p7.gameName
			}
		end
	})
end