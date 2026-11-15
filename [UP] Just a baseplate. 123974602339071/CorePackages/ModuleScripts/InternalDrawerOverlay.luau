-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InternalDrawer.InternalDrawerOverlay
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v2.Otter)
local v_u_5 = require(v2.React)
local v6 = require(v2.ReactOtter)
local v_u_7 = require(v2.ReactRoblox)
local v_u_8 = v6.useAnimatedBinding
local v_u_9 = require(v1.Components.Backdrop)
local v_u_10 = require(v1.Constants)
local v_u_11 = require(v1.Enums.OnCloseCallbackReason)
local v_u_12 = require(v1.Providers.Elevation.ElevationProvider).ElevationOwnerScope
local v_u_13 = require(v1.Components.ScrollView)
local v_u_14 = require(v1.Enums.StateLayerAffordance)
local v_u_15 = require(v1.Components.View)
local v_u_16 = require(script.Parent.useInternalDrawerVariants)
local v_u_17 = require(v1.Providers.Overlay.useOverlay)
local v_u_18 = require(v1.Providers.Preferences.usePreferences)
local v_u_19 = require(v1.Components.Sheet.useScreenSize)
local v_u_20 = require(v1.Providers.Style.useTokens)
local v_u_21 = require(v1.Enums.InternalDrawerBackdrop)
local v_u_22 = require(v1.Enums.InternalDrawerShadow)
require(script.Parent.Types)
return v_u_5.memo(v_u_5.forwardRef(function(p_u_23, p24) -- name: InternalDrawerOverlay
	-- upvalues: (copy) v_u_17, (copy) v_u_20, (copy) v_u_16, (copy) v_u_22, (copy) v_u_18, (copy) v_u_19, (copy) v_u_5, (copy) v_u_8, (copy) v_u_4, (copy) v_u_21, (copy) v_u_11, (copy) v_u_7, (copy) v_u_15, (copy) v_u_14, (copy) v_u_3, (copy) v_u_10, (copy) v_u_12, (copy) v_u_13, (copy) v_u_9
	local v25 = v_u_17()
	local v_u_26 = v_u_20()
	local v27 = v_u_16(p_u_23.layout, p_u_23.side)
	local v28 = p_u_23.shadow == v_u_22.Overlay300
	local v29 = p_u_23.elevation
	local v_u_30 = v_u_18().reducedMotion
	local v31 = v_u_19()
	local v_u_32 = v27.surface
	local v33 = v31.X - v_u_26.Size.Size_1200 - v_u_32.margin
	local v34 = math.max(v33, 0)
	local v35 = p_u_23.width
	local v_u_36 = math.min(v35, v34)
	local v_u_37 = v_u_5.useRef(p_u_23.isOpen)
	v_u_37.current = p_u_23.isOpen
	local v_u_38 = v_u_5.useRef(true)
	local v_u_39 = v_u_5.useRef(true)
	local v_u_40 = v_u_5.useRef(0)
	local v_u_41 = v_u_5.useRef(1)
	local v_u_42 = v_u_5.useRef(false)
	local v_u_43 = v_u_5.useRef(p_u_23.onExited)
	v_u_43.current = p_u_23.onExited
	local v_u_44 = v_u_5.useRef(p_u_23.onOpenComplete)
	v_u_44.current = p_u_23.onOpenComplete
	local function v_u_46() -- name: notifySettled
		-- upvalues: (copy) v_u_37, (copy) v_u_38, (copy) v_u_39, (copy) v_u_43, (copy) v_u_42, (copy) v_u_40, (copy) v_u_41, (copy) v_u_44
		if v_u_37.current or not (v_u_38.current and v_u_39.current) then
			if v_u_42.current and (v_u_38.current and (v_u_39.current and (v_u_40.current == 1 and v_u_41.current == 0))) then
				v_u_42.current = false
				local v45 = v_u_44.current
				if v45 then
					v45()
				end
			end
		else
			v_u_43.current()
		end
	end
	local v48, v_u_49 = v_u_8(0, function(p47)
		-- upvalues: (copy) v_u_40, (copy) v_u_38, (copy) v_u_46
		v_u_40.current = p47
		v_u_38.current = true
		v_u_46()
	end)
	local v51, v_u_52 = v_u_8(1, function(p50)
		-- upvalues: (copy) v_u_41, (copy) v_u_39, (copy) v_u_46
		v_u_41.current = p50
		v_u_39.current = true
		v_u_46()
	end)
	v_u_5.useEffect(function()
		-- upvalues: (copy) v_u_38, (copy) v_u_39, (copy) v_u_42, (copy) p_u_23, (copy) v_u_44, (copy) v_u_30, (copy) v_u_49, (ref) v_u_4, (copy) v_u_52, (copy) v_u_26
		v_u_38.current = false
		v_u_39.current = false
		local v53 = v_u_42
		local v54 = p_u_23.isOpen
		if v54 then
			v54 = v_u_44.current ~= nil
		end
		v53.current = v54
		if v_u_30 then
			v_u_49((v_u_4.instant(p_u_23.isOpen and 1 or 0)))
			v_u_52((v_u_4.instant(p_u_23.isOpen and 0 or 1)))
			return
		elseif p_u_23.isOpen then
			v_u_49(v_u_4.ease(1, {
				["easingStyle"] = v_u_26.Ease.StandardOut,
				["duration"] = v_u_26.Time.Time_300
			}))
			v_u_52(v_u_4.ease(0, {
				["duration"] = v_u_26.Time.Time_100
			}))
		else
			v_u_49(v_u_4.ease(0, {
				["easingStyle"] = v_u_26.Ease.StandardIn,
				["duration"] = v_u_26.Time.Time_100
			}))
			v_u_52(v_u_4.ease(1, {
				["duration"] = v_u_26.Time.Time_100
			}))
		end
	end, { p_u_23.isOpen, v_u_30 })
	local v55 = v_u_5.useCallback(function()
		-- upvalues: (copy) p_u_23, (ref) v_u_21, (copy) v_u_37, (ref) v_u_11
		if p_u_23.backdrop == v_u_21.Dismissible and v_u_37.current then
			p_u_23.onRequestClose(v_u_11.BackdropClick)
		end
	end, { p_u_23.backdrop, p_u_23.onRequestClose })
	local v56 = UDim2.new(0, v_u_36, 1, -v_u_32.margin * 2)
	local v59 = v48:map(function(p57)
		-- upvalues: (copy) v_u_36, (copy) v_u_32
		local v58 = (1 - p57) * v_u_36
		return UDim2.new(v_u_32.anchorScaleX, v_u_32.openOffsetSign * v_u_32.margin * p57 + v_u_32.hiddenOffsetSign * v58, 0, v_u_32.margin)
	end)
	if v25 then
		local v60 = v_u_7.createPortal
		local v61 = v_u_5.createElement
		local v62 = v_u_15
		local v63 = {
			["ZIndex"] = nil,
			["tag"] = "size-full",
			["testId"] = nil,
			["ZIndex"] = v29.zIndex,
			["testId"] = ("%*--container"):format(p_u_23.testId)
		}
		local v64 = {}
		local v65 = v_u_5.createElement
		local v66 = v_u_15
		local v67 = {
			["Size"] = nil,
			["Position"] = nil,
			["ClipsDescendants"] = true,
			["ZIndex"] = nil,
			["stateLayer"] = nil,
			["onActivated"] = nil,
			["selection"] = nil,
			["selectionGroup"] = nil,
			["tag"] = nil,
			["ref"] = nil,
			["testId"] = nil,
			["Size"] = v56,
			["Position"] = v59,
			["ZIndex"] = v28 and 3 or 2,
			["stateLayer"] = {
				["affordance"] = v_u_14.None
			},
			["onActivated"] = v_u_3.noop,
			["selection"] = v_u_10.MODAL.DISABLE_SELECTION,
			["selectionGroup"] = v_u_10.MODAL.TRAP_FOCUS,
			["tag"] = ("%* %*"):format(v_u_32.tag, p_u_23.backgroundColor),
			["ref"] = p24,
			["testId"] = p_u_23.testId
		}
		local v68 = {}
		local v69 = v_u_5.createElement
		local v70 = v_u_15
		local v71 = {
			["tag"] = "col size-full",
			["testId"] = nil,
			["testId"] = ("%*--content"):format(p_u_23.testId)
		}
		local v72 = v_u_5.createElement
		local v73 = v_u_12
		local v74 = {
			["owner"] = v29
		}
		local v75 = {}
		local v76
		if p_u_23.header == nil then
			v76 = nil
		else
			v76 = v_u_5.createElement(v_u_15, {
				["LayoutOrder"] = 1,
				["tag"] = "col size-full-0 auto-y",
				["testId"] = nil,
				["testId"] = ("%*--header"):format(p_u_23.testId)
			}, p_u_23.header)
		end
		v75.Header = v76
		v75.Body = v_u_5.createElement(v_u_13, {
			["LayoutOrder"] = 2,
			["scroll"] = nil,
			["tag"] = "fill size-full-0",
			["testId"] = nil,
			["scroll"] = {
				["AutomaticCanvasSize"] = Enum.AutomaticSize.Y,
				["CanvasSize"] = UDim2.fromScale(1, 0),
				["ScrollingDirection"] = Enum.ScrollingDirection.Y,
				["scrollBarVisibility"] = p_u_23.scrollBarVisibility
			},
			["testId"] = ("%*--body"):format(p_u_23.testId)
		}, {
			["Children"] = v_u_5.createElement(v_u_15, {
				["tag"] = "col size-full-0 auto-y",
				["testId"] = nil,
				["testId"] = ("%*--body-content"):format(p_u_23.testId)
			}, p_u_23.children)
		})
		local v77
		if p_u_23.footer == nil then
			v77 = nil
		else
			v77 = v_u_5.createElement(v_u_15, {
				["LayoutOrder"] = 3,
				["tag"] = "col size-full-0 auto-y",
				["testId"] = nil,
				["testId"] = ("%*--footer"):format(p_u_23.testId)
			}, p_u_23.footer)
		end
		v75.Footer = v77
		v68.Content = v69(v70, v71, v72(v73, v74, v75))
		local v78
		if v27.innerEdge.isVisible then
			v78 = v_u_5.createElement(v_u_15, {
				["Size"] = nil,
				["backgroundStyle"] = nil,
				["ZIndex"] = 2,
				["tag"] = nil,
				["testId"] = nil,
				["Size"] = UDim2.new(0, v27.innerEdge.thickness, 1, 0),
				["backgroundStyle"] = v27.innerEdge.backgroundStyle,
				["tag"] = v27.innerEdge.tag,
				["testId"] = ("%*--inner-edge"):format(p_u_23.testId)
			})
		else
			v78 = nil
		end
		v68.InnerEdge = v78
		v64.Surface = v65(v66, v67, v68)
		local v79
		if v28 then
			v79 = v_u_5.createElement(v_u_15, {
				["Size"] = nil,
				["Position"] = nil,
				["ZIndex"] = 2,
				["tag"] = nil,
				["testId"] = nil,
				["Size"] = v56,
				["Position"] = v59,
				["tag"] = v27.shadow.tag,
				["testId"] = ("%*--shadow"):format(p_u_23.testId)
			})
		else
			v79 = nil
		end
		v64.Shadow = v79
		v64.Backdrop = v_u_5.createElement(v_u_9, {
			["ZIndex"] = 1,
			["transparency"] = nil,
			["onActivated"] = nil,
			["testId"] = nil,
			["transparency"] = v51,
			["onActivated"] = v55,
			["testId"] = ("%*--backdrop"):format(p_u_23.testId)
		})
		v25 = v60(v61(v62, v63, v64), v25)
	end
	return v25
end))