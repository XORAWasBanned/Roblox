-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.PresentationMobile.PlayerListApp
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = game:GetService("Players")
local v_u_4 = game:GetService("UserInputService")
local v_u_5 = require(v1.Packages.Signals)
local v_u_6 = require(v1.Workspace.Packages.Display)
local v_u_7 = require(v1.Packages.Cryo)
local v_u_8 = require(v1.Packages.Roact)
local v9 = require(v1.Packages.RoactRodux)
local v_u_10 = require(v1.Packages.Otter)
local v_u_11 = require(v1.Workspace.Packages.Style).AppFonts
local v12 = require(v1.Workspace.Packages.PlayerList)
local v_u_13 = v12.Common.useLayoutValues
local v_u_14 = v12.Common.Constants
local v15 = game:GetService("CoreGui").RobloxGui.Modules
local v_u_16 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_17 = require(v15.TopBar.Constants)
local v_u_18 = require(v1.Workspace.Packages.Chrome).Enabled()
local v_u_19 = require(v1.Packages.Foundation).Hooks.useTokens
local v20 = script.Parent
local v21 = v20.Parent.Parent
local v_u_22 = require(v21.Actions.SetPlayerListVisibility)
local v_u_23 = require(v21.Actions.SetIsUsingGamepad)
local v_u_24 = require(v21.Components.Container.PlayerListDisplayContainer)
local v_u_25 = require(v20.PlayerDropDown)
local v26 = v21.Components.Connection
local v_u_27 = require(v26.EventConnections)
local v_u_28 = require(v26.ContextActionsBinder)
local v_u_29 = require(v26.TopStatConnector)
local v_u_30 = require(v26.LayoutValues).WithLayoutValues
local v_u_31 = require(v21.Flags.FFlagPlayerListFixMobileScrolling)
local v_u_32 = v12.Flags.FFlagAddNewPlayerListFocusNav
local v_u_33 = v12.Flags.FFlagEnableMobilePlayerListOnConsole
local v_u_34 = v12.Flags.FFlagPlayerListIgnoreDevGamepadBindings
local v_u_35 = require(v21.Flags.FFlagPlayerListRemoveTopStat)
local v_u_36 = {
	["dampingRatio"] = 1,
	["frequency"] = 4
}
local v_u_37 = v_u_8.PureComponent:extend("PlayerListApp")
local function v_u_56(p38, p39, p40, p41, p42) -- name: playerListSizeFromViewportSize
	-- upvalues: (copy) v_u_33, (copy) v_u_18, (copy) v_u_17
	local v43 = p39.x
	local v44 = p39.y
	local v45 = math.min(v43, v44)
	local v46 = p39.x
	local v47 = p39.y
	local v48 = math.max(v46, v47)
	local v49 = (v45 - 320) * 60 / 55 + 270
	local v50 = (v48 - 480) * 46 / 190 + 434
	if not v_u_33 or v49 <= 500 then
		local v51 = v45 - 24
		local v52 = math.min(270, v51)
		p41 = math.clamp(v49, v52, 500)
	end
	if not v_u_33 or v50 <= 600 then
		local v53 = v48 - 24
		local v54 = math.min(434, v53)
		p42 = math.clamp(v50, v54, 600)
	end
	local v55 = p39.x > p39.y and p42 and p42 or p41
	if p39.y > p39.x then
		p41 = p42 or p41
	end
	if not v_u_33 then
		v55 = v55 * p40
		p41 = p41 * p40
	end
	if v_u_18 and p39.y < p39.x then
		p41 = p41 - (v_u_17.TopBarHeight * p38.state.UiScale - 24)
	end
	return UDim2.fromOffset(v55, p41)
end
local function v_u_64(p57, p58) -- name: getTeamCount
	local v59 = {}
	local v60 = 0
	for _, v61 in pairs(p57) do
		if v59[v61.TeamColor.Number] then
			continue
		end
		v59[v61.TeamColor.Number] = true
		v60 = v60 + 1
	end
	if v60 > 0 then
		for _, v62 in ipairs(p58) do
			if v62.Team ~= nil then
				continue
			end
			v63 = true
		end
		local v63 = false
		if v63 then
			v60 = v60 + 1
		end
	end
	return v60
end
function v_u_37.init(p_u_65) -- name: init
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_8, (copy) v_u_10
	p_u_65.state = {
		["visible"] = false
	}
	p_u_65.disposeUiScaleEffect = v_u_5.createEffect(function(p66)
		-- upvalues: (ref) v_u_6, (copy) p_u_65
		p_u_65:setState({
			["UiScale"] = v_u_6.GetDisplayStore(p66).getUIScale(p66)
		})
	end)
	local v67, v68 = v_u_8.createBinding(0.5)
	p_u_65.bodyTransparency = v67
	p_u_65.updateBodyTransparency = v68
	p_u_65.bodyTransparencyMotor = v_u_10.createSingleMotor(1)
	p_u_65.bodyTransparencyMotor:onStep(function(p69)
		-- upvalues: (copy) p_u_65
		p_u_65.updateBodyTransparency(p69)
		p_u_65.props.setLayerCollectorEnabled(p69 < 0.99 and true or p_u_65.props.displayOptions.isVisible)
	end)
	p_u_65.bodyTransparencyMotor:onComplete(function()
		-- upvalues: (copy) p_u_65
		if not p_u_65.props.displayOptions.isVisible then
			p_u_65:setState({
				["visible"] = false
			})
		end
	end)
	local v70, v71 = v_u_8.createBinding(0)
	p_u_65.bgTransparency = v70
	p_u_65.updateBgTransparency = v71
	p_u_65.bgTransparencyMotor = v_u_10.createSingleMotor(1)
	p_u_65.bgTransparencyMotor:onStep(p_u_65.updateBgTransparency)
	local v72, v73 = v_u_8.createBinding(1)
	p_u_65.frameScale = v72
	p_u_65.updateFrameScale = v73
	p_u_65.frameScaleMotor = v_u_10.createSingleMotor(0)
	p_u_65.frameScaleMotor:onStep(function(p74)
		-- upvalues: (copy) p_u_65
		p_u_65.updateFrameScale(p74)
	end)
	p_u_65.titleRef = v_u_8.createRef()
	p_u_65.closeRef = v_u_8.createRef()
end
function v_u_37.renderBodyChildren(p_u_75, _, p76) -- name: renderBodyChildren
	-- upvalues: (copy) v_u_8, (copy) v_u_11, (copy) v_u_16
	local v77 = p_u_75.state.visible
	local v78 = p_u_75.props.isDropDownVisible
	local v79 = p_u_75.props.tokens.Size.Size_1100
	local v80 = p_u_75.props.tokens.Size.Size_500
	local v81 = {
		["UIScale"] = v_u_8.createElement("UIScale", {
			["Scale"] = p_u_75.frameScale
		}),
		["UICorner"] = v_u_8.createElement("UICorner", {
			["CornerRadius"] = UDim.new(0, 6)
		})
	}
	local v82 = v_u_8.createElement
	local v83 = "TextLabel"
	local v84 = {
		["Size"] = UDim2.new(1, 0, 0, v79),
		["Position"] = UDim2.new(0, 0, 0, 0),
		["BackgroundTransparency"] = 1,
		["Font"] = v_u_11.default:getBold()
	}
	local v85
	if v77 then
		v85 = not v78
	else
		v85 = v77
	end
	v84.Visible = v85
	v84.TextSize = p_u_75.props.tokens.FontSize.FontSize_500
	v84.TextColor3 = Color3.fromRGB(240, 240, 240)
	v84.TextXAlignment = Enum.TextXAlignment.Center
	v84.TextYAlignment = Enum.TextYAlignment.Center
	v84.Text = v_u_16:FormatByKey("InGame.PlayerList.Leaderboard")
	v84[v_u_8.Ref] = p_u_75.titleRef
	v81.TitleText = v82(v83, v84)
	local v86 = v_u_8.createElement
	local v87 = "ImageButton"
	local v88 = {
		["Image"] = "rbxasset://textures/ui/InspectMenu/x.png",
		["ImageColor3"] = Color3.fromRGB(255, 255, 255),
		["AnchorPoint"] = Vector2.new(0, 0.5),
		["Size"] = UDim2.fromOffset(v80, v80),
		["Position"] = UDim2.fromOffset(v80 / 2, v80),
		["BackgroundTransparency"] = 1
	}
	local v89
	if v77 then
		v89 = not v78
	else
		v89 = v77
	end
	v88.Visible = v89
	v88.ZIndex = 0
	v88[v_u_8.Ref] = p_u_75.closeRef
	v88[v_u_8.Event.Activated] = function()
		-- upvalues: (copy) p_u_75
		p_u_75.props.setPlayerListVisible(false)
	end
	v81.CloseButton = v86(v87, v88)
	local v90 = v_u_8.createElement
	local v91 = "Frame"
	local v92 = {
		["Position"] = nil,
		["AnchorPoint"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Visible"] = nil,
		["AutoLocalize"] = false,
		["Position"] = UDim2.new(0.5, 0, 1, 0),
		["AnchorPoint"] = Vector2.new(0.5, 1),
		["Size"] = UDim2.new(1, 0, 1, -v79)
	}
	if v77 then
		v77 = not v78
	end
	v92.Visible = v77
	v81.ContentFrame = v90(v91, v92, p76)
	return v81
end
function v_u_37.render(p_u_93) -- name: render
	-- upvalues: (copy) v_u_8, (copy) v_u_28, (copy) v_u_30, (copy) v_u_33, (copy) v_u_3, (copy) v_u_64, (copy) v_u_17, (copy) v_u_24, (copy) v_u_32, (copy) v_u_27, (copy) v_u_35, (copy) v_u_29, (copy) v_u_31, (copy) v_u_25, (copy) v_u_18, (copy) v_u_56
	if p_u_93.state.visible then
		return v_u_30(function(p94)
			-- upvalues: (ref) v_u_33, (copy) p_u_93, (ref) v_u_3, (ref) v_u_64, (ref) v_u_17, (ref) v_u_8, (ref) v_u_24, (ref) v_u_32, (ref) v_u_27, (ref) v_u_28, (ref) v_u_35, (ref) v_u_29, (ref) v_u_31, (ref) v_u_25, (ref) v_u_18, (ref) v_u_56
			if v_u_33 then
				p94 = p_u_93.props.layoutValues
			end
			local v95
			if p94.IsTenFoot then
				v95 = p94.EntrySizeX
			else
				v95 = p94.EntryBaseSizeX + 4 * p94.EntrySizeIncreasePerStat
				local v96 = p94.PlayerDropDownSizeXMobile + p94.PlayerDropDownOffset
				local v97 = p94.ContainerPadding * 2 + v96
				if p_u_93.props.screenSizeX - v97 < v95 then
					v95 = p_u_93.props.screenSizeX - v97
				end
			end
			local v98 = (1 / 0)
			local v99
			if v_u_3.MaxPlayers >= 6 then
				v99 = v_u_3.MaxPlayers <= 12
			else
				v99 = false
			end
			if v99 then
				v98 = v_u_3.MaxPlayers * 26 + v_u_64(p_u_93.props.teams, p_u_93.props.players) * 20
			end
			local v100 = v_u_17.TopBarHeight * p_u_93.state.UiScale
			local v101 = {}
			if p_u_93.state.visible then
				local v102 = v_u_8.createElement
				local v103 = v_u_24
				local v104 = {
					["screenSizeY"] = p_u_93.props.screenSizeY,
					["entrySize"] = v95
				}
				local v105
				if v_u_32 then
					v105 = p_u_93.props.displayOptions.isVisible
				else
					v105 = nil
				end
				v104.isVisible = v105
				v101.PlayerScrollList = v102(v103, v104)
			end
			v101.EventConnections = v_u_8.createElement(v_u_27)
			v101.ContextActionsBindings = v_u_8.createElement(v_u_28)
			if not v_u_35 then
				v101.TopStatConnector = v_u_8.createElement(v_u_29)
			end
			local v106 = v_u_8.createElement
			local v107 = "ImageButton"
			local v108 = {
				["Active"] = p_u_93.props.displayOptions.isVisible,
				["Size"] = UDim2.new(1, 0, 1, 0),
				["Position"] = UDim2.new(0, 0, 0, 0),
				["BackgroundColor3"] = Color3.fromRGB(17, 18, 20),
				["BackgroundTransparency"] = p_u_93.bgTransparency,
				["BorderColor3"] = Color3.fromRGB(0, 0, 0),
				["BorderSizePixel"] = 0,
				["AutoLocalize"] = false,
				["AutoButtonColor"] = false,
				["Selectable"] = not v_u_31,
				["Image"] = "",
				[v_u_8.Event.Activated] = function()
					-- upvalues: (ref) p_u_93
					p_u_93.props.setPlayerListVisible(false)
				end
			}
			local v109 = {
				["PlayerDropDown"] = v_u_8.createElement(v_u_25, {
					["contentsVisible"] = true,
					["selectedPlayer"] = nil,
					["selectedPlayer"] = p_u_93.props.dropDownPlayer
				})
			}
			local v110
			if v_u_18 and p_u_93.props.screenSizeY < p_u_93.props.screenSizeX then
				v110 = v_u_8.createElement("UIPadding", {
					["PaddingTop"] = UDim.new(0, v100)
				})
			else
				v110 = nil
			end
			v109.BodyPadding = v110
			v109.BodyBackground = v_u_8.createElement("Frame", {
				["Size"] = nil,
				["AnchorPoint"] = nil,
				["Position"] = nil,
				["BackgroundColor3"] = nil,
				["BackgroundTransparency"] = nil,
				["BorderColor3"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = v_u_56(p_u_93, Vector2.new(p_u_93.props.screenSizeX, p_u_93.props.screenSizeY), p_u_93.state.UiScale, p94.PlayerListSizeMin, p94.PlayerListSizeMax),
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["Position"] = UDim2.new(0.5, 0, 0.5, 0),
				["BackgroundColor3"] = Color3.fromRGB(17, 18, 20),
				["BackgroundTransparency"] = p_u_93.bodyTransparency,
				["BorderColor3"] = Color3.fromRGB(0, 0, 0)
			}, p_u_93:renderBodyChildren(v98, v101))
			return v106(v107, v108, v109)
		end)
	else
		return v_u_8.createElement(v_u_28)
	end
end
function v_u_37.didMount(p111) -- name: didMount
	p111.props.setLayerCollectorEnabled(false)
	p111:setState({
		["visible"] = p111.props.displayOptions.isVisible
	})
end
function v_u_37.willUnmount(p112) -- name: willUnmount
	p112.props.setLayerCollectorEnabled(true)
	if p112.disposeUiScaleEffect then
		p112.disposeUiScaleEffect()
	end
end
function v_u_37.didUpdate(p113, p114, _) -- name: didUpdate
	-- upvalues: (copy) v_u_34, (copy) v_u_2, (copy) v_u_14, (copy) v_u_4, (copy) v_u_10, (copy) v_u_36
	local v115 = p113.props.displayOptions.isVisible
	local v116 = p113.props.isDropDownVisible
	if v_u_34 and v115 ~= p114.displayOptions.isVisible then
		v_u_2:SetMenuIsOpen(v115, v_u_14.PLAYER_LIST_MENU)
	end
	if v115 then
		p113:setState({
			["visible"] = true
		})
	end
	if v115 ~= p114.displayOptions.isVisible and v115 then
		local v117 = v_u_4:GetLastInputType().Name:find("Gamepad") ~= nil
		p113.props.setIsUsingGamepad(v117)
	end
	p113.bgTransparencyMotor:setGoal(v_u_10.spring((v116 or v115) and 0.7 or 1, v_u_36))
	local v118 = v116 and v115
	p113.frameScaleMotor:setGoal(v_u_10.spring(v118 and 0.95 or (v115 and 1 or 1.25), v_u_36))
	local v119 = 1
	if v118 then
		v119 = 0.8 * p113.props.preferredTransparency
	elseif v115 then
		v119 = 0.2 * p113.props.preferredTransparency
	end
	p113.bodyTransparencyMotor:setGoal(v_u_10.spring(v119, v_u_36))
end
return v9.connect(function(p120) -- name: mapStateToProps
	return {
		["isDropDownVisible"] = p120.playerDropDown.isVisible,
		["screenSizeX"] = p120.screenSize.X,
		["screenSizeY"] = p120.screenSize.Y,
		["preferredTransparency"] = p120.settings.preferredTransparency,
		["displayOptions"] = p120.displayOptions,
		["players"] = p120.players,
		["playerStats"] = p120.playerStats,
		["playerIconInfo"] = p120.playerIconInfo,
		["playerRelationship"] = p120.playerRelationship,
		["gameStats"] = p120.gameStats,
		["teams"] = p120.teams
	}
end, function(p_u_121) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_22, (copy) v_u_23
	return {
		["setPlayerListVisible"] = function(p122) -- name: setPlayerListVisible
			-- upvalues: (copy) p_u_121, (ref) v_u_22
			return p_u_121(v_u_22(p122))
		end,
		["setIsUsingGamepad"] = function(p123) -- name: setIsUsingGamepad
			-- upvalues: (copy) p_u_121, (ref) v_u_23
			return p_u_121(v_u_23(p123))
		end
	}
end)(function(p124)
	-- upvalues: (copy) v_u_33, (copy) v_u_13, (copy) v_u_19, (copy) v_u_8, (copy) v_u_37, (copy) v_u_7
	local v125
	if v_u_33 then
		v125 = v_u_13()
	else
		v125 = nil
	end
	local v126 = v_u_19()
	local v127 = v_u_8.createElement
	local v128 = v_u_37
	local v129 = v_u_7.Dictionary.join
	local v130 = {}
	if not v_u_33 then
		v125 = nil
	end
	v130.layoutValues = v125
	v130.tokens = v126
	return v127(v128, v129(p124, v130))
end)