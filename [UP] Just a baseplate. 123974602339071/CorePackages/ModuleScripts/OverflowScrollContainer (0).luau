-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.OverflowScrollContainer.OverflowScrollContainer
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Otter)
local v_u_4 = require(v2.React)
local v_u_5 = require(v2.ReactOtter)
local v_u_6 = require(v1.Enums.ControlState)
local v_u_7 = require(v1.Utility.Flags)
local v8 = require(v1.Enums.InputSize)
local v_u_9 = require(script.Parent.Scrim)
local v_u_10 = require(v1.Components.ScrollView)
local v_u_11 = require(v1.Enums.StateLayerAffordance)
require(v1.Components.Types)
local v_u_12 = require(v1.Components.View)
local v_u_13 = require(v1.Enums.Visibility)
local v_u_14 = require(script.Parent.useClippingRect)
local v_u_15 = require(v1.Utility.usePreferredInput)
local v_u_16 = require(v1.Providers.Style.useTokens)
local v_u_17 = require(v1.Utility.withCommonProps)
local v_u_18 = require(v1.Utility.withDefaults)
local v_u_19 = {
	["size"] = nil,
	["scrimBottomInset"] = 0,
	["testId"] = "--foundation-overflow-scroll-container",
	["size"] = v8.Medium
}
return v_u_4.memo(v_u_4.forwardRef(function(p20, p21) -- name: OverflowScrollContainer
	-- upvalues: (copy) v_u_18, (copy) v_u_19, (copy) v_u_16, (copy) v_u_4, (copy) v_u_15, (copy) v_u_14, (copy) v_u_5, (copy) v_u_3, (copy) v_u_6, (copy) v_u_12, (copy) v_u_17, (copy) v_u_10, (copy) v_u_7, (copy) v_u_11, (copy) v_u_13, (copy) v_u_9
	local v_u_22 = v_u_18(p20, v_u_19)
	local v_u_23 = v_u_16()
	local v24, v_u_25 = v_u_4.useState(false)
	local v26, v_u_27 = v_u_4.useState(false)
	local v28, v_u_29 = v_u_4.useState(false)
	local v30, v_u_31 = v_u_4.useState(false)
	local v32, v_u_33 = v_u_4.useState(false)
	local v34 = v_u_22.forceHovered or (v28 or (v30 or v32))
	local v35 = v_u_15()
	local v36 = v_u_22.forcePreferredInput or v35
	local v_u_37 = v_u_4.useRef(nil)
	local v38, v39 = v_u_14(v_u_37)
	local v40, v_u_41 = v_u_4.useBinding(0)
	local v_u_44 = v_u_5.useMotor(0, function(p42)
		-- upvalues: (copy) v_u_37
		local v43 = v_u_37.current
		if v43 then
			v43.CanvasPosition = Vector2.new(p42, 0)
		end
	end)
	local v_u_46 = v_u_4.useCallback(function(p45)
		-- upvalues: (copy) v_u_41, (copy) v_u_27, (copy) v_u_25
		v_u_41(p45.AbsoluteWindowSize.Y)
		if p45.AbsoluteWindowSize.X ~= 0 then
			v_u_27(p45.CanvasPosition.X > 0)
			v_u_25(p45.AbsoluteWindowSize.X + p45.CanvasPosition.X < p45.AbsoluteCanvasSize.X - 1)
		end
	end, {})
	local v_u_56 = v_u_4.useCallback(function(p47)
		-- upvalues: (copy) v_u_37, (copy) v_u_44, (ref) v_u_3, (copy) v_u_23
		local v48 = v_u_37.current
		if v48 then
			local v49 = v48.AbsoluteCanvasSize.X - v48.AbsoluteWindowSize.X
			local v50 = math.max(v49, 0)
			local v51 = v48.AbsoluteWindowSize.X * 0.8
			local v52 = v48.AbsoluteWindowSize.X * 0.19999999999999996
			local v53 = v48.CanvasPosition.X + p47 * v51
			local v54
			if p47 > 0 and v50 - v53 <= v52 then
				v54 = v50
			else
				v54 = p47 < 0 and v53 <= v52 and 0 or v53
			end
			local v55 = math.clamp(v54, 0, v50)
			v_u_44(v_u_3.ease(v55, {
				["duration"] = v_u_23.Time.Time_200,
				["easingStyle"] = Enum.EasingStyle.Quad,
				["startingValue"] = v48.CanvasPosition.X
			}))
		end
	end, { v_u_23 })
	local v57 = v_u_4.useCallback(function()
		-- upvalues: (copy) v_u_56
		v_u_56(-1)
	end, { v_u_56 })
	local v58 = v_u_4.useCallback(function()
		-- upvalues: (copy) v_u_56
		v_u_56(1)
	end, { v_u_56 })
	local v60 = v_u_4.useCallback(function(p59)
		-- upvalues: (copy) v_u_29, (ref) v_u_6
		v_u_29(p59 == v_u_6.Hover and true or p59 == v_u_6.Pressed)
	end, {})
	local v62 = v_u_4.useCallback(function(p61)
		-- upvalues: (copy) v_u_31, (ref) v_u_6
		v_u_31(p61 == v_u_6.Hover and true or p61 == v_u_6.Pressed)
	end, {})
	local v64 = v_u_4.useCallback(function(p63)
		-- upvalues: (copy) v_u_33, (ref) v_u_6
		v_u_33(p63 == v_u_6.Hover and true or p63 == v_u_6.Pressed)
	end, {})
	v_u_4.useEffect(function()
		-- upvalues: (copy) v_u_37, (copy) v_u_46
		if v_u_37.current then
			v_u_46(v_u_37.current)
		end
	end, {})
	local v65 = v_u_4.createElement
	local v66 = v_u_12
	local v67 = v_u_17(v_u_22, {
		["ref"] = nil,
		["tag"] = "size-full-0 auto-y",
		["ref"] = p21
	})
	local v68 = {}
	local v69 = v_u_4.createElement
	local v70 = v_u_10
	local v71 = {
		["tag"] = "size-full-0 auto-y",
		["ClipsDescendants"] = nil,
		["onStateChanged"] = nil,
		["stateLayer"] = nil,
		["onCanvasPositionChanged"] = nil,
		["onAbsoluteCanvasSizeChanged"] = nil,
		["onAbsoluteWindowSizeChanged"] = nil,
		["scrollingFrameRef"] = nil,
		["selection"] = nil,
		["layout"] = nil,
		["scroll"] = nil,
		["testId"] = nil
	}
	local v72
	if v_u_7.FoundationUnifiedScrimScrolling then
		v72 = not v39
	else
		v72 = false
	end
	v71.ClipsDescendants = v72
	v71.onStateChanged = v60
	v71.stateLayer = {
		["affordance"] = v_u_11.None
	}
	v71.onCanvasPositionChanged = v_u_46
	v71.onAbsoluteCanvasSizeChanged = v_u_46
	v71.onAbsoluteWindowSizeChanged = v_u_46
	v71.scrollingFrameRef = v_u_37
	v71.selection = {
		["Selectable"] = false
	}
	v71.layout = {
		["FillDirection"] = Enum.FillDirection.Horizontal
	}
	v71.scroll = {
		["AutomaticSize"] = Enum.AutomaticSize.Y,
		["AutomaticCanvasSize"] = Enum.AutomaticSize.X,
		["CanvasSize"] = UDim2.fromScale(0, 1),
		["ScrollingDirection"] = Enum.ScrollingDirection.X,
		["scrollBarVisibility"] = v_u_13.None
	}
	v71.testId = ("%*--scroll"):format(v_u_22.testId)
	v68.Scroll = v69(v70, v71, v_u_22.children)
	v68.ScrimLayer = v_u_4.createElement(v_u_12, {
		["tag"] = "row flex-between",
		["Position"] = nil,
		["Size"] = nil,
		["ZIndex"] = 2,
		["testId"] = nil,
		["Position"] = v38:map(function(p73)
			return UDim2.fromOffset(p73.Min.X, 0)
		end),
		["Size"] = v38:map(function(p74)
			-- upvalues: (copy) v_u_22
			return UDim2.new(0, p74.Max.X - p74.Min.X, 1, -v_u_22.scrimBottomInset)
		end),
		["testId"] = ("%*--scrim-layer"):format(v_u_22.testId)
	}, {
		["ScrimStart"] = v_u_4.createElement(v_u_9, {
			["LayoutOrder"] = 1,
			["size"] = nil,
			["rowHeight"] = nil,
			["alignment"] = nil,
			["isHovered"] = nil,
			["preferredInput"] = nil,
			["isVisible"] = nil,
			["onActivated"] = nil,
			["onStateChanged"] = nil,
			["testId"] = nil,
			["size"] = v_u_22.size,
			["rowHeight"] = v40,
			["alignment"] = Enum.HorizontalAlignment.Left,
			["isHovered"] = v34,
			["preferredInput"] = v36,
			["isVisible"] = v_u_22.forceScrimsVisible or v26,
			["onActivated"] = v57,
			["onStateChanged"] = v62,
			["testId"] = ("%*--scrim-start"):format(v_u_22.testId)
		}),
		["ScrimEnd"] = v_u_4.createElement(v_u_9, {
			["LayoutOrder"] = 2,
			["size"] = nil,
			["rowHeight"] = nil,
			["alignment"] = nil,
			["isHovered"] = nil,
			["preferredInput"] = nil,
			["isVisible"] = nil,
			["onActivated"] = nil,
			["onStateChanged"] = nil,
			["testId"] = nil,
			["size"] = v_u_22.size,
			["rowHeight"] = v40,
			["alignment"] = Enum.HorizontalAlignment.Right,
			["isHovered"] = v34,
			["preferredInput"] = v36,
			["isVisible"] = v_u_22.forceScrimsVisible or v24,
			["onActivated"] = v58,
			["onStateChanged"] = v64,
			["testId"] = ("%*--scrim-end"):format(v_u_22.testId)
		})
	})
	return v65(v66, v67, v68)
end))