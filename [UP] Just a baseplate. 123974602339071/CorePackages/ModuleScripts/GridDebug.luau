-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Grid.Debug.GridDebug
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v1.Enums.Breakpoint)
local v_u_4 = require(script.Parent.GridDebugStyleSheet)
local v_u_5 = require(v2.React)
local v_u_6 = require(v1.Providers.Style.StyleSheetContext)
local v_u_7 = require(v1.Components.Text)
local v_u_8 = require(v1.Components.View)
local v_u_9 = require(v1.Utility.getGridMetrics)
local v_u_10 = require(v1.Providers.Responsive.Hooks.useBreakpoint)
local v_u_11 = require(v1.Providers.Responsive.useResponsive)
local v_u_12 = require(v1.Providers.Style.useTokens)
local v_u_13 = require(v1.Utility.withDefaults)
local function v_u_15(p14) -- name: DebugCol
	-- upvalues: (copy) v_u_5, (copy) v_u_8
	return v_u_5.createElement(v_u_8, {
		["Size"] = p14.size or UDim2.new(0, p14.width or 0, 1, 0),
		["backgroundStyle"] = p14.backgroundStyle,
		["LayoutOrder"] = p14.LayoutOrder,
		["tag"] = p14.tag
	})
end
local v_u_16 = {
	["debugTransparency"] = 0.7
}
return function(p17) -- name: GridDebug
	-- upvalues: (copy) v_u_13, (copy) v_u_16, (copy) v_u_12, (copy) v_u_5, (copy) v_u_11, (copy) v_u_10, (copy) v_u_9, (copy) v_u_3, (copy) v_u_15, (copy) v_u_8, (copy) v_u_4, (copy) v_u_7, (copy) v_u_6
	local v18 = v_u_13(p17, v_u_16)
	local v19 = v_u_12()
	local v20, v21 = v_u_5.useState(nil)
	local v22 = v_u_11()
	local v23, v24 = v_u_5.useState(nil)
	local v25, v26 = v_u_10(v23)
	local v27 = v_u_9(v22.config, v25, v26.X)
	local v28 = v22.config.breakpoint.widths[v_u_3.XLarge]
	local v29 = ({
		[Enum.ItemLineAlignment.Start] = "position-top-left anchor-top-left",
		[Enum.ItemLineAlignment.Center] = "position-top-center anchor-top-center",
		[Enum.ItemLineAlignment.End] = "position-top-right anchor-top-right"
	})[v18.align]
	local v30 = {}
	for v31 = 1, v27.full.colCount - 1 do
		if v31 >= v27.full.colCount then
			continue
		end
		local v32 = v_u_5.createElement
		local v33 = v_u_15
		local v34 = {
			["key"] = ("DebugCol%*"):format(v31),
			["width"] = v27.gutterWidth,
			["backgroundStyle"] = {
				["Color3"] = nil,
				["Transparency"] = 0.5,
				["Color3"] = v19.Color.System.Alert.Color3
			},
			["LayoutOrder"] = v31
		}
		table.insert(v30, v32(v33, v34))
	end
	local v35 = v_u_5.createElement
	local v36 = v_u_8
	local v37 = {
		["tag"] = ("size-full-full %*"):format(v29)
	}
	local v38 = {
		["GridDebugStyleSheet"] = v_u_5.createElement(v_u_4, {
			["breakpoint"] = v25,
			["ref"] = v21
		}),
		["GridDebugMeasureWrapper"] = v_u_5.createElement(v_u_8, {
			["ref"] = nil,
			["tag"] = "size-full-0",
			["ref"] = v24
		}, {
			["GridMeasureSizeConstraint"] = v_u_5.createElement("UISizeConstraint", {
				["MaxSize"] = Vector2.new(v28, (1 / 0))
			})
		}),
		["GridDebugMeasure"] = v_u_5.createElement(v_u_8, {
			["Size"] = UDim2.new(1, 0, 0, 4),
			["backgroundStyle"] = {
				["Color3"] = Color3.fromRGB(255, 0, 0),
				["Transparency"] = v18.debugTransparency
			}
		}),
		["GridDebugSizeConstraint"] = v_u_5.createElement("UISizeConstraint", {
			["MaxSize"] = Vector2.new(v28, (1 / 0))
		}),
		["GridDebugSizeLabel"] = v_u_5.createElement(v_u_7, {
			["tag"] = "position-top-center anchor-top-center auto-xy padding-xxsmall text-label-small text-truncate-end bg-over-media-300",
			["Text"] = nil,
			["Text"] = ("breakpoint: %*, width: %*, columns: %*, maxWidth: %*, margin: %*, gapWidth: %*"):format(v22.config.breakpoint.shortNames[v25], v26.X, v27.full.colCount, v28, v27.margin, v27.gutterWidth)
		})
	}
	local v39 = v_u_5.createElement
	local v40 = v_u_8
	local v41 = {
		["tag"] = "row size-full-full",
		["backgroundStyle"] = nil,
		["backgroundStyle"] = {
			["Color3"] = v19.Color.System.Emphasis.Color3,
			["Transparency"] = v18.debugTransparency
		}
	}
	local v42 = {
		["LeftMargin"] = v_u_5.createElement(v_u_15, {
			["width"] = nil,
			["backgroundStyle"] = nil,
			["LayoutOrder"] = 0,
			["width"] = v27.margin,
			["backgroundStyle"] = {
				["Color3"] = v19.Color.System.Warning.Color3,
				["Transparency"] = v18.debugTransparency
			}
		}),
		["Columns"] = v_u_5.createElement(v_u_8, {
			["tag"] = "row flex-x-evenly fill size-0-full",
			["backgroundStyle"] = nil,
			["LayoutOrder"] = 1,
			["backgroundStyle"] = {
				["Color3"] = v19.Color.System.Emphasis.Color3,
				["Transparency"] = v18.debugTransparency
			}
		}, v30),
		["RightMargin"] = v_u_5.createElement(v_u_15, {
			["width"] = nil,
			["backgroundStyle"] = nil,
			["LayoutOrder"] = 2,
			["width"] = v27.margin,
			["backgroundStyle"] = {
				["Color3"] = v19.Color.System.Warning.Color3,
				["Transparency"] = v18.debugTransparency
			}
		})
	}
	v38.GridDebug = v39(v40, v41, v42)
	local v43
	if v20 then
		v43 = v_u_5.createElement(v_u_6.Provider, {
			["value"] = v20
		}, v_u_5.createElement(v_u_8, {
			["tag"] = "size-full-full"
		}, {
			["GridDebugPadding"] = v_u_5.createElement("UIPadding", {
				["PaddingTop"] = UDim.new(0, v27.gapHeight * 2)
			}),
			["GridDebugChildren"] = v_u_5.createElement(v_u_5.Fragment, nil, p17.children)
		}))
	else
		v43 = nil
	end
	v38.GridDebugContent = v43
	return v35(v36, v37, v38)
end