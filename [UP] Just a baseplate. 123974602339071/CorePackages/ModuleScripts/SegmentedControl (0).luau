-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.SegmentedControl.SegmentedControl
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v2.React)
require(v1.Components.Types)
local v_u_5 = require(v1.Components.View)
require(v1.Enums.ControlState)
local v_u_6 = require(v1.Enums.FillBehavior)
local v7 = require(v1.Enums.InputSize)
local v8 = require(v1.Enums.SegmentedControlVariant)
local v_u_9 = require(v1.Providers.Style.useTokens)
local v_u_10 = require(v1.Utility.withCommonProps)
local v_u_11 = require(v1.Utility.useAnimatedHighlight)
local v_u_12 = require(v1.Utility.withDefaults)
local v_u_13 = require(script.Parent.Segment)
local v_u_14 = require(script.Parent.useSegmentedControlVariants)
local v_u_15 = require(v1.Utility.Flags)
local v_u_16 = {
	["size"] = nil,
	["variant"] = nil,
	["fillBehavior"] = nil,
	["testId"] = "--foundation-segmented-control",
	["ZIndex"] = 1,
	["size"] = v7.Medium,
	["variant"] = v8.Filled,
	["fillBehavior"] = v_u_6.Fit
}
return v_u_4.memo(v_u_4.forwardRef(function(p17, p_u_18) -- name: SegmentedControl
	-- upvalues: (copy) v_u_12, (copy) v_u_16, (copy) v_u_15, (copy) v_u_9, (copy) v_u_14, (copy) v_u_6, (copy) v_u_4, (copy) v_u_11, (copy) v_u_5, (copy) v_u_10, (copy) v_u_3, (copy) v_u_13
	local v_u_19 = v_u_12(p17, v_u_16)
	local v_u_20
	if v_u_15.FoundationSegmentedControlBeta then
		v_u_20 = v_u_19.variant
	else
		v_u_20 = nil
	end
	local v_u_21
	if v_u_15.FoundationSegmentedControlBeta then
		v_u_21 = v_u_19.fillBehavior
	else
		v_u_21 = nil
	end
	local v22 = v_u_9()
	local v23 = v_u_14
	local v24 = v_u_19.size
	local v25
	if v_u_15.FoundationSegmentedControlBeta then
		v25 = v_u_20
	else
		v25 = nil
	end
	local v26
	if v_u_15.FoundationSegmentedControlBeta then
		v26 = v_u_21
	else
		v26 = nil
	end
	local v27 = v23(v22, v24, v25, v26, v_u_19.isCircular)
	local v28
	if v_u_15.FoundationSegmentedControlBeta then
		v28 = v_u_21 == v_u_6.Fill
	else
		v28 = nil
	end
	local v_u_29 = v_u_4.useRef(nil)
	local v_u_30 = v_u_4.useRef({})
	local v_u_33 = v_u_4.useMemo(function()
		-- upvalues: (copy) v_u_30, (copy) v_u_19, (ref) v_u_4
		local v31 = v_u_30.current
		for _, v32 in v_u_19.segments do
			if v32.ref then
				v31[v32.id] = v32.ref
			else
				if v31[v32.id] then
					continue
				end
				v31[v32.id] = v_u_4.createRef()
			end
		end
		return v31
	end, { v_u_19.segments })
	local v34 = v_u_11
	local v35 = v_u_19.value
	local v36 = p_u_18 or v_u_29
	local v37 = v_u_33
	local v38
	if v_u_15.FoundationSegmentedControlBeta then
		v38 = v_u_19.size
	else
		v38 = nil
	end
	local v39
	if v_u_15.FoundationSegmentedControlBeta then
		v39 = v_u_21
	else
		v39 = nil
	end
	local v40 = v34(v35, v36, v37, v38, v39)
	local v41 = v40.activeItemHeight
	local v42 = v40.highlightPosition
	local v43 = v40.highlightWidth
	local v44, v45 = v_u_4.useBinding(Vector2.new(0, 0))
	local v_u_46 = v45
	local v_u_48 = v_u_4.useCallback(function(p47)
		-- upvalues: (ref) v_u_46
		v_u_46(p47.AbsoluteSize)
	end, { v27.container.tag })
	local v50 = v_u_4.useCallback(function(p49)
		-- upvalues: (copy) v_u_19, (ref) v_u_48
		if v_u_19.onAbsoluteSizeChanged then
			v_u_19.onAbsoluteSizeChanged(p49)
		end
		v_u_48(p49)
	end, { v_u_19.onAbsoluteSizeChanged, v_u_48 })
	local v_u_54 = v_u_4.useCallback(function(p51)
		-- upvalues: (ref) v_u_33, (copy) v_u_19
		local v52 = 0
		if p51.current then
			local v53 = v_u_33[v_u_19.value].current
			if v53 then
				v52 = v53.AbsolutePosition.Y - p51.current.AbsolutePosition.Y
			end
		end
		return v52
	end, { v_u_19.value })
	local v55 = v_u_4.createElement
	local v56 = v_u_5
	local v57 = v_u_10
	local v58 = {
		["tag"] = v_u_15.FoundationSegmentedControlBeta and v28 and "size-full-0 auto-y" or nil
	}
	local v59
	if v_u_15.FoundationSegmentedControlBeta then
		if v28 then
			v59 = nil
		else
			v59 = v44:map(function(p60)
				return UDim2.fromOffset(p60.X, p60.Y)
			end)
		end
	else
		v59 = v44:map(function(p61)
			return UDim2.fromOffset(p61.X, p61.Y)
		end)
	end
	v58.Size = v59
	local v62 = v57(v_u_19, v58)
	local v63 = {}
	local v64 = v_u_4.createElement
	local v65 = v_u_5
	local v66 = v_u_12
	local v67 = {
		["tag"] = v27.container.tag
	}
	local v68
	if v_u_15.FoundationSegmentedControlBeta then
		v68 = v27.container.stroke
	else
		v68 = nil
	end
	v67.stroke = v68
	v67.ref = p_u_18 or v_u_29
	v67.testId = ("%*--segments-container"):format(v_u_19.testId)
	v63.SegmentsContainer = v64(v65, v66(v67, {
		["onAbsoluteSizeChanged"] = v50
	}), v_u_3.map(v_u_19.segments, function(p69, p70)
		-- upvalues: (ref) v_u_4, (ref) v_u_13, (copy) v_u_19, (ref) v_u_15, (copy) v_u_20, (copy) v_u_21, (ref) v_u_33
		local v71 = (p70 - 1) * 2 + 1
		local v72 = v_u_4.createElement
		local v73 = v_u_4.Fragment
		local v74 = {}
		local v75 = p69.id
		v74.key = tostring(v75)
		local v76 = {}
		local v77 = v_u_4.createElement
		local v78 = v_u_13
		local v79 = {
			["id"] = p69.id,
			["size"] = v_u_19.size
		}
		local v80
		if v_u_15.FoundationSegmentedControlBeta then
			v80 = v_u_20
		else
			v80 = nil
		end
		v79.variant = v80
		local v81
		if v_u_15.FoundationSegmentedControlBeta then
			v81 = v_u_21
		else
			v81 = nil
		end
		v79.fillBehavior = v81
		v79.isCircular = v_u_19.isCircular
		v79.text = p69.text
		v79.icon = p69.icon
		v79.isActive = p69.id == v_u_19.value
		v79.onActivated = v_u_19.onActivated
		v79.LayoutOrder = v71
		v79.testId = ("%*--segment-%*"):format(v_u_19.testId, p69.id)
		v79.ref = v_u_33[p69.id]
		v76.Segment = v77(v78, v79)
		return v72(v73, v74, v76)
	end))
	local v82 = v_u_4.createElement
	local v83 = v_u_5
	local v84 = {
		["tag"] = v27.segment.tag
	}
	local v85
	if v_u_15.FoundationSegmentedControlBeta then
		v85 = v22.Color.Shift.Shift_300
	else
		v85 = v22.Color.Shift.Shift_400
	end
	v84.backgroundStyle = v85
	v84.Size = v_u_4.joinBindings({ v43, v41 }):map(function(p86)
		return UDim2.fromOffset(p86[1], p86[2])
	end)
	v84.Position = v42:map(function(p87)
		-- upvalues: (ref) v_u_54, (copy) p_u_18, (ref) v_u_29
		local v88 = v_u_54(p_u_18 or v_u_29)
		return UDim2.fromOffset(p87, v88)
	end)
	v84.ZIndex = v_u_19.ZIndex + 1
	v84.testId = ("%*--animated-overlay"):format(v_u_19.testId)
	v63.Overlay = v82(v83, v84)
	return v55(v56, v62, v63)
end))