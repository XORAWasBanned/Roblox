-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Stepper.Stepper
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v2.React)
local v_u_5 = require(v1.Enums.FillBehavior)
local v6 = require(v1.Enums.InputSize)
local v_u_7 = require(v1.Components.OverflowScrollContainer)
local v_u_8 = require(v1.Enums.StepperStepState)
local v_u_9 = require(script.Parent.StepItem)
require(v1.Components.Types)
local v_u_10 = require(v1.Components.View)
local v_u_11 = require(v1.Utility.useAnimatedHighlight)
local v_u_12 = require(v1.Providers.Style.useTokens)
local v_u_13 = require(v1.Utility.withCommonProps)
local v_u_14 = require(v1.Utility.withDefaults)
local v_u_15 = {
	["fillBehavior"] = nil,
	["size"] = nil,
	["testId"] = "--foundation-stepper",
	["ZIndex"] = 1,
	["fillBehavior"] = v_u_5.Fill,
	["size"] = v6.Medium
}
return v_u_4.memo(v_u_4.forwardRef(function(p16, p17) -- name: Stepper
	-- upvalues: (copy) v_u_14, (copy) v_u_15, (copy) v_u_12, (copy) v_u_3, (copy) v_u_5, (copy) v_u_4, (copy) v_u_11, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_13, (copy) v_u_7
	local v_u_18 = v_u_14(p16, v_u_15)
	local v19 = v_u_12()
	local v_u_20 = v_u_18.activeStepId or v_u_3.get(v_u_18, { "steps", 1, "id" })
	local v22 = v_u_3.findIndex(v_u_18.steps, function(p21)
		-- upvalues: (copy) v_u_20
		return p21.id == v_u_20
	end) or 1
	local v23 = v_u_18.fillBehavior == v_u_5.Fill
	local v24 = v_u_4.useRef(nil)
	local v_u_25 = v_u_4.useRef({})
	local v28 = v_u_4.useMemo(function()
		-- upvalues: (copy) v_u_25, (copy) v_u_18, (ref) v_u_4
		local v26 = v_u_25.current
		for _, v27 in v_u_18.steps do
			if v26[v27.id] then
				continue
			end
			v26[v27.id] = v_u_4.createRef()
		end
		return v26
	end, { v_u_18.steps })
	local v29 = v_u_11(v_u_20, p17 or v24, v28, v_u_18.size, v_u_18.fillBehavior)
	local v30, v_u_31 = v_u_4.useBinding(0)
	local v33 = v_u_4.useCallback(function(p32)
		-- upvalues: (copy) v_u_31
		v_u_31(p32.AbsoluteSize.X)
	end, {})
	local v_u_34 = v19.Stroke.Standard
	local v35 = {}
	for v36, v37 in ipairs(v_u_18.steps) do
		local v38
		if v_u_20 == v37.id then
			v38 = v_u_8.Current
		elseif v36 < v22 then
			v38 = v_u_8.Complete
		else
			v38 = v_u_8.Incomplete
		end
		v35[("Step%*"):format(v37.id)] = v_u_4.createElement(v_u_9, {
			["step"] = v37,
			["index"] = v36,
			["stepState"] = v38,
			["size"] = v_u_18.size,
			["fillBehavior"] = v_u_18.fillBehavior,
			["LayoutOrder"] = v36,
			["testId"] = ("%*--step-%*"):format(v_u_18.testId, v37.id),
			["ref"] = v28[v37.id]
		})
	end
	local v39 = v_u_4.createElement
	local v40 = v_u_10
	local v42 = v_u_13(v_u_18, {
		["tag"] = "size-full-0 auto-y no-clip",
		["sizeConstraint"] = nil,
		["sizeConstraint"] = not v23 and {
			["MaxSize"] = v30:map(function(p41)
				return Vector2.new(p41, (1 / 0))
			end)
		} or nil
	})
	local v43 = {}
	local v44 = v_u_4.createElement
	local v45 = v_u_10
	local v46 = {
		["ref"] = nil,
		["tag"] = "col size-full-0 auto-y",
		["ZIndex"] = nil,
		["testId"] = nil,
		["ref"] = p17 or v24,
		["ZIndex"] = v_u_18.ZIndex,
		["testId"] = ("%*--container"):format(v_u_18.testId)
	}
	local v47 = {
		["ScrollContainer"] = v_u_4.createElement(v_u_7, {
			["LayoutOrder"] = 1,
			["size"] = nil,
			["scrimBottomInset"] = nil,
			["testId"] = nil,
			["size"] = v_u_18.size,
			["scrimBottomInset"] = v_u_34,
			["testId"] = ("%*--scroll-container"):format(v_u_18.testId)
		}, {
			["StepList"] = v_u_4.createElement(v_u_10, {
				["onAbsoluteSizeChanged"] = v33,
				["tag"] = {
					["row flex-y-fill auto-xy"] = true,
					["size-full-0"] = v23
				},
				["testId"] = ("%*--list"):format(v_u_18.testId)
			}, v35)
		}),
		["Border"] = v_u_4.createElement(v_u_10, {
			["LayoutOrder"] = 2,
			["tag"] = "position-bottom-left anchor-bottom-left",
			["Size"] = nil,
			["backgroundStyle"] = nil,
			["testId"] = nil,
			["Size"] = UDim2.new(1, 0, 0, v19.Stroke.Standard),
			["backgroundStyle"] = v19.Color.Stroke.Default,
			["testId"] = ("%*--border"):format(v_u_18.testId)
		})
	}
	v43.Stepper = v44(v45, v46, v47)
	v43.AnimatedBorder = v_u_4.createElement(v_u_10, {
		["LayoutOrder"] = 0,
		["ZIndex"] = nil,
		["tag"] = "anchor-bottom-left bg-system-contrast",
		["Size"] = nil,
		["Position"] = nil,
		["testId"] = nil,
		["ZIndex"] = v_u_18.ZIndex + 1,
		["Size"] = v29.highlightWidth:map(function(p48)
			-- upvalues: (copy) v_u_34
			return UDim2.fromOffset(p48, v_u_34)
		end),
		["Position"] = v_u_4.joinBindings({ v29.highlightPosition, v29.activeItemHeight }):map(function(p49)
			local v50 = p49[1]
			local v51 = p49[2]
			return UDim2.fromOffset(v50, v51)
		end),
		["testId"] = ("%*--animated-border"):format(v_u_18.testId)
	})
	return v39(v40, v42, v43)
end))