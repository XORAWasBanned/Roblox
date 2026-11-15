-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.ScrollView.ScrollView
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(script.Parent.ScrollingFrame)
require(v1.Components.Types)
local v_u_5 = require(v1.Components.View)
local v_u_6 = require(v1.Utility.useDefaultTags)
local v_u_7 = require(v1.Utility.withDefaults)
local v_u_8 = require(v1.Providers.Style.useStyleTags)
local v9 = require(v1.Enums.Visibility)
local v_u_10 = require(v1.Enums.ControlState)
local v_u_11 = {
	["layout"] = nil,
	["scroll"] = nil,
	["AutoLocalize"] = false,
	["BorderSizePixel"] = 0,
	["ClipsDescendants"] = true,
	["isDisabled"] = false,
	["testId"] = "--foundation-scroll-view",
	["layout"] = {
		["SortOrder"] = Enum.SortOrder.LayoutOrder
	},
	["scroll"] = {
		["scrollBarVisibility"] = v9.Auto
	}
}
return v_u_3.memo(v_u_3.forwardRef(function(p12, p13) -- name: ScrollView
	-- upvalues: (copy) v_u_7, (copy) v_u_11, (copy) v_u_6, (copy) v_u_8, (copy) v_u_3, (copy) v_u_10, (copy) v_u_5, (copy) v_u_4
	local v_u_14 = v_u_7(p12, v_u_11)
	local v15 = v_u_8((v_u_6(v_u_14.tag, "gui-object-defaults")))
	local v16, v_u_17 = v_u_3.useState(v_u_10.Initialize)
	local v18 = table.clone(v_u_14)
	function v18.onStateChanged(p19) -- name: onStateChanged
		-- upvalues: (copy) v_u_17, (copy) v_u_14
		v_u_17(p19)
		if v_u_14.onStateChanged ~= nil then
			v_u_14.onStateChanged(p19)
		end
	end
	v18.stateLayer = not (v_u_14.onStateChanged or v_u_14.onActivated) and {
		["affordance"] = "None"
	} or v_u_14.stateLayer
	v18.selection = {
		["Selectable"] = false
	}
	v18.ref = p13
	v18[v_u_3.Tag] = v15
	v18.scroll = nil
	v18.layout = nil
	local v20 = {
		["ListLayout"] = v_u_3.createElement("UIListLayout", {
			["FillDirection"] = v_u_14.layout.FillDirection,
			["ItemLineAlignment"] = v_u_14.layout.ItemLineAlignment,
			["HorizontalAlignment"] = v_u_14.layout.HorizontalAlignment,
			["HorizontalFlex"] = v_u_14.layout.HorizontalFlex,
			["VerticalAlignment"] = v_u_14.layout.VerticalAlignment,
			["VerticalFlex"] = v_u_14.layout.VerticalFlex,
			["Padding"] = v_u_14.layout.Padding,
			["SortOrder"] = v_u_14.layout.SortOrder,
			["Wraps"] = v_u_14.layout.Wraps
		})
	}
	if v_u_14.children then
		local v21 = v_u_14.children
		if typeof(v21) == "table" and (v_u_14.layout ~= nil and v_u_14.layout.FillDirection ~= nil) then
			for v22, v23 in v_u_14.children do
				v20[v22] = v23
			end
			return v_u_3.createElement(v_u_5, v18, {
				["ScrollingFrame"] = v_u_3.createElement(v_u_4, {
					["controlState"] = nil,
					["selection"] = nil,
					["scrollBarVisibility"] = nil,
					["onCanvasPositionChanged"] = nil,
					["onAbsoluteCanvasSizeChanged"] = nil,
					["onAbsoluteWindowSizeChanged"] = nil,
					["AutomaticSize"] = nil,
					["AutomaticCanvasSize"] = nil,
					["CanvasSize"] = nil,
					["ClipsDescendants"] = false,
					["ScrollingDirection"] = nil,
					["ScrollingEnabled"] = nil,
					["VerticalScrollBarInset"] = nil,
					["HorizontalScrollBarInset"] = nil,
					["ref"] = nil,
					["controlState"] = v16,
					["selection"] = v_u_14.selection,
					["scrollBarVisibility"] = v_u_14.scroll.scrollBarVisibility,
					["onCanvasPositionChanged"] = v_u_14.onCanvasPositionChanged,
					["onAbsoluteCanvasSizeChanged"] = v_u_14.onAbsoluteCanvasSizeChanged,
					["onAbsoluteWindowSizeChanged"] = v_u_14.onAbsoluteWindowSizeChanged,
					["AutomaticSize"] = v_u_14.scroll.AutomaticSize,
					["AutomaticCanvasSize"] = v_u_14.scroll.AutomaticCanvasSize,
					["CanvasSize"] = v_u_14.scroll.CanvasSize,
					["ScrollingDirection"] = v_u_14.scroll.ScrollingDirection,
					["ScrollingEnabled"] = v_u_14.scroll.ScrollingEnabled,
					["VerticalScrollBarInset"] = v_u_14.scroll.VerticalScrollBarInset,
					["HorizontalScrollBarInset"] = v_u_14.scroll.HorizontalScrollBarInset,
					["ref"] = v_u_14.scrollingFrameRef
				}, v20)
			})
		else
			v20 = v_u_14.children
			return v_u_3.createElement(v_u_5, v18, {
				["ScrollingFrame"] = v_u_3.createElement(v_u_4, {
					["controlState"] = nil,
					["selection"] = nil,
					["scrollBarVisibility"] = nil,
					["onCanvasPositionChanged"] = nil,
					["onAbsoluteCanvasSizeChanged"] = nil,
					["onAbsoluteWindowSizeChanged"] = nil,
					["AutomaticSize"] = nil,
					["AutomaticCanvasSize"] = nil,
					["CanvasSize"] = nil,
					["ClipsDescendants"] = false,
					["ScrollingDirection"] = nil,
					["ScrollingEnabled"] = nil,
					["VerticalScrollBarInset"] = nil,
					["HorizontalScrollBarInset"] = nil,
					["ref"] = nil,
					["controlState"] = v16,
					["selection"] = v_u_14.selection,
					["scrollBarVisibility"] = v_u_14.scroll.scrollBarVisibility,
					["onCanvasPositionChanged"] = v_u_14.onCanvasPositionChanged,
					["onAbsoluteCanvasSizeChanged"] = v_u_14.onAbsoluteCanvasSizeChanged,
					["onAbsoluteWindowSizeChanged"] = v_u_14.onAbsoluteWindowSizeChanged,
					["AutomaticSize"] = v_u_14.scroll.AutomaticSize,
					["AutomaticCanvasSize"] = v_u_14.scroll.AutomaticCanvasSize,
					["CanvasSize"] = v_u_14.scroll.CanvasSize,
					["ScrollingDirection"] = v_u_14.scroll.ScrollingDirection,
					["ScrollingEnabled"] = v_u_14.scroll.ScrollingEnabled,
					["VerticalScrollBarInset"] = v_u_14.scroll.VerticalScrollBarInset,
					["HorizontalScrollBarInset"] = v_u_14.scroll.HorizontalScrollBarInset,
					["ref"] = v_u_14.scrollingFrameRef
				}, v20)
			})
		end
	else
		v20 = v_u_14.children
		return v_u_3.createElement(v_u_5, v18, {
			["ScrollingFrame"] = v_u_3.createElement(v_u_4, {
				["controlState"] = nil,
				["selection"] = nil,
				["scrollBarVisibility"] = nil,
				["onCanvasPositionChanged"] = nil,
				["onAbsoluteCanvasSizeChanged"] = nil,
				["onAbsoluteWindowSizeChanged"] = nil,
				["AutomaticSize"] = nil,
				["AutomaticCanvasSize"] = nil,
				["CanvasSize"] = nil,
				["ClipsDescendants"] = false,
				["ScrollingDirection"] = nil,
				["ScrollingEnabled"] = nil,
				["VerticalScrollBarInset"] = nil,
				["HorizontalScrollBarInset"] = nil,
				["ref"] = nil,
				["controlState"] = v16,
				["selection"] = v_u_14.selection,
				["scrollBarVisibility"] = v_u_14.scroll.scrollBarVisibility,
				["onCanvasPositionChanged"] = v_u_14.onCanvasPositionChanged,
				["onAbsoluteCanvasSizeChanged"] = v_u_14.onAbsoluteCanvasSizeChanged,
				["onAbsoluteWindowSizeChanged"] = v_u_14.onAbsoluteWindowSizeChanged,
				["AutomaticSize"] = v_u_14.scroll.AutomaticSize,
				["AutomaticCanvasSize"] = v_u_14.scroll.AutomaticCanvasSize,
				["CanvasSize"] = v_u_14.scroll.CanvasSize,
				["ScrollingDirection"] = v_u_14.scroll.ScrollingDirection,
				["ScrollingEnabled"] = v_u_14.scroll.ScrollingEnabled,
				["VerticalScrollBarInset"] = v_u_14.scroll.VerticalScrollBarInset,
				["HorizontalScrollBarInset"] = v_u_14.scroll.HorizontalScrollBarInset,
				["ref"] = v_u_14.scrollingFrameRef
			}, v20)
		})
	end
end))