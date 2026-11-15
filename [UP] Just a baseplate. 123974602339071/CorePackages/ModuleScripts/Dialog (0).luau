-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Dialog.Dialog
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v2.Otter)
local v_u_5 = require(v2.React)
local v6 = require(v2.ReactOtter)
local v_u_7 = require(v2.ReactRoblox)
local v_u_8 = v6.useAnimatedBinding
local v_u_9 = require(v1.Components.Backdrop)
local v_u_10 = require(v1.Components.CloseAffordance)
local v11 = require(v1.Constants)
local v_u_12 = require(v1.Components.Image)
local v_u_13 = require(v1.Components.View)
local v_u_14 = require(v1.Providers.Overlay.useOverlay)
local v15 = require(v1.Enums.DialogSize)
local v_u_16 = require(v1.Enums.OnCloseCallbackReason)
local v_u_17 = require(v1.Enums.StateLayerAffordance)
local v_u_18 = require(v1.Utility.Flags)
local v_u_19 = require(v1.Utility.useScaledValue)
local v_u_20 = require(v1.Providers.Style.useTokens)
local v_u_21 = require(v1.Utility.withCommonProps)
local v_u_22 = require(v1.Utility.withDefaults)
local v_u_23 = require(v1.Providers.Preferences.usePreferences)
local v_u_24 = require(script.Parent.Types)
require(v1.Components.Types)
local v_u_25 = require(script.Parent.useDialogVariants).useDialogVariants
local v_u_26 = require(script.Parent.DialogProvider)
local v_u_27 = require(script.Parent.useDialog)
local v_u_28 = require(script.Parent.useDialogResponsiveSize)
local v_u_29 = require(v1.Providers.Elevation.useElevation)
local v_u_30 = require(v1.Providers.Elevation.ElevationProvider).ElevationOwnerScope
local v_u_31 = require(v1.Enums.ElevationLayer)
local v_u_32 = {
	["size"] = nil,
	["disablePortal"] = true,
	["hasBackdrop"] = false,
	["testId"] = "--foundation-dialog",
	["size"] = v15.Medium
}
local v_u_33 = v11.SHADOW_IMAGE
local v_u_34 = v11.SHADOW_SIZE
local function v_u_118(p35) -- name: Dialog
	-- upvalues: (copy) v_u_3, (copy) v_u_25, (copy) v_u_19, (copy) v_u_5, (copy) v_u_14, (copy) v_u_29, (copy) v_u_31, (copy) v_u_27, (copy) v_u_28, (copy) v_u_20, (copy) v_u_23, (copy) v_u_8, (copy) v_u_4, (copy) v_u_13, (copy) v_u_18, (copy) v_u_12, (copy) v_u_33, (copy) v_u_34, (copy) v_u_21, (copy) v_u_17, (copy) v_u_24, (copy) v_u_10, (copy) v_u_30, (copy) v_u_9, (copy) v_u_16, (copy) v_u_7
	local v_u_36 = v_u_3.assign({}, p35, {
		["LayoutOrder"] = 1
	})
	local v_u_37 = v_u_25()
	local v38 = v_u_19(v_u_37.inner.maxWidth)
	local v39, v_u_40 = v_u_5.useBinding(Vector2.new(0, 0))
	local v41 = v_u_14()
	local v42 = v_u_29(v_u_31.Dialog, {
		["stackAboveOwner"] = false
	})
	local v43 = v_u_27()
	v_u_28(v_u_36.size)
	local v_u_44 = v_u_20()
	local v_u_45 = v_u_23().reducedMotion
	local v_u_46 = v_u_44.Size.Size_800
	local v47, v_u_48 = v_u_5.useState(true)
	local v_u_49 = v_u_5.useRef(false)
	local v_u_50 = v_u_5.useRef(nil)
	local v51, v_u_52 = v_u_8(1)
	local v53, v_u_54 = v_u_8(v_u_46, function()
		-- upvalues: (copy) v_u_49, (copy) v_u_36, (copy) v_u_50, (copy) v_u_48
		if v_u_49.current then
			if v_u_36.onClose then
				v_u_36.onClose(v_u_50.current)
				return
			end
		else
			v_u_48(false)
		end
	end)
	v_u_5.useEffect(function()
		-- upvalues: (copy) v_u_45, (copy) v_u_54, (ref) v_u_4, (copy) v_u_52, (copy) v_u_44
		if v_u_45 then
			v_u_54((v_u_4.instant(0)))
			v_u_52((v_u_4.instant(0)))
		else
			v_u_54(v_u_4.ease(0, {
				["easingStyle"] = v_u_44.Ease.StandardOut,
				["duration"] = v_u_44.Time.Time_300
			}))
			v_u_52(v_u_4.ease(0, {
				["duration"] = v_u_44.Time.Time_100
			}))
		end
	end, {})
	local v_u_56 = v_u_5.useCallback(function(p55)
		-- upvalues: (copy) v_u_49, (copy) v_u_50, (copy) v_u_45, (copy) v_u_54, (ref) v_u_4, (copy) v_u_46, (copy) v_u_52, (copy) v_u_44, (copy) v_u_48
		if v_u_49.current then
			return
		else
			v_u_50.current = p55
			if v_u_45 then
				v_u_49.current = true
				v_u_54(v_u_4.instant(v_u_46))
				v_u_52(v_u_4.instant(1))
			else
				v_u_54(v_u_4.ease(v_u_46, {
					["easingStyle"] = v_u_44.Ease.StandardIn,
					["duration"] = v_u_44.Time.Time_200
				}))
				v_u_52(v_u_4.ease(1, {
					["duration"] = v_u_44.Time.Time_100
				}))
				v_u_48(true)
				v_u_49.current = true
			end
		end
	end, { v_u_46, v_u_45 })
	local v_u_57 = v_u_5.useMemo(function()
		return Instance.new("Folder")
	end, {})
	v_u_5.useEffect(function()
		-- upvalues: (copy) v_u_57
		return function()
			-- upvalues: (ref) v_u_57
			v_u_57:Destroy()
		end
	end, { v_u_57 })
	local v58, v_u_59 = v_u_5.useState(false)
	local v61 = v_u_5.useCallback(function(p60)
		-- upvalues: (copy) v_u_57, (copy) v_u_59
		if p60 then
			v_u_57.Parent = p60
			v_u_59(true)
		else
			v_u_57.Parent = nil
			v_u_59(false)
		end
	end, { v_u_57 })
	local v62 = v_u_5.createElement
	local v63 = v_u_13
	local v64 = {
		["tag"] = nil,
		["ZIndex"] = 2,
		["tag"] = v_u_37.container.tag
	}
	local v65 = {}
	local v66
	if v_u_18.FoundationDialogOverlayShadow then
		v66 = v_u_5.createElement(v_u_13, {
			["tag"] = "shadow-overlay-300 radius-large",
			["Size"] = nil,
			["testId"] = nil,
			["Size"] = v39:map(function(p67)
				return UDim2.fromOffset(p67.X, p67.Y)
			end),
			["testId"] = ("%*--shadow"):format(v_u_36.testId)
		})
	else
		v66 = v_u_5.createElement(v_u_12, {
			["Image"] = v_u_33,
			["Size"] = v39:map(function(p68)
				-- upvalues: (ref) v_u_34
				return UDim2.fromOffset(p68.X + v_u_34 * 2, p68.Y + v_u_34 * 2)
			end),
			["slice"] = {
				["center"] = nil,
				["scale"] = 2,
				["center"] = Rect.new(v_u_34, v_u_34, v_u_34, v_u_34)
			},
			["imageStyle"] = v_u_37.shadow.imageStyle,
			["testId"] = ("%*--shadow"):format(v_u_36.testId)
		})
	end
	v65.Shadow = v66
	local v69 = v62(v63, v64, v65)
	local v70 = v_u_5.createElement
	local v71 = v_u_13
	local v72 = {
		["tag"] = nil,
		["ZIndex"] = 3,
		["tag"] = v_u_37.container.tag
	}
	local v73 = {}
	local v74 = v_u_5.createElement
	local v75 = v_u_13
	local v76 = v_u_21(v_u_36, {
		["tag"] = v_u_37.inner.tag,
		["ref"] = v_u_36.forwardRef,
		["sizeConstraint"] = {
			["MaxSize"] = Vector2.new(v38, (1 / 0))
		},
		["stateLayer"] = {
			["affordance"] = v_u_17.None
		},
		["selection"] = v_u_24.nonSelectable,
		["selectionGroup"] = v_u_24.isolatedSelectionGroup,
		["onActivated"] = v_u_3.noop
	})
	local v77 = {}
	local v78
	if v_u_36.onClose then
		local v79 = v_u_5.createElement
		local v80 = v_u_10
		local v81 = {
			["onActivated"] = nil,
			["ref"] = nil,
			["NextSelectionDown"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["ZIndex"] = 2,
			["testId"] = nil
		}
		local v82
		if v_u_56 and not v_u_45 then
			v82 = v_u_56
		else
			v82 = v_u_36.onClose
		end
		v81.onActivated = v82
		v81.ref = v43.closeAffordanceRef
		v81.NextSelectionDown = v43.contentStartRef
		v81.Position = UDim2.new(1, -v_u_37.closeAffordance.offset, 0, v_u_37.closeAffordance.offset)
		v81.AnchorPoint = Vector2.new(1, 0)
		v81.testId = ("%*--close-affordance"):format(v_u_36.testId)
		v78 = v79(v80, v81)
	else
		v78 = nil
	end
	v77.CloseAffordance = v78
	v77.DialogBody = v_u_5.createElement(v_u_13, {
		["tag"] = v_u_37.body.tag,
		["onAbsoluteSizeChanged"] = function(p83) -- name: onAbsoluteSizeChanged
			-- upvalues: (copy) v_u_40
			local v84 = p83.AbsoluteSize
			if v84.X > 0 and v84.Y > 0 then
				v_u_40(v84)
			end
		end,
		["testId"] = ("%*--body"):format(v_u_36.testId)
	}, v_u_5.createElement(v_u_30, {
		["owner"] = v42
	}, v_u_36.children))
	v73.DialogInner = v74(v75, v76, v77)
	local v85 = v70(v71, v72, v73)
	local v86 = v_u_5.createElement
	local v87 = v_u_13
	local v88 = {
		["ZIndex"] = nil,
		["tag"] = "size-full padding-y-xlarge",
		["testId"] = nil,
		["ZIndex"] = v42.zIndex,
		["testId"] = ("%*--container"):format(v_u_36.testId)
	}
	local v89 = {}
	local v90
	if v_u_36.hasBackdrop then
		if v_u_18.FoundationDialogInternalBackdrop then
			local v91 = v_u_5.createElement
			local v92 = v_u_9
			local v93 = {
				["transparency"] = nil,
				["onActivated"] = nil,
				["ZIndex"] = 2,
				["testId"] = nil
			}
			if v_u_45 then
				v51 = nil
			end
			v93.transparency = v51
			function v93.onActivated() -- name: onActivated
				-- upvalues: (copy) v_u_36, (copy) v_u_56, (copy) v_u_45, (ref) v_u_16
				if v_u_36.onClose then
					if v_u_56 and not v_u_45 then
						v_u_56(v_u_16.BackdropClick)
						return
					end
					v_u_36.onClose(v_u_16.BackdropClick)
				end
			end
			v93.testId = ("%*--backdrop"):format(v_u_36.testId)
			v90 = v91(v92, v93)
		else
			local v94 = v_u_5.createElement
			local v95 = v_u_13
			local v96 = {
				["tag"] = "position-center-center anchor-center-center",
				["Size"] = nil,
				["stateLayer"] = nil,
				["onActivated"] = nil,
				["backgroundStyle"] = nil,
				["ZIndex"] = 2,
				["testId"] = nil,
				["Size"] = UDim2.fromScale(2, 2),
				["stateLayer"] = {
					["affordance"] = v_u_17.None
				},
				["onActivated"] = function() -- name: onActivated
					-- upvalues: (copy) v_u_36, (copy) v_u_56, (copy) v_u_45, (ref) v_u_16
					if v_u_36.onClose then
						if v_u_56 and not v_u_45 then
							v_u_56(v_u_16.BackdropClick)
							return
						end
						v_u_36.onClose(v_u_16.BackdropClick)
					end
				end
			}
			local v97
			if v_u_45 or not v51 then
				v97 = v_u_37.backdrop.backgroundStyle
			else
				v97 = v51:map(function(p98)
					-- upvalues: (copy) v_u_37
					local v99 = {
						["Color3"] = v_u_37.backdrop.backgroundStyle.Color3
					}
					local v100 = v_u_37.backdrop.backgroundStyle.Transparency
					v99.Transparency = math.lerp(v100, 1, p98)
					return v99
				end)
			end
			v96.backgroundStyle = v97
			v96.testId = ("%*--backdrop"):format(v_u_36.testId)
			v90 = v94(v95, v96)
		end
	else
		v90 = nil
	end
	v89.Backdrop = v90
	local v101 = v_u_5.createElement
	local v102 = v_u_13
	local v103 = {
		["ref"] = nil,
		["Position"] = nil,
		["sizeConstraint"] = nil,
		["testId"] = nil,
		["tag"] = nil,
		["ZIndex"] = 2,
		["GroupTransparency"] = nil
	}
	if v_u_45 then
		v61 = nil
	end
	v103.ref = v61
	local v104
	if v_u_45 or not v53 then
		v104 = nil
	else
		v104 = v53:map(function(p105)
			return UDim2.new(0.5, 0, 0.5, p105)
		end)
	end
	v103.Position = v104
	local v106
	if v_u_45 then
		v106 = nil
	else
		v106 = {}
		local v107 = Vector2.new
		local v108
		if v_u_18.FoundationDialogOverlayShadow then
			v108 = v_u_44.Size.Size_1400 * 2
		else
			v108 = v_u_34 * 2
		end
		v106.MaxSize = v107(v38 + v108, (1 / 0))
	end
	v103.sizeConstraint = v106
	v103.testId = ("%*--content-wrapper"):format(v_u_36.testId)
	v103.tag = {
		["anchor-center-center size-full"] = not v_u_45,
		["size-full"] = v_u_45
	}
	local v109
	if v_u_18.FoundationDialogOverlayShadow then
		if v_u_45 or not v53 then
			v109 = nil
		else
			v109 = v53:map(function(p110)
				-- upvalues: (copy) v_u_46
				return p110 / v_u_46
			end)
		end
	elseif v_u_45 or not (v47 and v53) then
		v109 = nil
	else
		v109 = v53:map(function(p111)
			-- upvalues: (copy) v_u_46
			return p111 / v_u_46
		end)
	end
	v103.GroupTransparency = v109
	v89.DialogContentWrapper = v101(v102, v103, v_u_45 and {
		["DialogShadowWrapper"] = v69,
		["Dialog"] = v85
	} or nil)
	local v112 = v86(v87, v88, v89)
	if v_u_45 then
		if v_u_36.disablePortal or v41 == nil then
			return v112
		else
			return v_u_7.createPortal(v112, v41)
		end
	else
		if not v_u_36.disablePortal and v41 ~= nil then
			v112 = v_u_7.createPortal(v112, v41)
		end
		local v113 = v_u_5.createElement
		local v114 = v_u_5.Fragment
		local v115 = nil
		local v116 = {
			["Main"] = v112
		}
		local v117
		if v58 then
			v117 = v_u_7.createPortal(v_u_5.createElement(v_u_5.Fragment, nil, {
				["DialogShadowWrapper"] = v69,
				["Dialog"] = v85
			}), v_u_57)
		else
			v117 = nil
		end
		v116.StableContent = v117
		return v113(v114, v115, v116)
	end
end
return v_u_5.memo(v_u_5.forwardRef(function(p119, p120) -- name: DialogContainer
	-- upvalues: (copy) v_u_22, (copy) v_u_32, (copy) v_u_5, (copy) v_u_26, (copy) v_u_118, (copy) v_u_3
	local v121 = v_u_22(p119, v_u_32)
	local v122 = v_u_5.createElement
	local v123 = v_u_26
	local v124 = {
		["size"] = v121.size,
		["responsiveSize"] = v121.size,
		["testId"] = v121.testId
	}
	local v125 = {
		["Dialog"] = v_u_5.createElement(v_u_118, v_u_3.assign({}, v121, {
			["forwardRef"] = p120
		}))
	}
	return v122(v123, v124, v125)
end))