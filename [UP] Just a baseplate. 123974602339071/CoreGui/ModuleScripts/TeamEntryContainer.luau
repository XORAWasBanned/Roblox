-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.Container.TeamEntryContainer
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("CoreGui")
local v3 = v_u_2:WaitForChild("RobloxGui")
local v4 = script.Parent.Parent.Parent
local v_u_5 = require(v1.Packages.React)
local v6 = require(v1.Workspace.Packages.PlayerList)
require(v1.Workspace.Packages.LeaderboardStore)
local v_u_7 = require(v1.Packages.SignalsReact)
local v_u_8 = require(v3.Modules.GameTranslator)
local v_u_9 = v6.Hooks.useLeaderboardStore
local v_u_10 = require(v4.Components.PresentationCommon.TeamEntryView)
local v_u_11 = require(v1.Workspace.Packages.SharedFlags).FFlagPlayerListFixLeaderstatsStacking
return v_u_5.memo(function(p_u_12) -- name: TeamEntryContainer
	-- upvalues: (copy) v_u_9, (copy) v_u_7, (copy) v_u_8, (copy) v_u_2, (copy) v_u_11, (copy) v_u_5, (copy) v_u_10
	local v13 = v_u_9().getGameStatsList()
	local v14 = p_u_12.teamData.stats
	local v16 = v_u_7.useSignalBinding(function(p15)
		-- upvalues: (ref) v_u_8, (ref) v_u_2, (copy) p_u_12
		return v_u_8:TranslateGameText(v_u_2, p_u_12.teamData.name(p15))
	end)
	local v17 = v_u_7.useSignalState(p_u_12.teamData.color)
	local v18
	if v_u_11 then
		v18 = nil
	else
		v18 = v_u_7.useSignalState(v13.getCount)
	end
	local v19
	if v_u_11 then
		v19 = nil
	else
		v19 = v_u_7.useSignalState(v14.getCount)
	end
	local v20 = v_u_5.createElement
	local v21 = v_u_10
	local v22 = {
		["teamName"] = v16,
		["teamColor"] = v17
	}
	if v_u_11 then
		v18 = nil
	end
	v22.gameStatsCount = v18
	if v_u_11 then
		v19 = nil
	end
	v22.teamStatsCount = v19
	v22.gameStats = v13
	v22.teamStats = v14
	v22.size = p_u_12.size
	v22.entrySizeX = p_u_12.entrySizeX
	v22.layoutOrder = p_u_12.layoutOrder
	v22.isSmallTouchDevice = p_u_12.isSmallTouchDevice
	v22.isDirectionalPreferred = p_u_12.isDirectionalPreferred
	return v20(v21, v22)
end)