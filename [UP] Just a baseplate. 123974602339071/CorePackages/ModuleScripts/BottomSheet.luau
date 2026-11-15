-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Sheet.BottomSheet
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v2.Otter)
local v_u_5 = require(v2.React)
local v6 = require(v2.ReactOtter)
local v_u_7 = require(v2.ReactRoblox)
local v_u_8 = require(v2.ReactUtils)
local v_u_9 = v6.useAnimatedBinding
local v_u_10 = require(v1.Enums.StateLayerAffordance)
local v_u_11 = require(v1.Providers.Elevation.useElevation)
local v_u_12 = require(v1.Providers.Overlay.useOverlay)
local v_u_13 = require(v1.Providers.Style.useTokens)
local v_u_14 = require(v1.Utility.withDefaults)
local v_u_15 = require(v1.Providers.Elevation.ElevationProvider).ElevationOwnerScope
local v_u_16 = require(v1.Enums.ElevationLayer)
local v17 = require(v1.Constants)
local v_u_18 = require(v1.Utility.Flags)
local v_u_19 = require(script.Parent.SheetContext)
local v_u_20 = require(script.Parent.Types)
local v_u_21 = require(script.Parent.SheetType)
local v_u_22 = require(script.Parent.childrenHasFullBleed)
local v_u_23 = require(script.Parent.useHardwareInsets)
local v_u_24 = require(script.Parent.useScreenHeight)
local v_u_25 = require(v1.Components.Backdrop)
local v_u_26 = require(v1.Components.Image)
local v_u_27 = require(v1.Components.View)
local v_u_28 = require(v1.Providers.Preferences.usePreferences)
local v_u_29 = {
	["defaultSnapPointIndex"] = 1,
	["testId"] = "--foundation-sheet"
}
local v_u_30 = v17.SHADOW_IMAGE
local v_u_31 = v17.SHADOW_SIZE
return v_u_5.memo(v_u_5.forwardRef(function(p32, p33) -- name: BottomSheet
	-- upvalues: (copy) v_u_14, (copy) v_u_29, (copy) v_u_12, (copy) v_u_13, (copy) v_u_11, (copy) v_u_16, (copy) v_u_28, (copy) v_u_24, (copy) v_u_5, (copy) v_u_18, (copy) v_u_23, (copy) v_u_9, (copy) v_u_22, (copy) v_u_4, (copy) v_u_8, (copy) v_u_21, (copy) v_u_27, (copy) v_u_10, (copy) v_u_7, (copy) v_u_20, (copy) v_u_3, (copy) v_u_19, (copy) v_u_15, (copy) v_u_26, (copy) v_u_30, (copy) v_u_31, (copy) v_u_25
	local v_u_34 = v_u_14(p32, v_u_29)
	local v_u_35 = v_u_12()
	local v_u_36 = v_u_13()
	local v37 = v_u_11(v_u_16.Sheet, {
		["stackAboveOwner"] = false
	})
	local v_u_38 = v_u_28().reducedMotion
	local v_u_39 = v_u_24()
	local v40, v_u_41 = v_u_5.useState(not v_u_35 and 0 or v_u_35.AbsoluteSize.Y)
	local v_u_42, v_u_43 = v_u_5.useState(0)
	local v44 = v_u_5.useMemo(function()
		-- upvalues: (copy) v_u_42
		return { v_u_42 }
	end, { v_u_42 })
	local v_u_45 = v_u_34.snapPoints or v44
	local v_u_47 = v_u_5.useCallback(function(p46)
		-- upvalues: (copy) v_u_39
		if p46 > 1 then
			return p46
		else
			return p46 * v_u_39
		end
	end, { v_u_39 })
	local v48 = 0
	local v_u_49 = (1 / 0)
	for _, v50 in v_u_45 do
		local v51 = v_u_47(v50)
		if v48 < v51 then
			v48 = v51
		end
		if not v_u_18.FoundationSheetReversedContent then
			continue
		end
		v_u_49 = math.min(v_u_49, v51)
	end
	local v_u_52 = math.min(v48, v_u_39)
	if v40 > 0 then
		v_u_52 = math.min(v_u_52, v40)
	end
	if v_u_18.FoundationSheetReversedContent then
		v_u_49 = math.min(v_u_49, v_u_52)
	end
	local v_u_53 = v_u_23(v_u_35).bottom
	local v_u_54 = v_u_5.useRef(0)
	local v_u_55 = v_u_5.useRef(false)
	local v_u_56 = v_u_5.useRef(v_u_34.onSnapPointChanged)
	v_u_56.current = v_u_34.onSnapPointChanged
	local v57, v_u_58 = v_u_9(1, function()
		-- upvalues: (copy) v_u_55, (copy) v_u_34
		if v_u_55.current then
			v_u_34.onClose()
		end
	end)
	local v_u_59, v_u_60 = v_u_5.useBinding(-v_u_53)
	local v_u_61, v_u_62 = v_u_5.useBinding(0)
	local v_u_63, v_u_64 = v_u_5.useBinding(false)
	local v_u_65, v_u_66 = v_u_5.useBinding(false)
	local v_u_67 = v_u_22(v_u_34.children)
	local v68, v69 = v_u_5.useBinding(0)
	local v_u_70 = v68
	local v_u_71 = v69
	local v_u_72 = v_u_5.useRef(0)
	local v_u_73 = v_u_5.useRef(nil)
	local v_u_74, v_u_75 = v_u_5.useBinding(0)
	local v_u_76 = v_u_5.useRef(nil)
	local v_u_77, v_u_78 = v_u_5.useBinding(false)
	local v_u_79
	if v_u_18.FoundationSheetReversedContent then
		v_u_79 = v_u_5.useRef(false)
	else
		v_u_79 = nil
	end
	local v_u_80
	if v_u_18.FoundationSheetReversedContent then
		v_u_80 = v_u_5.useCallback(function(p81)
			-- upvalues: (copy) v_u_79
			v_u_79.current = p81
		end, {})
	else
		v_u_80 = nil
	end
	local v_u_82
	if v_u_18.FoundationSheetReversedContent then
		v_u_82 = v_u_5.useMemo(function()
			-- upvalues: (copy) v_u_34, (copy) v_u_59, (copy) v_u_36, (ref) v_u_52, (ref) v_u_49
			if v_u_34.snapPoints == nil then
				return nil
			else
				return v_u_59:map(function(p83)
					-- upvalues: (ref) v_u_36, (ref) v_u_52, (ref) v_u_49
					local v84 = p83 + v_u_36.Margin.Small
					local v85 = v_u_49
					local v86 = v_u_52
					return v_u_52 - math.clamp(v84, v85, v86)
				end)
			end
		end, {
			v_u_34.snapPoints == nil,
			v_u_59,
			v_u_49,
			v_u_52,
			v_u_36.Margin.Small
		})
	else
		v_u_82 = nil
	end
	local v_u_87 = v_u_5.useRef(false)
	local v_u_88 = v_u_5.useRef(0)
	local v_u_89 = v_u_5.useRef(nil)
	local v_u_90 = v_u_5.useRef(false)
	local v_u_91 = v_u_5.useRef(0)
	local v_u_92 = v_u_5.useRef(false)
	local v93, v94 = v_u_5.useState(false)
	local v_u_95 = v93
	local v_u_96 = v94
	local v_u_98 = v_u_5.useCallback(function(p97)
		-- upvalues: (ref) v_u_92, (ref) v_u_96
		if v_u_92.current ~= p97 then
			v_u_92.current = p97
			v_u_96(p97)
		end
	end, {})
	local v_u_99 = v_u_5.useCallback(function()
		-- upvalues: (copy) v_u_89, (copy) v_u_88, (copy) v_u_90
		if v_u_89.current then
			v_u_89.current:Disconnect()
			v_u_89.current = nil
		end
		v_u_88.current = 0
		v_u_90.current = false
	end, {})
	local v_u_116 = v_u_5.useCallback(function(p_u_100)
		-- upvalues: (copy) v_u_99, (copy) v_u_90, (copy) v_u_73, (copy) v_u_89, (copy) v_u_91
		v_u_99()
		v_u_90.current = true
		if v_u_73.current then
			v_u_73.current:ResetScrollVelocity()
		end
		v_u_89.current = game:GetService("RunService").Heartbeat:Connect(function(p101)
			-- upvalues: (ref) v_u_73, (ref) v_u_90, (ref) v_u_99, (ref) v_u_91, (copy) p_u_100
			if v_u_73.current and v_u_90.current then
				local v102 = v_u_73.current.CanvasPosition.Y
				local v103 = v_u_91.current
				local v104 = p_u_100
				local v105 = v102 - v104
				local v106 = 25.132741228718345 * p101
				local v107 = -v106
				local v108 = math.exp(v107)
				local v109 = v103 + 25.132741228718345 * v105
				local v110 = (v105 + v109 * p101) * v108
				local v111 = (v103 - v109 * v106) * v108
				local v112 = v104 + v110
				v_u_91.current = v111
				v_u_73.current.CanvasPosition = Vector2.new(0, v112)
				local v113 = p_u_100 - v_u_73.current.CanvasPosition.Y
				local v114
				if math.abs(v113) < 0.5 then
					local v115 = v_u_91.current
					v114 = math.abs(v115) < 1
				else
					v114 = false
				end
				if v114 then
					v_u_73.current.CanvasPosition = Vector2.new(0, p_u_100)
					v_u_99()
				end
			else
				v_u_99()
			end
		end)
	end, { v_u_99 })
	local v_u_120 = v_u_5.useCallback(function(p117)
		-- upvalues: (copy) v_u_47, (ref) v_u_52, (copy) v_u_53
		local v118 = v_u_47(p117)
		local v119 = v_u_52
		return math.min(v118, v119) + v_u_53
	end, { v_u_53, v_u_47, v_u_52 })
	local v_u_122 = v_u_5.useCallback(function(p121)
		-- upvalues: (copy) v_u_54, (copy) v_u_116, (copy) v_u_120, (copy) v_u_45, (copy) v_u_56
		v_u_54.current = p121
		v_u_116(v_u_120(v_u_45[p121]))
		if v_u_56.current then
			v_u_56.current(v_u_45[p121], p121)
		end
	end, { v_u_120, v_u_45 })
	local v_u_124 = v_u_5.useCallback(function(p123)
		-- upvalues: (copy) v_u_99, (copy) v_u_54, (copy) v_u_73, (copy) v_u_120, (copy) v_u_45, (copy) v_u_56
		v_u_99()
		v_u_54.current = p123
		if v_u_73.current then
			v_u_73.current.CanvasPosition = Vector2.new(0, v_u_120(v_u_45[p123]))
		end
		if v_u_56.current then
			v_u_56.current(v_u_45[p123], p123)
		end
	end, { v_u_99, v_u_120, v_u_45 })
	local v_u_126 = v_u_5.useCallback(function(p125)
		-- upvalues: (copy) v_u_55, (copy) v_u_38, (copy) v_u_99, (copy) v_u_73, (copy) v_u_58, (ref) v_u_4, (copy) v_u_91, (copy) v_u_88, (copy) v_u_116, (copy) v_u_36
		if v_u_55.current then
			return
		elseif v_u_38 and not p125 then
			v_u_55.current = true
			v_u_99()
			if v_u_73.current then
				v_u_73.current.CanvasPosition = Vector2.new(0, 0)
			end
			v_u_58((v_u_4.instant(1)))
		else
			v_u_91.current = -v_u_88.current
			v_u_116(0)
			v_u_58(v_u_4.ease(1, {
				["duration"] = v_u_36.Time.Time_100
			}))
			v_u_55.current = true
		end
	end, { v_u_116, v_u_99, v_u_38 })
	local v_u_129 = v_u_5.useCallback(function()
		-- upvalues: (ref) v_u_52, (copy) v_u_53, (copy) v_u_72
		local v127 = v_u_52 + v_u_53
		local v128 = math.floor(v127)
		return v_u_72.current >= v128 - 0.01
	end, { v_u_52, v_u_53 })
	local v_u_137 = v_u_5.useCallback(function()
		-- upvalues: (copy) v_u_74, (copy) v_u_129, (ref) v_u_18, (copy) v_u_79, (copy) v_u_87, (copy) v_u_77, (copy) v_u_76, (copy) v_u_88, (copy) v_u_78
		local v130 = v_u_74:getValue() <= 0
		local v131 = v_u_129()
		if v_u_18.FoundationSheetReversedContent and v_u_79.current then
			if not v_u_87.current or (v_u_77:getValue() or v131) then
				local v132 = v_u_76.current
				local v133 = v132 == nil and true or v_u_74:getValue() >= v132.AbsoluteCanvasSize.Y - v132.AbsoluteWindowSize.Y - 1
				local v134 = v_u_88.current
				local v135 = v_u_87.current
				if v135 then
					if v134 > 0 and v130 then
						v133 = v130
					elseif v134 < 0 then
						if v133 then
							v133 = not v131
						end
					else
						v133 = false
					end
				else
					v133 = v135
				end
				v_u_78(not v133)
			end
		else
			local v136 = not v131
			if v136 then
				v136 = v_u_88.current < 0
			end
			if v136 or v_u_88.current > 0 and (v130 and v_u_87.current) then
				v_u_78(false)
			elseif (v_u_88.current < 0 or v_u_88.current == 0) and v131 then
				v_u_78(true)
			end
		end
	end, { v_u_129 })
	local v_u_150 = v_u_5.useCallback(function()
		-- upvalues: (copy) v_u_88, (copy) v_u_72, (copy) v_u_45, (copy) v_u_120, (copy) v_u_87, (copy) v_u_91, (copy) v_u_126, (copy) v_u_122
		local v138 = v_u_88.current
		local v_u_139 = v_u_72.current - v138 / 2.35
		local v140 = {
			{
				["index"] = 0,
				["position"] = 0
			}
		}
		for v141, v142 in v_u_45 do
			local v143 = {
				["index"] = v141,
				["position"] = v_u_120(v142)
			}
			table.insert(v140, v143)
		end
		table.sort(v140, function(p144, p145)
			-- upvalues: (copy) v_u_139
			local v146 = p144.position - v_u_139
			local v147 = math.abs(v146)
			local v148 = p145.position - v_u_139
			return v147 < math.abs(v148)
		end)
		local v149 = v140[1]
		if not v_u_87.current then
			v_u_91.current = -v138
			if v149.index == 0 then
				v_u_126(true)
				return
			end
			v_u_122(v149.index)
		end
	end, {
		v_u_45,
		v_u_122,
		v_u_120,
		v_u_126
	})
	v_u_5.useEffect(function()
		-- upvalues: (copy) v_u_35, (copy) v_u_38, (copy) v_u_124, (copy) v_u_34, (copy) v_u_58, (ref) v_u_4, (copy) v_u_122, (copy) v_u_36, (copy) v_u_47, (copy) v_u_45, (ref) v_u_52, (copy) v_u_78, (ref) v_u_18, (copy) v_u_79, (copy) v_u_99
		if v_u_35 then
			if v_u_38 then
				v_u_124(v_u_34.defaultSnapPointIndex)
				v_u_58(v_u_4.instant(0))
			else
				v_u_122(v_u_34.defaultSnapPointIndex)
				v_u_58(v_u_4.ease(0, {
					["duration"] = v_u_36.Time.Time_100
				}))
			end
			local v151 = v_u_52 <= v_u_47(v_u_45[v_u_34.defaultSnapPointIndex])
			local v152 = v_u_78
			if v_u_18.FoundationSheetReversedContent and not v151 then
				v151 = v_u_79.current
			end
			v152(v151)
		end
		return function()
			-- upvalues: (ref) v_u_99
			v_u_99()
		end
	end, {
		v_u_35,
		v_u_45,
		v_u_34.defaultSnapPointIndex,
		v_u_122,
		v_u_47,
		v_u_124,
		v_u_38
	})
	v_u_5.useLayoutEffect(function()
		-- upvalues: (copy) v_u_35, (copy) v_u_41
		if v_u_35 then
			v_u_41(v_u_35.AbsoluteSize.Y)
			local v_u_153 = v_u_35:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: (ref) v_u_41, (ref) v_u_35
				v_u_41(v_u_35.AbsoluteSize.Y)
			end)
			return function()
				-- upvalues: (copy) v_u_153
				v_u_153:Disconnect()
			end
		end
	end, { v_u_35 })
	local v154 = {
		v_u_35,
		v_u_150,
		v_u_137,
		v_u_99,
		v_u_129,
		v_u_98
	}
	v_u_5.useEffect(function()
		-- upvalues: (copy) v_u_88, (copy) v_u_87, (ref) v_u_98, (copy) v_u_137, (copy) v_u_99, (copy) v_u_73, (ref) v_u_18, (copy) v_u_79, (copy) v_u_78, (copy) v_u_129, (copy) v_u_55, (copy) v_u_150
		local v_u_160 = game:GetService("UserInputService").TouchPan:Connect(function(_, p155, p156, _)
			-- upvalues: (ref) v_u_88, (ref) v_u_87, (ref) v_u_98, (ref) v_u_137
			v_u_88.current = p156.Y
			if v_u_87.current and p155 then
				local v157 = p155.Y
				local v158 = math.abs(v157)
				local v159 = p155.X
				if math.abs(v159) < v158 then
					v_u_98(true)
				end
			end
			v_u_137()
		end)
		local v_u_161 = game:GetService("UserInputService").InputBegan:Connect(function()
			-- upvalues: (ref) v_u_87, (ref) v_u_88, (ref) v_u_98, (ref) v_u_99
			v_u_87.current = true
			v_u_88.current = 0
			v_u_98(false)
			v_u_99()
		end)
		local v_u_162 = game:GetService("UserInputService").InputEnded:Connect(function()
			-- upvalues: (ref) v_u_87, (ref) v_u_98, (ref) v_u_73, (ref) v_u_88, (ref) v_u_18, (ref) v_u_79, (ref) v_u_78, (ref) v_u_129, (ref) v_u_55, (ref) v_u_150
			if v_u_87.current == false then
				return
			else
				v_u_87.current = false
				v_u_98(false)
				v_u_88.current = not v_u_73.current and 0 or v_u_73.current:GetScrollVelocity().Y
				if v_u_18.FoundationSheetReversedContent and v_u_79.current then
					v_u_78(true)
				end
				if v_u_129() or v_u_55.current then
					v_u_78(true)
				else
					v_u_150()
				end
			end
		end)
		return function()
			-- upvalues: (ref) v_u_98, (copy) v_u_160, (copy) v_u_161, (copy) v_u_162
			v_u_98(false)
			v_u_160:Disconnect()
			v_u_161:Disconnect()
			v_u_162:Disconnect()
		end
	end, v154)
	local v_u_163 = v_u_5.useRef(nil)
	local v_u_164, v_u_165 = v_u_5.useState(nil)
	local v_u_166, v167 = v_u_5.useState(nil)
	local v168 = v_u_8.useComposedRef(p33, v167)
	v_u_5.useImperativeHandle(v_u_34.sheetRef, function()
		-- upvalues: (copy) v_u_126
		return {
			["close"] = v_u_126
		}
	end, {})
	local v170 = v_u_5.useMemo(function()
		-- upvalues: (copy) v_u_61, (copy) v_u_62, (copy) v_u_63, (copy) v_u_64, (copy) v_u_59, (copy) v_u_60, (copy) v_u_53, (copy) v_u_77, (copy) v_u_74, (copy) v_u_76, (copy) v_u_75, (copy) v_u_137, (copy) v_u_65, (copy) v_u_66, (ref) v_u_67, (ref) v_u_70, (ref) v_u_71, (copy) v_u_126, (ref) v_u_21, (copy) v_u_166, (copy) v_u_34, (copy) v_u_163, (copy) v_u_164, (copy) v_u_165, (ref) v_u_95, (copy) v_u_82, (copy) v_u_80
		return {
			["actionsHeight"] = nil,
			["setActionsHeight"] = nil,
			["hasActionsDivider"] = nil,
			["setHasActionsDivider"] = nil,
			["sheetHeightAvailable"] = nil,
			["setSheetHeightAvailable"] = nil,
			["safeAreaPadding"] = nil,
			["bottomPadding"] = 200,
			["innerScrollingEnabled"] = nil,
			["innerScrollY"] = nil,
			["innerScrollingRef"] = nil,
			["setInnerScrollY"] = nil,
			["hasHeader"] = nil,
			["setHasHeader"] = nil,
			["hasFullBleed"] = nil,
			["fullBleedHeight"] = nil,
			["setFullBleedHeight"] = nil,
			["closeSheet"] = nil,
			["hasRadius"] = true,
			["sheetType"] = nil,
			["innerSurface"] = nil,
			["testId"] = nil,
			["closeAffordanceRef"] = nil,
			["contentStartRef"] = nil,
			["setContentStartRef"] = nil,
			["isVerticalSheetGesture"] = nil,
			["contentRevealOffset"] = nil,
			["setIsContentReversed"] = nil,
			["actionsHeight"] = v_u_61,
			["setActionsHeight"] = v_u_62,
			["hasActionsDivider"] = v_u_63,
			["setHasActionsDivider"] = v_u_64,
			["sheetHeightAvailable"] = v_u_59,
			["setSheetHeightAvailable"] = v_u_60,
			["safeAreaPadding"] = v_u_53,
			["innerScrollingEnabled"] = v_u_77,
			["innerScrollY"] = v_u_74,
			["innerScrollingRef"] = v_u_76,
			["setInnerScrollY"] = function(p169) -- name: setInnerScrollY
				-- upvalues: (ref) v_u_75, (ref) v_u_137
				v_u_75(p169)
				v_u_137()
			end,
			["hasHeader"] = v_u_65,
			["setHasHeader"] = v_u_66,
			["hasFullBleed"] = v_u_67,
			["fullBleedHeight"] = v_u_70,
			["setFullBleedHeight"] = v_u_71,
			["closeSheet"] = v_u_126,
			["sheetType"] = v_u_21.Bottom,
			["innerSurface"] = v_u_166,
			["testId"] = v_u_34.testId,
			["closeAffordanceRef"] = v_u_163,
			["contentStartRef"] = v_u_164,
			["setContentStartRef"] = v_u_165,
			["isVerticalSheetGesture"] = v_u_95,
			["contentRevealOffset"] = v_u_82,
			["setIsContentReversed"] = v_u_80
		}
	end, {
		v_u_34.testId,
		v_u_126,
		v_u_53,
		v_u_137,
		v_u_166,
		v_u_163,
		v_u_164,
		v_u_67,
		v_u_95,
		v_u_82,
		v_u_80
	})
	local v171 = v_u_5.createElement
	local v172 = v_u_27
	local v173 = {
		["ZIndex"] = 5,
		["backgroundStyle"] = nil,
		["Position"] = nil,
		["AnchorPoint"] = nil,
		["tag"] = "align-y-center size-1000-100 padding-y-small radius-small",
		["testId"] = nil,
		["backgroundStyle"] = v_u_36.Color.Content.Muted
	}
	local v174 = UDim2.new
	local v175 = 0.5
	local v176 = 0
	local v177 = 0
	local v178
	if v_u_67 then
		v178 = v_u_36.Padding.Small
	else
		v178 = -v_u_36.Padding.XSmall
	end
	v173.Position = v174(v175, v176, v177, v178)
	v173.AnchorPoint = Vector2.new(0.5, 0)
	v173.testId = ("%*--gripper"):format(v_u_34.testId)
	local v185 = v171(v172, v173, {
		["TouchTarget"] = v_u_5.createElement(v_u_27, {
			["tag"] = "size-1000-600",
			["stateLayer"] = nil,
			["onActivated"] = nil,
			["stateLayer"] = {
				["affordance"] = v_u_10.None
			},
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (copy) v_u_87, (ref) v_u_18, (copy) v_u_79, (copy) v_u_76, (copy) v_u_75, (copy) v_u_45, (copy) v_u_54, (copy) v_u_38, (copy) v_u_124, (copy) v_u_122, (copy) v_u_47, (ref) v_u_52, (copy) v_u_78, (copy) v_u_126
				v_u_87.current = false
				if v_u_18.FoundationSheetReversedContent and (v_u_79.current and v_u_76.current) then
					local v179 = v_u_76.current
					local v180 = v179.AbsoluteCanvasSize.Y - v179.AbsoluteWindowSize.Y
					local v181 = math.max(0, v180)
					v_u_75(v181)
					v179.CanvasPosition = Vector2.new(0, v181)
					v179:ResetScrollVelocity()
				elseif v_u_76.current then
					v_u_75(0)
					v_u_76.current.CanvasPosition = Vector2.new(0, 0)
					v_u_76.current:ResetScrollVelocity()
				end
				if #v_u_45 > 1 then
					local v182 = v_u_54.current % #v_u_45 + 1
					if v_u_38 then
						v_u_124(v182)
					else
						v_u_122(v182)
					end
					local v183 = v_u_52 <= v_u_47(v_u_45[v182])
					local v184 = v_u_78
					if v_u_18.FoundationSheetReversedContent and not v183 then
						v183 = v_u_79.current
					end
					v184(v183)
				else
					v_u_126()
				end
			end
		})
	})
	if v_u_35 then
		local v186 = v_u_7.createPortal
		local v187 = v_u_5.createElement
		local v188 = v_u_27
		local v189 = {
			["ZIndex"] = nil,
			["ref"] = nil,
			["selection"] = nil,
			["selectionGroup"] = nil,
			["tag"] = "size-full",
			["testId"] = nil,
			["ZIndex"] = v37.zIndex,
			["ref"] = v168,
			["selection"] = v_u_20.nonSelectable,
			["selectionGroup"] = v_u_20.isolatedSelectionGroup,
			["testId"] = ("%*--surface"):format(v_u_34.testId)
		}
		local v190 = v_u_5.createElement
		local v191 = "ScrollingFrame"
		local v196 = {
			["Size"] = UDim2.fromScale(1, 1),
			["CanvasSize"] = UDim2.new(1, 0, 1, v_u_52 + v_u_53),
			["ClipsDescendants"] = false,
			["BackgroundTransparency"] = 1,
			["ScrollingDirection"] = Enum.ScrollingDirection.Y,
			["ScrollBarThickness"] = 0,
			["ref"] = v_u_73,
			[v_u_5.Change.CanvasPosition] = function(p192)
				-- upvalues: (copy) v_u_72, (ref) v_u_18, (copy) v_u_82, (copy) v_u_60, (copy) v_u_53, (copy) v_u_36, (copy) v_u_76, (copy) v_u_79, (copy) v_u_137, (copy) v_u_126
				v_u_72.current = p192.CanvasPosition.Y
				local v193
				if v_u_18.FoundationSheetReversedContent and v_u_82 then
					v193 = v_u_82:getValue()
				else
					v193 = nil
				end
				v_u_60(v_u_72.current - v_u_53 - v_u_36.Margin.Small)
				if v_u_18.FoundationSheetReversedContent and (v_u_82 and v193) then
					local v194 = v_u_76.current
					local v195 = v_u_82:getValue() - v193
					if v_u_79.current and (v194 and v195 ~= 0) then
						v194.CanvasPosition = Vector2.new(0, v194.CanvasPosition.Y + v195)
					end
				end
				v_u_137()
				if v_u_72.current <= 0 then
					v_u_126()
				end
			end
		}
		local v197 = {}
		local v198 = v_u_5.createElement
		local v199 = v_u_27
		local v200 = {
			["Size"] = nil,
			["Position"] = nil,
			["ZIndex"] = 3,
			["Size"] = UDim2.new(1, 0, 1, 200 - v_u_52 - v_u_53),
			["Position"] = UDim2.new(0, 0, 1, -v_u_52)
		}
		local v201 = {}
		local v202 = v_u_5.createElement
		local v203 = v_u_27
		local v204 = {}
		local v205
		if v_u_34.snapPoints == nil then
			v205 = UDim2.fromScale(1, 0)
		else
			v205 = UDim2.new(1, 0, 0, v_u_52 + 200)
		end
		v204.Size = v205
		local v206
		if v_u_34.snapPoints == nil then
			v206 = Enum.AutomaticSize.Y
		else
			v206 = nil
		end
		v204.AutomaticSize = v206
		v204.onAbsoluteSizeChanged = v_u_34.snapPoints == nil and function(p207)
			-- upvalues: (copy) v_u_43
			v_u_43(p207.AbsoluteSize.Y - 200)
		end or nil
		v204.stateLayer = {
			["affordance"] = v_u_10.None
		}
		v204.onActivated = v_u_3.noop
		v204.testId = v_u_34.testId
		v204.tag = {
			["col items-center radius-large clip bg-surface-100"] = true,
			["padding-top-medium"] = not v_u_67
		}
		v201.Sheet = v202(v203, v204, {
			["GripperContainer"] = v_u_5.createElement("Folder", nil, {
				["Gripper"] = v185
			}),
			["Content"] = v_u_5.createElement(v_u_19.Provider, {
				["value"] = v170
			}, v_u_5.createElement(v_u_15, {
				["owner"] = v37
			}, v_u_34.children))
		})
		v197.SheetContainer = v198(v199, v200, v201)
		local v208
		if v_u_18.FoundationBottomSheetOverlayShadow then
			v208 = v_u_5.createElement(v_u_27, {
				["tag"] = "shadow-overlay-300 radius-large",
				["Size"] = nil,
				["Position"] = nil,
				["ZIndex"] = 2,
				["testId"] = nil,
				["Size"] = UDim2.new(1, 0, 0, v_u_52 + 200),
				["Position"] = UDim2.new(0, 0, 1, -v_u_52),
				["testId"] = ("%*--shadow"):format(v_u_34.testId)
			})
		else
			v208 = v_u_5.createElement(v_u_26, {
				["Image"] = nil,
				["Size"] = nil,
				["Position"] = nil,
				["ZIndex"] = 2,
				["slice"] = nil,
				["imageStyle"] = nil,
				["Image"] = v_u_30,
				["Size"] = UDim2.new(1, v_u_31 * 2, 0, v_u_52 + 200 + v_u_31 * 2),
				["Position"] = UDim2.new(-v_u_31, 0, 1, -v_u_52 - v_u_31),
				["slice"] = {
					["center"] = nil,
					["scale"] = 2,
					["center"] = Rect.new(v_u_31, v_u_31, v_u_31 + 1, v_u_31 + 1)
				},
				["imageStyle"] = v_u_36.Color.Extended.Black.Black_10
			})
		end
		v197.Shadow = v208
		local v209
		if v_u_18.FoundationBottomSheetInternalBackdrop then
			v209 = v_u_5.createElement(v_u_25, {
				["transparency"] = nil,
				["onActivated"] = nil,
				["Size"] = nil,
				["ZIndex"] = 1,
				["testId"] = nil,
				["transparency"] = v57,
				["onActivated"] = function() -- name: onActivated
					-- upvalues: (copy) v_u_126
					v_u_126()
				end,
				["Size"] = UDim2.fromScale(1, 2),
				["testId"] = ("%*--backdrop"):format(v_u_34.testId)
			})
		else
			v209 = v_u_5.createElement(v_u_27, {
				["Size"] = nil,
				["Position"] = nil,
				["ZIndex"] = 1,
				["stateLayer"] = nil,
				["backgroundStyle"] = nil,
				["onActivated"] = nil,
				["testId"] = nil,
				["Size"] = UDim2.fromScale(1, 2),
				["Position"] = UDim2.fromScale(0, -0.5),
				["stateLayer"] = {
					["affordance"] = v_u_10.None
				},
				["backgroundStyle"] = v57:map(function(p210)
					-- upvalues: (copy) v_u_36
					local v211 = {
						["Color3"] = v_u_36.Color.Common.Backdrop.Color3
					}
					local v212 = v_u_36.Color.Common.Backdrop.Transparency
					v211.Transparency = math.lerp(v212, 1, p210)
					return v211
				end),
				["onActivated"] = function() -- name: onActivated
					-- upvalues: (copy) v_u_126
					v_u_126()
				end,
				["testId"] = ("%*--backdrop"):format(v_u_34.testId)
			})
		end
		v197.Backdrop = v209
		v_u_35 = v186(v187(v188, v189, v190(v191, v196, v197)), v_u_35)
	end
	return v_u_35
end))