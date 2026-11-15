-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Sheet.SideSheet
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v2.Otter)
local v_u_5 = require(v2.React)
local v6 = require(v2.ReactOtter)
local v_u_7 = require(v2.ReactRoblox)
local v_u_8 = v6.useAnimatedBinding
local v_u_9 = require(v1.Enums.CloseAffordanceVariant)
local v10 = require(v1.Constants)
local v_u_11 = require(v1.Utility.Flags)
local v_u_12 = require(v1.Enums.StateLayerAffordance)
local v_u_13 = require(v1.Providers.Overlay.useOverlay)
local v_u_14 = require(v1.Providers.Style.useTokens)
local v_u_15 = require(v1.Utility.withDefaults)
local v_u_16 = require(script.Parent.SheetContext)
local v_u_17 = require(script.Parent.Types)
local v_u_18 = require(script.Parent.SheetType)
local v_u_19 = require(v1.Providers.Elevation.useElevation)
local v_u_20 = require(v1.Providers.Elevation.ElevationProvider).ElevationOwnerScope
local v_u_21 = require(v1.Enums.ElevationLayer)
local v22 = require(v1.Enums.DialogSize)
local v_u_23 = require(script.Parent.childrenHasFullBleed)
local v_u_24 = require(script.Parent.useHardwareInsets)
local v_u_25 = require(script.Parent.useScreenSize)
local v_u_26 = require(v1.Components.Backdrop)
local v_u_27 = require(v1.Components.CloseAffordance)
local v_u_28 = require(v1.Components.Image)
local v_u_29 = require(v1.Components.View)
local v_u_30 = require(v1.Providers.Preferences.usePreferences)
local v_u_31 = {
	[v22.Medium] = {
		["TARGET_WIDTH"] = 0.4,
		["MIN"] = 360,
		["MAX"] = 440
	},
	[v22.Large] = {
		["TARGET_WIDTH"] = 0.5,
		["MIN"] = 440,
		["MAX"] = 640
	}
}
local v_u_32 = {
	["testId"] = "--foundation-sheet",
	["size"] = nil,
	["size"] = v22.Medium
}
local v_u_33 = v10.SHADOW_IMAGE
local v_u_34 = v10.SHADOW_SIZE
return v_u_5.memo(v_u_5.forwardRef(function(p35, p36) -- name: SideSheet
	-- upvalues: (copy) v_u_15, (copy) v_u_32, (copy) v_u_13, (copy) v_u_14, (copy) v_u_19, (copy) v_u_21, (copy) v_u_30, (copy) v_u_24, (copy) v_u_25, (copy) v_u_31, (copy) v_u_5, (copy) v_u_8, (copy) v_u_23, (copy) v_u_4, (copy) v_u_3, (copy) v_u_18, (copy) v_u_7, (copy) v_u_29, (copy) v_u_12, (copy) v_u_17, (copy) v_u_16, (copy) v_u_20, (copy) v_u_27, (copy) v_u_9, (copy) v_u_28, (copy) v_u_33, (copy) v_u_34, (copy) v_u_11, (copy) v_u_26
	local v_u_37 = v_u_15(p35, v_u_32)
	local v38 = v_u_13()
	local v_u_39 = v_u_14()
	local v40 = v_u_19(v_u_21.Sheet, {
		["stackAboveOwner"] = false
	})
	local v_u_41 = v_u_30().reducedMotion
	local v42 = v_u_24(v38)
	local v43 = v_u_25()
	local v44 = v42.right
	local v_u_45 = v_u_37.displaySize == Enum.DisplaySize.Small
	local v46 = v_u_31[v_u_37.size].TARGET_WIDTH
	local v47 = v_u_31[v_u_37.size].MIN * v_u_39.Config.UI.Scale
	local v48 = v_u_31[v_u_37.size].MAX * v_u_39.Config.UI.Scale
	local v49 = v43.X * v46
	local v_u_50 = math.clamp(v49, v47, v48)
	local v_u_51 = v_u_39.Padding.Medium
	local v_u_52 = v_u_5.useRef(false)
	local v53, v_u_54 = v_u_8(1, function()
		-- upvalues: (copy) v_u_52, (copy) v_u_37
		if v_u_52.current then
			v_u_37.onClose()
		end
	end)
	local v_u_55 = -(v44 + (v_u_45 and 0 or v_u_51))
	local v56, v_u_57 = v_u_8(v_u_55)
	local v_u_58, v_u_59 = v_u_5.useBinding(false)
	local v_u_60, v_u_61 = v_u_5.useBinding(false)
	local v_u_62 = v_u_23(v_u_37.children)
	local v63, v64 = v_u_5.useBinding(0)
	local v_u_65 = v63
	local v_u_66 = v64
	local v_u_67, v_u_68 = v_u_5.useBinding(0)
	local v_u_69 = v_u_5.useRef(nil)
	local v_u_70, v_u_71 = v_u_5.useState(nil)
	v_u_5.useEffect(function()
		-- upvalues: (copy) v_u_41, (copy) v_u_57, (ref) v_u_4, (copy) v_u_50, (copy) v_u_54, (copy) v_u_39
		if v_u_41 then
			v_u_57((v_u_4.instant(v_u_50)))
			v_u_54((v_u_4.instant(0)))
		else
			v_u_57(v_u_4.ease(v_u_50, {
				["easingStyle"] = v_u_39.Ease.StandardOut,
				["duration"] = v_u_39.Time.Time_300
			}))
			v_u_54(v_u_4.ease(0, {
				["duration"] = v_u_39.Time.Time_100
			}))
		end
	end, { v_u_50, v_u_41 })
	local v_u_72 = v_u_5.useCallback(function()
		-- upvalues: (copy) v_u_52, (copy) v_u_41, (copy) v_u_57, (ref) v_u_4, (copy) v_u_55, (copy) v_u_54, (copy) v_u_39
		if v_u_52.current then
			return
		elseif v_u_41 then
			v_u_52.current = true
			v_u_57(v_u_4.instant(v_u_55))
			v_u_54(v_u_4.instant(1))
		else
			v_u_57(v_u_4.ease(v_u_55, {
				["easingStyle"] = v_u_39.Ease.StandardIn,
				["duration"] = v_u_39.Time.Time_100
			}))
			v_u_54(v_u_4.ease(1, {
				["duration"] = v_u_39.Time.Time_100
			}))
			v_u_52.current = true
		end
	end, { v_u_55, v_u_41 })
	v_u_5.useImperativeHandle(v_u_37.sheetRef, function()
		-- upvalues: (copy) v_u_72
		return {
			["close"] = v_u_72
		}
	end, {})
	local v73 = UDim2.new(0, v_u_50 + (not v_u_45 and 0 or v44), 1, v_u_45 and 0 or -v_u_51 * 2)
	local v78 = v56:map(function(p74)
		-- upvalues: (copy) v_u_45, (copy) v_u_51
		local v75 = UDim2.new
		local v76 = 1
		local v77
		if v_u_45 then
			v77 = -p74
		else
			v77 = -(p74 + v_u_51)
		end
		return v75(v76, v77, 0, v_u_45 and 0 or v_u_51)
	end)
	local v79 = v_u_5.useMemo(function()
		-- upvalues: (ref) v_u_3, (copy) v_u_58, (copy) v_u_59, (copy) v_u_67, (copy) v_u_68, (copy) v_u_60, (copy) v_u_61, (ref) v_u_62, (ref) v_u_65, (ref) v_u_66, (copy) v_u_72, (copy) v_u_45, (ref) v_u_18, (copy) v_u_37, (copy) v_u_69, (copy) v_u_70, (copy) v_u_71
		return {
			["actionsHeight"] = 0,
			["setActionsHeight"] = nil,
			["hasActionsDivider"] = nil,
			["setHasActionsDivider"] = nil,
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
			["hasRadius"] = nil,
			["sheetType"] = nil,
			["testId"] = nil,
			["closeAffordanceRef"] = nil,
			["contentStartRef"] = nil,
			["setContentStartRef"] = nil,
			["setActionsHeight"] = v_u_3.noop,
			["hasActionsDivider"] = v_u_58,
			["setHasActionsDivider"] = v_u_59,
			["setSheetHeightAvailable"] = v_u_3.noop,
			["innerScrollY"] = v_u_67,
			["setInnerScrollY"] = v_u_68,
			["hasHeader"] = v_u_60,
			["setHasHeader"] = v_u_61,
			["hasFullBleed"] = v_u_62,
			["fullBleedHeight"] = v_u_65,
			["setFullBleedHeight"] = v_u_66,
			["closeSheet"] = v_u_72,
			["hasRadius"] = not v_u_45,
			["sheetType"] = v_u_18.Side,
			["testId"] = v_u_37.testId,
			["closeAffordanceRef"] = v_u_69,
			["contentStartRef"] = v_u_70,
			["setContentStartRef"] = v_u_71
		}
	end, {
		v_u_37.testId,
		v_u_72,
		v_u_70,
		v_u_69,
		v_u_62,
		v_u_45
	})
	if v38 then
		local v80 = v_u_7.createPortal
		local v81 = v_u_5.createElement
		local v82 = v_u_29
		local v83 = {
			["ZIndex"] = nil,
			["tag"] = "size-full",
			["testId"] = nil,
			["ZIndex"] = v40.zIndex,
			["testId"] = ("%*--surface"):format(v_u_37.testId)
		}
		local v84 = {}
		local v85 = v_u_5.createElement
		local v86 = v_u_29
		local v87 = {
			["Size"] = nil,
			["Position"] = nil,
			["ClipsDescendants"] = true,
			["ZIndex"] = 3,
			["padding"] = nil,
			["stateLayer"] = nil,
			["onActivated"] = nil,
			["ref"] = nil,
			["selection"] = nil,
			["selectionGroup"] = nil,
			["tag"] = nil,
			["testId"] = nil,
			["Size"] = v73,
			["Position"] = v78,
			["padding"] = v_u_45 and v44 > 0 and {
				["right"] = UDim.new(0, v44)
			} or nil,
			["stateLayer"] = {
				["affordance"] = v_u_12.None
			},
			["onActivated"] = v_u_3.noop,
			["ref"] = p36,
			["selection"] = v_u_17.nonSelectable,
			["selectionGroup"] = v_u_17.isolatedSelectionGroup,
			["tag"] = {
				["stroke-standard stroke-default bg-surface-100"] = true,
				["radius-large"] = not v_u_45
			},
			["testId"] = v_u_37.testId
		}
		local v88 = {
			["Content"] = v_u_5.createElement(v_u_29, {
				["tag"] = "col items-center size-full-full clip"
			}, v_u_5.createElement(v_u_16.Provider, {
				["value"] = v79
			}, v_u_5.createElement(v_u_20, {
				["owner"] = v40
			}, v_u_37.children)))
		}
		local v89 = v_u_5.createElement
		local v90 = v_u_27
		local v91 = {
			["onActivated"] = v_u_72,
			["ref"] = v_u_69,
			["NextSelectionDown"] = v_u_70
		}
		local v92
		if v_u_62 then
			v92 = v_u_9.OverMedia
		else
			v92 = v_u_9.Utility
		end
		v91.variant = v92
		v91.Position = UDim2.new(1, -v_u_39.Margin.Small, 0, v_u_39.Margin.Small)
		v91.AnchorPoint = Vector2.new(1, 0)
		v91.Visible = v_u_60:map(function(p93)
			return not p93
		end)
		v91.testId = ("%*--close-affordance"):format(v_u_37.testId)
		v88.CloseAffordance = v89(v90, v91)
		v84.Sheet = v85(v86, v87, v88)
		v84.Shadow = v_u_5.createElement(v_u_28, {
			["Image"] = nil,
			["Size"] = nil,
			["Position"] = nil,
			["ZIndex"] = 2,
			["slice"] = nil,
			["imageStyle"] = nil,
			["Image"] = v_u_33,
			["Size"] = v73 + UDim2.fromOffset(v_u_34 * 2, v_u_34 * 2),
			["Position"] = v78:map(function(p94)
				-- upvalues: (ref) v_u_34
				return p94 + UDim2.fromOffset(-v_u_34, -v_u_34)
			end),
			["slice"] = {
				["center"] = nil,
				["scale"] = 2,
				["center"] = Rect.new(v_u_34, v_u_34, v_u_34 + 1, v_u_34 + 1)
			},
			["imageStyle"] = v_u_39.Color.Extended.Black.Black_10
		})
		local v95
		if v_u_11.FoundationSideSheetInternalBackdrop then
			v95 = v_u_5.createElement(v_u_26, {
				["transparency"] = nil,
				["onActivated"] = nil,
				["ZIndex"] = 1,
				["testId"] = nil,
				["transparency"] = v53,
				["onActivated"] = v_u_72,
				["testId"] = ("%*--backdrop"):format(v_u_37.testId)
			})
		else
			v95 = v_u_5.createElement(v_u_29, {
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
					["affordance"] = v_u_12.None
				},
				["backgroundStyle"] = v53:map(function(p96)
					-- upvalues: (copy) v_u_39
					local v97 = {
						["Color3"] = v_u_39.Color.Common.Backdrop.Color3
					}
					local v98 = v_u_39.Color.Common.Backdrop.Transparency
					v97.Transparency = math.lerp(v98, 1, p96)
					return v97
				end),
				["onActivated"] = v_u_72,
				["testId"] = ("%*--backdrop"):format(v_u_37.testId)
			})
		end
		v84.Backdrop = v95
		v38 = v80(v81(v82, v83, v84), v38)
	end
	return v38
end))