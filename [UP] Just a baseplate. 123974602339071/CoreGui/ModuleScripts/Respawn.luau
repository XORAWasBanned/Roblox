-- Path: CoreGui.RobloxGui.Modules.TopBar.Reducer.Respawn
local v1 = game:GetService("CorePackages")
local v2 = script.Parent.Parent
if require(v2.Flags.FFlagTopBarDeprecateRespawnRodux) then
	return nil
end
local v3 = require(v1.Packages.Rodux)
local v4 = script.Parent.Parent.Actions
local v5 = require(v4.SetRespawnBehaviour)
return v3.createReducer({
	["enabled"] = true,
	["customCallback"] = nil
}, {
	[v5.name] = function(_, p6)
		return {
			["enabled"] = p6.respawnEnabled,
			["customCallback"] = p6.customCallback
		}
	end
})