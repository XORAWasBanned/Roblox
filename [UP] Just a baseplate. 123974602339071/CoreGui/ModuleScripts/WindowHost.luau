-- Path: CoreGui.RobloxGui.Modules.Chrome.ChromeShared.Unibar.ComponentHosts.WindowHost
local v1 = script:FindFirstAncestor("ChromeShared")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.React)
local v_u_4 = require(v2.Packages.ReactRoblox)
local v_u_5 = game:GetService("CoreGui")
local v_u_6 = game:GetService("UserInputService")
local v_u_7 = game:GetService("TweenService")
local v_u_8 = game:GetService("VRService")
local v_u_9 = require(v2.Packages.ReactOtter)
local v_u_10 = require(v2.Packages.Signals)
local v_u_11 = require(v2.Workspace.Packages.Display).GetDisplayStore(false).getUIScale
local v12 = require(v2.Packages.UIBlox)
local v13 = require(v2.Packages.Foundation)
local v_u_14 = v12.Core.Control.Interactable
local v_u_15 = v13.Hooks.useStyleSheet
local v_u_16 = require(v2.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local v_u_17 = require(v2.Workspace.Packages.AppCommonLib).Symbol.named("SelfieViewCursorOverride")
local v_u_18 = require(v1.Utility.debounce)
local v_u_19 = require(v1.Service)
local v_u_20 = require(v1.Unibar.Constants)
require(v2.Workspace.Packages.Chrome)
local v_u_21 = require(v1.Analytics.ChromeAnalytics)
local v_u_22 = require(v1.Utility.shouldRejectMultiTouch)
local v_u_23 = require(v2.Workspace.Packages.CoreScriptsCommon).SettingsShowSignal
local v_u_24 = require(v2.Workspace.Packages.CoreGuiCommon)
local v_u_25 = v_u_24.Flags.FFlagTopBarSignalizeMenuOpen
local v_u_26 = require(v2.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local v_u_27 = game:DefineFastInt("ChromeWindowLayoutOrder", 2)
local v_u_28 = game:DefineFastFlag("FixWindowDragError", false)
local v_u_29 = game:DefineFastFlag("FixWindowDragStaleConnection", false)
local v_u_30 = require(v1.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local v_u_31 = require(v1.Hooks.useWindowSize)
local v_u_32 = {
	["dampingRatio"] = 1,
	["frequency"] = 3
}
local v_u_33 = false
return function(p_u_34)
	-- upvalues: (copy) v_u_31, (copy) v_u_3, (copy) v_u_25, (copy) v_u_26, (copy) v_u_9, (copy) v_u_32, (copy) v_u_10, (copy) v_u_24, (copy) v_u_23, (copy) v_u_19, (copy) v_u_20, (copy) v_u_21, (copy) v_u_6, (copy) v_u_22, (copy) v_u_30, (copy) v_u_11, (copy) v_u_8, (ref) v_u_33, (copy) v_u_16, (copy) v_u_17, (copy) v_u_29, (copy) v_u_28, (copy) v_u_7, (copy) v_u_27, (copy) v_u_15, (copy) v_u_4, (copy) v_u_18, (copy) v_u_14, (copy) v_u_5
	local v_u_35 = v_u_31(p_u_34.integration.integration)
	local v_u_36 = v_u_3.useRef(nil)
	local v_u_37 = v_u_3.useRef(nil)
	local v38, v_u_39 = v_u_3.useBinding(false)
	local v_u_40 = 0
	local v_u_41 = v_u_3.useMemo(function()
		return nil
	end, {})
	local v42, v_u_43 = v_u_3.useBinding(false)
	local v44, v_u_45 = v_u_3.useBinding(false)
	local v46
	if v_u_25 then
		v46 = v_u_3.joinBindings({ v42, v44 }):map(function(p47)
			return p47[1] or p47[2]
		end)
	else
		v46 = nil
	end
	local v48
	if v_u_25 then
		v48 = nil
	else
		v48 = v_u_26(function(p49)
			return p49.displayOptions.menuOpen or p49.displayOptions.inspectMenuOpen
		end)
	end
	local v_u_50, v_u_51 = v_u_3.useBinding(false)
	local v_u_52, v_u_53 = v_u_9.useAnimatedBinding(v_u_35.X.Offset)
	local v_u_54, v_u_55 = v_u_9.useAnimatedBinding(v_u_35.Y.Offset)
	local v_u_56 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_52, (copy) v_u_54, (copy) p_u_34
		return Vector2.new(v_u_52:getValue(), v_u_54:getValue()) * (p_u_34.integration.integration.windowAnchorPoint or Vector2.zero)
	end, { v_u_52, v_u_54, p_u_34.integration })
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_52, (copy) v_u_53, (ref) v_u_9, (copy) v_u_35, (ref) v_u_32
		if v_u_52:getValue() == 0 then
			v_u_53((v_u_9.instant(v_u_35.X.Offset)))
		else
			v_u_53(v_u_9.spring(v_u_35.X.Offset, v_u_32))
		end
	end, { v_u_35.X.Offset })
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_54, (copy) v_u_55, (ref) v_u_9, (copy) v_u_35, (ref) v_u_32
		if v_u_54:getValue() == 0 then
			v_u_55((v_u_9.instant(v_u_35.Y.Offset)))
		else
			v_u_55(v_u_9.spring(v_u_35.Y.Offset, v_u_32))
		end
	end, { v_u_35.Y.Offset })
	if v_u_25 then
		v_u_3.useEffect(function()
			-- upvalues: (ref) v_u_10, (ref) v_u_24, (copy) v_u_45, (ref) v_u_23, (copy) v_u_43
			local v_u_58 = v_u_10.createEffect(function(p57)
				-- upvalues: (ref) v_u_24, (ref) v_u_45
				v_u_45((v_u_24.Stores.GetInspectAndBuyStore(p57).getInspectAndBuyOpen(p57)))
			end)
			v_u_23:connect(function(p59)
				-- upvalues: (ref) v_u_43
				v_u_43(p59)
			end)
			return function()
				-- upvalues: (copy) v_u_58
				v_u_58()
			end
		end, {})
	end
	v_u_3.useEffect(function()
		-- upvalues: (ref) v_u_19, (copy) p_u_34, (copy) v_u_36, (ref) v_u_37, (copy) v_u_39, (copy) v_u_53, (ref) v_u_9, (ref) v_u_20, (copy) v_u_55, (copy) v_u_35, (ref) v_u_32, (ref) v_u_21, (ref) v_u_6, (ref) v_u_22, (ref) v_u_30, (ref) v_u_11
		local v60 = v_u_19:dragConnection(p_u_34.integration.id)
		local v61, v_u_62
		if v60 then
			v61 = v60.connection
			v_u_62 = v60.inputObject
		else
			v61 = nil
			v_u_62 = nil
		end
		local v63 = v_u_36.current ~= nil
		assert(v63)
		local v64 = v_u_36.current.Parent ~= nil
		assert(v64)
		local v_u_65 = v_u_36.current
		local v_u_66 = v_u_36.current:FindFirstAncestorWhichIsA("ScreenGui").AbsoluteSize
		if v61 == nil then
			local v67
			if v_u_30 and p_u_34.position then
				local v68 = v_u_11(false)
				local v69 = v68 * p_u_34.position.X.Offset
				local v70 = v68 * p_u_34.position.Y.Offset
				v67 = UDim2.new(p_u_34.position.X.Scale, v69, p_u_34.position.Y.Scale, v70)
			else
				v67 = p_u_34.position or UDim2.new()
			end
			if p_u_34.integration.integration.cachePosition then
				local v71 = v_u_19:windowPosition(p_u_34.integration.id) or UDim2.new()
				local v72 = v71.X.Scale ~= 1 and 0 or v_u_66.X
				v_u_65.Position = UDim2.new(0, v72 + v71.X.Offset, 0, v71.Y.Offset)
			else
				local v73 = v67.X.Scale ~= 1 and 0 or v_u_66.X
				v_u_65.Position = UDim2.new(0, v73 + v67.X.Offset, 0, v67.Y.Offset)
			end
		else
			v_u_37 = v61
			v_u_39(true)
			if v_u_37 then
				v_u_53((v_u_9.instant(v_u_20.WINDOW_ICON_SIZE)))
				v_u_55((v_u_9.instant(v_u_20.WINDOW_ICON_SIZE)))
				task.defer(v_u_53, v_u_9.spring(v_u_35.X.Offset, v_u_32))
				task.defer(v_u_55, v_u_9.spring(v_u_35.Y.Offset, v_u_32))
				local v74 = v_u_36.current.AbsolutePosition.X
				local v75 = v_u_36.current.AbsolutePosition.Y
				local v_u_76 = Vector3.new(v74, v75, 0)
				v_u_21.default:setWindowDefaultPosition(p_u_34.integration.id, Vector2.new(v_u_76.X, v_u_76.Y))
				v_u_37.current = v_u_6.InputChanged:Connect(function(p77, _)
					-- upvalues: (ref) v_u_22, (ref) v_u_62, (copy) v_u_76, (copy) v_u_76, (copy) v_u_66, (copy) v_u_65
					local v78 = p77.Position
					if not v_u_22(v_u_62, p77) then
						local v79 = v78 - v_u_76
						local v80 = {}
						local v81 = (v79 + v_u_76).X
						local v82 = v_u_66.X
						v80.X = math.clamp(v81, 0, v82)
						local v83 = (v79 + v_u_76).Y
						local v84 = v_u_66.Y
						v80.Y = math.clamp(v83, 0, v84)
						v_u_65.Position = UDim2.fromOffset(v80.X, v80.Y)
					end
				end)
			end
		end
	end, {})
	local v_u_86 = v_u_3.useCallback(function(p85)
		-- upvalues: (copy) p_u_34, (ref) v_u_19
		if p_u_34.integration.integration.cachePosition then
			v_u_19:updateWindowPosition(p_u_34.integration.id, p85)
		end
	end, { p_u_34.integration })
	local v87 = v_u_3.useCallback(function()
		-- upvalues: (ref) v_u_8, (ref) v_u_33, (ref) v_u_16, (ref) v_u_17
		if not v_u_8.VREnabled then
			v_u_33 = true
			v_u_16.push(v_u_17, Enum.OverrideMouseIconBehavior.ForceShow)
		end
	end)
	local v88 = v_u_3.useCallback(function()
		-- upvalues: (ref) v_u_33, (ref) v_u_16, (ref) v_u_17
		if v_u_33 then
			v_u_33 = false
			v_u_16.pop(v_u_17)
		end
	end)
	local v123 = v_u_3.useCallback(function(_, p_u_89)
		-- upvalues: (copy) v_u_36, (copy) v_u_56, (ref) v_u_21, (copy) p_u_34, (ref) v_u_29, (ref) v_u_37, (copy) v_u_39, (copy) v_u_50, (ref) v_u_28, (copy) v_u_52, (copy) v_u_54, (ref) v_u_6, (ref) v_u_22, (ref) v_u_40, (ref) v_u_20
		local v90 = v_u_36.current ~= nil
		assert(v90)
		local v91 = v_u_36.current.Parent ~= nil
		assert(v91)
		local v_u_92 = v_u_36.current
		local v_u_93 = v_u_36.current:FindFirstAncestorWhichIsA("ScreenGui").AbsoluteSize
		local v_u_94 = v_u_56()
		local v_u_95 = p_u_89.Position
		local v96 = v_u_36.current.AbsolutePosition.X + v_u_94.X
		local v97 = v_u_36.current.AbsolutePosition.Y + v_u_94.Y
		local v_u_98 = Vector3.new(v96, v97, 0)
		if p_u_89.UserInputType == Enum.UserInputType.MouseButton1 or p_u_89.UserInputType == Enum.UserInputType.Touch then
			v_u_21.default:onWindowTouchBegan(p_u_34.integration.id, Vector2.new(v_u_36.current.AbsolutePosition.X, v_u_36.current.AbsolutePosition.Y))
			if v_u_29 and v_u_37.current then
				v_u_37.current:Disconnect()
				v_u_37.current = nil
				v_u_39(false)
			end
			if (v_u_29 and true or not v_u_37.current) and not v_u_50:getValue() then
				local v99 = {}
				local v100 = v_u_98.X
				local v101 = 0
				local v102
				if v_u_28 then
					local v103 = v_u_93.X - (v_u_52:getValue() - v_u_94.X)
					v102 = math.max(0, v103)
				else
					v102 = v_u_93.X - (v_u_52:getValue() - v_u_94.X)
				end
				v99.X = math.clamp(v100, v101, v102)
				local v104 = v_u_98.Y
				local v105 = 0
				local v106
				if v_u_28 then
					local v107 = v_u_93.Y - (v_u_54:getValue() - v_u_94.Y)
					v106 = math.max(0, v107)
				else
					v106 = v_u_93.Y - (v_u_54:getValue() - v_u_94.Y)
				end
				v99.Y = math.clamp(v104, v105, v106)
				v_u_92.Position = UDim2.fromOffset(v99.X, v99.Y)
				v_u_37.current = v_u_6.InputChanged:Connect(function(p108, _)
					-- upvalues: (ref) v_u_22, (copy) p_u_89, (copy) v_u_95, (ref) v_u_40, (ref) v_u_29, (ref) v_u_20, (ref) v_u_39, (copy) v_u_98, (copy) v_u_94, (ref) v_u_28, (copy) v_u_93, (ref) v_u_52, (ref) v_u_54, (copy) v_u_92, (ref) v_u_21, (ref) p_u_34
					if not v_u_22(p_u_89, p108) then
						local v109 = p108.Position
						local v110 = v109 - v_u_95
						local v111
						if v_u_29 then
							v111 = v110.Magnitude
						else
							v111 = v_u_40 + v110.Magnitude
						end
						v_u_40 = v111
						if v_u_40 > v_u_20.WINDOW_MIN_DRAG_DISTANCE then
							v_u_39(true)
							local v112 = {}
							local v113 = (v110 + v_u_98).X
							local v114 = v_u_94.X
							local v115
							if v_u_28 then
								local v116 = v_u_94.X
								local v117 = v_u_93.X - (v_u_52:getValue() - v_u_94.X)
								v115 = math.max(v116, v117)
							else
								v115 = v_u_93.X - (v_u_52:getValue() - v_u_94.X)
							end
							v112.X = math.clamp(v113, v114, v115)
							local v118 = (v110 + v_u_98).Y
							local v119 = v_u_94.Y
							local v120
							if v_u_28 then
								local v121 = v_u_94.Y
								local v122 = v_u_93.Y - (v_u_54:getValue() - v_u_94.Y)
								v120 = math.max(v121, v122)
							else
								v120 = v_u_93.Y - (v_u_54:getValue() - v_u_94.Y)
							end
							v112.Y = math.clamp(v118, v119, v120)
							v_u_92.Position = UDim2.fromOffset(v112.X, v112.Y)
							v_u_21.default:onWindowDrag(p_u_34.integration.id, v109)
						end
					end
				end)
			end
		end
	end, { v_u_56 })
	local function v_u_130(p124)
		-- upvalues: (copy) v_u_56, (copy) v_u_52, (copy) v_u_54
		local v125 = p124.Parent
		local v126 = p124.Position.X.Offset
		local v127 = p124.Position.Y.Offset
		local v128 = v_u_56()
		local v129 = v125.AbsoluteSize
		return (v126 < v128.X or (v129.X - (v_u_52:getValue() - v128.X) < v126 or v127 < v128.Y)) and true or v129.Y - (v_u_54:getValue() - v128.Y) < v127
	end
	local v_u_148 = v_u_3.useCallback(function(p131)
		-- upvalues: (copy) v_u_36, (ref) v_u_41, (copy) v_u_130, (copy) v_u_56, (copy) v_u_52, (copy) v_u_54, (copy) v_u_86, (copy) v_u_51, (ref) v_u_7
		if v_u_36 == nil or v_u_36.current == nil then
			return
		else
			local v132 = v_u_36.current ~= nil
			assert(v132)
			local v133 = v_u_36.current.Parent ~= nil
			assert(v133)
			local v134 = v_u_36.current
			local v135 = v134.Position.X.Offset
			local v136 = v134.Position.Y.Offset
			if v_u_41 and v_u_41.PlaybackState == Enum.PlaybackState.Playing then
				v_u_41:Cancel()
			end
			if v_u_130(v134) then
				if v134 == nil then
					return
				else
					local v137 = v_u_36.current.Parent
					local v138 = v_u_56()
					local v139 = v137.AbsoluteSize
					local v140 = 0
					local v141
					if v139.X > v_u_52:getValue() then
						local v142 = v138.X
						local v143 = v139.X - (v_u_52:getValue() - v138.X)
						v141 = math.clamp(v135, v142, v143)
					else
						v141 = 0
					end
					if v139.Y > v_u_54:getValue() then
						local v144 = v138.Y
						local v145 = v139.Y - (v_u_54:getValue() - v138.Y)
						v140 = math.clamp(v136, v144, v145)
					end
					local v146 = UDim2.new(0, v141, 0, v140)
					v_u_86(v146)
					if p131 then
						v134.Position = v146
					else
						v_u_51(true)
						v_u_41 = v_u_7:Create(v134, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
							["Position"] = v146
						})
						local v147 = v_u_41 ~= nil
						assert(v147)
						v_u_41.Completed:Connect(function(_)
							-- upvalues: (ref) v_u_51, (ref) v_u_41
							v_u_51(false)
							v_u_41 = nil
						end)
						v_u_41:Play()
					end
				end
			else
				v_u_86(UDim2.new(0, v135, 0, v136))
				return
			end
		end
	end, { v_u_56 })
	local v150 = v_u_3.useCallback(function(_, p149)
		-- upvalues: (ref) v_u_40, (copy) v_u_36, (ref) v_u_21, (copy) p_u_34, (copy) v_u_130, (ref) v_u_37, (copy) v_u_39, (ref) v_u_19, (copy) v_u_148
		v_u_40 = 0
		if p149.UserInputType == Enum.UserInputType.MouseButton1 or p149.UserInputType == Enum.UserInputType.Touch then
			if v_u_36.current then
				v_u_21.default:onWindowTouchEnded(p_u_34.integration.id, Vector2.new(v_u_36.current.AbsolutePosition.X, v_u_36.current.AbsolutePosition.Y), (v_u_130(v_u_36.current)))
			end
			if v_u_37.current then
				v_u_37.current:Disconnect()
				v_u_37.current = nil
				v_u_39(false)
				v_u_19:gesture(p_u_34.integration.id, nil)
				v_u_148()
			end
		end
	end, {})
	local v_u_151 = v_u_27
	local v152 = v_u_15()
	local v153 = v_u_4.createPortal
	local v154 = {}
	local v155 = v_u_3.createElement
	local v156 = "ScreenGui"
	local v157 = {
		["Name"] = v_u_20.WINDOW_HOST_GUI_NAME .. ":" .. p_u_34.integration.id,
		[v_u_3.Change.AbsoluteSize] = v_u_18(function()
			-- upvalues: (copy) v_u_148
			v_u_148()
		end, 0.2)
	}
	local v158
	if v_u_25 and v46 then
		v158 = v46:map(function(p159)
			-- upvalues: (copy) v_u_151
			return p159 and -1 or v_u_151
		end)
	else
		v158 = v48 and -1 or v_u_151
	end
	v157.DisplayOrder = v158
	v157.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	local v160 = {}
	local v161 = v_u_3.createElement
	local v162 = "Frame"
	local v164 = {
		["Size"] = nil,
		["LayoutOrder"] = 1,
		["ref"] = nil,
		["BorderSizePixel"] = 0,
		["AnchorPoint"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = v_u_3.joinBindings({ v_u_52, v_u_54 }):map(function(p163)
			-- upvalues: (copy) v_u_148
			v_u_148(true)
			return UDim2.fromOffset(p163[1], p163[2])
		end),
		["ref"] = v_u_36
	}
	local v165
	if p_u_34.integration.integration.windowAnchorPoint then
		v165 = p_u_34.integration.integration.windowAnchorPoint
	else
		v165 = nil
	end
	v164.AnchorPoint = v165
	local v166 = {
		["WindowWrapper"] = v_u_3.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(1, 0, 1, 0)
		}, {
			["Integration"] = p_u_34.integration.component(p_u_34) or nil,
			["InputShield"] = v_u_3.createElement(v_u_14, {
				["ZIndex"] = 3,
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["Visible"] = nil,
				["Size"] = UDim2.fromScale(1, 1),
				["Visible"] = v38
			}),
			["InputWrapper"] = v_u_3.createElement("Frame", {
				["ZIndex"] = 4,
				["Size"] = UDim2.fromScale(1, 1),
				["BackgroundTransparency"] = 1,
				[v_u_3.Event.InputBegan] = v123,
				[v_u_3.Event.InputEnded] = v150,
				[v_u_3.Event.MouseEnter] = v87,
				[v_u_3.Event.MouseLeave] = v88,
				[v_u_3.Event.Destroying] = v88
			})
		})
	}
	v160.WindowFrame = v161(v162, v164, v166)
	v160.FoundationStyleLink = v_u_3.createElement("StyleLink", {
		["StyleSheet"] = v152
	})
	v154.Name = v155(v156, v157, v160)
	return v153(v154, v_u_5)
end