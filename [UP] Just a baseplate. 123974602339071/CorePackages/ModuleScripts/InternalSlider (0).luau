-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InternalSlider.InternalSlider
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Constants)
local v_u_5 = require(v1.Utility.Input.InputMode)
require(v1.Components.Types)
local v_u_6 = require(v1.Components.View)
local v_u_7 = require(v1.Utility.Input.useLastInputMode)
local v_u_8 = require(v1.Utility.withCommonProps)
local v_u_9 = require(v1.Utility.withDefaults)
local v_u_10 = require(v1.Enums.CursorType)
local v11 = require(v1.Enums.InputSize)
local v_u_12 = require(v1.Enums.Orientation)
local v_u_13 = require(v1.Enums.StateLayerAffordance)
local v14 = require(v1.Enums.Visibility)
local v_u_15 = require(v1.Providers.Cursor.CursorComponent)
local v_u_16 = require(v1.Providers.Style.PresentationContext)
local v_u_17 = require(v1.Components.Knob.getKnobSize)
local v_u_18 = require(v1.Providers.Style.useTokens)
local v_u_19 = require(v1.Components.Slider.SliderThumb)
local v_u_20 = require(script.Parent.getKnobVisibility)
local v_u_21 = require(script.Parent.useSliderCapture)
local v_u_22 = require(script.Parent.useSliderPointerDrag)
local v_u_23 = require(script.Parent.useSliderThumbs)
local v_u_24 = {
	["range"] = nil,
	["size"] = nil,
	["width"] = nil,
	["orientation"] = nil,
	["isDisabled"] = false,
	["isContained"] = false,
	["knobVisibility"] = nil,
	["testId"] = "--foundation-internal-slider",
	["range"] = NumberRange.new(0, 1),
	["size"] = v11.Medium,
	["width"] = UDim.new(1, 0),
	["orientation"] = v_u_12.Horizontal,
	["knobVisibility"] = v14.Auto
}
local v_u_25 = {
	["SelectionBehaviorLeft"] = Enum.SelectionBehavior.Stop,
	["SelectionBehaviorRight"] = Enum.SelectionBehavior.Stop,
	["SelectionBehaviorUp"] = Enum.SelectionBehavior.Stop,
	["SelectionBehaviorDown"] = Enum.SelectionBehavior.Stop
}
local v_u_26 = {
	["SelectionBehaviorLeft"] = Enum.SelectionBehavior.Escape,
	["SelectionBehaviorRight"] = Enum.SelectionBehavior.Escape,
	["SelectionBehaviorUp"] = Enum.SelectionBehavior.Escape,
	["SelectionBehaviorDown"] = Enum.SelectionBehavior.Escape
}
local function v_u_27() -- name: noop end
return v_u_3.forwardRef(function(p28, p29) -- name: InternalSlider
	-- upvalues: (copy) v_u_9, (copy) v_u_24, (copy) v_u_12, (copy) v_u_18, (copy) v_u_16, (copy) v_u_7, (copy) v_u_3, (copy) v_u_17, (copy) v_u_23, (copy) v_u_21, (copy) v_u_22, (copy) v_u_5, (copy) v_u_20, (copy) v_u_6, (copy) v_u_13, (copy) v_u_10, (copy) v_u_25, (copy) v_u_27, (copy) v_u_15, (copy) v_u_19, (copy) v_u_8, (copy) v_u_4, (copy) v_u_26
	local v30 = v_u_9(p28, v_u_24)
	local v_u_31 = v30.orientation == v_u_12.Vertical
	local v32 = v_u_18()
	local v33 = v_u_16.usePresentationContext()
	local v34 = v_u_7()
	local v_u_35 = v_u_3.useRef(nil)
	v_u_3.useImperativeHandle(p29, function()
		-- upvalues: (copy) v_u_35
		return v_u_35.current
	end, {})
	local v36 = v_u_17(v32, v30.size)
	local v37, v_u_38 = v_u_3.useBinding(v36)
	local v40 = v_u_3.useCallback(function(p39)
		-- upvalues: (copy) v_u_38
		v_u_38(UDim2.fromOffset(p39.AbsoluteSize.X, p39.AbsoluteSize.Y))
	end, {})
	local v_u_41 = v_u_23({
		["thumbs"] = v30.thumbs,
		["range"] = v30.range,
		["step"] = v30.step,
		["onValueChanged"] = v30.onValueChanged
	})
	local v42 = v_u_21({
		["thumbs"] = v30.thumbs,
		["rootRef"] = v_u_35,
		["range"] = v30.range,
		["step"] = v30.step,
		["isVertical"] = v_u_31,
		["isDisabled"] = v30.isDisabled,
		["updateThumbValue"] = v_u_41.updateThumbValue,
		["clampToNeighbors"] = v_u_41.clampToNeighbors
	})
	local v_u_43 = v_u_22({
		["thumbs"] = v30.thumbs,
		["rootRef"] = v_u_35,
		["isVertical"] = v_u_31,
		["toFraction"] = v_u_41.toFraction,
		["seekThumb"] = v_u_41.seekThumb,
		["setActiveIndex"] = v42.setActiveIndex,
		["onDragStarted"] = v30.onDragStarted,
		["onDragEnded"] = v30.onDragEnded
	})
	local v44
	if v34 == v_u_5.Directional then
		v44 = v42.isSelected
	else
		v44 = false
	end
	local v45 = v34 ~= v_u_5.Directional
	local v46 = v_u_20({
		["knobVisibility"] = v30.knobVisibility,
		["controlState"] = v42.controlState,
		["isDisabled"] = v30.isDisabled,
		["isSelected"] = v42.isSelected,
		["isDragging"] = v_u_43.draggedIndex ~= nil
	})
	local v47 = UDim.new(0, v36.X.Offset)
	local v48
	if v_u_31 then
		v48 = UDim2.new(v47, v30.width)
	else
		v48 = UDim2.new(v30.width, v47)
	end
	local v49 = {}
	local v50 = v_u_3.createElement
	local v51 = v_u_6
	local v52 = {
		["Size"] = nil,
		["stateLayer"] = nil,
		["cursor"] = nil,
		["onStateChanged"] = nil,
		["isDisabled"] = nil,
		["ref"] = nil,
		["ZIndex"] = 0,
		["testId"] = nil,
		["Size"] = UDim2.fromScale(1, 1),
		["stateLayer"] = {
			["affordance"] = v_u_13.None
		}
	}
	local v53
	if v42.isCaptured then
		v53 = v_u_10.Invisible
	else
		v53 = nil
	end
	v52.cursor = v53
	v52.onStateChanged = v42.onStateChanged
	v52.isDisabled = v30.isDisabled
	v52.ref = v42.focusTargetRef
	v52.testId = ("%*--focus-target"):format(v30.testId)
	local v54 = {}
	local v55
	if v44 then
		v55 = nil
	else
		v55 = v_u_3.createElement("UIDragDetector", {
			["DragStyle"] = Enum.UIDragDetectorDragStyle.Scriptable,
			[v_u_3.Event.DragStart] = v_u_43.onTrackDragStarted,
			[v_u_3.Event.DragContinue] = v_u_43.onTrackDrag,
			[v_u_3.Event.DragEnd] = v_u_43.onTrackDragEnded,
			["SelectionModeDragSpeed"] = UDim2.new(),
			["Enabled"] = not v30.isDisabled
		})
	end
	v54.DragDetector = v55
	v49.FocusTarget = v50(v51, v52, v54)
	v49.Track = v_u_3.createElement(v_u_3.Fragment, nil, v30.children)
	local v56
	if v42.isCaptured then
		local v57 = v_u_3.createElement
		local v58 = v_u_6
		local v59 = {
			["Size"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["ZIndex"] = 3,
			["selection"] = nil,
			["selectionGroup"] = nil,
			["cursor"] = nil,
			["onStateChanged"] = nil,
			["ref"] = nil,
			["testId"] = nil,
			["Size"] = v37
		}
		local v60
		if v30.isContained then
			v60 = v_u_41.fractions[v42.activeThumbIndex]:map(function(p61)
				-- upvalues: (copy) v_u_31
				if v_u_31 then
					return Vector2.new(0.5, 1 - p61)
				else
					return Vector2.new(p61, 0.5)
				end
			end)
		else
			v60 = Vector2.new(0.5, 0.5)
		end
		v59.AnchorPoint = v60
		v59.Position = v_u_41.fractions[v42.activeThumbIndex]:map(function(p62)
			-- upvalues: (copy) v_u_31
			if v_u_31 then
				return UDim2.fromScale(0.5, 1 - p62)
			else
				return UDim2.fromScale(p62, 0.5)
			end
		end)
		v59.selection = {
			["Selectable"] = true
		}
		v59.selectionGroup = v_u_25
		v59.cursor = v_u_10.Invisible
		v59.onStateChanged = v_u_27
		v59.ref = v42.captureTargetRef
		v59.testId = ("%*--selection-cursor"):format(v30.testId)
		v56 = v57(v58, v59, {
			["Cursor"] = v_u_3.createElement(v_u_15, {
				["isVisible"] = true,
				["cornerRadius"] = nil,
				["offset"] = nil,
				["borderWidth"] = nil,
				["colorNamespace"] = nil,
				["cornerRadius"] = UDim.new(0.5, 0),
				["offset"] = v32.Padding.XSmall,
				["borderWidth"] = v32.Stroke.Thicker,
				["colorNamespace"] = v33.colorNamespace
			})
		})
	else
		v56 = nil
	end
	v49.SelectionCursor = v56
	for v_u_63, v64 in v30.thumbs do
		v49[("Thumb%*"):format(v_u_63)] = v_u_3.createElement(v_u_19, {
			["trackRef"] = v_u_35,
			["fraction"] = v_u_41.fractions[v_u_63],
			["isVertical"] = v_u_31,
			["Visible"] = v46,
			["isDisabled"] = v30.isDisabled,
			["isDragEnabled"] = v45,
			["isContained"] = v30.isContained,
			["knob"] = v30.renderThumb(v_u_63, {
				["isVisible"] = v46,
				["isDragging"] = v_u_43.draggedIndex == v_u_63
			}),
			["onSeek"] = function(p65) -- name: onSeek
				-- upvalues: (copy) v_u_41, (copy) v_u_63
				v_u_41.seekThumb(v_u_63, p65)
			end,
			["getBounds"] = function() -- name: getBounds
				-- upvalues: (copy) v_u_41, (copy) v_u_63
				return v_u_41.getThumbBounds(v_u_63)
			end,
			["onDragStarted"] = function() -- name: onDragStarted
				-- upvalues: (copy) v_u_43, (copy) v_u_63
				v_u_43.onThumbDragStarted(v_u_63)
			end,
			["onDragEnded"] = v_u_43.onThumbDragEnded,
			["onAbsoluteSizeChanged"] = v40,
			["testId"] = v64.testId
		})
	end
	local v66 = v_u_3.createElement
	local v67 = v_u_6
	local v68 = v_u_8
	local v69 = {
		["Size"] = v48
	}
	local v70
	if v30.isDisabled then
		v70 = v_u_4.DISABLED_TRANSPARENCY
	else
		v70 = nil
	end
	v69.GroupTransparency = v70
	local v71
	if v42.isCaptured then
		v71 = v_u_25
	else
		v71 = v_u_26
	end
	v69.selectionGroup = v71
	v69.ref = v_u_35
	return v66(v67, v68(v30, v69), v49)
end)