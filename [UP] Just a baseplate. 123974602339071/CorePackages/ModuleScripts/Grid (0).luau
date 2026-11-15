-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Grid.Grid
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v1.Enums.Breakpoint)
local v_u_4 = require(script.Parent.GridStyleSheet)
local v_u_5 = require(v2.React)
require(v1.Providers.Responsive.ResponsiveContext)
require(v1.Components.Types)
local v_u_6 = require(v1.Components.View)
local v_u_7 = require(v1.Utility.getGridMetrics)
local v_u_8 = require(v1.Providers.Responsive.Hooks.useBreakpoint)
local v_u_9 = require(v1.Providers.Responsive.useResponsive)
local v_u_10 = require(v1.Utility.withCommonProps)
local v_u_11 = require(v1.Utility.withDefaults)
local v_u_12 = {
	[Enum.ItemLineAlignment.Start] = "items-start",
	[Enum.ItemLineAlignment.Center] = "items-center",
	[Enum.ItemLineAlignment.End] = "items-end"
}
local v_u_13 = {
	["tag"] = "size-full-0 auto-y",
	["align"] = nil,
	["SortOrder"] = nil,
	["Wraps"] = true,
	["testId"] = "--foundation-grid",
	["align"] = Enum.ItemLineAlignment.Start,
	["SortOrder"] = Enum.SortOrder.LayoutOrder
}
return v_u_5.memo(v_u_5.forwardRef(function(p14, p15) -- name: Grid
	-- upvalues: (copy) v_u_11, (copy) v_u_13, (copy) v_u_9, (copy) v_u_5, (copy) v_u_8, (copy) v_u_7, (copy) v_u_3, (copy) v_u_12, (copy) v_u_6, (copy) v_u_10, (copy) v_u_4
	local v16 = v_u_11(p14, v_u_13)
	local v17 = v_u_9()
	local v18, v19 = v_u_5.useState(nil)
	local v20, v21 = v_u_8(v18)
	local v22 = v_u_7(v17.config, v20, v21.X)
	local v23 = v17.config.breakpoint.widths[v_u_3.XLarge]
	local v24 = v_u_12[v16.align]
	local v25 = v_u_5.createElement
	local v26 = v_u_6
	local v27 = v_u_10(v16, {
		["tag"] = v16.tag,
		["ref"] = p15
	})
	local v28 = {
		["GridMeasure"] = v_u_5.createElement(v_u_6, {
			["ref"] = nil,
			["tag"] = "size-full-0",
			["ref"] = v19
		}, {
			["GridMeasureSizeConstraint"] = v_u_5.createElement("UISizeConstraint", {
				["MaxSize"] = Vector2.new(v23, (1 / 0))
			})
		})
	}
	local v29 = v_u_5.createElement
	local v30 = v_u_6
	local v31 = {
		["tag"] = ("col flex-x-fill size-full-0 auto-y %*"):format(v24)
	}
	local v32 = {
		["GridStyleSheet"] = v_u_5.createElement(v_u_4, {
			["breakpoint"] = v20,
			["containerWidth"] = v21.X
		})
	}
	local v33 = v_u_5.createElement
	local v34 = v_u_6
	local v35 = {
		["tag"] = "auto-y",
		["Size"] = nil,
		["layout"] = nil,
		["Size"] = UDim2.fromOffset(v21.X, 0)
	}
	local v36 = {}
	local v37
	if v16.Wraps then
		v37 = nil
	else
		v37 = UDim.new(0, v22.gutterWidth)
	end
	v36.Padding = v37
	v36.SortOrder = v16.SortOrder
	v36.FillDirection = Enum.FillDirection.Horizontal
	local v38
	if v16.Wraps then
		v38 = Enum.UIFlexAlignment.SpaceBetween
	else
		v38 = nil
	end
	v36.HorizontalFlex = v38
	v36.Wraps = v16.Wraps
	v35.layout = v36
	v32.Grid = v33(v34, v35, {
		["GridSizeConstraint"] = v_u_5.createElement("UISizeConstraint", {
			["MaxSize"] = Vector2.new(v23, (1 / 0))
		}),
		["GridMargin"] = v_u_5.createElement("UIPadding", {
			["PaddingLeft"] = UDim.new(0, v22.margin),
			["PaddingRight"] = UDim.new(0, v22.margin)
		})
	}, v16.children)
	v28.GridAlignment = v29(v30, v31, v32)
	return v25(v26, v27, v28)
end))