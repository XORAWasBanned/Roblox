-- Path: CoreGui.RobloxGui.Modules.InGameMenu.reducer.respawn
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Cryo
local v4 = v2.Rodux
local v5 = script.Parent.Parent
local v6 = require(v5.Actions.SetRespawning)
local v7 = require(v5.Actions.SetRespawnBehavior)
local v8 = require(v5.Actions.SetMenuOpen)
local v9 = require(v5.Actions.SetCurrentPage)
return v4.createReducer({
	["dialogOpen"] = false,
	["enabled"] = true,
	["customCallback"] = nil
}, {
	[v6.name] = function(p10, p11)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.join(p10, {
			["dialogOpen"] = p11.respawning
		})
	end,
	[v8.name] = function(p12, p13)
		-- upvalues: (copy) v_u_3
		if p13.menuOpen then
			return p12
		else
			return v_u_3.Dictionary.join(p12, {
				["dialogOpen"] = false
			})
		end
	end,
	[v9.name] = function(p14, _)
		-- upvalues: (copy) v_u_3
		return v_u_3.Dictionary.join(p14, {
			["dialogOpen"] = false
		})
	end,
	[v7.name] = function(p15, p16)
		local v17 = p15.dialogOpen
		if not p16.respawnEnabled then
			v17 = false
		end
		return {
			["customCallback"] = p16.customCallback,
			["enabled"] = p16.respawnEnabled,
			["dialogOpen"] = v17
		}
	end
})