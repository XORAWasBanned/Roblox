-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Toggle.useToggleVariants
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Components.InternalInput)
local v_u_2 = require(v1.Enums.InputSize)
require(v1.Enums.ControlState)
local v_u_3 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
local v_u_4 = require(v1.Providers.Style.VariantsContext)
local v_u_5 = require(v1.Components.Knob.getKnobSize)
local function v_u_11(p6) -- name: computeProps
	local v7 = p6.knobSize.X.Offset
	local v8 = (p6.size.height - v7) / 2
	local v9 = {}
	local v10 = {
		["tag"] = p6.tag,
		["size"] = UDim2.fromOffset(p6.size.width, p6.size.height),
		["stroke"] = {
			["thickness"] = p6.strokeThickness
		}
	}
	v9.input = v10
	v9.knob = {
		["offPosition"] = UDim2.new(0, v8, 0.5, 0),
		["onPosition"] = UDim2.new(0, p6.size.width - v7 - v8, 0.5, 0)
	}
	return v9
end
local function v_u_28(p12) -- name: variantsFactory
	-- upvalues: (copy) v_u_2, (copy) v_u_11, (copy) v_u_5
	local v13 = {}
	local v14 = {
		["colors"] = {
			["backgroundStyle"] = p12.Color.ActionStandard.Background,
			["hoverStyle"] = p12.Color.State.Hover,
			["checkedStyle"] = p12.Color.System.Contrast,
			["labelStyle"] = p12.Color.Content.Emphasis,
			["labelHoverStyle"] = p12.Color.Content.Emphasis
		},
		["cursorRadius"] = UDim.new(0, p12.Radius.Circle)
	}
	v13.input = v14
	local v15 = {}
	local v16 = v_u_2.XSmall
	local v17 = v_u_11
	local v18 = {
		["tag"] = "radius-circle",
		["size"] = nil,
		["knobSize"] = nil,
		["strokeThickness"] = nil,
		["size"] = {
			["width"] = p12.Size.Size_700,
			["height"] = p12.Size.Size_400
		},
		["knobSize"] = v_u_5(p12, v_u_2.XSmall),
		["strokeThickness"] = p12.Stroke.None
	}
	v15[v16] = v17(v18)
	local v19 = v_u_2.Small
	local v20 = v_u_11
	local v21 = {
		["tag"] = "radius-circle",
		["size"] = nil,
		["knobSize"] = nil,
		["strokeThickness"] = nil,
		["size"] = {
			["width"] = p12.Size.Size_800,
			["height"] = p12.Size.Size_500
		},
		["knobSize"] = v_u_5(p12, v_u_2.Small),
		["strokeThickness"] = p12.Stroke.None
	}
	v15[v19] = v20(v21)
	local v22 = v_u_2.Medium
	local v23 = v_u_11
	local v24 = {
		["tag"] = "radius-circle",
		["size"] = nil,
		["knobSize"] = nil,
		["strokeThickness"] = nil,
		["size"] = {
			["width"] = p12.Size.Size_1000,
			["height"] = p12.Size.Size_600
		},
		["knobSize"] = v_u_5(p12, v_u_2.Medium),
		["strokeThickness"] = p12.Stroke.None
	}
	v15[v22] = v23(v24)
	local v25 = v_u_2.Large
	local v26 = v_u_11
	local v27 = {
		["tag"] = "radius-circle",
		["size"] = nil,
		["knobSize"] = nil,
		["strokeThickness"] = nil,
		["size"] = {
			["width"] = p12.Size.Size_1100,
			["height"] = p12.Size.Size_600
		},
		["knobSize"] = v_u_5(p12, v_u_2.Medium),
		["strokeThickness"] = p12.Stroke.None
	}
	v15[v25] = v26(v27)
	return {
		["common"] = v13,
		["sizes"] = v15
	}
end
return function(p29, p30)
	-- upvalues: (copy) v_u_4, (copy) v_u_28, (copy) v_u_3
	local v31 = v_u_4.useVariants("Toggle", v_u_28, p29)
	return v_u_3(v31.common, v31.sizes[p30])
end