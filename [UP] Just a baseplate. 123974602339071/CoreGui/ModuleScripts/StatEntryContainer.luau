-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.Container.StatEntryContainer
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("CoreGui")
local v3 = v_u_2:WaitForChild("RobloxGui")
local v_u_4 = require(v3.Modules.GameTranslator)
local v_u_5 = require(v1.Packages.React)
local v_u_6 = require(v1.Packages.Cryo)
local v_u_7 = require(v1.Packages.Signals)
local v_u_8 = require(v1.Packages.SignalsReact)
local v9 = require(v1.Workspace.Packages.PlayerList)
require(v1.Workspace.Packages.LeaderboardStore)
local v_u_10 = v9.Hooks.useLeaderboardStore
local v_u_11 = v9.Presentation.StatEntryView
return v_u_5.memo(function(p_u_12) -- name: StatEntryContainer
	-- upvalues: (copy) v_u_10, (copy) v_u_5, (copy) v_u_4, (copy) v_u_2, (copy) v_u_8, (copy) v_u_7, (copy) v_u_6, (copy) v_u_11
	local v_u_13 = v_u_10().getGameStatsList().getData(p_u_12.statName, false)
	local v16 = {
		["statName"] = v_u_5.useMemo(function()
			-- upvalues: (ref) v_u_4, (ref) v_u_2, (copy) p_u_12
			return v_u_4:TranslateGameText(v_u_2, p_u_12.statName)
		end, { p_u_12.statName }),
		["statValue"] = v_u_8.useSignalBinding(v_u_7.createComputed(function(p14)
			-- upvalues: (copy) p_u_12
			return not p_u_12.stat and "-" or p_u_12.stat(p14)
		end)),
		["layoutOrder"] = v_u_8.useSignalBinding(v_u_7.createComputed(function(p15)
			-- upvalues: (copy) v_u_13
			return not v_u_13 and (1 / 0) or v_u_13.order(p15)
		end))
	}
	local v17 = v_u_6.Dictionary.join(v16, p_u_12)
	return v_u_5.createElement(v_u_11, v17)
end)