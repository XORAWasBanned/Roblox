-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Unibar.SubMenu
local v1 = script:FindFirstAncestor("ChromeShared")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = UserSettings():GetService("UserGameSettings")
local v5 = require(v2.Workspace.Packages.SharedFlags)
local v_u_6 = v5.FFlagEnableConsoleExpControls
local v_u_7 = v5.FFlagEnableMenuTrailingBadge
local v_u_8 = game:DefineFastFlag("AvatarSwitcherHamburgerExposure", false)
local v_u_9 = game:DefineFastString("AvatarSwitcherIXPLayer", "UIEcosystem.User.Migration")
local v_u_10 = require(script.Parent.Parent.Parent.Flags).FFlagUnibarMenuOpenSubmenu
local v_u_11 = require(v1.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local v_u_12 = require(v2.Packages.React)
local v13 = require(v2.Packages.UIBlox)
local v_u_14
if v_u_6 then
	v_u_14 = require(v2.Workspace.Packages.InputUi).Gamepad.GamepadUtils
else
	v_u_14 = nil
end
local v_u_15 = v13.App.Text.StyledTextLabel
local v_u_16 = v13.Core.Style.useStyle
local v_u_17 = v13.Core.Control.Interactable
local v_u_18 = v13.Core.Control.Enum.ControlState
local v_u_19 = v13.App.Container.VerticalScrollView
local v_u_20 = v13.App.Container.Enum.ScrollBarType
local v_u_21 = require(v2.Packages.ReactOtter)
local v_u_22 = require(v2.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local v23 = require(v2.Packages.Foundation)
local v_u_24 = v23.Hooks.useCursor
local v_u_25 = require(v1.Service)
local v26 = require(v2.Workspace.Packages.Chrome)
local v_u_27 = require(v1.Service.ViewportUtil)
local v_u_28 = require(v1.Unibar.Constants)
local v_u_29
if v_u_6 then
	v_u_29 = require(v1.Parent.Parent.TopBar.Components.MenuIconContext)
else
	v_u_29 = nil
end
local v_u_30 = require(v1.Unibar.SubMenuContext)
local v_u_31
if v_u_7 then
	v_u_31 = require(v1.Unibar.MenuTrailingBadge)
else
	v_u_31 = nil
end
local v_u_32 = v26.UnibarStyle
local v_u_33 = game:GetService("UserInputService")
local v_u_34 = require(v1.Hooks.useChromeMenuItems)
local v_u_35 = require(v1.Hooks.useObservableValue)
local v_u_36 = require(v1.Hooks.useTopbarInsetHeight)
local v_u_37 = require(v1.Hooks.useMappedObservableValue)
local v_u_38 = game:DefineFastFlag("FixChromeIntegrationLayoutBug", false)
local v_u_39 = require(v2.Workspace.Packages.AppCommonLib).isSpatial
local v_u_40 = require(v2.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local v_u_41 = require(v2.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP
local v_u_42
if v_u_40 then
	v_u_42 = require(v2.Workspace.Packages.VrSpatialUi).UIManager
else
	v_u_42 = nil
end
local v_u_43 = require(v1.Unibar.ComponentHosts.IconHost)
local v_u_44 = v23.Enums.CursorType.RoundedSlot
local v_u_45 = Vector2.new(0, 0)
local v_u_46 = {}
local v_u_47 = nil
function MenuRow(p_u_48) -- name: MenuRow
	-- upvalues: (copy) v_u_16, (copy) v_u_11, (copy) v_u_32, (copy) v_u_28, (copy) v_u_12, (copy) v_u_30, (copy) v_u_6, (copy) v_u_29, (copy) v_u_18, (copy) v_u_7, (copy) v_u_25, (copy) v_u_3, (copy) v_u_15, (copy) v_u_43, (copy) v_u_31, (copy) v_u_40, (copy) v_u_41, (ref) v_u_42, (copy) v_u_17, (copy) v_u_24, (copy) v_u_44, (copy) v_u_38
	local v_u_49 = v_u_16().Theme
	local v_u_50 = {
		["Color"] = nil,
		["Transparency"] = 1,
		["Color"] = Color3.new(0, 0, 0)
	}
	local v51, v52, v53, v54, v55, v56, v57
	if v_u_11 then
		local v58 = v_u_32.use()
		v51 = v58.ICON_SIZE
		v52 = v58.SUB_MENU_ROW_HEIGHT
		v53 = v58.SUBMENU_PADDING_LEFT
		v54 = v58.SUBMENU_PADDING_RIGHT
		v55 = v58.SUBMENU_ROW_LABEL_FONT
		v56 = v58.SUBMENU_ROW_PADDING
		v57 = v58.SUBMENU_ROW_CORNER_RADIUS
	else
		v51 = v_u_28.ICON_SIZE
		v52 = v_u_28.SUB_MENU_ROW_HEIGHT
		v53 = v_u_28.SUBMENU_PADDING_LEFT
		v54 = v_u_28.SUBMENU_PADDING_RIGHT
		v55 = v_u_28.SUBMENU_ROW_LABEL_FONT
		v56 = v_u_28.SUBMENU_ROW_PADDING
		v57 = v_u_28.SUBMENU_ROW_CORNER_RADIUS
	end
	local v59 = v_u_12.useContext(v_u_30)
	local v60
	if v_u_6 then
		v60 = v_u_12.useContext(v_u_29)
	else
		v60 = nil
	end
	local v61, v_u_62 = v_u_12.useBinding(v_u_50)
	local v64 = v_u_12.useCallback(function(_, p63)
		-- upvalues: (ref) v_u_18, (copy) v_u_62, (copy) v_u_49, (copy) v_u_50
		if p63 == v_u_18.Pressed then
			v_u_62(v_u_49.BackgroundOnPress)
			return
		elseif p63 == v_u_18.Hover then
			v_u_62(v_u_49.BackgroundOnHover)
		else
			v_u_62(v_u_50)
		end
	end)
	local v65
	if v_u_7 then
		v65 = p_u_48.integration.menuTrailingBadgeConfig
	else
		v65 = nil
	end
	local v66 = v_u_12.useCallback(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_25, (ref) v_u_3, (copy) p_u_48
		if v_u_6 then
			v_u_25:disableFocusNav()
			v_u_3.SelectedCoreObject = nil
			v_u_25:setShortcutBar(nil)
			v_u_25:selectedItem():set(nil)
			p_u_48.activated()
		else
			p_u_48.activated()
		end
	end, { p_u_48.id })
	local v67 = v_u_12.createElement
	local v68 = v_u_15
	local v69 = {
		["size"] = nil,
		["lineHeight"] = 1,
		["fontStyle"] = nil,
		["colorStyle"] = nil,
		["text"] = nil,
		["textTruncate"] = nil,
		["textXAlignment"] = nil,
		["fluidSizing"] = true,
		["richText"] = true
	}
	local v70
	if v_u_7 then
		v70 = UDim2.fromScale(1, 1)
	else
		v70 = UDim2.new(1, -v51 - v53 - v54, 1, 0)
	end
	v69.size = v70
	v69.fontStyle = v55
	local v71
	if v59 then
		v71 = {
			["Color"] = v_u_49.TextEmphasis.Color,
			["Transparency"] = v59:map(function(p72)
				return 1 - p72
			end)
		}
	else
		v71 = v_u_49.TextEmphasis
	end
	v69.colorStyle = v71
	v69.text = p_u_48.integration.label
	v69.textTruncate = Enum.TextTruncate.AtEnd
	v69.textXAlignment = Enum.TextXAlignment.Left
	local v73 = v67(v68, v69)
	if v_u_7 then
		v73 = v_u_12.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.fromScale(0, 1)
		}, {
			["UIFlexItem"] = v_u_12.createElement("UIFlexItem", {
				["FlexMode"] = Enum.UIFlexMode.Fill
			}),
			["StyledTextLabel"] = v73
		})
	end
	local v74 = v_u_12.createElement
	local v75 = v_u_12.Fragment
	local v76 = nil
	local v77 = {
		["UIPadding"] = v_u_12.createElement("UIPadding", {
			["PaddingLeft"] = UDim.new(0, v53),
			["PaddingRight"] = UDim.new(0, v54)
		}),
		["UIListLayout"] = v_u_12.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center,
			["Padding"] = UDim.new(0, v56)
		}),
		["IconHost"] = v_u_12.createElement(v_u_43, {
			["integration"] = nil,
			["disableButtonBehaviors"] = true,
			["integration"] = p_u_48
		}),
		["Label"] = v73
	}
	local v78
	if v_u_7 and v65 then
		v78 = v_u_12.createElement(v_u_31, {
			["integrationId"] = p_u_48.integration.id,
			["config"] = v65
		})
	else
		v78 = nil
	end
	v77.TrailingBadge = v78
	local v79 = v74(v75, v76, v77)
	local v80 = (not v_u_40 or v_u_41:isSpatialUIScalingFixEnabled()) and 1 or v_u_42.getInstance():getAdditionalCameraScaleIfNeeded()
	local v81 = v_u_12.createElement
	local v82 = v_u_17
	local v85 = {
		["Size"] = UDim2.new(1, 0, 0, v52 * v80),
		["BorderSizePixel"] = 0,
		["BackgroundTransparency"] = v61:map(function(p83)
			return p83.Transparency
		end),
		["BackgroundColor3"] = v61:map(function(p84)
			return p84.Color
		end),
		["SelectionImageObject"] = v_u_24(v_u_44),
		[v_u_12.Event.Activated] = v66,
		["LayoutOrder"] = p_u_48.order,
		["onStateChanged"] = v64
	}
	local v86
	if v_u_6 then
		v86 = v60.menuIconRef
	else
		v86 = nil
	end
	v85.NextSelectionLeft = v86
	local v87 = {
		["UICorner"] = v_u_12.createElement("UICorner", {
			["CornerRadius"] = UDim.new(0, v57)
		})
	}
	if v_u_38 then
		v79 = v_u_12.createElement("Frame", {
			["Size"] = nil,
			["BorderSizePixel"] = 0,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = nil,
			["Size"] = UDim2.new(1, 0, 1, 0),
			["LayoutOrder"] = p_u_48.order
		}, { v79 })
	end
	v87.RowLabel = v79
	return v81(v82, v85, v87)
end
function isLeft(p88) -- name: isLeft
	return p88 == Enum.HorizontalAlignment.Left
end
function SubMenu(p89) -- name: SubMenu
	-- upvalues: (copy) v_u_16, (copy) v_u_12, (copy) v_u_35, (copy) v_u_27, (copy) v_u_36, (copy) v_u_11, (copy) v_u_32, (copy) v_u_28, (copy) v_u_3, (copy) v_u_25, (copy) v_u_6, (copy) v_u_33, (copy) v_u_14, (copy) v_u_8, (copy) v_u_22, (copy) v_u_9, (copy) v_u_40, (copy) v_u_41, (ref) v_u_42, (copy) v_u_39, (copy) v_u_4, (copy) v_u_37, (copy) v_u_19, (copy) v_u_20
	local v90 = v_u_16()
	local v91 = v90.Theme
	local v_u_92 = v_u_12.useRef(nil)
	local v93 = v_u_35(v_u_27.screenSize)
	local v94 = v_u_36()
	local v95, v96, v97, v98, v99, v100
	if v_u_11 then
		local v101 = v_u_32.use()
		v95 = v101.UNIBAR_LEFT_MARGIN
		v96 = v101.ICON_CELL_WIDTH
		v97 = v101.UNIBAR_END_PADDING
		v98 = v101.SUB_MENU_ROW_HEIGHT
		v99 = v101.SUBMENU_CORNER_RADIUS
		v100 = v101.SUBMENU_BOTTOM_PADDING
	else
		v95 = v_u_28.UNIBAR_LEFT_MARGIN
		v96 = v_u_28.ICON_CELL_WIDTH
		v97 = v_u_28.UNIBAR_END_PADDING
		v98 = v_u_28.SUB_MENU_ROW_HEIGHT
		v99 = v_u_28.SUBMENU_CORNER_RADIUS
		v100 = v_u_28.SUBMENU_BOTTOM_PADDING
	end
	local v102 = v98 * 0.5
	v_u_12.useEffect(function()
		-- upvalues: (copy) v_u_92, (ref) v_u_3, (ref) v_u_25, (ref) v_u_6, (ref) v_u_33, (ref) v_u_14
		local v_u_103
		if v_u_6 then
			v_u_103 = v_u_33.InputChanged:Connect(function(_)
				-- upvalues: (ref) v_u_33, (ref) v_u_14, (ref) v_u_92, (ref) v_u_3, (ref) v_u_25
				for _, v104 in v_u_33:GetGamepadState(Enum.UserInputType.Gamepad1) do
					if v104.KeyCode ~= Enum.KeyCode.Thumbstick1 then
						continue
					end
					local v105 = v_u_14.normalizeStickByDeadzone(Vector2.new(v104.Position.X, v104.Position.Y)).X
					if v105 < -0.5 then
						local v106 = v_u_92.current
						if v106 then
							v106 = v_u_92.current:IsAncestorOf(v_u_3.SelectedCoreObject)
						end
						if not v106 then
							continue
						end
						v_u_25:setSelectedByOffset(-1)
					else
						if v105 <= 0.5 then
							continue
						end
						local v107 = v_u_92.current
						if v107 then
							v107 = v_u_92.current:IsAncestorOf(v_u_3.SelectedCoreObject)
						end
						if not v107 then
							continue
						end
						v_u_25:setSelectedByOffset(1)
					end
				end
			end)
		else
			v_u_103 = nil
		end
		local v_u_112 = v_u_33.InputBegan:Connect(function(p108)
			-- upvalues: (ref) v_u_92, (ref) v_u_3, (ref) v_u_25
			local v109 = p108.KeyCode
			if v109 == Enum.KeyCode.Left or v109 == Enum.KeyCode.DPadLeft then
				local v110 = v_u_92.current
				if v110 then
					v110 = v_u_92.current:IsAncestorOf(v_u_3.SelectedCoreObject)
				end
				if v110 then
					v_u_25:setSelectedByOffset(-1)
					return
				end
			elseif v109 == Enum.KeyCode.Right or v109 == Enum.KeyCode.DPadRight then
				local v111 = v_u_92.current
				if v111 then
					v111 = v_u_92.current:IsAncestorOf(v_u_3.SelectedCoreObject)
				end
				if v111 then
					v_u_25:setSelectedByOffset(1)
				end
			end
		end)
		return function()
			-- upvalues: (ref) v_u_6, (ref) v_u_103, (copy) v_u_112
			if v_u_6 then
				v_u_103:Disconnect()
			end
			v_u_112:Disconnect()
		end
	end, {})
	if v_u_8 then
		v_u_12.useEffect(function()
			-- upvalues: (ref) v_u_22, (ref) v_u_9
			v_u_22:LogFlagLinkedUserLayerExposure(v_u_9)
		end, {})
	end
	local v113 = v94 + v96
	local v114 = not (p89 and p89.items) and 0 or v98 * #p89.items
	local v115 = v114 * ((not v_u_40 or v_u_41:isSpatialUIScalingFixEnabled()) and 1 or v_u_42.getInstance():getAdditionalCameraScaleIfNeeded())
	local v116
	if p89.panelSize then
		v116 = p89.panelSize.Y
	else
		v116 = v115
	end
	local v117 = v_u_40
	if v117 then
		v117 = v_u_39()
	end
	local v_u_118
	if v117 then
		v_u_118 = math.min(v115, v116)
	else
		local v119 = v93.Y - v113
		v_u_118 = math.min(v119, v114)
	end
	if not v117 and v93.Y - v113 < v114 then
		local v120 = (v93.Y - v113) / v98
		local v121 = math.floor(v120)
		if v98 * v121 + v102 <= v93.Y - v113 then
			v_u_118 = v98 * v121 + v102
		else
			v_u_118 = v98 * v121 - v102
		end
	end
	local v122 = {
		["UIListLayout"] = v_u_12.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
	}
	local v123 = v_u_12.createElement
	local v124 = "UISizeConstraint"
	local v125 = {}
	local v126
	if v_u_4.ReducedMotion or not p89.menuTransition then
		v126 = Vector2.new(0, v_u_118)
	else
		v126 = p89.menuTransition:map(function(p127)
			-- upvalues: (ref) v_u_118
			return Vector2.new(0, v_u_118 * p127)
		end)
	end
	v125.MinSize = v126
	v122.UISizeConstraint = v123(v124, v125)
	v122.BottomPadding = v_u_12.createElement("Frame", {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 10000,
		["Size"] = UDim2.new(0, 0, 0, v100)
	})
	for _, v128 in p89.items do
		v122[v128.id] = v_u_12.createElement(MenuRow, v128)
	end
	local v129 = v_u_37(v_u_25:orderAlignment(), isLeft)
	local v_u_130 = v90.Theme.BackgroundUIContrast.Transparency * v90.Settings.PreferredTransparency
	local v131
	if v117 then
		v131 = Vector2.new(0, 1)
	elseif v129 then
		v131 = Vector2.zero
	else
		v131 = Vector2.new(1, 0)
	end
	local v132 = v_u_12.createElement
	local v133 = "Frame"
	local v134 = {}
	local v135
	if v117 then
		local v136 = UDim2.new
		local v137 = 1
		local v138 = 0
		local v139 = 0
		local v140
		if v117 then
			v140 = math.min(v115, v116)
		else
			v140 = v115
		end
		v135 = v136(v137, v138, v139, v140)
	else
		v135 = UDim2.new(0, v96 * 4 + v95 + v97 * 2, 0, 0)
	end
	v134.Size = v135
	v134.AnchorPoint = v131
	local v141
	if v117 then
		v141 = UDim2.new(0, 0, 1, 0)
	else
		v141 = UDim2.new(0, -v94 - 2 + v95, 0, 0)
	end
	v134.Position = v141
	v134.BackgroundColor3 = v91.BackgroundUIContrast.Color
	if p89.menuTransition then
		v_u_130 = p89.menuTransition:map(function(p142)
			-- upvalues: (copy) v_u_130
			return v_u_130 + (1 - v_u_130) * (1 - p142)
		end)
	end
	v134.BackgroundTransparency = v_u_130
	local v143
	if v117 then
		v143 = nil
	else
		v143 = Enum.AutomaticSize.Y
	end
	v134.AutomaticSize = v143
	v134.ref = v_u_92
	v134.SelectionGroup = v_u_6 and true or nil
	local v144
	if v_u_6 then
		v144 = Enum.SelectionBehavior.Stop
	else
		v144 = nil
	end
	v134.SelectionBehaviorDown = v144
	local v145 = {
		["UICorner"] = v_u_12.createElement("UICorner", {
			["CornerRadius"] = UDim.new(0, v99)
		})
	}
	local v146 = v_u_12.createElement
	local v147 = v_u_19
	local v148 = {
		["size"] = nil,
		["canvasSizeY"] = nil,
		["selectable"] = false,
		["scrollBarType"] = nil,
		["size"] = UDim2.new(1, 0, 1, 0)
	}
	local v149 = UDim.new
	local v150 = 0
	if v117 then
		v114 = v115
	end
	v148.canvasSizeY = v149(v150, v114)
	v148.scrollBarType = v_u_20.Compact
	v145.ScrollingFrame = v146(v147, v148, v122)
	return v132(v133, v134, v145)
end
return function(p151)
	-- upvalues: (copy) v_u_12, (copy) v_u_35, (copy) v_u_25, (copy) v_u_34, (copy) v_u_21, (ref) v_u_46, (ref) v_u_47, (copy) v_u_28, (copy) v_u_33, (ref) v_u_45, (copy) v_u_40, (copy) v_u_39, (copy) v_u_41, (copy) v_u_10, (copy) v_u_30
	local v152 = {}
	local v_u_153 = v_u_12.useRef(nil)
	local v_u_154 = v_u_12.useRef(nil)
	local v_u_155 = v_u_12.useRef(nil)
	local v_u_156 = v_u_35(v_u_25:currentSubMenu())
	local _, v_u_157 = v_u_12.useState(0)
	local v158 = v_u_34()
	local v_u_159 = {}
	local v161, v_u_162 = v_u_21.useAnimatedBinding(0, function(p160)
		-- upvalues: (copy) v_u_157
		v_u_157(p160)
	end)
	v_u_12.useEffect(function()
		-- upvalues: (ref) v_u_46, (ref) v_u_159, (ref) v_u_47, (copy) v_u_156, (copy) v_u_157, (copy) v_u_162, (ref) v_u_21, (ref) v_u_28, (copy) v_u_155, (ref) v_u_33, (ref) v_u_45, (copy) v_u_154, (ref) v_u_25, (copy) v_u_153, (ref) v_u_40, (ref) v_u_39, (ref) v_u_41
		v_u_46 = v_u_159
		v_u_47 = v_u_156
		if v_u_156 then
			v_u_157(0)
			v_u_162(v_u_21.spring(1, v_u_28.MENU_ANIMATION_SPRING))
			v_u_155.current = v_u_33.TouchStarted:Connect(function(p163)
				-- upvalues: (ref) v_u_45
				v_u_45 = Vector2.new(p163.Position.X, p163.Position.Y)
			end)
			v_u_154.current = v_u_33.TouchTap:Connect(function(p164)
				-- upvalues: (ref) v_u_45, (ref) v_u_25
				if p164[1] - v_u_45 == Vector2.zero then
					local v165 = v_u_25:currentSubMenu():get()
					if v165 then
						v_u_25:toggleSubMenu(v165)
					end
				end
			end)
			v_u_153.current = v_u_33.InputEnded:Connect(function(p166, _)
				-- upvalues: (ref) v_u_40, (ref) v_u_39, (ref) v_u_41, (ref) v_u_25
				if not v_u_40 or (not v_u_39() or v_u_41:isMovePanelToCenter()) then
					local v167 = p166.UserInputType == Enum.UserInputType.MouseButton1
					local v168 = v_u_25:currentSubMenu():get()
					if v168 and v167 then
						v_u_25:toggleSubMenu(v168)
					end
				end
			end)
		else
			v_u_157(1)
			v_u_162(v_u_21.spring(0, v_u_28.MENU_ANIMATION_SPRING))
		end
		return function()
			-- upvalues: (ref) v_u_153, (ref) v_u_154, (ref) v_u_155
			if v_u_153.current then
				v_u_153.current:Disconnect()
				v_u_153.current = nil
			end
			if v_u_154.current then
				v_u_154.current:Disconnect()
				v_u_154.current = nil
			end
			if v_u_155.current then
				v_u_155.current:Disconnect()
				v_u_155.current = nil
			end
		end
	end, { v_u_156 })
	if v_u_156 and v158 then
		for _, v169 in v158 do
			if v_u_156 ~= v169.id then
				continue
			end
			v_u_159 = v169.children
		end
	end
	if #v_u_159 > 0 then
		v152[v_u_156] = v_u_12.createElement(SubMenu, {
			["items"] = v_u_159,
			["menuTransition"] = v161,
			["panelSize"] = p151.panelSize
		})
	elseif #v_u_46 > 0 then
		v152[v_u_47] = v_u_12.createElement(SubMenu, {
			["items"] = v_u_46,
			["menuTransition"] = v161,
			["panelSize"] = p151.panelSize
		})
	end
	local v170 = v_u_12.createElement
	local v171 = "Frame"
	local v172 = {
		["Name"] = "SubMenuHost",
		["Size"] = nil,
		["BorderSizePixel"] = 0,
		["BackgroundTransparency"] = 1,
		["ref"] = nil
	}
	local v173
	if v_u_40 and v_u_39() then
		v173 = UDim2.new(1, 0, 1, 0)
	else
		v173 = UDim2.new(0, 0, 1, 0)
	end
	v172.Size = v173
	local v174
	if v_u_10 then
		v174 = p151.subMenuHostRef
	else
		v174 = nil
	end
	v172.ref = v174
	return v170(v171, v172, v_u_12.createElement(v_u_30.Provider, {
		["value"] = v161
	}, v152))
end