-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Presentation.MenuIcon
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = game:GetService("VRService")
local v_u_5 = game:GetService("GamepadService")
local v_u_6 = game:GetService("ContextActionService")
local v7 = require(v1.Workspace.Packages.SharedFlags)
local v_u_8 = v7.FFlagEnableConsoleExpControls
local v_u_9 = v7.FFlagReduceTopBarInsetsWhileHidden
local v_u_10 = v7.FFlagShowUnibarOnVirtualCursor
local v_u_11 = v7.FFlagAddUILessMode
local v_u_12 = v7.FIntAddUILessModeVariant
require(v1.Packages.Signals)
local v_u_13 = require(v1.Workspace.Packages.Display)
local v_u_14 = require(v1.Packages.Roact)
local v_u_15 = require(v1.Packages.React)
local v16 = require(v1.Packages.RoactRodux)
local v17 = require(v1.Packages.t)
local v18 = require(v1.Packages.UIBlox)
local v_u_19 = v18.App.ImageSet.Images
local v_u_20 = v18.App.Dialog.TooltipV2.withTooltip
local v_u_21 = v18.App.Dialog.Enum.TooltipOrientation
local v_u_22 = v_u_2:WaitForChild("RobloxGui")
local v23 = v_u_22.Modules.Chrome
local v_u_24 = require(v1.Workspace.Packages.Chrome).FocusUtils
local v_u_25 = require(v1.Workspace.Packages.Chrome).Enabled
local v_u_26 = require(v1.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local v_u_27
if v_u_25() and (v_u_8 or v_u_26) then
	v_u_27 = require(v23.Service)
else
	v_u_27 = nil
end
local v_u_28
if v_u_25() and v_u_8 then
	v_u_28 = require(v23.ChromeShared.Unibar.Constants)
else
	v_u_28 = nil
end
require(v_u_22.Modules.TenFootInterface)
local v_u_29 = require(v_u_22.Modules.isNewInGameMenuEnabled)
local v_u_30 = require(v_u_22.Modules.InGameMenuConstants)
require(v_u_22.Modules.PlayerList.PlayerListManager)
local v_u_31 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_32 = require(script.Parent.BadgeOver12)
local v_u_33 = require(v1.Workspace.Packages.CoreGuiCommon).Stores
local v_u_34 = require(v1.Packages.Signals)
local v_u_35 = require(v1.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local v_u_36 = v_u_34.createEffect
local v_u_37 = require(v1.Workspace.Packages.VrCommon).VRHub
local v_u_38 = v7.isSubjectToDesktopPolicies
local v_u_39 = require(v1.Workspace.Packages.RoactUtils).ExternalEventConnection
local v40 = require(v1.Workspace.Packages.CoreGuiCommon)
local v_u_41 = v40.Flags.FFlagTopBarSignalizeKeepOutAreas
local v_u_42 = game:DefineFastFlag("EnableReferralRewardTooltip", false)
local v_u_43 = v40.Flags.FFlagTopBarSignalizeMenuOpen
local v_u_44 = require(script.Parent.Parent.Parent.Flags.FFlagTopBarDeprecateDisplayOptionsRodux)
local v45 = script.Parent.Parent
local v46 = v45.Parent.Actions
local v_u_47 = require(v45.Parent.Constants)
local v_u_48 = require(v46.SetGamepadMenuOpen)
local v_u_49 = require(v46.SetKeepOutArea)
local v_u_50 = require(script.Parent.menuIconHoveredSignal)
local v_u_51
if v_u_8 and not v_u_25() then
	v_u_51 = nil
else
	v_u_51 = require(script.Parent.Parent.GamepadConnector)
end
local v_u_52
if v_u_29() then
	v_u_52 = require(v_u_22.Modules.InGameMenuInit)
else
	v_u_52 = nil
end
local v_u_53 = require(v_u_22.Modules.isNewTiltIconEnabled)
local v_u_54, v_u_55, v_u_56, v_u_57, v_u_58, v_u_59
if v_u_26 then
	local v_u_60 = require(v1.Workspace.Packages.AppCommonLib).isSpatial
	v_u_54 = v18.App.Dialog.TooltipCallout
	local v61 = require(v1.Workspace.Packages.VrSpatialUi)
	local v_u_62 = v61.UIManager
	v_u_55 = v61.Panel3DInSpatialUI
	v_u_56 = v61.Constants.PanelType
	v_u_57 = v61.Constants.SPATIAL_TOOLTIP_SPACING
	v_u_58 = function()
		-- upvalues: (copy) v_u_26, (ref) v_u_60, (copy) v_u_27, (ref) v_u_62
		if not (v_u_26 and v_u_60()) then
			return false
		end
		local v63 = v_u_27:showTopBar()
		local v64 = v_u_62.getInstance():isBottomBarInteractionOnAnimationSupported()
		local v65 = not v63
		if v65 then
			v65 = not v64
		end
		return v65
	end
	v_u_59 = v_u_60
else
	v_u_54 = nil
	v_u_55 = nil
	v_u_56 = nil
	v_u_57 = nil
	v_u_59 = nil
	v_u_58 = nil
end
local v_u_66 = require(script.Parent.IconButton)
local v67 = require(script.Parent.withReferralRewardTooltipInfo)
local v68 = v_u_14.PureComponent:extend("MenuIcon")
local v_u_69 = v_u_25()
local v_u_70 = v_u_69 and 0.65 or 0.4
local v_u_71 = { Enum.KeyCode.Escape }
local v72 = v17.strictInterface
local v73 = {
	["layoutOrder"] = v17.integer
}
local v74
if v_u_44 then
	v74 = nil
else
	v74 = v17.callback
end
v73.setGamepadMenuOpen = v74
local v75
if v_u_43 then
	v75 = nil
else
	v75 = v17.optional(v17.number)
end
v73.iconScale = v75
v73.onAreaChanged = v17.optional(v17.callback)
v73.showBadgeOver12 = v17.optional(v17.boolean)
local v76
if v_u_25() and v_u_8 then
	v76 = v17.optional(v17.any)
else
	v76 = nil
end
v73.menuIconRef = v76
local v77
if v_u_25() and v_u_8 then
	v77 = v17.optional(v17.any)
else
	v77 = nil
end
v73.unibarMenuRef = v77
v73.referralRewardTooltipText = v17.optional(v17.string)
v68.validateProps = v72(v73)
function v68.init(p_u_78) -- name: init
	-- upvalues: (copy) v_u_69, (copy) v_u_34, (copy) v_u_13, (copy) v_u_43, (copy) v_u_35, (copy) v_u_25, (copy) v_u_26, (ref) v_u_58, (copy) v_u_22, (copy) v_u_11, (copy) v_u_30, (copy) v_u_4, (copy) v_u_37, (copy) v_u_5, (ref) v_u_52, (copy) v_u_29, (copy) v_u_50, (copy) v_u_70, (copy) v_u_38, (copy) v_u_8, (copy) v_u_10, (copy) v_u_28, (copy) v_u_27, (copy) v_u_24, (copy) v_u_3, (copy) v_u_6, (copy) v_u_51, (copy) v_u_14, (copy) v_u_9, (copy) v_u_47, (copy) v_u_12, (copy) v_u_33, (copy) v_u_36
	local v79 = {
		["vrShowMenuIcon"] = false,
		["showTooltip"] = false,
		["isHovering"] = false,
		["clickLatched"] = nil,
		["enableFlashingDot"] = false
	}
	local v80
	if v_u_69 then
		v80 = false
	else
		v80 = nil
	end
	v79.clickLatched = v80
	p_u_78:setState(v79)
	p_u_78.disposeUiScaleEffect = v_u_34.createEffect(function(p81)
		-- upvalues: (ref) v_u_13, (copy) p_u_78
		p_u_78:setState({
			["UiScale"] = v_u_13.GetDisplayStore(p81).getUIScale(p81)
		})
	end)
	if v_u_43 then
		v_u_35:connect(function(p82)
			-- upvalues: (copy) p_u_78
			p_u_78:setState({
				["tiltMenuOpen"] = p82
			})
		end)
	end
	if not v_u_25() then
		task.spawn(function()
			-- upvalues: (copy) p_u_78
			p_u_78:setState({
				["enableFlashingDot"] = true
			})
		end)
	end
	function p_u_78.menuIconActivated()
		-- upvalues: (copy) p_u_78, (ref) v_u_69, (ref) v_u_26, (ref) v_u_58, (ref) v_u_22, (ref) v_u_11, (ref) v_u_30, (ref) v_u_4, (ref) v_u_37, (ref) v_u_5, (ref) v_u_52, (ref) v_u_29
		local v83 = p_u_78
		local v84 = {
			["showTooltip"] = false,
			["isHovering"] = nil,
			["clickLatched"] = nil
		}
		local v85
		if v_u_69 then
			v85 = nil
		else
			v85 = false
		end
		v84.isHovering = v85
		v84.clickLatched = v_u_69 and true or nil
		v83:setState(v84)
		if v_u_26 then
			if v_u_58() then
				return
			else
				local v86 = require(v_u_22.Modules.Settings.SettingsHub)
				if v_u_11 then
					v86:ToggleVisibility(nil, v_u_30.AnalyticsMenuOpenTypes.TopbarButton)
				else
					v86:ToggleVisibility(v_u_30.AnalyticsMenuOpenTypes.TopbarButton)
				end
			end
		elseif v_u_4.VREnabled and (v_u_37.ShowTopBar or v_u_5.GamepadCursorEnabled) then
			v_u_52.openInGameMenu(v_u_30.MainPagePageKey)
			return
		elseif v_u_29() then
			v_u_52.openInGameMenu(v_u_30.MainPagePageKey)
			return
		else
			local v87 = require(v_u_22.Modules.Settings.SettingsHub)
			if v_u_11 then
				v87:ToggleVisibility(nil, v_u_30.AnalyticsMenuOpenTypes.TopbarButton)
			else
				v87:ToggleVisibility(v_u_30.AnalyticsMenuOpenTypes.TopbarButton)
			end
		end
	end
	function p_u_78.fireMenuIconHoveredSignal(p88)
		-- upvalues: (ref) v_u_50
		v_u_50:fire(p88)
	end
	function p_u_78.menuIconOnHover()
		-- upvalues: (ref) v_u_26, (ref) v_u_58, (ref) v_u_69, (copy) p_u_78, (ref) v_u_70, (ref) v_u_29, (ref) v_u_38, (ref) v_u_52, (ref) v_u_30
		if not (v_u_26 and v_u_58()) then
			if v_u_69 then
				p_u_78:setState({
					["isHovering"] = true
				})
				p_u_78.fireMenuIconHoveredSignal(true)
				delay(v_u_70, function()
					-- upvalues: (ref) p_u_78, (ref) v_u_26, (ref) v_u_58
					if p_u_78.state.isHovering and not p_u_78.state.clickLatched then
						if v_u_26 and v_u_58() then
							return
						end
						p_u_78:setState({
							["showTooltip"] = true
						})
					end
				end)
			else
				p_u_78.fireMenuIconHoveredSignal(false)
			end
			if v_u_29() then
				if not v_u_38() then
					return
				end
				v_u_52.openInGameMenu(v_u_30.InitalPageKey)
				v_u_52.setMenuIconTooltipOpen(false)
			end
		end
	end
	function p_u_78.menuIconOnHoverEnd()
		-- upvalues: (copy) p_u_78, (ref) v_u_69
		local v89 = p_u_78
		local v90 = {
			["showTooltip"] = false,
			["isHovering"] = false,
			["clickLatched"] = nil
		}
		local v91
		if v_u_69 then
			v91 = false
		else
			v91 = nil
		end
		v90.clickLatched = v91
		v89:setState(v90)
	end
	function p_u_78.showTopBarCallback()
		-- upvalues: (copy) p_u_78
		if p_u_78.state.vrShowMenuIcon ~= false then
			p_u_78:setState({
				["vrShowMenuIcon"] = false
			})
		end
	end
	if v_u_25() and v_u_8 then
		function p_u_78.onMenuIconSelectionChanged(_, p92, _, p93)
			-- upvalues: (ref) v_u_8, (ref) v_u_5, (ref) v_u_10, (ref) v_u_28, (ref) v_u_27, (ref) v_u_24, (ref) v_u_3, (ref) v_u_6
			if v_u_8 then
				if not v_u_5.GamepadCursorEnabled then
					if not (v_u_10 and v_u_5.GamepadCursorEnabled) and (p93 and string.find(p93.Name, v_u_28.ICON_NAME_PREFIX)) then
						v_u_27:enableFocusNav()
					end
					v_u_24.MenuIconSelectedSignal:set(p92)
				end
			else
				local function v95(_, p94, _) -- name: unfocusTilt
					-- upvalues: (ref) v_u_8, (ref) v_u_3
					if (v_u_8 or p94 ~= Enum.UserInputState.End) and (not v_u_8 or p94 ~= Enum.UserInputState.Begin) then
						return Enum.ContextActionResult.Pass
					end
					v_u_3.SelectedCoreObject = nil
					return Enum.ContextActionResult.Sink
				end
				if p92 then
					v_u_6:BindCoreAction("Unfocus_Tilt", v95, false, Enum.KeyCode.ButtonB)
				else
					v_u_6:UnbindCoreAction("Unfocus_Tilt")
					if not (v_u_10 and v_u_5.GamepadCursorEnabled) and (p93 and string.find(p93.Name, v_u_28.ICON_NAME_PREFIX)) then
						v_u_27:enableFocusNav()
					end
				end
			end
		end
	end
	local v96
	if v_u_8 then
		v96 = v_u_25()
		if v96 then
			v96 = v_u_51
		end
	else
		v96 = v_u_25
	end
	if v96 and v_u_8 then
		local v_u_97 = v_u_51:getShowTopBar()
		local v98, v99 = v_u_14.createBinding(v_u_97:get())
		p_u_78.showIcon = v98
		p_u_78.setShowIcon = v99
		if v_u_9 then
			p_u_78.priorAbsolutePosition = Vector2.zero
			p_u_78.priorAbsoluteSize = Vector2.zero
		end
		v_u_97:connect(function()
			-- upvalues: (copy) v_u_97, (copy) p_u_78, (ref) v_u_9, (ref) v_u_47
			local v100 = v_u_97:get()
			p_u_78.setShowIcon(v100)
			if v_u_9 then
				if v100 then
					p_u_78.props.onAreaChanged(v_u_47.MenuIconKeepOutAreaId, p_u_78.priorAbsolutePosition, p_u_78.priorAbsoluteSize)
					return
				end
				p_u_78.props.onAreaChanged(v_u_47.MenuIconKeepOutAreaId, Vector2.zero, Vector2.zero)
			end
		end)
	end
	if v_u_25() and v_u_8 then
		v_u_27:onTriggerMenuIcon():connect(function()
			-- upvalues: (ref) v_u_3, (copy) p_u_78, (ref) v_u_24
			v_u_3.SelectedCoreObject = p_u_78.props.menuIconRef:getValue()
			v_u_24.MenuIconSelectedSignal:set(true)
		end)
	end
	if v_u_11 and (v_u_12 ~= 0 and v_u_33.GetUILessStore) then
		p_u_78.uiLessStore = v_u_33.GetUILessStore(false)
		if p_u_78.uiLessStore.getUILessModeEnabled(false) then
			local v101, v102 = v_u_14.createBinding(true)
			p_u_78.showIcon = v101
			p_u_78.setShowIcon = v102
			p_u_78.priorAbsolutePosition = Vector2.zero
			p_u_78.priorAbsoluteSize = Vector2.zero
			p_u_78.disposeEffect = v_u_36(function(p103)
				-- upvalues: (copy) p_u_78, (ref) v_u_47
				local v104 = p_u_78.uiLessStore.getUIVisible(p103)
				p_u_78.setShowIcon(v104)
				if v104 then
					p_u_78.props.onAreaChanged(v_u_47.MenuIconKeepOutAreaId, p_u_78.priorAbsolutePosition, p_u_78.priorAbsoluteSize)
				else
					p_u_78.props.onAreaChanged(v_u_47.MenuIconKeepOutAreaId, Vector2.zero, Vector2.zero)
				end
			end)
		end
	end
end
function v68.renderWithTooltipCompat(p_u_105, p_u_106, p107, p108) -- name: renderWithTooltipCompat
	-- upvalues: (copy) v_u_26, (ref) v_u_59, (copy) v_u_15, (ref) v_u_55, (ref) v_u_56, (ref) v_u_54, (copy) v_u_21, (ref) v_u_57, (copy) v_u_20
	if not (v_u_26 and v_u_59()) then
		return v_u_20(p_u_106, p107, p108)
	end
	local function v110(p109)
		-- upvalues: (copy) p_u_105
		p_u_105:setState({
			["triggerPointSize"] = p109.AbsoluteSize,
			["triggerPointPosition"] = p109.AbsolutePosition
		})
	end
	local v111 = v_u_15.createElement
	local v112 = v_u_15.Fragment
	local v113 = nil
	local v114 = {}
	local v115
	if p107.active and (p_u_105.state.triggerPointSize and v_u_55) then
		v115 = v_u_15.createElement(v_u_55, {
			["panelType"] = v_u_56.ToolTipsContainer,
			["renderFunction"] = function(p116) -- name: renderFunction
				-- upvalues: (ref) v_u_15, (ref) v_u_54, (copy) p_u_106, (ref) v_u_21, (copy) p_u_105, (ref) v_u_57
				return v_u_15.createElement(v_u_54, {
					["textAlignment"] = nil,
					["headerText"] = nil,
					["orientation"] = nil,
					["distanceOffset"] = 0,
					["triggerPointCenter"] = nil,
					["contentOffsetVector"] = nil,
					["triggerPointRadius"] = nil,
					["textAlignment"] = Enum.TextXAlignment.Center,
					["headerText"] = p_u_106.headerText,
					["orientation"] = v_u_21.Top,
					["triggerPointCenter"] = Vector2.new(p_u_105.state.triggerPointPosition.X + p_u_105.state.triggerPointSize.X / 2, p116.Y - v_u_57),
					["contentOffsetVector"] = Vector2.zero,
					["triggerPointRadius"] = Vector2.zero
				})
			end
		})
	else
		v115 = nil
	end
	v114.VRSpatialTooltip = v115
	v114.MenuIconTriggerPoint = p108(v110)
	return v111(v112, v113, v114)
end
function v68.willUnmount(p117) -- name: willUnmount
	-- upvalues: (copy) v_u_11, (copy) v_u_12, (copy) v_u_43
	if v_u_11 and (v_u_12 ~= 0 and (p117.uiLessStore.getUILessModeEnabled(false) and p117.disposeEffect)) then
		p117.disposeEffect()
	end
	if v_u_43 and p117.tiltMenuDisposeEffect then
		p117.tiltMenuDisposeEffect()
	end
	if p117.disposeUiScaleEffect then
		p117.disposeUiScaleEffect()
	end
end
function v68.render(p_u_118) -- name: render
	-- upvalues: (copy) v_u_26, (copy) v_u_4, (copy) v_u_47, (copy) v_u_9, (copy) v_u_8, (copy) v_u_25, (copy) v_u_51, (copy) v_u_11, (copy) v_u_12, (copy) v_u_14, (copy) v_u_66, (copy) v_u_53, (copy) v_u_19, (copy) v_u_43, (copy) v_u_69, (copy) v_u_5, (copy) v_u_39, (copy) v_u_37, (copy) v_u_32, (copy) v_u_31, (copy) v_u_71, (copy) v_u_42, (copy) v_u_2, (copy) v_u_21, (copy) v_u_27, (copy) v_u_28
	local v_u_119 = v_u_26 and true or (not v_u_4.VREnabled or p_u_118.state.vrShowMenuIcon)
	local v_u_120 = v_u_47.TopBarButtonHeight * p_u_118.state.UiScale
	local v121 = v_u_47.TopBarButtonPadding * p_u_118.state.UiScale
	local v_u_122 = v_u_47.MENU_ICON_SIZE * p_u_118.state.UiScale
	local function v_u_124(p123)
		-- upvalues: (ref) v_u_9, (copy) p_u_118, (ref) v_u_8, (ref) v_u_25, (ref) v_u_51, (ref) v_u_47, (ref) v_u_11, (ref) v_u_12
		if p123 then
			if v_u_9 then
				p_u_118.priorAbsolutePosition = p123.AbsolutePosition
				p_u_118.priorAbsoluteSize = p123.AbsoluteSize
				if (not v_u_8 or v_u_25()) and v_u_51:getShowTopBar():get() then
					p_u_118.props.onAreaChanged(v_u_47.MenuIconKeepOutAreaId, p123.AbsolutePosition, p123.AbsoluteSize)
					return
				end
			elseif v_u_11 and (v_u_12 ~= 0 and p_u_118.uiLessStore.getUILessModeEnabled(false)) then
				p_u_118.priorAbsolutePosition = p123.AbsolutePosition
				p_u_118.priorAbsoluteSize = p123.AbsoluteSize
				if p_u_118.uiLessStore.getUIVisible(false) then
					p_u_118.props.onAreaChanged(v_u_47.MenuIconKeepOutAreaId, p123.AbsolutePosition, p123.AbsoluteSize)
					return
				end
			else
				p_u_118.props.onAreaChanged(v_u_47.MenuIconKeepOutAreaId, p123.AbsolutePosition, p123.AbsoluteSize)
			end
		end
	end
	local v125 = v_u_14.createElement
	local v126 = v_u_66
	local v127 = {
		["icon"] = not v_u_53() and "rbxasset://textures/ui/TopBar/coloredlogo.png" or v_u_19["icons/logo/block"]
	}
	local v128
	if v_u_43 then
		v128 = v_u_122 * (not p_u_118.state.tiltMenuOpen and 1 or v_u_47.MenuIconOpenScale)
	else
		v128 = v_u_122 * (p_u_118.props.iconScale or 1)
	end
	v127.iconSize = v128
	v127.useIconScaleAnimation = v_u_53()
	v127.onActivated = p_u_118.menuIconActivated
	v127.onHover = p_u_118.menuIconOnHover
	local v129
	if v_u_69 then
		v129 = p_u_118.menuIconOnHoverEnd
	else
		v129 = nil
	end
	v127.onHoverEnd = v129
	v127.enableFlashingDot = p_u_118.state.enableFlashingDot
	v127.modal = v_u_11 and (v_u_12 == 2 and p_u_118.uiLessStore.getUILessModeEnabled(false)) and true or nil
	local v_u_130 = v125(v126, v127)
	local v_u_131 = v_u_5
	if v_u_131 then
		v_u_131 = v_u_14.createElement(v_u_39, {
			["event"] = v_u_37.ShowTopBarChanged.Event or v_u_5:GetPropertyChangedSignal("GamepadCursorEnabled"),
			["callback"] = p_u_118.showTopBarCallback
		})
	end
	local v_u_132
	if p_u_118.props.showBadgeOver12 then
		local v133 = v_u_14.createElement
		local v134 = v_u_32
		local v135 = {}
		local v136
		if v_u_25() then
			v136 = UDim2.new(0, 1, 1, -(v121 + 1))
		else
			v136 = UDim2.new(0, -4, 1, 4)
		end
		v135.position = v136
		v_u_132 = v133(v134, v135)
	else
		v_u_132 = nil
	end
	if v_u_69 then
		local v_u_137 = "Roblox Menu"
		local function v138()
			-- upvalues: (ref) v_u_137, (ref) v_u_31
			v_u_137 = v_u_31:FormatByKey("CoreScripts.TopBar.RobloxMenu")
		end
		pcall(v138)
		local v139 = {
			["textAlignment"] = Enum.TextXAlignment.Center,
			["headerText"] = v_u_137,
			["hotkeyCodes"] = v_u_71
		}
		if v_u_42 and (p_u_118.props.referralRewardTooltipText and p_u_118.props.referralRewardTooltipText ~= "") then
			v139.headerText = p_u_118.props.referralRewardTooltipText
			v139.hotkeyCodes = {}
		end
		local v140 = {
			["active"] = nil,
			["guiTarget"] = nil,
			["preferredOrientation"] = nil,
			["DisplayOrder"] = 10,
			["active"] = p_u_118.state.showTooltip,
			["guiTarget"] = v_u_2,
			["preferredOrientation"] = v_u_21.Bottom
		}
		if v_u_42 and (p_u_118.props.referralRewardTooltipText and p_u_118.props.referralRewardTooltipText ~= "") then
			v140.active = true
		end
		return p_u_118:renderWithTooltipCompat(v139, v140, function(p_u_141)
			-- upvalues: (copy) v_u_124, (ref) v_u_25, (ref) v_u_8, (copy) p_u_118, (ref) v_u_27, (ref) v_u_28, (ref) v_u_14, (ref) v_u_66, (ref) v_u_53, (ref) v_u_19, (ref) v_u_43, (copy) v_u_122, (ref) v_u_47, (ref) v_u_69, (ref) v_u_11, (ref) v_u_12, (ref) v_u_119, (copy) v_u_120, (copy) v_u_132, (copy) v_u_130, (copy) v_u_131
			local function v143(p142)
				-- upvalues: (ref) v_u_124, (copy) p_u_141
				v_u_124(p142)
				p_u_141(p142)
			end
			local v144
			if v_u_25() and (v_u_8 and (p_u_118.props.unibarMenuRef and p_u_118.props.unibarMenuRef.current)) then
				local v145 = v_u_27:menuList():get()[1]
				local v146
				if v145 then
					v146 = v_u_28.ICON_NAME_PREFIX .. v145.id
				else
					v146 = nil
				end
				local v147
				if p_u_118.props.unibarMenuRef.current and v146 then
					v147 = p_u_118.props.unibarMenuRef.current:FindFirstChild(v146, true)
				else
					v147 = nil
				end
				local v148 = v_u_14.createElement
				local v149 = v_u_66
				local v150 = {
					["icon"] = not v_u_53() and "rbxasset://textures/ui/TopBar/coloredlogo.png" or v_u_19["icons/logo/block"]
				}
				local v151
				if v_u_43 then
					v151 = v_u_122 * (not p_u_118.state.tiltMenuOpen and 1 or v_u_47.MenuIconOpenScale)
				else
					v151 = v_u_122 * (p_u_118.props.iconScale or 1)
				end
				v150.iconSize = v151
				v150.useIconScaleAnimation = v_u_53()
				v150.onActivated = p_u_118.menuIconActivated
				v150.onHover = p_u_118.menuIconOnHover
				local v152
				if v_u_69 then
					v152 = p_u_118.menuIconOnHoverEnd
				else
					v152 = nil
				end
				v150.onHoverEnd = v152
				v150.enableFlashingDot = p_u_118.state.enableFlashingDot
				v150.onSelectionChanged = p_u_118.onMenuIconSelectionChanged
				v150.nextSelectionRightRef = v147
				v150.forwardRef = p_u_118.props.menuIconRef
				v144 = v148(v149, v150)
			else
				v144 = nil
			end
			local v153 = v_u_14.createElement
			local v154 = "Frame"
			local v155 = {}
			local v156
			if v_u_25() and v_u_8 or v_u_11 and (v_u_12 ~= 0 and p_u_118.uiLessStore.getUILessModeEnabled(false)) then
				v156 = p_u_118.showIcon:map(function(p157)
					-- upvalues: (ref) v_u_119
					return v_u_119 and p157
				end)
			else
				v156 = v_u_119
			end
			v155.Visible = v156
			v155.BackgroundTransparency = 1
			v155.Size = UDim2.new(0, v_u_120, 1, 0)
			v155.LayoutOrder = p_u_118.props.layoutOrder
			v155.SelectionGroup = v_u_25() and v_u_8 and true or nil
			local v158
			if v_u_25() and v_u_8 then
				v158 = Enum.SelectionBehavior.Stop
			else
				v158 = nil
			end
			v155.SelectionBehaviorLeft = v158
			local v159
			if v_u_25() and v_u_8 then
				v159 = Enum.SelectionBehavior.Stop
			else
				v159 = nil
			end
			v155.SelectionBehaviorUp = v159
			local v160
			if v_u_25() and v_u_8 then
				v160 = Enum.SelectionBehavior.Stop
			else
				v160 = nil
			end
			v155.SelectionBehaviorDown = v160
			v155[v_u_14.Change.AbsoluteSize] = v143
			v155[v_u_14.Change.AbsolutePosition] = v143
			local v161 = {
				["BadgeOver12"] = v_u_132
			}
			local v162
			if v_u_25() and (v_u_8 and (p_u_118.props.unibarMenuRef and p_u_118.props.unibarMenuRef.current)) then
				v162 = nil
			else
				v162 = v_u_130
			end
			v161.Background = v162
			if not (v_u_25() and v_u_8) then
				v144 = nil
			end
			v161.IconHitArea = v144
			v161.ShowTopBarListener = v_u_131
			return v153(v154, v155, v161)
		end)
	end
	local v163 = v_u_14.createElement
	local v164 = "Frame"
	local v165 = {}
	if v_u_25() and v_u_8 or v_u_11 and (v_u_12 ~= 0 and p_u_118.uiLessStore.getUILessModeEnabled(false)) then
		v_u_119 = p_u_118.showIcon:map(function(p166)
			-- upvalues: (ref) v_u_119
			return v_u_119 and p166
		end)
	end
	v165.Visible = v_u_119
	v165.BackgroundTransparency = 1
	v165.Size = UDim2.new(0, v_u_120, 1, 0)
	v165.LayoutOrder = p_u_118.props.layoutOrder
	v165[v_u_14.Change.AbsoluteSize] = v_u_124
	v165[v_u_14.Change.AbsolutePosition] = v_u_124
	return v163(v164, v165, {
		["BadgeOver12"] = v_u_132,
		["Background"] = v_u_130,
		["ShowTopBarListener"] = v_u_131
	})
end
local v172 = v16.UNSTABLE_connect2(nil, function(p_u_167) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_44, (copy) v_u_48, (copy) v_u_41, (copy) v_u_49
	return {
		["setGamepadMenuOpen"] = not v_u_44 and function(p168)
			-- upvalues: (copy) p_u_167, (ref) v_u_48
			return p_u_167(v_u_48(p168))
		end or nil,
		["onAreaChanged"] = not v_u_41 and function(p169, p170, p171)
			-- upvalues: (copy) p_u_167, (ref) v_u_49
			return p_u_167(v_u_49(p169, p170, p171))
		end or nil
	}
end)(v68)
if v_u_42 then
	return v67(v172)
else
	return v172
end