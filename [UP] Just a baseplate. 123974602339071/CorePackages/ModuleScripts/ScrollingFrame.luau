-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.ScrollView.ScrollingFrame
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactOtter)
require(v1.Components.Types)
local v_u_5 = require(v1.Utility.withDefaults)
local v_u_6 = require(v1.Utility.withGuiObjectProps)
local v_u_7 = require(v1.Providers.Cursor.useCursor)
local v_u_8 = require(v1.Providers.Style.useStyleTags)
local v_u_9 = require(v1.Providers.Style.useTokens)
local v_u_10 = require(v1.Enums.Visibility)
local v_u_11 = require(v1.Enums.ControlState)
local v_u_12 = {
	["frequency"] = 2
}
local v_u_13 = {
	["scrollBarVisibility"] = "Auto"
}
return v_u_3.memo(v_u_3.forwardRef(function(p14, p15) -- name: ScrollingFrame
	-- upvalues: (copy) v_u_5, (copy) v_u_13, (copy) v_u_6, (copy) v_u_9, (copy) v_u_8, (copy) v_u_3, (copy) v_u_10, (copy) v_u_7, (copy) v_u_4, (copy) v_u_12, (copy) v_u_11
	local v_u_16 = v_u_5(p14, v_u_13)
	local v17 = v_u_6({
		["selection"] = v_u_16.selection
	}, {})
	local v_u_18 = v_u_9()
	local v19 = v_u_8(p14.tag)
	local v_u_20 = v_u_18.Color.Shift.Shift_400
	local v21 = v_u_3.useMemo(function()
		-- upvalues: (copy) v_u_16, (ref) v_u_10, (copy) v_u_18
		return v_u_16.scrollBarVisibility == v_u_10.None and 0 or v_u_18.Size.Size_150
	end, { v_u_16.scrollBarVisibility })
	local v22 = v_u_7()
	local v_u_23 = v_u_3.useRef(nil)
	local v24, v_u_25 = v_u_4.useAnimatedBinding(1)
	local v_u_28 = v_u_3.useCallback(function(p26, p27)
		-- upvalues: (copy) v_u_23, (copy) v_u_25, (ref) v_u_4, (copy) v_u_20, (ref) v_u_12
		if v_u_23.current then
			task.cancel(v_u_23.current)
		end
		if p26 then
			v_u_25(v_u_4.spring(v_u_20.Transparency, v_u_12))
		end
		if p27 ~= nil then
			v_u_23.current = task.delay(p27, function()
				-- upvalues: (ref) v_u_25, (ref) v_u_4, (ref) v_u_12
				v_u_25(v_u_4.spring(1, v_u_12))
			end)
		end
	end, { v_u_20 })
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_16, (copy) v_u_28, (ref) v_u_11
		if v_u_16.scrollBarVisibility == "None" then
			v_u_28(false, 0)
			return
		elseif v_u_16.scrollBarVisibility == "Always" then
			v_u_28(true)
		else
			v_u_28((v_u_16.controlState == v_u_11.Hover or v_u_16.controlState == v_u_11.Selected) and true or v_u_16.controlState == v_u_11.Pressed, v_u_16.controlState == v_u_11.Default and 0 or nil)
		end
	end, { v_u_16.scrollBarVisibility, v_u_16.controlState })
	return v_u_3.createElement("ScrollingFrame", {
		["AutomaticCanvasSize"] = v_u_16.AutomaticCanvasSize,
		["CanvasSize"] = v_u_16.CanvasSize,
		["ClipsDescendants"] = v_u_16.ClipsDescendants,
		["ScrollingDirection"] = v_u_16.ScrollingDirection,
		["ScrollingEnabled"] = v_u_16.ScrollingEnabled,
		["ScrollBarImageColor3"] = v_u_20.Color3,
		["ScrollBarImageTransparency"] = v24,
		["ScrollBarThickness"] = v21,
		["VerticalScrollBarInset"] = v_u_16.VerticalScrollBarInset,
		["HorizontalScrollBarInset"] = v_u_16.HorizontalScrollBarInset,
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["AutomaticSize"] = v_u_16.AutomaticSize,
		["Size"] = UDim2.fromScale(1, 1),
		["Selectable"] = v17.Selectable,
		["NextSelectionUp"] = v17.NextSelectionUp,
		["NextSelectionDown"] = v17.NextSelectionDown,
		["NextSelectionLeft"] = v17.NextSelectionLeft,
		["NextSelectionRight"] = v17.NextSelectionRight,
		["SelectionImageObject"] = v17.SelectionImageObject or v22,
		["SelectionOrder"] = v17.SelectionOrder,
		[v_u_3.Change.CanvasPosition] = v_u_16.scrollBarVisibility == "Auto" and function(p29)
			-- upvalues: (copy) v_u_28, (copy) v_u_16
			v_u_28(true, 3)
			if v_u_16.onCanvasPositionChanged then
				v_u_16.onCanvasPositionChanged(p29)
			end
		end or v_u_16.onCanvasPositionChanged,
		[v_u_3.Change.AbsoluteCanvasSize] = v_u_16.onAbsoluteCanvasSizeChanged,
		[v_u_3.Change.AbsoluteWindowSize] = v_u_16.onAbsoluteWindowSizeChanged,
		["ref"] = p15,
		[v_u_3.Tag] = v19
	}, v_u_16.children)
end))