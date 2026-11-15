-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Unibar.ComponentHosts.IconHost
local v1 = script:FindFirstAncestor("ChromeShared")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("CoreGui")
local v_u_4 = game:GetService("UserInputService")
local v_u_5 = require(v2.Packages.React)
local v6 = require(v2.Workspace.Packages.SharedFlags)
local v_u_7 = v6.FFlagEnableConsoleExpControls
local v_u_8 = v6.FFlagEnableWhatsNew
local v_u_9
if v_u_8 then
	v_u_9 = require(v2.Workspace.Packages.WhatsNew).WhatsNewAnchor
else
	v_u_9 = nil
end
local v10 = require(script.Parent.Parent.Parent.Parent.Flags)
local v_u_11 = v10.FFlagUnibarMenuOpenHamburger
local v_u_12 = v10.FFlagUnibarMenuOpenSubmenu
local v13 = require(v1.Flags)
local v_u_14 = v13.FFlagChromeNineDotActivityIndicator
local v_u_15 = v13.FFlagTokenizeUnibarConstantsWithStyleProvider
local v16 = require(v2.Packages.UIBlox)
local v_u_17 = require(v2.Packages.Foundation)
local v_u_18 = v_u_17.Hooks.useCursor
local v_u_19 = v_u_17.StatusIndicator
local v_u_20 = v_u_17.Enums.StatusIndicatorVariant
local v_u_21 = v16.Core.Control.Interactable
local v_u_22 = v16.Core.Control.Enum.ControlState
local v_u_23 = v16.Core.Style.useStyle
local v_u_24 = v16.App.Dialog.TooltipV2.withTooltip
local v_u_25 = require(v1.Unibar.Constants)
local v_u_26 = require(v1.Service)
local v_u_27 = require(v1.Analytics.ChromeAnalytics)
local v_u_28 = require(v2.Workspace.Packages.Chrome).UnibarStyle
local v_u_29 = require(v1.Hooks.useObservableValue)
local v_u_30 = require(v1.Hooks.useMappedObservableValueBinding)
local v_u_31 = require(v1.Hooks.useTimeHysteresis)
local v_u_32 = require(v1.Utility.shouldRejectMultiTouch)
local v_u_33 = require(script.Parent.ChatNotificationBadge)
local v_u_34 = require(script.Parent.NineDotActivityIndicator)
local v_u_35 = require(script.Parent.NineDotNotificationBadge)
local v_u_36 = require(v2.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local v_u_37 = nil
local v_u_38, v_u_39, v_u_40, v_u_41, v_u_42, v_u_43
if v_u_36 then
	v_u_38 = require(v2.Workspace.Packages.AppCommonLib).isSpatial
	local v44 = require(v2.Workspace.Packages.VrSpatialUi)
	v_u_39 = v44.Panel3DInSpatialUI
	v_u_40 = v44.Constants.PanelType
	v_u_41 = v16.App.Dialog.Enum.TooltipOrientation
	v_u_42 = v16.App.Dialog.TooltipCallout
	v_u_43 = v44.Constants.SPATIAL_TOOLTIP_SPACING
	local v45 = v44.UIManager
	local v46 = require(v1.Service.ChromeUtils).MappedSignal
	local v_u_47 = v45.getInstance():getBottomBarVisibility()
	if v_u_47 and v_u_38() then
		v_u_37 = v46.new(v_u_47, function()
			-- upvalues: (copy) v_u_47
			return v_u_47:get()
		end)
	end
else
	v_u_38 = nil
	v_u_43 = nil
	v_u_42 = nil
	v_u_41 = nil
	v_u_39 = nil
	v_u_40 = nil
end
local v_u_48
if v_u_7 then
	v_u_48 = require(v1.Parent.Parent.TopBar.Components.MenuIconContext)
else
	v_u_48 = nil
end
local v_u_49 = {}
function areTooltipsDisplaying() -- name: areTooltipsDisplaying
	-- upvalues: (copy) v_u_49
	local v50 = tick()
	for _, v51 in v_u_49 do
		if not v51.displaying and v50 - v51.time >= 0.15 then
			continue
		end
		return true
	end
	return false
end
function logTooltipState(p52, p53) -- name: logTooltipState
	-- upvalues: (copy) v_u_49
	if not v_u_49[p52] or v_u_49[p52].displaying ~= p53 then
		v_u_49[p52] = {
			["displaying"] = p53,
			["time"] = tick()
		}
	end
end
function NotificationBadge(p54) -- name: NotificationBadge
	-- upvalues: (copy) v_u_5, (copy) v_u_15, (copy) v_u_28, (copy) v_u_25, (copy) v_u_19, (copy) v_u_20, (copy) v_u_14, (copy) v_u_34
	if not p54.integration then
		return nil
	end
	local v_u_55
	if p54.integration.integration then
		v_u_55 = p54.integration.integration.notification or nil
	else
		v_u_55 = nil
	end
	local v56, v57 = v_u_5.useBinding(v_u_55 and (v_u_55:get().value or 0) or 0)
	local v_u_58 = v57
	local v59, v60 = v_u_5.useState(false)
	local v_u_61 = v60
	v_u_5.useEffect(function()
		-- upvalues: (copy) v_u_55, (ref) v_u_61, (ref) v_u_58
		if v_u_55 then
			local v_u_63 = v_u_55:connect(function()
				-- upvalues: (ref) v_u_55, (ref) v_u_61, (ref) v_u_58
				local v62 = v_u_55:get().value or 0
				v_u_61(v62 > 0)
				v_u_58(v62)
			end)
			return function()
				-- upvalues: (copy) v_u_63
				v_u_63:disconnect()
			end
		end
	end, { p54.integration.integration.id })
	local v64, v65
	if v_u_15 then
		local v66 = v_u_28.use()
		v64 = v66.ICON_BADGE_OFFSET_X
		v65 = v66.ICON_BADGE_OFFSET_Y
	else
		v64 = v_u_25.ICON_BADGE_OFFSET_X
		v65 = v_u_25.ICON_BADGE_OFFSET_Y
	end
	local v_u_67 = p54.minBadgeCount or 0
	local v68 = v59 or v_u_67 > 0
	local v72 = v56:map(function(p69)
		-- upvalues: (copy) v_u_67
		local v70 = v_u_67
		local v71 = math.max(p69, v70)
		return math.min(v71, 99)
	end)
	local v73 = v_u_5.createElement
	local v74 = "Frame"
	local v75 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Visible"] = nil,
		["ZIndex"] = 2,
		["Size"] = UDim2.fromScale(1, 1),
		["Visible"] = p54.toggleTransition and (p54.toggleTransition:map(function(_)
			return true
		end) or true) or true
	}
	local v76 = {}
	local v77
	if v68 then
		v77 = v_u_5.createElement(v_u_19, {
			["value"] = v72,
			["variant"] = v_u_20.Emphasis,
			["AnchorPoint"] = Vector2.new(0, 0),
			["Position"] = UDim2.new(0, v64, 0, v65)
		})
	else
		v77 = nil
	end
	v76.Badge = v77
	local v78
	if v_u_14 and p54.integration.id == "nine_dot" then
		v78 = v_u_5.createElement(v_u_34, {
			["hasNotificationBadge"] = v68,
			["position"] = UDim2.new(0, v64, 0, v65),
			["visible"] = p54.showNineDotActivityIndicator == true
		})
	else
		v78 = nil
	end
	v76.ActivityIndicator = v78
	return v73(v74, v75, v76)
end
function NotificationIndicator(p79) -- name: NotificationIndicator
	-- upvalues: (copy) v_u_29, (copy) v_u_26, (copy) v_u_5
	local v80 = v_u_29(v_u_26:notificationIndicator())
	p79.setIconVisible(not v80)
	return v_u_5.createElement("Frame", {
		["Name"] = "NotificationIndicatorFrame",
		["Size"] = nil,
		["BorderSizePixel"] = 0,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 1, 0)
	}, {
		["IntegrationIcon"] = v80 and v80.component(p79) or nil,
		["UIListLayout"] = v_u_5.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
		})
	})
end
function HighlightCircle(p81) -- name: HighlightCircle
	-- upvalues: (copy) v_u_15, (copy) v_u_28, (copy) v_u_25, (copy) v_u_5
	local v82
	if v_u_15 then
		v82 = v_u_28.use().ICON_HIGHLIGHT_SIZE
	else
		v82 = v_u_25.ICON_HIGHLIGHT_SIZE
	end
	local v83 = v_u_5.createElement
	local v84 = {
		["Name"] = nil,
		["Size"] = nil,
		["AnchorPoint"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = nil,
		["BorderSizePixel"] = 0,
		["Visible"] = nil,
		["Name"] = p81.name or "Highlighter",
		["Size"] = v82,
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["BackgroundColor3"] = p81.color.Color,
		["BackgroundTransparency"] = p81.color.Transparency,
		["Visible"] = p81.visible
	}
	local v85 = {
		["corner"] = v_u_5.createElement("UICorner", {
			["CornerRadius"] = UDim.new(1, 0)
		})
	}
	return v83("Frame", v84, v85)
end
function TooltipButton(p_u_86) -- name: TooltipButton
	-- upvalues: (copy) v_u_15, (copy) v_u_28, (copy) v_u_25, (copy) v_u_5, (copy) v_u_31, (copy) v_u_36, (ref) v_u_38, (copy) v_u_29, (copy) v_u_26, (ref) v_u_37, (copy) v_u_22, (copy) v_u_27, (copy) v_u_4, (copy) v_u_32, (copy) v_u_7, (copy) v_u_48, (copy) v_u_21, (copy) v_u_11, (copy) v_u_12, (copy) v_u_18, (copy) v_u_17, (ref) v_u_39, (ref) v_u_40, (ref) v_u_43, (ref) v_u_42, (ref) v_u_41, (copy) v_u_24, (copy) v_u_3
	local v_u_87
	if v_u_15 then
		v_u_87 = v_u_28.use().ICON_HIGHLIGHT_SIZE
	else
		v_u_87 = v_u_25.ICON_HIGHLIGHT_SIZE
	end
	local v_u_88 = v_u_5.useRef(nil)
	local v_u_89 = p_u_86.integration.integration.secondaryAction
	local v_u_90 = p_u_86.integration.integration.draggable or false
	local v_u_91 = v_u_5.useRef(nil)
	v_u_5.useEffect(function()
		-- upvalues: (copy) v_u_91
		return function()
			-- upvalues: (ref) v_u_91
			if v_u_91.current then
				v_u_91.current:Disconnect()
				v_u_91.current = nil
			end
		end
	end, {})
	local v92, v_u_93
	if v_u_89 then
		v92, v_u_93 = v_u_31(0.05, 0.15, 0.35)
	else
		v92, v_u_93 = v_u_31(0.6, 0.65, 0.7)
	end
	local v_u_94, v_u_95 = v_u_31(0, 0, 0.65)
	local v96, v_u_97 = v_u_5.useState(false)
	local v98, v_u_99 = v_u_31(0, 1)
	local v_u_100
	if v_u_36 then
		v_u_100 = v_u_38()
	else
		v_u_100 = nil
	end
	local v101
	if v_u_36 then
		v101 = v_u_29(v_u_26:getTopBarVisibiity())
	else
		v101 = nil
	end
	local v102
	if v_u_36 and v_u_37 then
		v102 = v_u_29(v_u_37)
	else
		v102 = nil
	end
	local v_u_103
	if v_u_36 and (v_u_100 and not (v101 or v102)) then
		v_u_103 = true
		v_u_90 = v_u_90
		if v_u_90 then
			v_u_90 = not v_u_103
		end
	else
		v_u_103 = false
	end
	local v104 = v_u_5.useCallback
	local function v109(p105, p106)
		-- upvalues: (ref) v_u_36, (ref) v_u_103, (ref) v_u_22, (ref) v_u_26, (copy) p_u_86, (ref) v_u_93, (copy) v_u_94, (copy) v_u_99
		if not (v_u_36 and v_u_103) then
			if p106 == v_u_22.Selected and (p105 == v_u_22.Default or p105 == v_u_22.Hover) then
				v_u_26:setSelected(p_u_86.integration.id)
			elseif p106 == v_u_22.Selected and p105 == v_u_22.Default then
				v_u_26:setSelected(p_u_86.integration.id)
			end
			local v107 = p106 ~= v_u_22.Default
			p_u_86.setHovered(v107)
			local v108 = p106 == v_u_22.Hover
			v_u_93(v108, v108 and v_u_94 or areTooltipsDisplaying())
			if v108 then
				v_u_26:onIntegrationHovered():fire(p_u_86.integration.id)
			end
			if not v107 then
				v_u_99(false)
			end
		end
	end
	local v110
	if v_u_36 then
		v110 = {
			p_u_86.setHovered,
			v_u_93,
			v_u_99,
			v_u_94,
			v_u_100,
			v_u_103
		}
	else
		v110 = {
			p_u_86.setHovered,
			v_u_93,
			v_u_99,
			v_u_94
		}
	end
	local v_u_111 = v104(v109, v110)
	local v_u_116 = v_u_5.useCallback(function(_, p_u_112)
		-- upvalues: (ref) v_u_90, (copy) v_u_99, (ref) v_u_27, (copy) p_u_86, (copy) v_u_91, (ref) v_u_4, (ref) v_u_32, (ref) v_u_26, (ref) v_u_25
		if v_u_90 then
			if p_u_112.UserInputType == Enum.UserInputType.MouseButton1 or p_u_112.UserInputType == Enum.UserInputType.Touch then
				local v_u_113 = p_u_112.Position
				v_u_99(true, true)
				v_u_27.default:onIconTouchBegan(p_u_86.integration.id)
				if not v_u_91.current then
					v_u_91.current = v_u_4.InputChanged:Connect(function(p114, _)
						-- upvalues: (ref) v_u_32, (copy) p_u_112, (ref) v_u_26, (ref) p_u_86, (ref) v_u_91, (copy) v_u_113, (ref) v_u_25, (ref) v_u_27
						if v_u_32(p_u_112, p114) then
							return
						elseif not v_u_26:isWindowOpen(p_u_86.integration.id) and v_u_91.current then
							local v115 = (v_u_113 - p114.Position).Magnitude
							if math.abs(v115) > v_u_25.DRAG_MAGNITUDE_THRESHOLD then
								v_u_27.default:onIconDrag(p_u_86.integration.id)
								v_u_26:storeChromeInteracted()
								v_u_26:toggleWindow(p_u_86.integration.id)
								v_u_26:gesture(p_u_86.integration.id, v_u_91, p_u_112)
							end
						end
					end)
				end
			end
		end
	end, { v_u_90 })
	local v_u_118 = v_u_5.useCallback(function(_, p117)
		-- upvalues: (ref) v_u_90, (copy) v_u_99, (copy) v_u_91, (ref) v_u_26, (copy) p_u_86
		if v_u_90 then
			if p117.UserInputType == Enum.UserInputType.MouseButton1 or p117.UserInputType == Enum.UserInputType.Touch then
				v_u_99(false)
				if v_u_91.current then
					v_u_91.current:Disconnect()
					v_u_91.current = nil
					v_u_26:gesture(p_u_86.integration.id, nil)
				end
			end
		end
	end, { v_u_90 })
	local v_u_119
	if v92 or v_u_94 then
		v_u_119 = not v98
	else
		v_u_119 = v96
		if v_u_119 then
			v_u_119 = not v98
		end
	end
	if v_u_36 and (v_u_119 and v_u_103) then
		v_u_119 = false
	end
	logTooltipState(p_u_86.integration.id, v_u_119)
	local v_u_120
	if v_u_7 then
		v_u_120 = v_u_5.useContext(v_u_48)
	else
		v_u_120 = nil
	end
	local v121 = v_u_5.useCallback
	local function v131(p122)
		-- upvalues: (ref) v_u_7, (ref) v_u_26, (ref) v_u_5, (ref) v_u_21, (ref) v_u_25, (copy) p_u_86, (ref) v_u_87, (copy) v_u_111, (copy) v_u_88, (ref) v_u_11, (ref) v_u_12, (ref) v_u_18, (ref) v_u_17, (ref) v_u_119, (copy) v_u_89, (copy) v_u_120, (copy) v_u_116, (copy) v_u_118, (ref) v_u_36, (copy) v_u_100, (ref) v_u_103, (copy) v_u_99, (copy) v_u_91
		local v123
		if v_u_7 then
			v123 = v_u_26:menuList():get()[1].id
		else
			v123 = nil
		end
		local v124 = v_u_5.createElement
		local v125 = v_u_21
		local v126 = {
			["Name"] = (not v_u_7 and "IconHitArea_" or v_u_25.ICON_NAME_PREFIX) .. p_u_86.integration.id,
			["Size"] = v_u_87,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["onStateChanged"] = v_u_111,
			["ref"] = v_u_88
		}
		local v127
		if v_u_11 or v_u_12 then
			v127 = p_u_86.integration.order
		else
			v127 = 100 - p_u_86.integration.order
		end
		v126.SelectionOrder = v127
		v126.Position = p_u_86.isCurrentlyOpenSubMenu:map(function(p128)
			-- upvalues: (ref) v_u_7
			return UDim2.new(0.5, 0, 0.5, (v_u_7 or not p128) and 0 or 1)
		end)
		v126.SelectionImageObject = v_u_18(v_u_17.Enums.CursorType.SkinToneCircle)
		v126.SelectionGroup = true
		v126.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
		v126.SelectionBehaviorDown = p_u_86.isCurrentlyOpenSubMenu:map(function(p129)
			-- upvalues: (ref) v_u_119, (ref) v_u_89
			if v_u_119 and v_u_89 or p129 then
				return Enum.SelectionBehavior.Escape
			else
				return Enum.SelectionBehavior.Stop
			end
		end)
		local v130
		if v_u_7 and p_u_86.integration.id == v123 then
			v130 = v_u_120.menuIconRef
		else
			v130 = nil
		end
		v126.NextSelectionLeft = v130
		v126[v_u_5.Change.AbsolutePosition] = p122
		v126[v_u_5.Change.AbsoluteSize] = p122
		v126[v_u_5.Event.InputBegan] = v_u_116
		v126[v_u_5.Event.InputEnded] = v_u_118
		v126[v_u_5.Event.Activated] = function()
			-- upvalues: (ref) v_u_36, (ref) v_u_100, (ref) v_u_103, (ref) v_u_26, (ref) v_u_99, (ref) p_u_86, (ref) v_u_91
			if v_u_36 and v_u_100 then
				if v_u_103 then
					return
				end
				v_u_26:onTriggerVRToggleButton():fire(true)
			end
			v_u_99(true, true)
			p_u_86.integration.activated()
			if v_u_91.current then
				v_u_91.current:Disconnect()
				v_u_91.current = nil
				v_u_26:gesture(p_u_86.integration.id, nil)
			end
		end
		return v124(v125, v126, {
			["corner"] = v_u_5.createElement("UICorner", {
				["CornerRadius"] = UDim.new(1, 0)
			})
		})
	end
	local v132 = {}
	local v133 = p_u_86.isCurrentlyOpenSubMenu
	if not v_u_36 then
		v_u_103 = nil
	end
	local v134
	if v_u_7 then
		v134 = v_u_120.menuIconRef
	else
		v134 = nil
	end
	__set_list(v132, 1, {v_u_111, v_u_93, v_u_99, v_u_116, v_u_118, v133, v_u_119, v_u_89, v_u_103, v134})
	local v135 = v121(v131, v132)
	local v_u_136 = v_u_5.useRef(nil)
	local v_u_142 = v_u_5.useCallback(function(p137)
		-- upvalues: (copy) v_u_136, (copy) v_u_95
		local v_u_138 = nil
		local v_u_139 = nil
		local v_u_140 = nil
		local function v141()
			-- upvalues: (ref) v_u_138, (ref) v_u_139, (ref) v_u_140
			if v_u_138 then
				v_u_138:disconnect()
				v_u_138 = nil
			end
			if v_u_139 then
				v_u_139:disconnect()
				v_u_139 = nil
			end
			if v_u_140 then
				v_u_140:disconnect()
				v_u_140 = nil
			end
		end
		if p137 ~= v_u_136.current then
			pcall(v141)
			if p137 then
				v_u_138 = p137.MouseEnter:Connect(function()
					-- upvalues: (ref) v_u_95
					v_u_95(true, true)
				end)
				v_u_139 = p137.MouseLeave:Connect(function()
					-- upvalues: (ref) v_u_95
					v_u_95(false)
				end)
				v_u_140 = p137.Destroying:Connect(function()
					-- upvalues: (ref) v_u_95
					v_u_95(false)
				end)
			end
			v_u_136.current = p137
		end
	end, { v_u_95 })
	local v_u_144 = v_u_89 and {
		["text"] = v_u_89.label,
		["onStateChanged"] = function(_, p143) -- name: onStateChanged
			-- upvalues: (ref) v_u_22, (copy) v_u_97
			if p143 == v_u_22.Selected then
				v_u_97(true)
			else
				v_u_97(false)
			end
		end,
		["onActivated"] = function() -- name: onActivated
			-- upvalues: (copy) v_u_89, (copy) p_u_86
			v_u_89.activated(p_u_86.integration)
		end,
		["NextSelectionUp"] = v_u_88,
		["NextSelectionLeft"] = v_u_88,
		["NextSelectionRight"] = v_u_88,
		["NextSelectionDown"] = v_u_88
	} or nil
	if not (v_u_36 and v_u_100) then
		local v145 = v_u_24
		local v146 = {
			["headerText"] = p_u_86.integration.integration.label,
			["hotkeyCodes"] = p_u_86.integration.integration.hotkeyCodes,
			["textAlignment"] = Enum.TextXAlignment.Left,
			["buttonProps"] = v_u_144
		}
		if not v_u_89 then
			v_u_142 = nil
		end
		v146.ref = v_u_142
		return v145(v146, {
			["active"] = nil,
			["guiTarget"] = nil,
			["DisplayOrder"] = 10,
			["active"] = v_u_119,
			["guiTarget"] = v_u_3
		}, v135)
	end
	local v_u_147, v_u_148 = v_u_5.useBinding(Vector2.zero)
	local v_u_149, v_u_150 = v_u_5.useBinding(Vector2.zero)
	local v152 = v_u_5.useCallback(function(p151)
		-- upvalues: (copy) v_u_148, (copy) v_u_150
		v_u_148(p151.AbsolutePosition)
		v_u_150(p151.AbsoluteSize)
	end, { v_u_148, v_u_150 })
	local v153 = v_u_5.createElement
	local v154 = v_u_5.Fragment
	local v155 = nil
	local v156 = {}
	local v157
	if v_u_119 and v_u_39 then
		v157 = v_u_5.createElement(v_u_39, {
			["panelType"] = v_u_40.ToolTipsContainer,
			["renderFunction"] = function(p158) -- name: renderFunction
				-- upvalues: (copy) v_u_147, (copy) v_u_149, (ref) v_u_43, (ref) v_u_5, (ref) v_u_42, (copy) p_u_86, (ref) v_u_41, (copy) v_u_144, (copy) v_u_89, (copy) v_u_142
				local v159 = Vector2.new(v_u_147:getValue().X + v_u_149:getValue().X / 2, p158.Y - v_u_43)
				local v160 = v_u_5.createElement
				local v161 = v_u_42
				local v162 = {
					["textAlignment"] = nil,
					["headerText"] = nil,
					["orientation"] = nil,
					["distanceOffset"] = 0,
					["triggerPointCenter"] = nil,
					["contentOffsetVector"] = nil,
					["triggerPointRadius"] = nil,
					["buttonProps"] = nil,
					["ref"] = nil,
					["textAlignment"] = Enum.TextXAlignment.Center,
					["headerText"] = p_u_86.integration.integration.label,
					["orientation"] = v_u_41.Top,
					["triggerPointCenter"] = v159,
					["contentOffsetVector"] = Vector2.zero,
					["triggerPointRadius"] = Vector2.zero,
					["buttonProps"] = v_u_144
				}
				local v163
				if v_u_89 then
					v163 = v_u_142
				else
					v163 = nil
				end
				v162.ref = v163
				return v160(v161, v162)
			end
		})
	else
		v157 = nil
	end
	v156.VRSpatialTooltip = v157
	__set_list(v156, 1, {v135(v152)})
	return v153(v154, v155, v156)
end
function IconHost(p_u_164) -- name: IconHost
	-- upvalues: (copy) v_u_5, (copy) v_u_23, (copy) v_u_15, (copy) v_u_28, (copy) v_u_25, (copy) v_u_30, (copy) v_u_26, (copy) v_u_33, (copy) v_u_14, (copy) v_u_35, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9
	if not (p_u_164.integration and p_u_164.integration.component) then
		warn("IconHost has no component to render")
	end
	local v165, v166 = v_u_5.useBinding(false)
	local v167, v168 = v_u_5.useBinding(true)
	local v169 = v_u_23().Theme.BackgroundOnHover
	local v170
	if v_u_15 then
		v170 = v_u_28.use().ICON_CELL_WIDTH
	else
		v170 = v_u_25.ICON_CELL_WIDTH
	end
	local v172 = v_u_30(v_u_26:currentSubMenu(), function(p171)
		-- upvalues: (copy) p_u_164
		return p171 == p_u_164.integration.id
	end)
	local v173 = {}
	local v174 = v_u_5.createElement
	local v175 = "Frame"
	local v176 = {
		["Name"] = "IntegrationIconFrame",
		["Size"] = nil,
		["BorderSizePixel"] = 0,
		["BackgroundTransparency"] = 1,
		["Visible"] = nil,
		["Size"] = UDim2.new(1, 0, 1, 0),
		["Visible"] = v167
	}
	local v177 = {}
	local v178
	if p_u_164.integration and p_u_164.integration.component then
		v178 = p_u_164.integration.component(p_u_164) or nil
	else
		v178 = nil
	end
	v177.IntegrationIcon = v178
	v177.UIListLayout = v_u_5.createElement("UIListLayout", {
		["FillDirection"] = Enum.FillDirection.Horizontal,
		["VerticalAlignment"] = Enum.VerticalAlignment.Center,
		["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
	})
	local v179 = v174(v175, v176, v177)
	local v180
	if p_u_164.integration.integration.flashNotificationSource then
		v180 = v_u_5.createElement(NotificationIndicator, {
			["integration"] = p_u_164.integration,
			["setIconVisible"] = v168
		})
	else
		v180 = nil
	end
	local v181 = v_u_5.createElement(HighlightCircle, {
		["name"] = "SelectedHighlighter",
		["color"] = nil,
		["visible"] = nil,
		["color"] = v169,
		["visible"] = v172
	})
	local v182 = v_u_5.createElement(HighlightCircle, {
		["name"] = "Highlighter",
		["color"] = nil,
		["visible"] = nil,
		["color"] = v169,
		["visible"] = v165
	})
	local v183
	if p_u_164.integration.id == "chat" then
		v183 = v_u_5.createElement(v_u_33, {
			["iconHostProps"] = p_u_164,
			["NotificationBadge"] = NotificationBadge
		})
	elseif v_u_14 and p_u_164.integration.id == "nine_dot" then
		v183 = v_u_5.createElement(v_u_35, {
			["iconHostProps"] = p_u_164,
			["NotificationBadge"] = NotificationBadge
		})
	else
		v183 = v_u_5.createElement(NotificationBadge, p_u_164)
	end
	local v184
	if p_u_164.disableButtonBehaviors then
		v184 = nil
	else
		v184 = v_u_5.createElement(TooltipButton, {
			["integration"] = p_u_164.integration,
			["setHovered"] = v166,
			["isCurrentlyOpenSubMenu"] = v172
		})
	end
	__set_list(v173, 1, {v179, v180, v181, v182, v183, v184})
	local v185 = {
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["BorderSizePixel"] = 0,
		["BackgroundTransparency"] = 1,
		["Position"] = nil,
		["Visible"] = nil,
		["ZIndex"] = nil,
		["Size"] = UDim2.new(0, v170, 0, v170),
		["LayoutOrder"] = p_u_164.integration.order,
		["Position"] = p_u_164.position,
		["Visible"] = p_u_164.visible
	}
	local v186
	if v_u_7 then
		v186 = nil
	else
		v186 = p_u_164.integration.order
	end
	v185.ZIndex = v186
	if v_u_8 then
		return v_u_5.createElement("Frame", v185, {
			["WhatsNewAnchor"] = v_u_5.createElement(v_u_9, {
				["anchorId"] = nil,
				["tag"] = "size-full",
				["anchorId"] = p_u_164.integration.id
			}, v173)
		})
	else
		return v_u_5.createElement("Frame", v185, v173)
	end
end
return IconHost