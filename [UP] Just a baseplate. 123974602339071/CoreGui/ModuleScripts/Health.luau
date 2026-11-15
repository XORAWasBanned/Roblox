-- Path: CoreGui.RobloxGui.Modules.TopBar.Reducer.Health
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.Rodux)
local v3 = script.Parent.Parent.Actions
local v4 = require(v3.UpdateHealth)
local v5 = require(v3.SetIsDead)
if require(v1.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeHealthBar then
	return nil
else
	return v2.createReducer({
		["isDead"] = false,
		["currentHealth"] = 100,
		["maxHealth"] = 100
	}, {
		[v4.name] = function(p6, p7)
			return {
				["isDead"] = p6.isDead,
				["currentHealth"] = p7.health,
				["maxHealth"] = p7.maxHealth
			}
		end,
		[v5.name] = function(p8, p9)
			return {
				["isDead"] = p9.isDead,
				["currentHealth"] = p8.currentHealth,
				["maxHealth"] = p8.maxHealth
			}
		end
	})
end