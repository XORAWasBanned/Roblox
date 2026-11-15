-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Tabs.OverflowScrollContainer
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v2.BuilderIcons)
local v_u_4 = require(v2.Dash)
local v_u_5 = require(v2.Otter)
local v_u_6 = require(v2.React)
local v_u_7 = require(v2.ReactOtter)
local v_u_8 = v3.Icon
local v_u_9 = require(v1.Components.IconButton)
local v_u_10 = require(v1.Enums.InputSize)
local v_u_11 = require(v1.Components.ScrollView)
require(v1.Components.Types)
local v_u_12 = require(v1.Components.View)
local v_u_13 = require(v1.Enums.Visibility)
local v_u_14 = require(v1.Utility.withCommonProps)
local v_u_15 = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.8, 0), NumberSequenceKeypoint.new(1, 1) })
local v_u_16 = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.2, 0), NumberSequenceKeypoint.new(1, 0) })
local function v_u_26(p17) -- name: OverflowButton
	-- upvalues: (copy) v_u_6, (copy) v_u_12, (copy) v_u_14, (copy) v_u_9, (copy) v_u_10
	local v18 = v_u_6.createElement
	local v19 = v_u_12
	local v20 = v_u_14(p17, {
		["tag"] = ("col align-y-center size-0-full auto-x bg-surface-0 %*"):format(p17.tag)
	})
	local v21 = {
		["UIGradient"] = v_u_6.createElement("UIGradient", {
			["Transparency"] = p17.gradient
		})
	}
	local v22 = v_u_6.createElement
	local v23 = v_u_9
	local v24 = {
		["onActivated"] = p17.onActivated
	}
	local v25
	if p17.size == v_u_10.Large or p17.size == v_u_10.Medium then
		v25 = v_u_10.Small
	else
		v25 = v_u_10.XSmall
	end
	v24.size = v25
	v24.icon = {
		["name"] = p17.icon
	}
	v21.Button = v22(v23, v24)
	return v18(v19, v20, v21)
end
return function(p27) -- name: OverflowScrollContainer
	-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_4, (copy) v_u_5, (copy) v_u_12, (copy) v_u_14, (copy) v_u_11, (copy) v_u_13, (copy) v_u_26, (copy) v_u_15, (copy) v_u_8, (copy) v_u_16
	local v28, v_u_29 = v_u_6.useBinding(false)
	local v30, v_u_31 = v_u_6.useBinding(false)
	local v_u_32 = v_u_6.useRef(nil)
	local v_u_35 = v_u_7.useMotor(0, function(p33)
		-- upvalues: (copy) v_u_32
		local v34 = v_u_32.current
		if v34 then
			v34.CanvasPosition = Vector2.new(p33, 0)
		end
	end)
	local v_u_37 = v_u_6.useCallback(v_u_4.throttle(function(p36)
		-- upvalues: (copy) v_u_29, (copy) v_u_31
		if p36.AbsoluteWindowSize.X ~= 0 then
			v_u_29(p36.AbsoluteWindowSize.X + p36.CanvasPosition.X < p36.AbsoluteCanvasSize.X - 1)
			v_u_31(p36.CanvasPosition.X ~= 0)
		end
	end, 0.2), {})
	local v_u_40 = v_u_6.useCallback(function(p38)
		-- upvalues: (copy) v_u_32, (copy) v_u_35, (ref) v_u_5
		local v39 = v_u_32.current
		if v39 then
			v_u_35(v_u_5.ease(v39.CanvasPosition.X + p38, {
				["duration"] = 0.2,
				["easingStyle"] = nil,
				["easingStyle"] = Enum.EasingStyle.Quad
			}))
		end
	end, {})
	v_u_6.useEffect(function()
		-- upvalues: (copy) v_u_32, (copy) v_u_37
		if v_u_32.current then
			v_u_37(v_u_32.current)
		end
	end, {})
	local v41 = v_u_6.useCallback(function()
		-- upvalues: (copy) v_u_40
		v_u_40(-90)
	end, { v_u_40 })
	local v42 = v_u_6.useCallback(function()
		-- upvalues: (copy) v_u_40
		v_u_40(90)
	end, { v_u_40 })
	local v43 = v_u_6.createElement
	local v44 = v_u_12
	local v45 = v_u_14(p27, {
		["tag"] = "auto-y",
		["Size"] = nil,
		["Size"] = UDim2.fromScale(1, 0)
	})
	local v46 = {}
	local v47 = v_u_6.createElement
	local v48 = v_u_11
	local v49 = {
		["LayoutOrder"] = 1,
		["Size"] = nil,
		["onCanvasPositionChanged"] = nil,
		["onAbsoluteWindowSizeChanged"] = nil,
		["scrollingFrameRef"] = nil,
		["selection"] = nil,
		["scroll"] = nil,
		["Size"] = UDim2.fromScale(1, 1),
		["onCanvasPositionChanged"] = v_u_37,
		["onAbsoluteWindowSizeChanged"] = v_u_37,
		["scrollingFrameRef"] = v_u_32,
		["selection"] = {
			["Selectable"] = false
		},
		["scroll"] = {
			["AutomaticSize"] = Enum.AutomaticSize.Y,
			["AutomaticCanvasSize"] = Enum.AutomaticSize.X,
			["ScrollingDirection"] = Enum.ScrollingDirection.X,
			["scrollBarVisibility"] = v_u_13.None
		}
	}
	v46.Scroll = v47(v48, v49, p27.children)
	v46.OverflowStart = v_u_6.createElement(v_u_26, {
		["LayoutOrder"] = 3,
		["Position"] = nil,
		["size"] = nil,
		["isStart"] = true,
		["ZIndex"] = 2,
		["Visible"] = nil,
		["onActivated"] = nil,
		["gradient"] = nil,
		["tag"] = "padding-right-small",
		["icon"] = nil,
		["testId"] = nil,
		["Position"] = UDim2.fromScale(0, 0),
		["size"] = p27.size,
		["Visible"] = v30,
		["onActivated"] = v41,
		["gradient"] = v_u_15,
		["icon"] = v_u_8.ChevronLargeLeft,
		["testId"] = ("%*--overflow-start"):format(p27.testId)
	})
	v46.OverflowEnd = v_u_6.createElement(v_u_26, {
		["LayoutOrder"] = 4,
		["Position"] = nil,
		["size"] = nil,
		["ZIndex"] = 2,
		["Visible"] = nil,
		["onActivated"] = nil,
		["gradient"] = nil,
		["tag"] = "anchor-top-right padding-left-small",
		["icon"] = nil,
		["testId"] = nil,
		["Position"] = UDim2.fromScale(1, 0),
		["size"] = p27.size,
		["Visible"] = v28,
		["onActivated"] = v42,
		["gradient"] = v_u_16,
		["icon"] = v_u_8.ChevronLargeRight,
		["testId"] = ("%*--overflow-end"):format(p27.testId)
	})
	return v43(v44, v45, v46)
end