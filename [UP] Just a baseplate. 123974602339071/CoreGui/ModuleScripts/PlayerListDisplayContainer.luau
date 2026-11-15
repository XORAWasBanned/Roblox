-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.Container.PlayerListDisplayContainer
local v1 = game:GetService("CorePackages")
local v2 = script.Parent.Parent.Parent
local v_u_3 = require(v1.Packages.React)
local v4 = require(v1.Packages.RoactRodux)
local v_u_5 = require(v1.Packages.SignalsReact)
local v6 = require(v1.Workspace.Packages.PlayerList)
require(v1.Workspace.Packages.LeaderboardStore)
local v_u_7 = v6.Hooks.useLeaderboardStore
local v_u_8 = require(v2.Components.PresentationCommon.PlayerListDisplayView)
local v_u_9 = require(v2.Actions.SetPlayerListVisibility)
local v_u_10 = v6.Flags.FFlagAddNewPlayerListFocusNav
local function v_u_17(p11) -- name: PlayerListDisplayContainer
	-- upvalues: (copy) v_u_7, (copy) v_u_5, (copy) v_u_3, (copy) v_u_8
	local v12 = v_u_7()
	local v13 = v12.getGameStatsList()
	local v14 = v12.getTeamList()
	local v15 = v_u_5.useSignalState(v13.getCount)
	local v16 = v_u_5.useSignalState(v14.getCount)
	if v12 then
		return v_u_3.createElement(v_u_3.Fragment, nil, v_u_3.createElement(v_u_8, {
			["teamList"] = v14,
			["teamListCount"] = v16,
			["gameStatsCount"] = v15,
			["entrySizeX"] = p11.entrySize,
			["screenSizeY"] = p11.screenSizeY,
			["playerIconInfo"] = p11.playerIconInfo,
			["playerRelationship"] = p11.playerRelationship,
			["dropDownPlayer"] = p11.dropDownPlayer,
			["dropDownVisible"] = p11.dropDownVisible,
			["dismissPlayerList"] = p11.dismissPlayerList,
			["isVisible"] = p11.isVisible,
			["isMinimized"] = p11.isMinimized,
			["isSmallTouchDevice"] = p11.isSmallTouchDevice,
			["isDirectionalPreferred"] = p11.isDirectionalPreferred,
			["isUsingGamepad"] = p11.isUsingGamepad
		}))
	else
		return nil
	end
end
return v_u_3.memo(v4.connect(function(p18) -- name: mapStateToProps
	-- upvalues: (copy) v_u_10
	local v19 = p18.displayOptions.isMinimized
	local v20 = {}
	local v21
	if v_u_10 then
		v21 = nil
	else
		v21 = p18.displayOptions.isVisible
	end
	v20.isVisible = v21
	v20.isMinimized = v19
	v20.isDirectionalPreferred = p18.displayOptions.isTenFootInterface
	v20.isUsingGamepad = p18.displayOptions.isUsingGamepad
	v20.isSmallTouchDevice = p18.displayOptions.isSmallTouchDevice
	v20.playerIconInfo = p18.playerIconInfo
	v20.playerRelationship = p18.playerRelationship
	v20.dropDownPlayer = p18.playerDropDown.selectedPlayer
	v20.dropDownVisible = p18.playerDropDown.isVisible
	return v20
end, function(p_u_22) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_9
	return {
		["dismissPlayerList"] = function() -- name: dismissPlayerList
			-- upvalues: (copy) p_u_22, (ref) v_u_9
			return p_u_22(v_u_9(false))
		end
	}
end)(function(p23) -- name: PlayerListDisplayContainerWithLeaderboardStore
	-- upvalues: (copy) v_u_7, (copy) v_u_17
	if v_u_7() then
		return v_u_17(p23)
	else
		return nil
	end
end))