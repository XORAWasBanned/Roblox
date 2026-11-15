-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Slider.useSliderVariants
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.InputSize)
local v_u_3 = require(v1.Enums.SliderVariant)
local v_u_4 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
local v_u_5 = require(v1.Providers.Style.VariantsContext)
require(v1.Components.Types)
local v_u_6 = require(v1.Utility.Flags)
local function v_u_29(p7) -- name: variantsFactory
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v8 = {}
	local v9 = v_u_3.Emphasis
	local v10 = {
		["bar"] = {
			["tag"] = "bg-shift-200"
		},
		["fill"] = {
			["tag"] = "bg-emphasis"
		},
		["knob"] = {
			["style"] = nil,
			["dragStyle"] = nil,
			["hasShadow"] = true,
			["style"] = p7.Color.Extended.White.White_100,
			["dragStyle"] = p7.Color.System.Emphasis
		}
	}
	v8[v9] = v10
	local v11 = v_u_3.Standard
	local v12 = {
		["bar"] = {
			["tag"] = "bg-shift-200"
		},
		["fill"] = {
			["tag"] = "bg-system-contrast"
		}
	}
	local v13 = {
		["style"] = nil,
		["dragStyle"] = nil,
		["stroke"] = nil,
		["hasShadow"] = true,
		["style"] = p7.Color.System.Contrast,
		["dragStyle"] = p7.Color.System.Contrast,
		["stroke"] = {
			["Color"] = p7.Color.Stroke.Default.Color3,
			["Transparency"] = p7.Color.Stroke.Default.Transparency,
			["Thickness"] = p7.Stroke.Standard
		}
	}
	v12.knob = v13
	v8[v11] = v12
	local v14 = v_u_3.Utility
	local v15 = {}
	local v16 = {
		["style"] = nil,
		["dragStyle"] = nil,
		["stroke"] = nil,
		["hasShadow"] = true,
		["style"] = p7.Color.None,
		["dragStyle"] = p7.Color.None,
		["stroke"] = {
			["Color"] = p7.Color.System.Contrast.Color3,
			["Transparency"] = p7.Color.System.Contrast.Transparency,
			["Thickness"] = p7.Stroke.Thicker
		}
	}
	v15.knob = v16
	v8[v14] = v15
	local v17 = {}
	local v18 = v_u_2.XSmall
	local v19 = {
		["bar"] = {
			["height"] = p7.Size.Size_100
		}
	}
	v17[v18] = v19
	local v20 = v_u_2.Small
	local v21 = {
		["bar"] = {
			["height"] = p7.Size.Size_150
		}
	}
	v17[v20] = v21
	local v22 = v_u_2.Medium
	local v23 = {
		["bar"] = {
			["height"] = p7.Size.Size_200
		}
	}
	v17[v22] = v23
	local v24 = v_u_2.Large
	local v25 = {
		["bar"] = {
			["height"] = p7.Size.Size_250
		}
	}
	v17[v24] = v25
	local v26 = {}
	local v27 = {
		["selectionGroup"] = {
			["SelectionBehaviorLeft"] = Enum.SelectionBehavior.Escape,
			["SelectionBehaviorRight"] = Enum.SelectionBehavior.Escape,
			["SelectionBehaviorUp"] = Enum.SelectionBehavior.Stop,
			["SelectionBehaviorDown"] = Enum.SelectionBehavior.Stop
		}
	}
	v26[true] = v27
	local v28 = {
		["selectionGroup"] = {
			["SelectionBehaviorLeft"] = Enum.SelectionBehavior.Stop,
			["SelectionBehaviorRight"] = Enum.SelectionBehavior.Stop,
			["SelectionBehaviorUp"] = Enum.SelectionBehavior.Escape,
			["SelectionBehaviorDown"] = Enum.SelectionBehavior.Escape
		}
	}
	v26[false] = v28
	return {
		["common"] = {
			["bar"] = {
				["tag"] = "position-center-center anchor-center-center radius-circle"
			},
			["fill"] = {
				["tag"] = "radius-circle"
			}
		},
		["variants"] = v8,
		["sizes"] = v17,
		["orientation"] = v26
	}
end
return function(p30, p31, p32, p33)
	-- upvalues: (copy) v_u_5, (copy) v_u_29, (copy) v_u_6, (copy) v_u_4
	local v34 = v_u_5.useVariants("Slider", v_u_29, p30)
	if v_u_6.FoundationSliderCapture then
		return v_u_4(v34.common, v34.variants[p32], v34.sizes[p31])
	else
		return v_u_4(v34.common, v34.variants[p32], v34.sizes[p31], v34.orientation[p33])
	end
end