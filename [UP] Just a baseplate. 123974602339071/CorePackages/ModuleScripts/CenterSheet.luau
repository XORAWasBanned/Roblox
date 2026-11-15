-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Sheet.CenterSheet
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v2.Otter)
local v_u_5 = require(v2.React)
local v6 = require(v2.ReactOtter)
local v_u_7 = require(v2.ReactRoblox)
local v_u_8 = v6.useAnimatedBinding
local v_u_9 = require(v1.Enums.CloseAffordanceVariant)
local v_u_10 = require(v1.Utility.Flags)
local v_u_11 = require(v1.Enums.StateLayerAffordance)
local v_u_12 = require(v1.Providers.Overlay.useOverlay)
local v_u_13 = require(v1.Utility.useScaledValue)
local v_u_14 = require(v1.Providers.Style.useTokens)
local v_u_15 = require(v1.Utility.withDefaults)
local v_u_16 = require(v1.Components.Dialog.useDialogVariants).DIALOG_SIZES
local v17 = require(v1.Constants)
local v18 = require(v1.Enums.DialogSize)
local v_u_19 = require(v1.Enums.ElevationLayer)
local v_u_20 = require(v1.Providers.Elevation.useElevation)
local v_u_21 = require(v1.Providers.Elevation.ElevationProvider).ElevationOwnerScope
local v_u_22 = require(v1.Providers.Preferences.usePreferences)
local v_u_23 = require(script.Parent.SheetContext)
local v_u_24 = require(script.Parent.Types)
local v_u_25 = require(script.Parent.SheetType)
local v_u_26 = require(script.Parent.childrenHasFullBleed)
local v_u_27 = require(v1.Components.Backdrop)
local v_u_28 = require(v1.Components.CloseAffordance)
local v_u_29 = require(v1.Components.Image)
local v_u_30 = require(v1.Components.View)
local v_u_31 = {
	["size"] = nil,
	["testId"] = "--foundation-sheet",
	["size"] = v18.Medium
}
local v_u_32 = v17.SHADOW_IMAGE
local v_u_33 = v17.SHADOW_SIZE
return v_u_5.memo(v_u_5.forwardRef(function(p34, p35) -- name: CenterSheet
	-- upvalues: (copy) v_u_15, (copy) v_u_31, (copy) v_u_12, (copy) v_u_14, (copy) v_u_20, (copy) v_u_19, (copy) v_u_22, (copy) v_u_13, (copy) v_u_16, (copy) v_u_5, (copy) v_u_8, (copy) v_u_26, (copy) v_u_4, (copy) v_u_3, (copy) v_u_25, (copy) v_u_30, (copy) v_u_11, (copy) v_u_24, (copy) v_u_23, (copy) v_u_21, (copy) v_u_28, (copy) v_u_9, (copy) v_u_10, (copy) v_u_29, (copy) v_u_32, (copy) v_u_33, (copy) v_u_7, (copy) v_u_27
	local v_u_36 = v_u_15(p34, v_u_31)
	local v37 = v_u_12()
	local v_u_38 = v_u_14()
	local v39 = v_u_20(v_u_19.Sheet, {
		["stackAboveOwner"] = false
	})
	local v_u_40 = v_u_22().reducedMotion
	local v41 = v_u_13(v_u_16[v_u_36.size])
	local v_u_42 = v_u_13(600)
	local v_u_43 = v_u_38.Size.Size_800
	local v44, v_u_45 = v_u_5.useBinding(v_u_42)
	local v_u_46
	if v44 then
		v_u_46 = v44:map(function(p47)
			-- upvalues: (copy) v_u_36
			if v_u_36.centerSheetHeight then
				if v_u_36.centerSheetHeight > 0 and v_u_36.centerSheetHeight <= 1 then
					return p47 * v_u_36.centerSheetHeight
				end
				if v_u_36.centerSheetHeight > 1 then
					local v48 = v_u_36.centerSheetHeight
					return math.min(v48, p47)
				end
			end
			return nil
		end)
	else
		v_u_46 = nil
	end
	local v49, v_u_50 = v_u_5.useState(true)
	local v_u_51 = v_u_5.useRef(false)
	local v52, v_u_53 = v_u_8(1, function()
		-- upvalues: (copy) v_u_51, (copy) v_u_36
		if v_u_51.current then
			v_u_36.onClose()
		end
	end)
	local v54, v_u_55 = v_u_8(v_u_43, function()
		-- upvalues: (copy) v_u_50
		v_u_50(false)
	end)
	local v_u_56, v_u_57 = v_u_5.useBinding(false)
	local v_u_58, v_u_59 = v_u_5.useBinding(false)
	local v_u_60 = v_u_26(v_u_36.children)
	local v61, v62 = v_u_5.useBinding(0)
	local v_u_63 = v61
	local v_u_64 = v62
	local v_u_65, v_u_66 = v_u_5.useBinding(0)
	local v67, v_u_68 = v_u_5.useBinding(0)
	local v_u_69 = v_u_5.useRef(nil)
	local v_u_70, v_u_71 = v_u_5.useState(nil)
	local v_u_73 = v_u_5.useMemo(function()
		local v72 = Instance.new("Frame")
		v72.BackgroundTransparency = 1
		v72.BorderSizePixel = 0
		v72.AutomaticSize = Enum.AutomaticSize.XY
		return v72
	end, {})
	v_u_5.useEffect(function()
		-- upvalues: (copy) v_u_73
		return function()
			-- upvalues: (ref) v_u_73
			v_u_73:Destroy()
		end
	end, {})
	local v75 = v_u_5.useCallback(function(p74)
		-- upvalues: (copy) v_u_73
		if p74 then
			v_u_73.Parent = p74
		else
			v_u_73.Parent = nil
		end
	end, {})
	v_u_5.useEffect(function()
		-- upvalues: (copy) v_u_40, (copy) v_u_55, (ref) v_u_4, (copy) v_u_53, (copy) v_u_38
		if v_u_40 then
			v_u_55((v_u_4.instant(0)))
			v_u_53((v_u_4.instant(0)))
		else
			v_u_55(v_u_4.ease(0, {
				["easingStyle"] = v_u_38.Ease.StandardOut,
				["duration"] = v_u_38.Time.Time_300
			}))
			v_u_53(v_u_4.ease(0, {
				["duration"] = v_u_38.Time.Time_100
			}))
		end
	end, {})
	local v_u_76 = v_u_5.useCallback(function()
		-- upvalues: (copy) v_u_51, (copy) v_u_40, (copy) v_u_55, (ref) v_u_4, (copy) v_u_43, (copy) v_u_53, (copy) v_u_38, (copy) v_u_50
		if v_u_51.current then
			return
		elseif v_u_40 then
			v_u_51.current = true
			v_u_55(v_u_4.instant(v_u_43))
			v_u_53(v_u_4.instant(1))
		else
			v_u_55(v_u_4.ease(v_u_43, {
				["easingStyle"] = v_u_38.Ease.StandardIn,
				["duration"] = v_u_38.Time.Time_100
			}))
			v_u_53(v_u_4.ease(1, {
				["duration"] = v_u_38.Time.Time_100
			}))
			v_u_50(true)
			v_u_51.current = true
		end
	end, { v_u_43, v_u_40 })
	v_u_5.useImperativeHandle(v_u_36.sheetRef, function()
		-- upvalues: (copy) v_u_76
		return {
			["close"] = v_u_76
		}
	end, {})
	local v77 = v_u_5.useMemo(function()
		-- upvalues: (ref) v_u_3, (copy) v_u_56, (copy) v_u_57, (copy) v_u_46, (copy) v_u_65, (copy) v_u_66, (copy) v_u_58, (copy) v_u_59, (ref) v_u_60, (ref) v_u_63, (ref) v_u_64, (copy) v_u_76, (ref) v_u_25, (copy) v_u_36, (copy) v_u_69, (copy) v_u_70, (copy) v_u_71
		return {
			["actionsHeight"] = 0,
			["setActionsHeight"] = nil,
			["hasActionsDivider"] = nil,
			["setHasActionsDivider"] = nil,
			["sheetContentHeight"] = nil,
			["setSheetContentHeight"] = nil,
			["sheetHeightAvailable"] = 0,
			["setSheetHeightAvailable"] = nil,
			["safeAreaPadding"] = 0,
			["bottomPadding"] = 0,
			["innerScrollingEnabled"] = true,
			["innerScrollY"] = nil,
			["setInnerScrollY"] = nil,
			["hasHeader"] = nil,
			["setHasHeader"] = nil,
			["hasFullBleed"] = nil,
			["fullBleedHeight"] = nil,
			["setFullBleedHeight"] = nil,
			["closeSheet"] = nil,
			["hasRadius"] = true,
			["sheetType"] = nil,
			["testId"] = nil,
			["closeAffordanceRef"] = nil,
			["contentStartRef"] = nil,
			["setContentStartRef"] = nil,
			["setActionsHeight"] = v_u_3.noop,
			["hasActionsDivider"] = v_u_56,
			["setHasActionsDivider"] = v_u_57,
			["sheetContentHeight"] = v_u_46,
			["setSheetContentHeight"] = v_u_3.noop,
			["setSheetHeightAvailable"] = v_u_3.noop,
			["innerScrollY"] = v_u_65,
			["setInnerScrollY"] = v_u_66,
			["hasHeader"] = v_u_58,
			["setHasHeader"] = v_u_59,
			["hasFullBleed"] = v_u_60,
			["fullBleedHeight"] = v_u_63,
			["setFullBleedHeight"] = v_u_64,
			["closeSheet"] = v_u_76,
			["sheetType"] = v_u_25.Center,
			["testId"] = v_u_36.testId,
			["closeAffordanceRef"] = v_u_69,
			["contentStartRef"] = v_u_70,
			["setContentStartRef"] = v_u_71
		}
	end, {
		v_u_36.testId,
		v_u_76,
		v_u_70,
		v_u_69,
		v_u_46,
		v_u_60
	})
	local v78 = v_u_5.createElement
	local v79 = v_u_30
	local v80 = {
		["ClipsDescendants"] = true,
		["Size"] = nil,
		["sizeConstraint"] = nil,
		["stateLayer"] = nil,
		["ZIndex"] = 2,
		["onActivated"] = nil,
		["onAbsoluteSizeChanged"] = nil,
		["ref"] = nil,
		["selection"] = nil,
		["selectionGroup"] = nil,
		["tag"] = nil,
		["testId"] = nil
	}
	local v81
	if v_u_36.centerSheetHeight and v_u_46 then
		v81 = v_u_46:map(function(p82)
			if p82 then
				return UDim2.new(1, 0, 0, p82)
			else
				return nil
			end
		end)
	else
		v81 = nil
	end
	v80.Size = v81
	v80.sizeConstraint = v_u_36.centerSheetHeight and v44 and {
		["MaxSize"] = v44:map(function(p83)
			return Vector2.new((1 / 0), p83)
		end)
	} or nil
	v80.stateLayer = {
		["affordance"] = v_u_11.None
	}
	v80.onActivated = v_u_3.noop
	function v80.onAbsoluteSizeChanged(p84) -- name: onAbsoluteSizeChanged
		-- upvalues: (copy) v_u_68
		v_u_68(p84.AbsoluteSize.Y)
	end
	v80.ref = p35
	v80.selection = v_u_24.nonSelectable
	v80.selectionGroup = v_u_24.isolatedSelectionGroup
	v80.tag = {
		["bg-surface-100 stroke-default stroke-standard radius-large"] = true,
		["size-full-0 auto-y"] = v_u_36.centerSheetHeight == nil
	}
	v80.testId = v_u_36.testId
	local v85 = {}
	local v86 = v_u_5.createElement
	local v87 = v_u_30
	local v88 = {
		["Size"] = nil,
		["tag"] = "col items-center size-full-0 auto-y clip"
	}
	local v89
	if v_u_36.centerSheetHeight and v_u_46 then
		v89 = v_u_46:map(function(p90)
			if p90 then
				return UDim2.new(1, 0, 0, p90)
			else
				return nil
			end
		end)
	else
		v89 = nil
	end
	v88.Size = v89
	v85.Content = v86(v87, v88, v_u_5.createElement(v_u_23.Provider, {
		["value"] = v77
	}, v_u_5.createElement(v_u_21, {
		["owner"] = v39
	}, v_u_36.children)))
	local v91 = v_u_5.createElement
	local v92 = v_u_28
	local v93 = {
		["onActivated"] = v_u_76,
		["ref"] = v_u_69,
		["NextSelectionDown"] = v_u_70
	}
	local v94
	if v_u_60 then
		v94 = v_u_9.OverMedia
	else
		v94 = v_u_9.Utility
	end
	v93.variant = v94
	v93.Position = UDim2.new(1, -v_u_38.Margin.Small, 0, v_u_38.Margin.Small)
	v93.AnchorPoint = Vector2.new(1, 0)
	v93.Visible = v_u_58:map(function(p95)
		return not p95
	end)
	v93.testId = ("%*--close-affordance"):format(v_u_36.testId)
	v85.CloseAffordance = v91(v92, v93)
	local v96 = v78(v79, v80, v85)
	local v97
	if v_u_10.FoundationCenterSheetOverlayShadow then
		v97 = v_u_5.createElement(v_u_30, {
			["tag"] = "shadow-overlay-300 radius-large",
			["Size"] = nil,
			["ZIndex"] = 1,
			["testId"] = nil,
			["Size"] = v67:map(function(p98)
				return UDim2.new(1, 0, 0, p98)
			end),
			["testId"] = ("%*--shadow"):format(v_u_36.testId)
		})
	else
		v97 = v_u_5.createElement(v_u_29, {
			["Image"] = nil,
			["Size"] = nil,
			["Position"] = nil,
			["ZIndex"] = 1,
			["slice"] = nil,
			["imageStyle"] = nil,
			["tag"] = "anchor-center-left",
			["Image"] = v_u_32,
			["Size"] = v67:map(function(p99)
				-- upvalues: (ref) v_u_33
				return UDim2.new(1, v_u_33 * 2, 0, p99 + v_u_33 * 2)
			end),
			["Position"] = UDim2.new(0, -v_u_33, 0.5, 0),
			["slice"] = {
				["center"] = nil,
				["scale"] = 2,
				["center"] = Rect.new(v_u_33, v_u_33, v_u_33 + 1, v_u_33 + 1)
			},
			["imageStyle"] = v_u_38.Color.Extended.Black.Black_10
		})
	end
	if v37 then
		local v100 = v_u_5.createElement
		local v101 = v_u_5.Fragment
		local v102 = nil
		local v103 = {}
		local v104 = v_u_7.createPortal
		local v105 = v_u_5.createElement
		local v106 = v_u_30
		local v107 = {
			["ZIndex"] = nil,
			["tag"] = "size-full",
			["testId"] = nil,
			["ZIndex"] = v39.zIndex,
			["testId"] = ("%*--surface"):format(v_u_36.testId)
		}
		local v108 = {}
		local v109
		if v_u_10.FoundationCenterSheetOverlayShadow then
			local v110 = v_u_5.createElement
			local v111 = v_u_30
			local v112 = {
				["ZIndex"] = 2,
				["sizeConstraint"] = nil,
				["Position"] = nil,
				["tag"] = "anchor-center-center size-full",
				["GroupTransparency"] = nil
			}
			local v113 = {}
			local v114 = Vector2.new
			local v115 = v_u_38.Size.Size_1400 - v_u_38.Padding.Medium
			local v116 = v41 + math.max(0, v115) * 2
			local v117 = v_u_38.Size.Size_1400 - v_u_38.Padding.Medium
			local v118 = v_u_42 + math.max(0, v117)
			local v119 = v_u_38.Size.Size_1400 + v_u_38.Size.Size_1200 - v_u_38.Padding.Medium
			v113.MaxSize = v114(v116, v118 + math.max(0, v119))
			v112.sizeConstraint = v113
			v112.Position = v54:map(function(p120)
				return UDim2.new(0.5, 0, 0.5, p120)
			end)
			v112.GroupTransparency = v54:map(function(p121)
				-- upvalues: (copy) v_u_43
				return p121 / v_u_43
			end)
			local v127 = {
				["SheetContainer"] = v_u_5.createElement(v_u_30, {
					["ref"] = nil,
					["ZIndex"] = 2,
					["sizeConstraint"] = nil,
					["Position"] = nil,
					["tag"] = "col align-y-center anchor-center-center size-full padding-medium",
					["testId"] = nil,
					["onAbsoluteSizeChanged"] = nil,
					["ref"] = v75,
					["sizeConstraint"] = {
						["MaxSize"] = Vector2.new(v41, v_u_42)
					},
					["Position"] = UDim2.fromScale(0.5, 0.5),
					["testId"] = ("%*--center-sheet-container"):format(v_u_36.testId),
					["onAbsoluteSizeChanged"] = (v_u_10.FoundationCenterSheetHeightFix or v_u_36.centerSheetHeight and v_u_45) and function(p122)
						-- upvalues: (copy) v_u_38, (copy) v_u_45, (copy) v_u_42
						local v123 = v_u_38.Margin.Medium * 2
						local v124 = v_u_45
						local v125 = p122.AbsoluteSize.Y - v123
						local v126 = v_u_42
						v124((math.min(v125, v126)))
					end or nil
				}, nil)
			}
			v109 = v110(v111, v112, v127)
		else
			v109 = nil
		end
		v108.ShadowHost = v109
		local v128
		if v_u_10.FoundationCenterSheetOverlayShadow then
			v128 = nil
		else
			local v129 = v_u_5.createElement
			local v130 = v_u_30
			local v132 = {
				["ref"] = nil,
				["ZIndex"] = 2,
				["sizeConstraint"] = nil,
				["Position"] = nil,
				["tag"] = "col align-y-center anchor-center-center size-full padding-medium",
				["testId"] = nil,
				["GroupTransparency"] = nil,
				["onAbsoluteSizeChanged"] = nil,
				["ref"] = v75,
				["sizeConstraint"] = {
					["MaxSize"] = Vector2.new(v41, v_u_42)
				},
				["Position"] = v54:map(function(p131)
					return UDim2.new(0.5, 0, 0.5, p131)
				end),
				["testId"] = ("%*--center-sheet-container"):format(v_u_36.testId)
			}
			local v133
			if v49 then
				v133 = v54:map(function(p134)
					-- upvalues: (copy) v_u_43
					return p134 / v_u_43
				end)
			else
				v133 = nil
			end
			v132.GroupTransparency = v133
			v132.onAbsoluteSizeChanged = (v_u_10.FoundationCenterSheetHeightFix or v_u_36.centerSheetHeight and v_u_45) and function(p135)
				-- upvalues: (copy) v_u_38, (copy) v_u_45, (copy) v_u_42
				local v136 = v_u_38.Margin.Medium * 2
				local v137 = v_u_45
				local v138 = p135.AbsoluteSize.Y - v136
				local v139 = v_u_42
				v137((math.min(v138, v139)))
			end or nil
			v128 = v129(v130, v132, nil)
		end
		v108.SheetContainer = v128
		local v140
		if v_u_10.FoundationCenterSheetInternalBackdrop then
			v140 = v_u_5.createElement(v_u_27, {
				["transparency"] = nil,
				["onActivated"] = nil,
				["ZIndex"] = 1,
				["testId"] = nil,
				["transparency"] = v52,
				["onActivated"] = v_u_76,
				["testId"] = ("%*--backdrop"):format(v_u_36.testId)
			})
		else
			v140 = v_u_5.createElement(v_u_30, {
				["Size"] = nil,
				["Position"] = nil,
				["ZIndex"] = 1,
				["stateLayer"] = nil,
				["backgroundStyle"] = nil,
				["onActivated"] = nil,
				["testId"] = nil,
				["Size"] = UDim2.fromScale(2, 2),
				["Position"] = UDim2.fromScale(-0.5, -0.5),
				["stateLayer"] = {
					["affordance"] = v_u_11.None
				},
				["backgroundStyle"] = v52:map(function(p141)
					-- upvalues: (copy) v_u_38
					local v142 = {
						["Color3"] = v_u_38.Color.Common.Backdrop.Color3
					}
					local v143 = v_u_38.Color.Common.Backdrop.Transparency
					v142.Transparency = math.lerp(v143, 1, p141)
					return v142
				end),
				["onActivated"] = v_u_76,
				["testId"] = ("%*--backdrop"):format(v_u_36.testId)
			})
		end
		v108.Backdrop = v140
		v103.OverlayPortal = v104(v105(v106, v107, v108), v37)
		v103.SheetContent = v_u_7.createPortal({
			["Sheet"] = v96,
			["Shadow"] = v97
		}, v_u_73)
		v37 = v100(v101, v102, v103)
	end
	return v37
end))