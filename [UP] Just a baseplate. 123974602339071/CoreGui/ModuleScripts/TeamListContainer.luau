-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.Container.TeamListContainer
local v1 = game:GetService("CorePackages")
local v2 = script.Parent.Parent.Parent
local v_u_3 = require(v1.Packages.React)
local v4 = require(v1.Packages.RoactRodux)
local v_u_5 = require(v1.Packages.SignalsReact)
local v6 = require(v1.Workspace.Packages.PlayerList)
local v_u_7 = require(v1.Workspace.Packages.LeaderboardStore)
require(v1.Workspace.Packages.PlayerIconInfoStore)
local v_u_8 = v6.Hooks.useLeaderboardStore
local v_u_9 = require(v2.Components.PresentationCommon.TeamListView)
local v_u_10 = v6.Flags.FFlagPlayerListUseFocusNavHook
return v_u_3.memo(v4.connect(function(p11) -- name: mapStateToProps
	return {
		["isSmallTouchDevice"] = p11.displayOptions.isSmallTouchDevice,
		["isDirectionalPreferred"] = p11.displayOptions.isTenFootInterface,
		["playerIconInfo"] = p11.playerIconInfo,
		["playerRelationship"] = p11.playerRelationship
	}
end)(function(p_u_12) -- name: TeamListContainer
	-- upvalues: (copy) v_u_8, (copy) v_u_5, (copy) v_u_3, (copy) v_u_7, (copy) v_u_10, (copy) v_u_9
	local v13 = v_u_8().getTeamList().getCount
	local v_u_14 = v_u_5.useSignalState(v13)
	local v_u_15 = v_u_5.useSignalState(p_u_12.teamData.players.getCount)
	local v16 = v_u_5.useSignalBinding(p_u_12.teamData.order)
	local v17 = v_u_3.useMemo(function()
		-- upvalues: (copy) p_u_12, (ref) v_u_7, (copy) v_u_14, (copy) v_u_15
		if p_u_12.teamData.name(false) == v_u_7.SpecialNeutralTeamName then
			if v_u_14 == 1 then
				return false
			end
			if v_u_15 == 0 then
				return false
			end
		end
		return true
	end, { v_u_14, v_u_15, p_u_12.teamData.name })
	local v18, v19
	if v_u_10 then
		v18, v19 = v_u_3.useMemo(function()
			-- upvalues: (copy) p_u_12
			if not (p_u_12.registerTeamInstance and p_u_12.teamId) then
				return nil, nil
			end
			local v20 = p_u_12.registerTeamInstance(p_u_12.teamId, p_u_12.teamData.order)
			return v20.registerPlayerInstance, v20.unregisterPlayerInstance
		end, { p_u_12.registerTeamInstance, p_u_12.teamId, p_u_12.teamData })
	else
		v18 = nil
		v19 = nil
	end
	if v_u_10 then
		v_u_3.useEffect(function()
			-- upvalues: (copy) p_u_12
			return function()
				-- upvalues: (ref) p_u_12
				if p_u_12.unregisterTeamInstance and p_u_12.teamId then
					p_u_12.unregisterTeamInstance(p_u_12.teamId)
				end
			end
		end, { p_u_12.unregisterTeamInstance, p_u_12.teamId })
	end
	local v21 = v_u_3.createElement
	local v22 = v_u_9
	local v23 = {
		["layoutOrder"] = v16,
		["showTeamEntry"] = v17,
		["teamPlayersCount"] = v_u_15,
		["entrySizeX"] = p_u_12.entrySizeX,
		["teamData"] = p_u_12.teamData,
		["playerIconInfos"] = p_u_12.playerIconInfos,
		["playerRelationships"] = p_u_12.playerRelationships,
		["firstPlayerRef"] = p_u_12.firstPlayerRef,
		["setDropDownPlayerDimensionY"] = p_u_12.setDropDownPlayerDimensionY,
		["prevFocusedEntry"] = p_u_12.prevFocusedEntry,
		["destroyedFocusedPlayerId"] = p_u_12.destroyedFocusedPlayerId
	}
	if not v_u_10 then
		v18 = nil
	end
	v23.registerPlayerInstance = v18
	if not v_u_10 then
		v19 = nil
	end
	v23.unregisterPlayerInstance = v19
	local v24
	if v_u_10 then
		v24 = p_u_12.setSelectedPlayerId
	else
		v24 = nil
	end
	v23.setSelectedPlayerId = v24
	v23.isSmallTouchDevice = p_u_12.isSmallTouchDevice
	v23.isDirectionalPreferred = p_u_12.isDirectionalPreferred
	return v21(v22, v23)
end))