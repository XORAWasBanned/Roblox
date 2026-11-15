-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Slider.SliderThumb
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
require(v1.Components.Types)
local v_u_4 = require(v1.Utility.withCommonProps)
local v_u_5 = require(v1.Components.Knob)
local v_u_6 = require(v1.Components.View)
local v7 = require(v1.Enums.ColorNamespace)
local v_u_8 = require(v1.Providers.Style.PresentationContext)
require(v1.Enums.InputSize)
local v_u_9 = require(script.Parent.calculateSliderFraction)
local v_u_10 = require(script.Parent.getGuiInputPosition)
local v_u_11 = {
	["colorNamespace"] = v7.Inverse
}
return function(p_u_12) -- name: SliderThumb
	-- upvalues: (copy) v_u_3, (copy) v_u_9, (copy) v_u_10, (copy) v_u_5, (copy) v_u_6, (copy) v_u_4, (copy) v_u_8, (copy) v_u_11
	local v_u_13 = v_u_3.useRef(p_u_12.fraction:getValue())
	local v14 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_13, (copy) p_u_12
		v_u_13.current = p_u_12.fraction:getValue()
		if p_u_12.onDragStarted then
			p_u_12.onDragStarted()
		end
	end, { p_u_12.fraction, p_u_12.onDragStarted })
	local v21 = v_u_3.useCallback(function(_, p15)
		-- upvalues: (copy) p_u_12, (ref) v_u_9, (ref) v_u_10, (copy) v_u_13
		local v16 = p_u_12.trackRef.current
		if v16 then
			local v17 = v_u_9(v_u_10(p15, v16), v16, p_u_12.isVertical)
			local v18, v19 = p_u_12.getBounds()
			local v20 = math.clamp(v17, v18, v19)
			if v20 ~= v_u_13.current then
				v_u_13.current = v20
				p_u_12.onSeek(v20)
			end
		end
	end, {
		p_u_12.trackRef,
		p_u_12.isVertical,
		p_u_12.getBounds,
		p_u_12.onSeek
	})
	local v22 = v_u_3.useCallback(function()
		-- upvalues: (copy) p_u_12
		if p_u_12.onDragEnded then
			p_u_12.onDragEnded()
		end
	end, { p_u_12.onDragEnded })
	local v24 = p_u_12.fraction:map(function(p23)
		-- upvalues: (copy) p_u_12
		if p_u_12.isVertical then
			return UDim2.fromScale(0.5, 1 - p23)
		else
			return UDim2.fromScale(p23, 0.5)
		end
	end)
	local v25
	if p_u_12.isContained then
		v25 = p_u_12.fraction:map(function(p26)
			-- upvalues: (copy) p_u_12
			if p_u_12.isVertical then
				return Vector2.new(0.5, 1 - p26)
			else
				return Vector2.new(p26, 0.5)
			end
		end)
	else
		v25 = Vector2.new(0.5, 0.5)
	end
	local v27
	if p_u_12.knobAppearance then
		v27 = v_u_3.createElement(v_u_5, {
			["size"] = p_u_12.knobAppearance.size,
			["style"] = p_u_12.knobAppearance.style,
			["stroke"] = p_u_12.knobAppearance.stroke,
			["hasShadow"] = p_u_12.knobAppearance.hasShadow,
			["testId"] = ("%*--knob"):format(p_u_12.testId)
		})
	else
		v27 = nil
	end
	local v28 = {
		["AnchorPoint"] = p_u_12.AnchorPoint or v25,
		["Position"] = p_u_12.Position or v24,
		["ZIndex"] = p_u_12.ZIndex or 2,
		["Visible"] = p_u_12.Visible,
		["LayoutOrder"] = p_u_12.LayoutOrder,
		["onAbsoluteSizeChanged"] = p_u_12.onAbsoluteSizeChanged,
		["onAbsolutePositionChanged"] = p_u_12.onAbsolutePositionChanged,
		["testId"] = p_u_12.testId
	}
	local v29 = v_u_3.createElement
	local v30 = v_u_6
	local v31 = v_u_4(v28, {
		["tag"] = "size-0-0 auto-xy"
	})
	local v32 = {}
	local v33 = v_u_3.createElement
	local v34 = v_u_6
	local v35 = {
		["tag"] = "size-full",
		["ZIndex"] = 2,
		["testId"] = nil,
		["testId"] = ("%*--drag-target"):format(p_u_12.testId)
	}
	local v36 = {}
	local v37
	if p_u_12.isDragEnabled == false then
		v37 = nil
	else
		v37 = v_u_3.createElement("UIDragDetector", {
			["DragStyle"] = Enum.UIDragDetectorDragStyle.Scriptable,
			[v_u_3.Event.DragStart] = v14,
			[v_u_3.Event.DragContinue] = v21,
			[v_u_3.Event.DragEnd] = v22,
			["Enabled"] = not p_u_12.isDisabled
		})
	end
	v36.DragDetector = v37
	v32.DragTarget = v33(v34, v35, v36)
	local v38
	if p_u_12.knob then
		v38 = v_u_3.createElement(v_u_6, {
			["tag"] = "size-0-0 auto-xy",
			["testId"] = nil,
			["testId"] = ("%*--custom-knob"):format(p_u_12.testId)
		}, p_u_12.knob)
	else
		local v39 = {
			["value"] = v_u_11
		}
		v38 = v_u_3.createElement(v_u_8.Provider, v39, {
			["Knob"] = v27
		})
	end
	v32.Knob = v38
	return v29(v30, v31, v32)
end