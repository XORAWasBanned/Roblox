-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Unibar.UnibarMenu
local v1 = script:FindFirstAncestor("ChromeShared")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = game:GetService("ContextActionService")
local v_u_5 = require(v2.Packages.React)
local v6 = require(v2.Workspace.Packages.SharedFlags)
local v_u_7 = v6.GetFFlagDebugEnableUnibarDummyIntegrations
local v_u_8 = v6.GetFIntIconSelectionTimeout
local v9 = v6.GetFFlagChromeCentralizedConfiguration
local v_u_10 = v6.FFlagEnableConsoleExpControls
local v_u_11 = v6.FFlagAddUILessMode
local v_u_12 = v6.FIntAddUILessModeVariant
local v_u_13 = v6.FFlagAppNavMyStatsTab
local v_u_14 = require(script.Parent.Parent.Parent.Flags).FFlagUnibarMenuOpenSubmenu
local v_u_15 = require(v1.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local v_u_16 = v6.FFlagEnablePlaytestModeUnibar
local v_u_17 = require(v2.Packages.UIBlox).Core.Style.useStyle
local v_u_18 = require(v1.Unibar.PlaytestModeThemeProvider)
local v_u_19 = require(v1.Service)
local v_u_20 = require(v2.Workspace.Packages.Chrome).UnibarStyle
if not v9() then
	require(v1.Parent.Integrations)
end
local v_u_21 = require(v1.Unibar.SubMenu)
local v_u_22 = require(v1.Unibar.WindowManager)
local v_u_23 = require(v1.Shortcuts.ShortcutBar)
local v_u_24 = require(v1.Unibar.Constants)
local v_u_25 = require(v1.Unibar.buildMenuOrder)
local v_u_26 = require(v1.Hooks.useChromeMenuItems)
local v_u_27 = require(v1.Hooks.useObservableValue)
local v_u_28 = require(v1.Hooks.useMappedObservableValue)
local v_u_29 = require(v1.Unibar.ComponentHosts.IconHost)
local v_u_30 = require(v2.Packages.ReactOtter)
local v_u_31 = require(v2.Workspace.Packages.AppCommonLib).isSpatial
local v_u_32 = v6.FFlagReduceTopBarInsetsWhileHidden
local v_u_33 = require(v2.Workspace.Packages.CoreGuiCommon).Stores
local v_u_34 = require(v2.Packages.Signals).createEffect
local v_u_35 = require(v1.Parent.Integrations.Party.Constants)
local v_u_36 = require(v1.Parent.Integrations.Connect.isConnectUnibarEnabled)
local v_u_37
if v_u_10 then
	v_u_37 = require(v1.Parent.Parent.TopBar.Components.GamepadConnector)
else
	v_u_37 = nil
end
local v_u_38 = require(v2.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local v_u_39, v_u_40, v_u_41
if v_u_38 then
	local v42 = require(v2.Workspace.Packages.VrSpatialUi)
	v_u_39 = v42.Panel3DInSpatialUI
	v_u_40 = v42.Constants.PanelType
	v_u_41 = require(v2.Workspace.Packages.Observable).ObservableValue.new(true)
else
	v_u_40 = nil
	v_u_39 = nil
	v_u_41 = nil
end
if not v9() then
	function configureUnibar() -- name: configureUnibar
		-- upvalues: (copy) v_u_25, (copy) v_u_7, (copy) v_u_36, (copy) v_u_35, (copy) v_u_13, (copy) v_u_38, (copy) v_u_31, (copy) v_u_19
		local v43 = v_u_25()
		local v44 = { "nine_dot", "chat", "toggle_mic_mute" }
		table.insert(v44, 3, "join_voice")
		if v_u_7() then
			table.insert(v44, "dummy_window")
			table.insert(v44, "dummy_window_2")
		end
		if v_u_36() then
			table.insert(v44, "party_entrypoint")
		end
		local v45 = table.find(v44, "toggle_mic_mute")
		if v45 then
			local v46 = v_u_35.TOGGLE_MIC_INTEGRATION_ID
			table.insert(v44, v45, v46)
		end
		if v_u_13 then
			table.insert(v44, "assistant_build")
		end
		if v_u_38 and v_u_31() then
			v_u_19:configureMenu({
				{ "vr_toggle_button", "vr_safety_bubble" },
				v44
			})
		else
			v_u_19:configureMenu({ v44 })
		end
		v_u_19:configureSubMenu("nine_dot", v43)
	end
	configureUnibar()
	if v_u_10 then
		require(script.Parent.Parent.Shortcuts.ConfigureShortcuts)()
	end
end
function IconDivider(p47) -- name: IconDivider
	-- upvalues: (copy) v_u_17, (copy) v_u_15, (copy) v_u_20, (copy) v_u_24, (copy) v_u_5
	local v_u_48 = v_u_17()
	local v49
	if v_u_15 then
		v49 = v_u_20.use().ICON_DIVIDER_POSITION
	else
		v49 = v_u_24.ICON_DIVIDER_POSITION
	end
	local v50 = v_u_5.createElement
	local v51 = "Frame"
	local v52 = {
		["Position"] = nil,
		["Size"] = nil,
		["BorderSizePixel"] = 0,
		["BackgroundTransparency"] = 1,
		["Position"] = p47.position,
		["Size"] = UDim2.new(0, v_u_24.DIVIDER_CELL_WIDTH, 1, 0)
	}
	local v53 = {}
	local v54 = v_u_5.createElement
	local v55 = "Frame"
	local v56 = {
		["Position"] = nil,
		["AnchorPoint"] = nil,
		["Size"] = nil,
		["BorderSizePixel"] = 0,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = nil,
		["Visible"] = nil,
		["Position"] = v49,
		["AnchorPoint"] = Vector2.new(0, 0.5),
		["Size"] = v_u_24.ICON_DIVIDER_SIZE,
		["BackgroundColor3"] = v_u_48.Theme.Divider.Color
	}
	local v57
	if p47.toggleTransition then
		v57 = p47.toggleTransition:map(function(p58)
			-- upvalues: (copy) v_u_48
			return v_u_48.Theme.Divider.Transparency + (1 - p58) * (1 - v_u_48.Theme.Divider.Transparency)
		end)
	else
		v57 = v_u_48.Theme.Divider.Transparency
	end
	v56.BackgroundTransparency = v57
	v56.Visible = p47.visible or true
	v53.DividerBar = v54(v55, v56)
	return v50(v51, v52, v53)
end
function AnimationStateHelper(p_u_59) -- name: AnimationStateHelper
	-- upvalues: (copy) v_u_27, (copy) v_u_19, (copy) v_u_5, (copy) v_u_10, (copy) v_u_4, (copy) v_u_3, (copy) v_u_24, (copy) v_u_14, (copy) v_u_30, (copy) v_u_8
	local v_u_60 = v_u_27(v_u_19:currentSubMenu())
	local v_u_61 = v_u_27(v_u_19:selectedItem())
	local v_u_62 = v_u_27(v_u_19:inFocusNav())
	v_u_5.useEffect(function()
		-- upvalues: (copy) v_u_62, (ref) v_u_10, (ref) v_u_4, (ref) v_u_19, (ref) v_u_3, (copy) p_u_59, (copy) v_u_61, (ref) v_u_24, (ref) v_u_14
		if v_u_62 then
			if not v_u_10 then
				v_u_4:BindCoreAction("RBXEscapeUnibar", function(_, p63, _)
					-- upvalues: (ref) v_u_10, (ref) v_u_19, (ref) v_u_3
					if v_u_10 then
						if p63 == Enum.UserInputState.End then
							v_u_19:disableFocusNav()
							v_u_3.SelectedCoreObject = nil
							return
						end
					else
						v_u_19:disableFocusNav()
					end
				end, false, Enum.KeyCode.ButtonB)
			end
			if v_u_10 then
				if p_u_59.menuFrameRef.current then
					local v64 = v_u_61
					local v65 = p_u_59.menuFrameRef.current:FindFirstChild(v_u_24.ICON_NAME_PREFIX .. tostring(v64), true)
					if v65 then
						v_u_3.SelectedCoreObject = v65
						return
					elseif v_u_14 then
						if v_u_10 then
							v_u_19:selectedItem():set("nine_dot")
						end
						v_u_19:toggleSubMenu("nine_dot")
					else
						v_u_3:Select(p_u_59.menuFrameRef.current)
					end
				end
			elseif p_u_59.menuFrameRef.current then
				v_u_3:Select(p_u_59.menuFrameRef.current)
				return
			end
		else
			v_u_4:UnbindCoreAction("RBXEscapeUnibar")
			if v_u_3.SelectedCoreObject and p_u_59.menuFrameRef.current:IsAncestorOf(v_u_3.SelectedCoreObject) then
				v_u_3.SelectedCoreObject = nil
			end
		end
	end, { v_u_62 })
	v_u_5.useEffect(function()
		-- upvalues: (copy) v_u_60, (ref) v_u_14, (copy) v_u_62, (ref) v_u_3, (copy) p_u_59, (ref) v_u_30, (ref) v_u_24
		if v_u_60 == "nine_dot" then
			if v_u_14 and v_u_62 then
				v_u_3:Select(p_u_59.subMenuHostRef.current)
			end
			p_u_59.setToggleSubmenuTransition((v_u_30.spring(1, v_u_24.MENU_ANIMATION_SPRING)))
		else
			p_u_59.setToggleSubmenuTransition((v_u_30.spring(0, v_u_24.MENU_ANIMATION_SPRING)))
		end
	end, { v_u_60 })
	local v66 = v_u_5.useEffect
	local function v71()
		-- upvalues: (ref) v_u_10, (copy) v_u_60, (copy) v_u_61, (ref) v_u_8, (copy) p_u_59, (ref) v_u_24, (ref) v_u_3
		if not v_u_10 or v_u_60 ~= v_u_61 then
			local v70 = coroutine.create(function()
				-- upvalues: (ref) v_u_8, (ref) p_u_59, (ref) v_u_61, (ref) v_u_10, (ref) v_u_24, (ref) v_u_3
				local v67 = 0
				if v67 < v_u_8() then
					v67 = v67 + 1
					task.wait()
					if not (p_u_59.menuFrameRef.current and v_u_61) then
						continue
					end
					local v68
					if v_u_10 then
						local v69 = v_u_61
						v68 = p_u_59.menuFrameRef.current:FindFirstChild(v_u_24.ICON_NAME_PREFIX .. tostring(v69), true)
					else
						v68 = p_u_59.menuFrameRef.current:FindFirstChild("IconHitArea_" .. v_u_61, true)
					end
					if not v68 then
						continue
					end
					v_u_3.SelectedCoreObject = v68
				end
			end)
			coroutine.resume(v70)
		end
	end
	local v72 = {}
	if not v_u_10 then
		v_u_60 = nil
	end
	__set_list(v72, 1, {v_u_61, v_u_60})
	v66(v71, v72)
	return nil
end
function linearInterpolation(p73, p74, p75) -- name: linearInterpolation
	return p73 * (1 - p75) + p74 * p75
end
function IconPositionBinding(p76, p_u_77, p_u_78, p_u_79, p80, p81, p_u_82, p_u_83, p_u_84) -- name: IconPositionBinding
	-- upvalues: (copy) v_u_15, (copy) v_u_20, (copy) v_u_24, (copy) v_u_5
	local v_u_85
	if v_u_15 then
		v_u_85 = v_u_20.use().UNIBAR_END_PADDING
	else
		v_u_85 = v_u_24.UNIBAR_END_PADDING
	end
	return v_u_5.joinBindings({ p76, p80, p81 }):map(function(p86)
		-- upvalues: (copy) p_u_84, (copy) p_u_78, (copy) p_u_77, (copy) p_u_79, (copy) p_u_83, (copy) p_u_82, (ref) v_u_85
		local v87
		if p_u_84.current then
			v87 = linearInterpolation(p_u_78, p_u_77, p86[2])
		else
			v87 = linearInterpolation(p_u_77, p_u_78, p86[2])
		end
		local v88 = p_u_79
		if p_u_83 and not p_u_82 then
			v88 = p_u_79 - p86[3]
		end
		local v89 = v87 - v88
		return UDim2.new(0, v_u_85 + v88 + v89 * p86[1], 0, 0)
	end)
end
local function v_u_92(p90, _, _, p91) -- name: onUnibarSelectionChanged
	-- upvalues: (copy) v_u_19
	if not p90:IsAncestorOf(p91) then
		v_u_19:disableFocusNav()
	end
end
function isLeft(p93) -- name: isLeft
	return p93 == Enum.HorizontalAlignment.Left
end
function Unibar(p_u_94) -- name: Unibar
	-- upvalues: (copy) v_u_15, (copy) v_u_20, (copy) v_u_24, (copy) v_u_5, (copy) v_u_11, (copy) v_u_12, (copy) v_u_33, (copy) v_u_26, (copy) v_u_30, (copy) v_u_19, (copy) v_u_32, (copy) v_u_37, (copy) v_u_28, (copy) v_u_29, (copy) v_u_34, (copy) v_u_17, (copy) v_u_14
	local v_u_95, v96
	if v_u_15 then
		local v97 = v_u_20.use()
		v_u_95 = v97.ICON_CELL_WIDTH
		v96 = v97.UNIBAR_END_PADDING
	else
		v_u_95 = v_u_24.ICON_CELL_WIDTH
		v96 = v_u_24.UNIBAR_END_PADDING
	end
	local v98 = {}
	local v99 = v_u_5.useRef({})
	local v_u_100 = v_u_5.useRef(Vector2.zero)
	local v_u_101 = v_u_5.useRef(Vector2.zero)
	local v_u_102
	if v_u_11 and (v_u_12 ~= 0 and v_u_33.GetUILessStore) then
		v_u_102 = v_u_5.useRef(v_u_33.GetUILessStore(false))
	else
		v_u_102 = nil
	end
	local v103 = false
	local v104 = v99.current or {}
	local v105 = v_u_26()
	local v106, v107 = v_u_30.useAnimatedBinding(1)
	local v108, v109 = v_u_30.useAnimatedBinding(1)
	local v_u_110, v_u_111 = v_u_30.useAnimatedBinding(0)
	local v_u_112 = v_u_5.useRef(0)
	local v113, v_u_114 = v_u_30.useAnimatedBinding(1)
	local v_u_115 = v_u_5.useRef(false)
	local v116 = v_u_5.useRef(0)
	local v117 = v_u_19:currentSubMenu():get() == "nine_dot"
	local v118, v119 = v_u_30.useAnimatedBinding(v117 and 1 or 0)
	local v120 = {}
	local v121 = 0
	local v122 = 0
	local v123 = 0
	local v_u_124 = 0
	local v128 = v_u_5.useCallback(function(p125)
		-- upvalues: (copy) v_u_100, (ref) v_u_19, (ref) v_u_32, (copy) v_u_101, (ref) v_u_11, (ref) v_u_12, (ref) v_u_102, (ref) v_u_37, (copy) p_u_94, (ref) v_u_24
		local v126 = Vector2.zero
		local v127 = Vector2.zero
		if p125 then
			v126 = p125.AbsolutePosition
			v127 = p125.AbsoluteSize
			if v126 ~= v_u_100.current then
				v_u_100.current = v126
				v_u_19:setMenuAbsolutePosition(v126)
			end
			if v_u_32 and v127 ~= v_u_101.current then
				v_u_101.current = v127
			end
			if v_u_11 and (v_u_12 ~= 0 and v_u_102.current.getUILessModeEnabled(false)) then
				if v126 ~= v_u_100.current then
					v_u_100.current = v126
					v_u_19:setMenuAbsolutePosition(v126)
				end
				if v127 ~= v_u_101.current then
					v_u_101.current = v127
				end
			end
		end
		if v_u_32 and v_u_37 then
			if p125 and (p_u_94.onAreaChanged and v_u_37:getShowTopBar():get()) then
				p_u_94.onAreaChanged(v_u_24.UNIBAR_KEEP_OUT_AREA_ID, v126, v127)
				return
			end
		elseif v_u_11 and (v_u_12 ~= 0 and v_u_102.current.getUILessModeEnabled(false)) then
			if p125 and (p_u_94.onAreaChanged and v_u_102.current.getUIVisible(false)) then
				p_u_94.onAreaChanged(v_u_24.UNIBAR_KEEP_OUT_AREA_ID, v126, v127)
				return
			end
		elseif p125 and p_u_94.onAreaChanged then
			p_u_94.onAreaChanged(v_u_24.UNIBAR_KEEP_OUT_AREA_ID, v126, p125.AbsoluteSize)
		end
	end, {})
	local v130 = v_u_5.joinBindings({ v108, v_u_110 }):map(function(p129)
		-- upvalues: (ref) v_u_124, (ref) v_u_95
		return UDim2.new(0, linearInterpolation(v_u_124, p129[2], p129[1]), 0, v_u_95)
	end)
	local v131 = v_u_28(v_u_19:orderAlignment(), isLeft)
	for _, v132 in v105 do
		if v132.integration.availability:get() ~= v_u_19.AvailabilitySignal.Pinned then
			continue
		end
		v121 = v121 + 1
	end
	local v133
	if v131 then
		v133 = 1
	else
		local v134 = v121 - 1
		v133 = math.max(v134, 0)
	end
	for v135, v136 in v105 do
		if v136.isDivider then
			local v137 = v122 + v_u_95 * v133
			local v138 = v104[v136.id] or v122
			v98[v136.id] = v122
			v103 = v103 or v138 ~= v122
			local v139 = IconPositionBinding(v106, v138, v122, v137, v113, v_u_110, false, v131, v_u_115)
			local v140
			if v131 then
				v140 = v_u_5.joinBindings({ v139, v130 }):map(function(p141)
					-- upvalues: (ref) v_u_95
					return p141[1].X.Offset >= v_u_95 * 0.5
				end)
			else
				v140 = v_u_5.joinBindings({ v139, v130 }):map(function(p142)
					-- upvalues: (ref) v_u_95
					local v143 = p142[1]
					local v144 = p142[2]
					return v143.X.Offset <= v144.X.Offset - v_u_95
				end)
			end
			v120[v136.id or "icon" .. v135] = v_u_5.createElement(IconDivider, {
				["position"] = v139,
				["visible"] = v140,
				["toggleTransition"] = v108
			})
			v122 = v122 + v_u_24.DIVIDER_CELL_WIDTH
		else
			if not v136.integration then
				continue
			end
			local v145 = v122 + v_u_95 * v133
			local v146
			if v136.integration.availability:get() == v_u_19.AvailabilitySignal.Pinned then
				v145 = v123
				v146 = true
			else
				v146 = false
			end
			local v147
			if v104[v136.id] == nil then
				v147 = v122
			else
				v147 = v104[v136.id]
			end
			v98[v136.id] = v122
			v103 = v103 or v147 ~= v122
			local v148 = IconPositionBinding(v106, v147, v122, v145, v113, v_u_110, v146, v131, v_u_115)
			local v149
			if v131 then
				v149 = v_u_5.joinBindings({ v148, v130 }):map(function(p150)
					-- upvalues: (ref) v_u_95
					return p150[1].X.Offset >= v_u_95 * 0.5
				end)
			else
				v149 = v_u_5.joinBindings({ v148, v130 }):map(function(p151)
					-- upvalues: (ref) v_u_95
					local v152 = p151[1]
					local v153 = p151[2]
					return v152.X.Offset <= v153.X.Offset - v_u_95 * 1.5
				end)
			end
			v120[v136.id or "icon" .. v135] = v_u_5.createElement(v_u_29, {
				["position"] = v148,
				["visible"] = v146 or v149,
				["toggleTransition"] = v118,
				["integration"] = v136
			})
			v122 = v122 + v_u_95
			if not v146 then
				continue
			end
			v123 = v123 + v_u_95
		end
	end
	v_u_124 = v122
	if p_u_94.onMinWidthChanged then
		p_u_94.onMinWidthChanged(v_u_124)
	end
	local v_u_154 = v96 * 2 + v122
	local v155 = { v_u_154 }
	v_u_5.useEffect(function()
		-- upvalues: (copy) v_u_112, (copy) v_u_110, (copy) v_u_111, (ref) v_u_30, (ref) v_u_154, (ref) v_u_24, (ref) v_u_19, (ref) v_u_95
		local v156 = v_u_112.current
		if v_u_110:getValue() == 0 then
			v_u_111((v_u_30.instant(v_u_154)))
			v_u_112.current = v_u_154
		elseif v156 ~= v_u_154 then
			v_u_111(v_u_30.spring(v_u_154, v_u_24.MENU_ANIMATION_SPRING))
			v_u_112.current = v_u_154
		end
		v_u_19:setMenuAbsoluteSize(Vector2.new(v_u_154, v_u_95))
	end, v155)
	if v103 then
		v116.current = (v116.current or 0) + 1
	end
	v99.current = v98
	v_u_5.useEffect(function()
		-- upvalues: (copy) v_u_115, (copy) v_u_114, (ref) v_u_30, (ref) v_u_24
		if v_u_115.current then
			v_u_114(v_u_30.spring(1, v_u_24.MENU_ANIMATION_SPRING))
			v_u_115.current = false
		else
			v_u_114(v_u_30.spring(0, v_u_24.MENU_ANIMATION_SPRING))
			v_u_115.current = true
		end
	end, { v116.current, v_u_115 })
	v_u_5.useEffect(function()
		-- upvalues: (ref) v_u_32, (ref) v_u_37, (copy) p_u_94, (ref) v_u_24, (copy) v_u_100, (copy) v_u_101
		if v_u_32 and v_u_37 then
			local v_u_157 = v_u_37:getShowTopBar()
			v_u_157:connect(function()
				-- upvalues: (copy) v_u_157, (ref) p_u_94, (ref) v_u_24, (ref) v_u_100, (ref) v_u_101
				if v_u_157:get() then
					p_u_94.onAreaChanged(v_u_24.UNIBAR_KEEP_OUT_AREA_ID, v_u_100.current, v_u_101.current)
				else
					p_u_94.onAreaChanged(v_u_24.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero)
				end
			end)
			p_u_94.onAreaChanged(v_u_24.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero)
		end
	end, {})
	v_u_5.useEffect(function()
		-- upvalues: (ref) v_u_11, (ref) v_u_12, (ref) v_u_102, (ref) v_u_34, (copy) p_u_94, (ref) v_u_24, (copy) v_u_100, (copy) v_u_101
		local v_u_158
		if v_u_11 and (v_u_12 ~= 0 and v_u_102.current.getUILessModeEnabled(false)) then
			v_u_158 = v_u_34(function(p159)
				-- upvalues: (ref) v_u_102, (ref) p_u_94, (ref) v_u_24, (ref) v_u_100, (ref) v_u_101
				if v_u_102.current.getUIVisible(p159) then
					p_u_94.onAreaChanged(v_u_24.UNIBAR_KEEP_OUT_AREA_ID, v_u_100.current, v_u_101.current)
				else
					p_u_94.onAreaChanged(v_u_24.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero)
				end
			end)
			p_u_94.onAreaChanged(v_u_24.UNIBAR_KEEP_OUT_AREA_ID, Vector2.zero, Vector2.zero)
		else
			v_u_158 = nil
		end
		return function()
			-- upvalues: (ref) v_u_158
			if v_u_158 then
				v_u_158()
			end
		end
	end, {})
	local v160 = v_u_17()
	local v161 = v_u_5.createElement
	local v162 = "Frame"
	local v163 = {
		["Size"] = v130,
		["BorderSizePixel"] = 0,
		["BackgroundTransparency"] = 1,
		["SelectionGroup"] = true,
		["ref"] = p_u_94.menuFrameRef,
		[v_u_5.Change.AbsoluteSize] = v128,
		[v_u_5.Change.AbsolutePosition] = v128
	}
	local v164 = {}
	local v165 = v_u_5.createElement
	local v166 = AnimationStateHelper
	local v167 = {
		["setToggleIconTransition"] = v107,
		["setToggleWidthTransition"] = v109,
		["setToggleSubmenuTransition"] = v119,
		["menuFrameRef"] = p_u_94.menuFrameRef
	}
	local v168
	if v_u_14 then
		v168 = p_u_94.subMenuHostRef
	else
		v168 = nil
	end
	v167.subMenuHostRef = v168
	__set_list(v164, 1, {v165(v166, v167), v_u_5.createElement("Frame", {
	["Size"] = nil,
	["BorderSizePixel"] = 0,
	["BackgroundColor3"] = nil,
	["BackgroundTransparency"] = nil,
	["Size"] = UDim2.new(1, 0, 1, 0),
	["BackgroundColor3"] = v160.Theme.BackgroundUIContrast.Color,
	["BackgroundTransparency"] = v160.Theme.BackgroundUIContrast.Transparency * v160.Settings.PreferredTransparency
}, {
	["UICorner"] = v_u_5.createElement("UICorner", {
		["CornerRadius"] = UDim.new(1, 0)
	})
}), v_u_5.createElement("Frame", {
	["Size"] = nil,
	["BorderSizePixel"] = 0,
	["BackgroundTransparency"] = 1,
	["Size"] = UDim2.new(1, 0, 1, 0)
}, v120)})
	return v161(v162, v163, v164)
end
local function v_u_184(p169) -- name: UnibarPills
	-- upvalues: (copy) v_u_17, (copy) v_u_15, (copy) v_u_20, (copy) v_u_24, (copy) v_u_26, (copy) v_u_19, (copy) v_u_30, (copy) v_u_5, (copy) v_u_29
	local v170 = v_u_17()
	local v171, v172
	if v_u_15 then
		local v173 = v_u_20.use()
		v171 = v173.UNIBAR_END_PADDING
		v172 = v173.MENU_SUBMENU_PADDING
	else
		v171 = v_u_24.UNIBAR_END_PADDING
		v172 = v_u_24.MENU_SUBMENU_PADDING
	end
	local v174 = v_u_26()
	local v175 = v_u_19:currentSubMenu():get() == "nine_dot"
	local v176, v177 = v_u_30.useAnimatedBinding(v175 and 1 or 0)
	local v178 = v174 ~= nil
	assert(v178, "Menu items should not be nil")
	local v179 = {}
	local v180 = {}
	for v181, v182 in v174 do
		if v182.integration and v182.isDivider == false then
			v179["icon_host" .. v181] = v_u_5.createElement(v_u_29, {
				["toggleTransition"] = v176,
				["integration"] = v182
			})
		end
		if not v182.isDivider and v181 ~= #v174 then
			continue
		end
		local v183 = v_u_5.createElement("Frame", {
			["Size"] = nil,
			["AutomaticSize"] = nil,
			["BorderSizePixel"] = 0,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = nil,
			["Size"] = UDim2.new(0, 0, 0, 0),
			["AutomaticSize"] = Enum.AutomaticSize.XY,
			["BackgroundColor3"] = v170.Theme.BackgroundUIContrast.Color,
			["BackgroundTransparency"] = v170.Theme.BackgroundUIContrast.Transparency * v170.Settings.PreferredTransparency
		}, {
			["UICorner"] = v_u_5.createElement("UICorner", {
				["CornerRadius"] = UDim.new(1, 0)
			}),
			["Padding"] = v_u_5.createElement("UIPadding", {
				["PaddingLeft"] = UDim.new(0, v171),
				["PaddingRight"] = UDim.new(0, v171)
			}),
			["PillsHorizontalList"] = v_u_5.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center
			})
		}, v179)
		v180["pill_" .. v181] = v183
		v179 = {}
	end
	return v_u_5.createElement("Frame", {
		["BorderSizePixel"] = 0,
		["BackgroundTransparency"] = 1,
		["SelectionGroup"] = true,
		["ref"] = nil,
		["AutomaticSize"] = nil,
		["ref"] = p169.menuFrameRef,
		["AutomaticSize"] = Enum.AutomaticSize.XY
	}, { v_u_5.createElement(AnimationStateHelper, {
			["setToggleSubmenuTransition"] = v177,
			["menuFrameRef"] = p169.menuFrameRef,
			["subMenuHostRef"] = p169.subMenuHostRef
		}), v_u_5.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center,
			["Padding"] = UDim.new(0, v172)
		}) }, v180)
end
local function v_u_188(p_u_185) -- name: SubMenuWrapper
	-- upvalues: (copy) v_u_38, (copy) v_u_31, (ref) v_u_39, (copy) v_u_27, (copy) v_u_19, (ref) v_u_41, (copy) v_u_5, (copy) v_u_21, (ref) v_u_40
	if v_u_38 and (v_u_31() and v_u_39) then
		v_u_41:set(v_u_27(v_u_19:currentSubMenu()) ~= nil)
	end
	local v187 = v_u_5.useCallback(function(p186)
		-- upvalues: (ref) v_u_5, (ref) v_u_21, (copy) p_u_185
		return v_u_5.createElement(v_u_21, {
			["subMenuHostRef"] = p_u_185.subMenuHostRef,
			["panelSize"] = p186
		})
	end, { p_u_185.subMenuHostRef })
	if v_u_38 and (v_u_31() and v_u_39) then
		return v_u_5.createElement(v_u_39, {
			["panelType"] = v_u_40.ChromeSubMenu,
			["renderFunction"] = v187,
			["visibilityObservable"] = v_u_41
		})
	else
		return v_u_5.createElement(v_u_21, {
			["subMenuHostRef"] = p_u_185.subMenuHostRef
		})
	end
end
return v_u_5.memo(function(p189)
	-- upvalues: (copy) v_u_15, (copy) v_u_20, (copy) v_u_24, (copy) v_u_5, (copy) v_u_10, (copy) v_u_14, (copy) v_u_28, (copy) v_u_19, (copy) v_u_37, (copy) v_u_11, (copy) v_u_12, (copy) v_u_33, (copy) v_u_34, (copy) v_u_38, (copy) v_u_31, (copy) v_u_184, (copy) v_u_16, (copy) v_u_18, (copy) v_u_92, (copy) v_u_188, (copy) v_u_21, (copy) v_u_23, (copy) v_u_22
	local v190
	if v_u_15 then
		v190 = v_u_20.use().MENU_SUBMENU_PADDING
	else
		v190 = v_u_24.MENU_SUBMENU_PADDING
	end
	local v_u_191 = v_u_5.useRef(nil)
	if v_u_10 and p189.menuRef then
		v_u_191 = p189.menuRef
	end
	local v_u_192 = v_u_5.useRef(nil)
	local v193
	if v_u_14 then
		v193 = v_u_5.useRef(nil)
	else
		v193 = nil
	end
	local function v_u_194() -- name: updateSize
		-- upvalues: (copy) v_u_192, (ref) v_u_191
		if v_u_192.current and v_u_191.current then
			v_u_192.current.Size = v_u_191.current.Size
		end
	end
	local v195 = v_u_28(v_u_19:orderAlignment(), isLeft)
	local v196, v_u_197, v_u_198
	if v_u_10 and v_u_37 then
		v196, v_u_197 = v_u_5.useBinding(v_u_37:getShowTopBar():get())
		v_u_198 = v_u_37:getShowTopBar()
	else
		v196 = nil
		v_u_197 = nil
		v_u_198 = nil
	end
	local v_u_199
	if v_u_11 and (v_u_12 ~= 0 and v_u_33.GetUILessStore) then
		v_u_199 = v_u_5.useRef(v_u_33.GetUILessStore(false))
		if v_u_199.current.getUILessModeEnabled(false) then
			v196, v_u_197 = v_u_5.useBinding(true)
		end
	else
		v_u_199 = nil
	end
	v_u_5.useEffect(function()
		-- upvalues: (ref) v_u_191, (copy) v_u_194, (copy) v_u_192, (ref) v_u_10, (ref) v_u_198, (ref) v_u_197
		local v_u_200
		if v_u_191 and v_u_191.current then
			v_u_200 = v_u_191.current:GetPropertyChangedSignal("Size"):Connect(v_u_194)
		else
			v_u_200 = nil
		end
		if v_u_192.current and v_u_191.current then
			v_u_192.current.Size = v_u_191.current.Size
		end
		if v_u_10 then
			v_u_198:connect(function()
				-- upvalues: (ref) v_u_197, (ref) v_u_198
				v_u_197(v_u_198:get())
			end)
		end
		return function()
			-- upvalues: (ref) v_u_200
			if v_u_200 then
				v_u_200:disconnect()
			end
		end
	end)
	v_u_5.useEffect(function()
		-- upvalues: (ref) v_u_11, (ref) v_u_12, (ref) v_u_199, (ref) v_u_34, (ref) v_u_197
		local v_u_201
		if v_u_11 and (v_u_12 ~= 0 and v_u_199.current.getUILessModeEnabled(false)) then
			v_u_201 = v_u_34(function(p202)
				-- upvalues: (ref) v_u_197, (ref) v_u_199
				v_u_197(v_u_199.current.getUIVisible(p202))
			end)
		else
			v_u_201 = nil
		end
		return function()
			-- upvalues: (ref) v_u_201
			if v_u_201 then
				v_u_201()
			end
		end
	end, {})
	local v203
	if v_u_38 and v_u_31() then
		v203 = v_u_5.createElement(v_u_184, {
			["menuFrameRef"] = v_u_191,
			["subMenuHostRef"] = v193
		})
	else
		local v204 = v_u_5.createElement
		local v205 = Unibar
		local v206 = {
			["menuFrameRef"] = v_u_191
		}
		local v207
		if v_u_14 then
			v207 = v193
		else
			v207 = nil
		end
		v206.subMenuHostRef = v207
		v206.onAreaChanged = p189.onAreaChanged
		v206.onMinWidthChanged = p189.onMinWidthChanged
		v203 = v204(v205, v206)
	end
	if v_u_16 then
		v203 = v_u_5.createElement("Frame", {
			["AutomaticSize"] = nil,
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["AutomaticSize"] = Enum.AutomaticSize.XY
		}, {
			["PlaytestModeThemeProvider"] = v_u_5.createElement(v_u_18, nil, {
				["Unibar"] = v203
			})
		})
	end
	local v208 = {}
	local v209 = v_u_5.createElement
	local v210 = "Frame"
	local v211 = {
		["Name"] = "UnibarMenu",
		["AutomaticSize"] = Enum.AutomaticSize.Y,
		["BorderSizePixel"] = 0,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = p189.layoutOrder,
		["SelectionGroup"] = true,
		["SelectionBehaviorUp"] = Enum.SelectionBehavior.Stop
	}
	local v212
	if v_u_10 then
		v212 = nil
	else
		v212 = Enum.SelectionBehavior.Stop
	end
	v211.SelectionBehaviorLeft = v212
	v211.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
	v211.ref = v_u_192
	local v213 = v_u_5.Event.SelectionChanged
	local v214
	if v_u_10 then
		v214 = v_u_92
	else
		v214 = nil
	end
	v211[v213] = v214
	if not v_u_10 and (not v_u_11 or (v_u_12 == 0 or not v_u_199.current.getUILessModeEnabled(false))) then
		v196 = nil
	end
	v211.Visible = v196
	local v215 = {}
	local v216 = v_u_5.createElement
	local v217 = "UIListLayout"
	local v218 = {
		["FillDirection"] = Enum.FillDirection.Vertical
	}
	local v219
	if v195 then
		v219 = Enum.HorizontalAlignment.Left
	else
		v219 = Enum.HorizontalAlignment.Right
	end
	v218.HorizontalAlignment = v219
	v218.VerticalAlignment = Enum.VerticalAlignment.Top
	v218.Padding = UDim.new(0, v190)
	local v220 = v216(v217, v218)
	local v221
	if v_u_38 then
		v221 = v_u_5.createElement(v_u_188, {
			["subMenuHostRef"] = v193
		})
	else
		v221 = v_u_5.createElement(v_u_21, {
			["subMenuHostRef"] = v193
		})
	end
	local v222
	if v_u_10 then
		v222 = v_u_5.createElement(v_u_23)
	else
		v222 = nil
	end
	__set_list(v215, 1, {v220, v203, v221, v222, (v_u_5.createElement(v_u_22))})
	__set_list(v208, 1, {v209(v210, v211, v215)})
	return v208
end, function(_, _)
	return true
end)