-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Sheet.Content.SheetContent
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v2.React)
local v5 = require(v2.ReactUtils)
local v_u_6 = require(v1.Providers.Style.useTokens)
local v_u_7 = require(v1.Constants)
local v_u_8 = require(v1.Enums.StateLayerAffordance)
local v9 = script:FindFirstAncestor("Sheet")
local v_u_10 = require(v9.SheetContext)
local v_u_11 = require(v9.SheetType)
local v_u_12 = require(v1.Utility.Flags)
local v_u_13 = require(v1.Components.ScrollView)
require(v1.Components.Types)
local v_u_14 = require(v1.Components.View)
local v_u_15 = require(v1.Utility.devAssert)
local v_u_16 = require(v1.Utility.isScrollingFrameOverflowingY)
local v_u_17 = v5.useComposedRef
return v_u_4.memo(v_u_4.forwardRef(function(p18, p19) -- name: SheetContent
	-- upvalues: (copy) v_u_6, (copy) v_u_4, (copy) v_u_10, (copy) v_u_12, (copy) v_u_15, (copy) v_u_16, (copy) v_u_11, (copy) v_u_14, (copy) v_u_8, (copy) v_u_3, (copy) v_u_17, (copy) v_u_7, (copy) v_u_13
	local v_u_20 = v_u_6()
	local v21 = v_u_4.useContext(v_u_10)
	local v22 = v21.innerScrollingEnabled
	local v_u_23 = v21.setInnerScrollY
	local v24 = v21.innerScrollingRef
	local v25 = v21.actionsHeight
	local v26 = v21.sheetContentHeight
	local v_u_27 = v21.setHasActionsDivider
	local v_u_28 = v21.bottomPadding
	local v29 = v21.hasHeader
	local v_u_30 = v21.hasFullBleed
	local v31 = v21.fullBleedHeight
	local v32 = v21.sheetType
	local v33 = v21.testId
	local v34
	if v22 then
		if v_u_23 then
			if v25 then
				if v_u_27 then
					if v_u_28 then
						if v29 then
							v34 = v33
						else
							v34 = v29
						end
					else
						v34 = v_u_28
					end
				else
					v34 = v_u_27
				end
			else
				v34 = v25
			end
		else
			v34 = v_u_23
		end
	else
		v34 = v22
	end
	assert(v34, "SheetContent must be used within a Sheet")
	local v_u_35
	if v_u_12.FoundationSheetReversedContent then
		v_u_35 = p18.isReversed == true
	else
		v_u_35 = false
	end
	local v36
	if v_u_35 then
		v36 = v21.contentRevealOffset
	else
		v36 = nil
	end
	if v_u_12.FoundationSheetReversedContent then
		v_u_15(not (v_u_35 and v_u_30), "Sheet.Content with isReversed=true is unsupported when used with Sheet.FullBleed")
	end
	if v_u_12.FoundationSheetReversedContent then
		local v_u_37 = v21.setIsContentReversed
		v_u_4.useLayoutEffect(function()
			-- upvalues: (copy) v_u_35, (copy) v_u_37
			if not (v_u_35 and v_u_37) then
				return nil
			end
			v_u_37(true)
			return function()
				-- upvalues: (ref) v_u_37
				v_u_37(false)
			end
		end, { v_u_35, v_u_37 })
	end
	local v38, v_u_39 = v_u_4.useBinding(false)
	local v_u_40
	if v_u_12.FoundationSheetReversedContent then
		v_u_40 = v_u_4.useRef(true)
	else
		v_u_40 = nil
	end
	local v41, v_u_42
	if v_u_12.FoundationSheetReversedContent then
		v41, v_u_42 = v_u_4.useBinding(0)
	else
		v_u_42 = nil
		v41 = nil
	end
	local v49 = v_u_4.useCallback(function(p43)
		-- upvalues: (copy) v_u_35, (copy) v_u_40, (copy) v_u_23, (ref) v_u_16, (ref) v_u_42, (copy) v_u_27, (copy) v_u_39
		if v_u_35 and v_u_40.current then
			local v44 = Vector2.new
			local v45 = p43.AbsoluteCanvasSize.Y - p43.AbsoluteWindowSize.Y
			p43.CanvasPosition = v44(0, (math.max(0, v45)))
		end
		v_u_23(p43.CanvasPosition.Y)
		local v46 = v_u_16(p43, 1)
		if v_u_35 then
			v_u_42(p43.AbsoluteWindowSize.Y)
			local v47 = v_u_27
			local v48 = p43.AbsoluteCanvasSize.Y - p43.AbsoluteWindowSize.Y
			v47(math.max(0, v48) - p43.CanvasPosition.Y > 1)
		else
			v_u_27(v46)
		end
		v_u_39(v46)
	end, { v_u_35, v_u_27, v_u_23 })
	local v50, v_u_51 = v_u_4.useBinding(0)
	local v53 = v_u_4.useCallback(function(p52)
		-- upvalues: (copy) v_u_51
		v_u_51(p52.AbsoluteSize.Y)
	end, {})
	local v54
	if v36 then
		v54 = v36:map(function(p55)
			return UDim2.fromOffset(0, p55)
		end)
	else
		v54 = nil
	end
	local v56
	if v36 then
		v56 = v_u_4.joinBindings({
			["windowSizeY"] = v41,
			["revealOffset"] = v36
		}):map(function(p57)
			local v58 = UDim2.new
			local v59 = p57.windowSizeY - p57.revealOffset
			return v58(1, 0, 0, (math.max(0, v59)))
		end)
	elseif v_u_35 then
		v56 = v41:map(function(p60)
			return UDim2.new(1, 0, 0, p60)
		end)
	else
		v56 = nil
	end
	local v_u_61 = v32 == v_u_11.Bottom
	local v62
	if p18.isContentFullBleed then
		v62 = nil
	else
		v62 = UDim.new(0, v_u_20.Padding.Small)
	end
	local v_u_63 = p18.Selectable == nil and true or p18.Selectable
	local v64
	if v38 then
		v64 = v38:map(function(p65)
			-- upvalues: (copy) v_u_63
			return v_u_63 and p65
		end)
	else
		v64 = nil
	end
	local v66 = v21.isVerticalSheetGesture
	local v67 = v_u_4.createElement
	local v68 = "Folder"
	local v69 = nil
	local v70 = {}
	local v71
	if v66 then
		v71 = v_u_4.createElement(v_u_14, {
			["Size"] = nil,
			["Selectable"] = false,
			["ZIndex"] = 2,
			["testId"] = nil,
			["stateLayer"] = nil,
			["onActivated"] = nil,
			["Size"] = UDim2.fromScale(1, 1),
			["testId"] = ("%*--content--interaction-sink"):format(v33),
			["stateLayer"] = {
				["affordance"] = v_u_8.None
			},
			["onActivated"] = v_u_3.noop
		})
	else
		v71 = nil
	end
	v70.ContentInteractionSink = v71
	local v72 = v67(v68, v69, v70)
	local v73 = v_u_17(v24, p18.scrollingFrameRef)
	local v74 = v_u_4.createElement
	local v75 = v_u_14
	local v76 = {
		["onAbsoluteSizeChanged"] = v53,
		["Position"] = v54,
		["Size"] = v56,
		["tag"] = {
			["col align-x-center gap-medium size-full-0 auto-y"] = true,
			["padding-x-medium"] = not p18.isContentFullBleed,
			["align-y-bottom"] = v_u_35
		}
	}
	local v77 = {}
	local v78
	if v_u_30 and v31 then
		v78 = v_u_4.createElement(v_u_14, {
			["Size"] = v31:map(function(p79)
				return UDim2.new(1, 0, 0, (math.max(0, p79)))
			end),
			["LayoutOrder"] = v_u_7.MIN_LAYOUT_ORDER,
			["testId"] = ("%*--content--full-bleed-spacer"):format(v33)
		})
	else
		v78 = nil
	end
	v77.FullBleedSpacer = v78
	v77.Children = v_u_4.createElement(v_u_4.Fragment, nil, p18.children)
	v77.ContentInteractionSinkContainer = v72
	local v80 = v74(v75, v76, v77)
	local v81 = v_u_4.createElement
	local v82 = v_u_13
	local v83 = {
		["scrollingFrameRef"] = nil,
		["ZIndex"] = 1,
		["selection"] = nil,
		["scroll"] = nil,
		["Size"] = nil,
		["Position"] = nil,
		["padding"] = nil,
		["ClipsDescendants"] = nil,
		["onCanvasPositionChanged"] = nil,
		["onAbsoluteCanvasSizeChanged"] = nil,
		["onAbsoluteWindowSizeChanged"] = nil,
		["testId"] = nil,
		["tag"] = nil,
		["ref"] = nil,
		["scrollingFrameRef"] = v73,
		["selection"] = {
			["Selectable"] = v64,
			["NextSelectionUp"] = p18.NextSelectionUp,
			["NextSelectionDown"] = p18.NextSelectionDown,
			["NextSelectionLeft"] = p18.NextSelectionLeft,
			["NextSelectionRight"] = p18.NextSelectionRight
		}
	}
	local v84 = {
		["ScrollingEnabled"] = v22,
		["AutomaticCanvasSize"] = Enum.AutomaticSize.Y
	}
	local v85
	if v26 then
		v85 = v50:map(function(p86)
			return UDim2.new(1, 0, 0, p86)
		end)
	else
		v85 = UDim2.fromScale(1, 0)
	end
	v84.CanvasSize = v85
	v84.ScrollingDirection = Enum.ScrollingDirection.Y
	v83.scroll = v84
	local v87
	if v26 then
		v87 = UDim2.fromScale(1, 1)
	else
		v87 = nil
	end
	v83.Size = v87
	local v88
	if v36 then
		v88 = v36:map(function(p89)
			return UDim2.fromOffset(0, -p89)
		end)
	else
		v88 = nil
	end
	v83.Position = v88
	local v94 = {
		["top"] = v29:map(function(p90)
			-- upvalues: (copy) v_u_30, (copy) v_u_61, (copy) v_u_20
			if p90 or v_u_30 then
				return UDim.new(0, 0)
			end
			local v91 = UDim.new
			local v92 = 0
			local v93
			if v_u_61 then
				v93 = v_u_20.Padding.Small
			else
				v93 = v_u_20.Margin.Small
			end
			return v91(v92, v93)
		end)
	}
	local v95
	if v_u_61 then
		v95 = v25:map(function(p96)
			-- upvalues: (copy) v_u_28, (copy) v_u_20
			return UDim.new(0, p96 + v_u_28 + v_u_20.Margin.Small)
		end)
	else
		v95 = UDim.new(0, v_u_20.Padding.Small)
	end
	v94.bottom = v95
	v94.left = v62
	v94.right = v62
	v83.padding = v94
	v83.ClipsDescendants = not v_u_61 and true or v29
	function v83.onCanvasPositionChanged(p97) -- name: onCanvasPositionChanged
		-- upvalues: (copy) v_u_35, (copy) v_u_40, (copy) v_u_27, (copy) v_u_23
		if v_u_35 then
			local v98 = v_u_40
			local v99 = p97.AbsoluteCanvasSize.Y - p97.AbsoluteWindowSize.Y
			v98.current = math.max(0, v99) - p97.CanvasPosition.Y <= 1
			v_u_27(not v_u_40.current)
		end
		v_u_23(p97.CanvasPosition.Y)
	end
	v83.onAbsoluteCanvasSizeChanged = v49
	v83.onAbsoluteWindowSizeChanged = v49
	v83.testId = ("%*--content"):format(v33)
	v83.tag = v36 and "size-full" or "fill size-full-0 auto-y"
	v83.ref = p19
	local v100 = v81(v82, v83, v80)
	if v36 then
		return v_u_4.createElement(v_u_14, {
			["ClipsDescendants"] = true,
			["ZIndex"] = 1,
			["tag"] = "fill size-full-0",
			["testId"] = nil,
			["testId"] = ("%*--content--viewport"):format(v33)
		}, {
			["ScrollView"] = v100
		})
	else
		return v100
	end
end))