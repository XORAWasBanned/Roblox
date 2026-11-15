-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.Container.PlayerEntryContainer
local v1 = game:GetService("CorePackages")
local v2 = script.Parent.Parent.Parent
local v_u_3 = require(v1.Packages.React)
local v4 = require(v1.Packages.RoactRodux)
local v_u_5 = require(v1.Packages.SignalsReact)
local v6 = require(v1.Workspace.Packages.PlayerList)
require(v1.Workspace.Packages.LeaderboardStore)
local v7 = require(v1.Workspace.Packages.SharedFlags)
local v8 = require(v1.Workspace.Packages.PlayerIconInfoStore)
local v_u_9 = v6.Hooks.useLeaderboardStore
local v_u_10 = require(v2.Components.PresentationCommon.PlayerEntryView)
local v_u_11 = require(v2.Actions.ClosePlayerDropDown)
local v_u_12 = require(v2.Actions.OpenPlayerDropDown)
local v_u_13 = v7.FFlagReplacePlayerIconRoduxWithSignal
local v_u_14
if v_u_13 then
	v_u_14 = v8.PlayerIconInfoStore
else
	v_u_14 = nil
end
local v_u_15 = v7.FFlagPlayerListFixLeaderstatsStacking
local v_u_16 = v6.Flags.FFlagPlayerListUseFocusNavHook
return v_u_3.memo(v4.connect(function(p17) -- name: mapStateToProps
	return {
		["selectedPlayer"] = p17.playerDropDown.selectedPlayer,
		["dropdownOpen"] = p17.playerDropDown.isVisible,
		["isSmallTouchDevice"] = p17.displayOptions.isSmallTouchDevice,
		["isDirectionalPreferred"] = p17.displayOptions.isTenFootInterface
	}
end, function(p_u_18) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_11, (copy) v_u_12
	return {
		["closeDropdown"] = function() -- name: closeDropdown
			-- upvalues: (copy) p_u_18, (ref) v_u_11
			return p_u_18(v_u_11())
		end,
		["openDropdown"] = function(p19) -- name: openDropdown
			-- upvalues: (copy) p_u_18, (ref) v_u_12
			return p_u_18(v_u_12(p19))
		end
	}
end)(function(p20) -- name: PlayerEntryContainer
	-- upvalues: (copy) v_u_9, (copy) v_u_13, (copy) v_u_14, (copy) v_u_5, (copy) v_u_15, (copy) v_u_3, (copy) v_u_10, (copy) v_u_16
	local v21 = v_u_9()
	local v22
	if v_u_13 then
		local v23 = v_u_14.getPlayerIconInfoReactive(p20.player.UserId)
		v22 = v_u_5.useSignalState(v23)
	else
		v22 = p20.playerIconInfo
	end
	local v24 = v21.getGameStatsList()
	local v25 = v21.getPlayerEntry(p20.player, false)
	local v26
	if v_u_15 then
		v26 = nil
	else
		v26 = v_u_5.useSignalState(v24.getCount)
	end
	if not v25 then
		return nil
	end
	local v27 = v_u_3.createElement
	local v28 = v_u_10
	local v29 = {
		["playerData"] = v25,
		["gameStats"] = v24
	}
	if v_u_15 then
		v26 = nil
	end
	v29.gameStatsCount = v26
	v29.size = p20.size
	v29.entrySizeX = p20.entrySizeX
	v29.layoutOrder = p20.layoutOrder
	v29.player = p20.player
	v29.titlePlayerEntry = p20.titlePlayerEntry
	v29.playerIconInfo = v22
	v29.playerRelationship = p20.playerRelationship
	v29.dropdownOpen = p20.dropdownOpen
	v29.selectedPlayer = p20.selectedPlayer
	v29.firstPlayerRef = p20.firstPlayerRef
	v29.openDropdown = p20.openDropdown
	v29.closeDropdown = p20.closeDropdown
	v29.setDropDownPlayerDimensionY = p20.setDropDownPlayerDimensionY
	v29.prevFocusedEntry = p20.prevFocusedEntry
	v29.destroyedFocusedPlayerId = p20.destroyedFocusedPlayerId
	local v30
	if v_u_16 then
		v30 = p20.registerPlayerInstance
	else
		v30 = nil
	end
	v29.registerPlayerInstance = v30
	local v31
	if v_u_16 then
		v31 = p20.unregisterPlayerInstance
	else
		v31 = nil
	end
	v29.unregisterPlayerInstance = v31
	local v32
	if v_u_16 then
		v32 = p20.setSelectedPlayerId
	else
		v32 = nil
	end
	v29.setSelectedPlayerId = v32
	v29.isSmallTouchDevice = p20.isSmallTouchDevice
	v29.isDirectionalPreferred = p20.isDirectionalPreferred
	return v27(v28, v29)
end))