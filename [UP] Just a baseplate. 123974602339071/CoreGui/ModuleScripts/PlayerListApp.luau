-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.Presentation.PlayerListApp
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("Players")
local v4 = v2:WaitForChild("RobloxGui")
local v_u_5 = require(v1.Packages.Roact)
local v6 = require(v1.Packages.RoactRodux)
local v_u_7 = require(v1.Packages.Signals)
local v_u_8 = require(v1.Packages.SignalsReact)
local v_u_9 = require(v1.Packages.Otter)
local v_u_10 = require(v1.Packages.Cryo)
local v11 = require(v1.Workspace.Packages.PlayerList)
require(v1.Workspace.Packages.LeaderboardStore)
local v_u_12 = require(v1.Workspace.Packages.Display)
local v_u_13 = require(v4.Modules.Stats.StatsUtils)
local v14 = script.Parent
local v15 = v14.Parent.PresentationCommon
local v16 = v14.Parent.Parent
local v_u_17 = v11.Hooks.useLeaderboardStore
local v_u_18 = v11.Hooks.usePlatformLeaderboard
local v_u_19 = v11.Common.Constants
local v_u_20 = require(v16.Components.Container.PlayerEntryContainer)
local v_u_21 = require(v16.Components.Container.PlayerListDisplayContainer)
local v_u_22 = require(v15.TenFootSideBar)
local v23 = v16.Components.Connection
local v_u_24 = require(v23.EventConnections)
local v_u_25 = require(v23.ContextActionsBinder)
local v_u_26 = require(v23.TopStatConnector)
local v_u_27 = require(v23.LayoutValues).WithLayoutValues
local v_u_28 = v11.Flags.FFlagAddNewPlayerListFocusNav
local v_u_29 = v11.Flags.FFlagPlayerListFixPlatformLeaderboardSizing
local v_u_30 = v11.Flags.FFlagPlayerListTwoTabsOnLegacy
local v_u_31 = require(v16.Flags.FFlagPlayerListRemoveTopStat)
local v_u_32 = {
	["dampingRatio"] = 1,
	["frequency"] = 7
}
local v_u_33
if v_u_29 and v_u_30 then
	v_u_33 = v_u_7.createSignal(false)
else
	v_u_33 = nil
end
local v_u_34 = v_u_5.PureComponent:extend("PlayerListApp")
local function v_u_42(p35, p36) -- name: getTeamCount
	local v37 = {}
	local v38 = 0
	for _, v39 in pairs(p35) do
		if v37[v39.TeamColor.Number] then
			continue
		end
		v37[v39.TeamColor.Number] = true
		v38 = v38 + 1
	end
	if v38 > 0 then
		for _, v40 in ipairs(p36) do
			if v40.Team ~= nil then
				continue
			end
			v41 = true
		end
		local v41 = false
		if v41 then
			v38 = v38 + 1
		end
	end
	return v38
end
function v_u_34.init(p_u_43) -- name: init
	-- upvalues: (copy) v_u_5, (copy) v_u_9, (copy) v_u_7, (copy) v_u_12
	p_u_43.state = {
		["visible"] = true
	}
	local v44, v45 = v_u_5.createBinding(UDim2.new(0, 0, 0, 0))
	p_u_43.positionOffset = v44
	p_u_43.updatePositionOffset = v45
	p_u_43.positionMotor = v_u_9.createSingleMotor(0)
	p_u_43.positionMotor:onStep(function(p46)
		-- upvalues: (copy) p_u_43
		p_u_43.updatePositionOffset(UDim2.new(p46, 0, 0, 0))
	end)
	p_u_43.positionMotor:onComplete(function(_)
		-- upvalues: (copy) p_u_43
		if not p_u_43.props.displayOptions.isVisible then
			p_u_43:setState({
				["visible"] = false
			})
		end
	end)
	p_u_43.disposeUiScaleEffect = v_u_7.createEffect(function(p47)
		-- upvalues: (ref) v_u_12, (copy) p_u_43
		p_u_43:setState({
			["UiScale"] = v_u_12.GetDisplayStore(p47).getUIScale(p47)
		})
	end)
end
function v_u_34.render(p_u_48) -- name: render
	-- upvalues: (copy) v_u_5, (copy) v_u_25, (copy) v_u_28, (copy) v_u_24, (copy) v_u_27, (copy) v_u_13, (copy) v_u_29, (copy) v_u_19, (copy) v_u_3, (copy) v_u_42, (copy) v_u_20, (copy) v_u_21, (copy) v_u_31, (copy) v_u_26, (copy) v_u_22
	if p_u_48.state.visible then
		return v_u_27(function(p49)
			-- upvalues: (copy) p_u_48, (ref) v_u_13, (ref) v_u_29, (ref) v_u_19, (ref) v_u_3, (ref) v_u_42, (ref) v_u_5, (ref) v_u_20, (ref) v_u_21, (ref) v_u_28, (ref) v_u_24, (ref) v_u_25, (ref) v_u_31, (ref) v_u_26, (ref) v_u_22
			local v50 = p49.ContainerPosition
			local v51 = p49.ContainerSize
			local v52 = p49.AnchorPoint
			if not p49.IsTenFoot and p_u_48.props.displayOptions.performanceStatsVisible then
				v50 = v50 + UDim2.fromOffset(0, v_u_13.ButtonHeight)
			end
			local v53 = v50 + UDim2.fromOffset(0, p49.TopBarOffset * p_u_48.state.UiScale)
			local v54 = p49.MaxLeaderstats
			if p_u_48.props.displayOptions.isSmallTouchDevice then
				v54 = p49.MaxLeaderstatsSmallScreen
			end
			local v55 = p_u_48.props.gameStatsCount
			local v56 = math.min(v55, v54)
			if v56 > 0 then
				local v57 = p49.StatEntrySizeX + p49.EntryPadding
				v51 = v51 + UDim2.new(0, v57 * v56, 0, 0)
			end
			local v58
			if p49.IsTenFoot then
				v58 = p49.EntrySizeX
			else
				v58 = p49.EntryBaseSizeX + math.min(4, v56) * p49.EntrySizeIncreasePerStat
				local v59 = v51 + UDim2.new(0, p49.ExtraContainerPadding, 0, 0)
				if v_u_29 and p_u_48.props.hasPlatformLeaderboard then
					local v60 = v_u_19.PLATFORM_PANEL_WIDTH - v59.X.Offset
					v58 = math.max(v58, v60)
				end
				local v61 = p49.PlayerDropDownSizeX + p49.PlayerDropDownOffset
				local v62 = v59.X.Offset + p49.ContainerPadding * 2 + v61
				if p_u_48.props.screenSizeX - v62 < v58 then
					v58 = p_u_48.props.screenSizeX - v62
				end
				v51 = v59 + UDim2.new(0, v58, 0, 0)
			end
			local v63 = (1 / 0)
			local v64
			if v_u_3.MaxPlayers >= 6 then
				v64 = v_u_3.MaxPlayers <= 12
			else
				v64 = false
			end
			if v64 then
				v63 = v_u_3.MaxPlayers * 26 + v_u_42(p_u_48.props.teams, p_u_48.props.players) * 20
			end
			local v65 = Vector2.zero
			if v_u_29 and p_u_48.props.hasPlatformLeaderboard then
				local v66 = Vector2.new
				local v67 = v_u_19.PLATFORM_PANEL_WIDTH
				local v68 = v51.X.Offset
				v65 = v66(math.min(v67, v68), v_u_19.LEGACY_PLATFORM_PANEL_MIN_HEIGHT)
				local v69 = v65.Y
				v63 = math.max(v63, v69)
			end
			local v70 = {}
			if p49.IsTenFoot then
				for _, v71 in ipairs(p_u_48.props.players) do
					if v71 ~= v_u_3.LocalPlayer then
						continue
					end
					v70.TitlePlayerEntry = v_u_5.createElement("Frame", {
						["Position"] = nil,
						["Size"] = nil,
						["BackgroundTransparency"] = 1,
						["Position"] = UDim2.fromOffset(0, 0),
						["Size"] = UDim2.new(1, p49.EntryXOffset, 0, p49.PlayerEntrySizeY)
					}, {
						["PlayerEntry"] = v_u_5.createElement(v_u_20, {
							["entrySizeX"] = nil,
							["titlePlayerEntry"] = true,
							["player"] = nil,
							["playerIconInfo"] = nil,
							["playerRelationship"] = nil,
							["entrySizeX"] = v58,
							["player"] = v71,
							["playerIconInfo"] = p_u_48.props.playerIconInfo[v71.UserId],
							["playerRelationship"] = p_u_48.props.playerRelationship[v71.UserId]
						})
					})
				end
			end
			local v72 = v_u_5.createElement
			local v73 = v_u_21
			local v74 = {
				["screenSizeY"] = p_u_48.props.screenSizeY,
				["entrySize"] = v58
			}
			local v75
			if v_u_28 then
				v75 = p_u_48.state.visible
			else
				v75 = nil
			end
			v74.isVisible = v75
			v70.PlayerScrollList = v72(v73, v74)
			v70.EventConnections = v_u_5.createElement(v_u_24)
			v70.ContextActionsBindings = v_u_5.createElement(v_u_25)
			if not v_u_31 then
				v70.TopStatConnector = v_u_5.createElement(v_u_26)
			end
			if p_u_48.props.displayOptions.isTenFootInterface then
				v70.TenFootSideBar = v_u_5.createElement(v_u_22)
			end
			return v_u_5.createElement("Frame", {
				["Position"] = v53,
				["AnchorPoint"] = v52,
				["Size"] = v51,
				["BackgroundTransparency"] = 1,
				["Visible"] = p_u_48.state.visible,
				["ZIndex"] = p49.IsTenFoot and 2 or 1,
				["AutoLocalize"] = false,
				[v_u_5.Ref] = p_u_48.rootRef
			}, {
				["OffsetFrame"] = v_u_5.createElement("Frame", {
					["Size"] = nil,
					["Position"] = nil,
					["BackgroundTransparency"] = 1,
					["Size"] = UDim2.new(1, 0, 1, 0),
					["Position"] = p_u_48.positionOffset
				}, v70),
				["UISizeConstraint"] = v_u_5.createElement("UISizeConstraint", {
					["MinSize"] = v65,
					["MaxSize"] = Vector2.new((1 / 0), v63)
				}) or nil
			})
		end)
	end
	local v76 = v_u_5.createFragment
	local v77 = {}
	local v78 = v_u_5.createElement(v_u_25)
	local v79
	if v_u_28 then
		v79 = v_u_5.createElement(v_u_24)
	else
		v79 = nil
	end
	__set_list(v77, 1, {v78, v79})
	return v76(v77)
end
function v_u_34.didMount(p80) -- name: didMount
	p80:setState({
		["visible"] = p80.props.displayOptions.isVisible
	})
end
function v_u_34.didUpdate(p81, p82, _) -- name: didUpdate
	-- upvalues: (copy) v_u_9, (copy) v_u_32
	if p81.props.displayOptions.isVisible ~= p82.displayOptions.isVisible then
		if p81.props.displayOptions.isTenFootInterface then
			p81:setState({
				["visible"] = p81.props.displayOptions.isVisible
			})
			return
		end
		if p81.props.displayOptions.isVisible then
			p81:setState({
				["visible"] = true
			})
			p81.positionMotor:setGoal(v_u_9.instant(0.2))
			p81.positionMotor:step(0)
			p81.positionMotor:setGoal(v_u_9.spring(0, v_u_32))
			return
		end
		p81.positionMotor:setGoal(v_u_9.spring(1.1, v_u_32))
	end
end
function v_u_34.willUnmount(p83) -- name: willUnmount
	p83.positionMotor:destroy()
	p83.positionMotor = nil
	if p83.disposeUiScaleEffect then
		p83.disposeUiScaleEffect()
	end
end
return v6.connect(function(p84) -- name: mapStateToProps
	return {
		["screenSizeX"] = p84.screenSize.X,
		["screenSizeY"] = p84.screenSize.Y,
		["displayOptions"] = p84.displayOptions,
		["players"] = p84.players,
		["playerStats"] = p84.playerStats,
		["playerIconInfo"] = p84.playerIconInfo,
		["playerRelationship"] = p84.playerRelationship,
		["gameStats"] = p84.gameStats,
		["teams"] = p84.teams
	}
end, nil)(function(p_u_85) -- name: PlayerListAppWithLeaderboardStore
	-- upvalues: (copy) v_u_17, (copy) v_u_7, (copy) v_u_8, (copy) v_u_29, (copy) v_u_30, (copy) v_u_18, (copy) v_u_33, (copy) v_u_5, (copy) v_u_34, (copy) v_u_10
	local v_u_86 = v_u_17()
	local v88 = v_u_7.createComputed(function(p87)
		-- upvalues: (copy) v_u_86, (copy) p_u_85
		return not v_u_86 and #p_u_85.gameStats or v_u_86.getGameStatsList().getCount(p87)
	end)
	local v89 = v_u_8.useSignalState(v88)
	local v90
	if v_u_29 and v_u_30 then
		local v91 = v_u_18()
		local v92
		if v91 then
			v92 = v91.getHasActiveLeaderboard
		else
			v92 = v_u_33
		end
		v90 = v_u_8.useSignalState(v92)
	else
		v90 = false
	end
	return v_u_5.createElement(v_u_34, v_u_10.Dictionary.join(p_u_85, {
		["gameStatsCount"] = v89,
		["hasPlatformLeaderboard"] = v90
	}))
end)