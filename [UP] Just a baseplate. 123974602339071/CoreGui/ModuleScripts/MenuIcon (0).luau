-- Path: CoreGui.RobloxGui.Modules.TopBar.ComponentsV2.MenuIcon
game:GetService("ContextActionService")
local v_u_1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("GamepadService")
local v_u_4 = game:GetService("GuiService")
game:GetService("VRService")
local v5 = script.Parent.Parent
local v_u_6 = v5.Parent
local v7 = v_u_6.Chrome
local v_u_8 = require(v7.Service)
local v_u_9 = require(v5.Constants)
local v_u_10 = require(v_u_6.InGameMenuConstants)
local v_u_11 = require(v7.ChromeShared.Unibar.Constants)
local v_u_12 = require(v2.Workspace.Packages.Chrome).FocusUtils
local v_u_13 = require(v2.Workspace.Packages.Display)
local v_u_14 = require(v2.Packages.Foundation)
local v_u_15 = require(v2.Packages.Motion)
local v_u_16 = require(v2.Packages.React)
local v_u_17 = require(v2.Workspace.Packages.RobloxTranslator)
local v_u_18 = require(v2.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local v19 = require(v2.Workspace.Packages.SharedFlags)
local v_u_20 = require(v2.Packages.Signals)
local v_u_21 = require(v2.Packages.SignalsReact)
local v22 = require(v2.Packages.UIBlox)
local v_u_23 = require(v2.Workspace.Packages.AppCommonLib).isSpatial
local v_u_24 = v19.FFlagShowUnibarOnVirtualCursor
local v_u_25 = require(v2.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local v_u_26 = v19.FFlagSideSheetFocusNav
local v_u_27 = v19.FFlagEnablePlaytestModeUnibar
local v_u_28 = v_u_14.View
local v_u_29 = v_u_14.Icon
local v_u_30 = v_u_14.Enums.ControlState
local v_u_31 = v_u_14.Hooks.useTokens
local v_u_32 = v_u_14.Hooks.useCursor
local v_u_33 = require(v7.ChromeShared.Hooks.useIsPlaytestMode)
local v_u_34 = require(v2.Workspace.Packages.InExperienceSideSheet).getSideSheetVisibility
local v_u_35 = require(v5.Components.Presentation.menuIconHoveredSignal)
local v_u_36 = require(v5.Components.Presentation.BadgeOver12)
local v_u_37 = v22.App.Dialog.TooltipV2.withTooltip
local v_u_38 = v22.App.Dialog.Enum.TooltipOrientation
local v_u_39 = v22.App.Dialog.TooltipCallout
local v40 = require(v2.Workspace.Packages.VrSpatialUi)
local v_u_41 = v40.UIManager
local v_u_42 = v40.Panel3DInSpatialUI
local v_u_43 = v40.Constants.PanelType
local v_u_44 = v40.Constants.SPATIAL_TOOLTIP_SPACING
local v_u_45
if v_u_27 then
	v_u_45 = v_u_14.Utility.getTokens(v_u_14.Enums.ColorMode.Light)
else
	v_u_45 = nil
end
local v_u_46 = { Enum.KeyCode.Escape }
return function(p_u_47) -- name: MenuIcon
	-- upvalues: (copy) v_u_31, (copy) v_u_27, (copy) v_u_33, (copy) v_u_45, (copy) v_u_25, (copy) v_u_21, (copy) v_u_13, (copy) v_u_9, (copy) v_u_16, (copy) v_u_15, (copy) v_u_4, (copy) v_u_8, (copy) v_u_11, (copy) v_u_32, (copy) v_u_14, (copy) v_u_46, (copy) v_u_1, (copy) v_u_38, (copy) v_u_17, (copy) v_u_18, (copy) v_u_20, (copy) v_u_34, (copy) v_u_12, (copy) v_u_30, (copy) v_u_23, (copy) v_u_41, (copy) v_u_35, (copy) v_u_24, (copy) v_u_3, (copy) v_u_6, (copy) v_u_10, (copy) v_u_39, (copy) v_u_44, (copy) v_u_42, (copy) v_u_43, (copy) v_u_37, (copy) v_u_28, (copy) v_u_26, (copy) v_u_36, (copy) v_u_29
	local v48 = v_u_31()
	local v49
	if v_u_27 then
		v49 = v_u_33()
	else
		v49 = nil
	end
	local v_u_50
	if v_u_27 and v49 then
		v_u_50 = v_u_45.Color.Content.Emphasis
	elseif v_u_25 then
		v_u_50 = v48.Color.ActionEmphasis.Foreground
	else
		v_u_50 = nil
	end
	local v_u_51
	if v_u_27 and v49 then
		v_u_51 = v_u_45.Color.OverMedia.OverMedia_0
	else
		v_u_51 = v48.Color.OverMedia.OverMedia_0
	end
	local v53 = v_u_21.useSignalState(function(p52)
		-- upvalues: (ref) v_u_13
		return v_u_13.GetDisplayStore(p52).getUIScale(p52)
	end)
	local v_u_54 = v_u_9.TopBarButtonPadding * v53
	local v_u_55 = v_u_9.MENU_ICON_SIZE * v53
	local v_u_58 = v_u_16.useMemo(function()
		-- upvalues: (ref) v_u_15, (copy) v_u_55, (ref) v_u_9
		local v56 = {
			["menuOpen"] = v_u_15.createState({
				["size"] = v_u_55 * v_u_9.MenuIconOpenScale
			})
		}
		local v57 = {
			["size"] = v_u_55
		}
		v56.menuClosed = v_u_15.createState(v57)
		return v56
	end, { v53 })
	local v_u_59, v_u_60 = v_u_15.useMotion(v_u_58.menuClosed)
	local v_u_61, v_u_62 = v_u_16.useBinding(v_u_4.PreferredTransparency)
	local v_u_63 = v_u_16.useRef(false)
	local v_u_64 = v_u_16.useRef(false)
	local v_u_65
	if p_u_47.unibarMenuRef and p_u_47.unibarMenuRef.current then
		local v66 = v_u_8:menuList():get()[1]
		local v67
		if v66 then
			v67 = v_u_11.ICON_NAME_PREFIX .. v66.id
		else
			v67 = nil
		end
		if p_u_47.unibarMenuRef.current and v67 then
			v_u_65 = p_u_47.unibarMenuRef.current:FindFirstChild(v67, true)
		else
			v_u_65 = nil
		end
	else
		v_u_65 = nil
	end
	local v68, v_u_69 = v_u_16.useState(false)
	local v_u_70, v_u_71 = v_u_16.useState(Vector2.zero)
	local v_u_72, v_u_73 = v_u_16.useState(Vector2.zero)
	local v_u_74 = v_u_32(v_u_14.Enums.CursorType.SkinToneCircle)
	local v_u_75 = v_u_16.useRef("Roblox Menu")
	local v76 = {
		["textAlignment"] = Enum.TextXAlignment.Center,
		["headerText"] = v_u_75.current,
		["hotkeyCodes"] = v_u_46
	}
	local v77 = {
		["active"] = nil,
		["guiTarget"] = nil,
		["preferredOrientation"] = nil,
		["DisplayOrder"] = 10,
		["active"] = v68,
		["guiTarget"] = v_u_1,
		["preferredOrientation"] = v_u_38.Bottom
	}
	v_u_16.useEffect(function()
		-- upvalues: (copy) v_u_75, (ref) v_u_17, (ref) v_u_4, (copy) v_u_62, (ref) v_u_18, (copy) v_u_60, (copy) v_u_58, (ref) v_u_25, (ref) v_u_20, (ref) v_u_34, (copy) p_u_47, (ref) v_u_8, (ref) v_u_12
		local function v78()
			-- upvalues: (ref) v_u_75, (ref) v_u_17
			v_u_75.current = v_u_17:FormatByKey("CoreScripts.TopBar.RobloxMenu")
		end
		pcall(v78)
		local v_u_79 = v_u_4:GetPropertyChangedSignal("PreferredTransparency"):Connect(function()
			-- upvalues: (ref) v_u_62, (ref) v_u_4
			v_u_62(v_u_4.PreferredTransparency)
		end)
		local v_u_83 = v_u_18:connect(function(p80)
			-- upvalues: (ref) v_u_60, (ref) v_u_58
			local v81 = v_u_60
			local v82
			if p80 then
				v82 = v_u_58.menuOpen
			else
				v82 = v_u_58.menuClosed
			end
			v81(v82)
		end)
		local v_u_84
		if v_u_25 then
			v_u_84 = v_u_20.createEffect(function(p85)
				-- upvalues: (ref) v_u_34, (ref) v_u_60, (ref) v_u_58
				local v86 = v_u_60
				local v87
				if v_u_34(p85) then
					v87 = v_u_58.menuOpen
				else
					v87 = v_u_58.menuClosed
				end
				v86(v87)
			end)
		else
			v_u_84 = nil
		end
		local v_u_88
		if p_u_47.menuIconRef then
			v_u_88 = v_u_8:onTriggerMenuIcon():connect(function()
				-- upvalues: (ref) v_u_4, (ref) p_u_47, (ref) v_u_12
				v_u_4.SelectedCoreObject = p_u_47.menuIconRef.current
				v_u_12.MenuIconSelectedSignal:set(true)
			end)
		else
			v_u_88 = nil
		end
		return function()
			-- upvalues: (ref) v_u_25, (ref) v_u_84, (copy) v_u_79, (copy) v_u_83, (ref) v_u_88
			if v_u_25 and v_u_84 then
				v_u_84()
			end
			v_u_79:Disconnect()
			v_u_83:Disconnect()
			if v_u_88 then
				v_u_88:disconnect()
			end
		end
	end, {})
	local v_u_89 = v_u_16.useRef(v_u_30.Default)
	local v_u_97 = v_u_16.useCallback(function(p90)
		-- upvalues: (ref) v_u_30, (ref) v_u_23, (ref) v_u_8, (ref) v_u_41, (copy) v_u_64, (ref) v_u_35, (copy) v_u_63, (copy) v_u_69, (ref) v_u_12, (copy) v_u_89, (ref) v_u_24, (ref) v_u_3, (ref) v_u_4, (ref) v_u_11
		if p90 == v_u_30.Hover then
			local v91
			if v_u_23() then
				local v92 = v_u_8:showTopBar()
				local v93 = v_u_41.getInstance():isBottomBarInteractionOnAnimationSupported()
				v91 = not v92
				if v91 then
					v91 = not v93
				end
			else
				v91 = false
			end
			if v91 then
				return
			end
			v_u_64.current = true
			v_u_35:fire(true)
			task.delay(0.65, function()
				-- upvalues: (ref) v_u_64, (ref) v_u_63, (ref) v_u_23, (ref) v_u_8, (ref) v_u_41, (ref) v_u_69
				if v_u_64.current and not v_u_63.current then
					local v94
					if v_u_23() then
						local v95 = v_u_8:showTopBar()
						local v96 = v_u_41.getInstance():isBottomBarInteractionOnAnimationSupported()
						v94 = not v95
						if v94 then
							v94 = not v96
						end
					else
						v94 = false
					end
					if v94 then
						return
					end
					v_u_69(true)
				end
			end)
		elseif p90 == v_u_30.Selected then
			v_u_12.MenuIconSelectedSignal:set(true)
		elseif p90 == v_u_30.Default then
			if v_u_89.current == v_u_30.Hover then
				v_u_69(false)
				v_u_64.current = false
				v_u_63.current = false
			elseif v_u_89.current == v_u_30.Selected then
				if not (v_u_24 and v_u_3.GamepadCursorEnabled) and (v_u_4.SelectedCoreObject and string.find(v_u_4.SelectedCoreObject.Name, v_u_11.ICON_NAME_PREFIX)) then
					v_u_8:enableFocusNav()
				end
				v_u_12.MenuIconSelectedSignal:set(false)
			end
		end
		v_u_89.current = p90
	end, {})
	local v_u_101 = v_u_16.useCallback(function()
		-- upvalues: (copy) v_u_69, (copy) v_u_63, (ref) v_u_23, (ref) v_u_8, (ref) v_u_41, (ref) v_u_6, (ref) v_u_10
		v_u_69(false)
		v_u_63.current = true
		local v98
		if v_u_23() then
			local v99 = v_u_8:showTopBar()
			local v100 = v_u_41.getInstance():isBottomBarInteractionOnAnimationSupported()
			v98 = not v99
			if v98 then
				v98 = not v100
			end
		else
			v98 = false
		end
		if not v98 then
			require(v_u_6.Settings.SettingsHub):ToggleVisibility(v_u_10.AnalyticsMenuOpenTypes.TopbarButton)
		end
	end, {})
	return (function(p_u_102, p103, p104) -- name: renderWithTooltipCompat
		-- upvalues: (ref) v_u_23, (copy) v_u_71, (copy) v_u_73, (ref) v_u_16, (ref) v_u_39, (ref) v_u_38, (copy) v_u_72, (copy) v_u_70, (ref) v_u_44, (ref) v_u_42, (ref) v_u_43, (ref) v_u_37
		if not v_u_23() then
			return v_u_37(p_u_102, p103, p104)
		end
		local function v106(p105)
			-- upvalues: (ref) v_u_71, (ref) v_u_73
			v_u_71(p105.AbsoluteSize)
			v_u_73(p105.AbsolutePosition)
		end
		local v107 = { p_u_102, v_u_72, v_u_70 }
		local v109 = v_u_16.useCallback(function(p108)
			-- upvalues: (ref) v_u_16, (ref) v_u_39, (copy) p_u_102, (ref) v_u_38, (ref) v_u_72, (ref) v_u_70, (ref) v_u_44
			return v_u_16.createElement(v_u_39, {
				["textAlignment"] = nil,
				["headerText"] = nil,
				["orientation"] = nil,
				["distanceOffset"] = 0,
				["triggerPointCenter"] = nil,
				["contentOffsetVector"] = nil,
				["triggerPointRadius"] = nil,
				["textAlignment"] = Enum.TextXAlignment.Center,
				["headerText"] = p_u_102.headerText,
				["orientation"] = v_u_38.Top,
				["triggerPointCenter"] = Vector2.new(v_u_72.X + v_u_70.X / 2, p108.Y - v_u_44),
				["contentOffsetVector"] = Vector2.zero,
				["triggerPointRadius"] = Vector2.zero
			})
		end, v107)
		local v110 = v_u_16.createElement
		local v111 = v_u_16.Fragment
		local v112 = nil
		local v113 = {}
		local v114
		if p103.active and (v_u_70 and v_u_42) then
			v114 = v_u_16.createElement(v_u_42, {
				["panelType"] = v_u_43.ToolTipsContainer,
				["renderFunction"] = v109
			})
		else
			v114 = nil
		end
		v113.VRSpatialTooltip = v114
		v113.MenuIconTriggerPoint = p104(v106)
		return v110(v111, v112, v113)
	end)(v76, v77, (v_u_16.useCallback(function(p115)
		-- upvalues: (ref) v_u_16, (ref) v_u_28, (ref) v_u_25, (copy) v_u_61, (copy) v_u_51, (copy) p_u_47, (ref) v_u_65, (ref) v_u_26, (copy) v_u_74, (copy) v_u_101, (copy) v_u_97, (ref) v_u_36, (copy) v_u_54, (ref) v_u_29, (ref) v_u_14, (copy) v_u_59, (copy) v_u_50
		local v116 = v_u_16.createElement
		local v117 = v_u_28
		local v118 = {
			["tag"] = "radius-circle aspect-1-1",
			["backgroundStyle"] = nil,
			["Size"] = nil,
			["NextSelectionRight"] = nil,
			["selection"] = nil,
			["selectionGroup"] = nil,
			["ref"] = nil,
			["onAbsoluteSizeChanged"] = nil,
			["onAbsolutePositionChanged"] = nil,
			["onActivated"] = nil,
			["onStateChanged"] = nil
		}
		local v119
		if v_u_25 then
			v119 = nil
		else
			v119 = v_u_61:map(function(p120)
				-- upvalues: (ref) v_u_51
				local v121 = v_u_51
				v121.Transparency = v121.Transparency * p120
				return v121
			end)
		end
		v118.backgroundStyle = v119
		local v122
		if p_u_47.buttonSize then
			v122 = UDim2.fromOffset(p_u_47.buttonSize, p_u_47.buttonSize)
		else
			v122 = UDim2.fromScale(1, 1)
		end
		v118.Size = v122
		v118.NextSelectionRight = v_u_65
		v118.selection = v_u_25 and v_u_26 and {
			["Selectable"] = false
		} or {
			["Selectable"] = true,
			["SelectionImageObject"] = nil,
			["SelectionImageObject"] = v_u_74
		}
		v118.selectionGroup = {
			["SelectionBehaviorLeft"] = Enum.SelectionBehavior.Stop,
			["SelectionBehaviorUp"] = Enum.SelectionBehavior.Stop,
			["SelectionBehaviorDown"] = Enum.SelectionBehavior.Stop
		}
		v118.ref = p_u_47.menuIconRef
		v118.onAbsoluteSizeChanged = p115
		v118.onAbsolutePositionChanged = p115
		local v123
		if v_u_25 then
			v123 = nil
		else
			v123 = v_u_101
		end
		v118.onActivated = v123
		local v124
		if v_u_25 then
			v124 = nil
		else
			v124 = v_u_97
		end
		v118.onStateChanged = v124
		local v125 = {}
		local v126
		if p_u_47.showBadgeOver12 then
			v126 = v_u_16.createElement(v_u_36, {
				["position"] = UDim2.new(0, 1, 1, -(v_u_54 + 1))
			})
		else
			v126 = nil
		end
		v125.BadgeOver12 = v126
		v125.Icon = v_u_16.createElement(v_u_29, {
			["name"] = v_u_14.Enums.IconName.Tilt,
			["size"] = v_u_59.size,
			["Position"] = UDim2.fromScale(0.5, 0.5),
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["style"] = v_u_50
		})
		return v116(v117, v118, v125)
	end, {
		v_u_61,
		v_u_65,
		v_u_74,
		v_u_101,
		v_u_97,
		p_u_47.showBadgeOver12,
		v_u_50,
		v_u_51,
		p_u_47.buttonSize
	})))
end