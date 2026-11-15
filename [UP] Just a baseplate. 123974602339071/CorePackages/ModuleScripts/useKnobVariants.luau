-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Knob.useKnobVariants
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.InputSize)
local v_u_3 = require(v1.Utility.composeStyleVariant)
require(v1.Components.Types)
require(v1.Providers.Style.Tokens)
local v_u_4 = require(v1.Providers.Style.VariantsContext)
local v_u_5 = require(script.Parent.getKnobSize)
local v_u_6 = require(v1.Enums.IconSize)
local function v_u_24(p7) -- name: variantsFactory
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_5
	local v8 = {}
	local v9 = v_u_2.XSmall
	local v10 = {
		["iconSize"] = v_u_6.XSmall,
		["size"] = v_u_5(p7, v_u_2.XSmall)
	}
	local v11 = {
		["knob"] = {
			["size"] = v10.size,
			["iconSize"] = v10.iconSize
		}
	}
	v8[v9] = v11
	local v12 = v_u_2.Small
	local v13 = {
		["iconSize"] = v_u_6.Small,
		["size"] = v_u_5(p7, v_u_2.Small)
	}
	local v14 = {
		["knob"] = {
			["size"] = v13.size,
			["iconSize"] = v13.iconSize
		}
	}
	v8[v12] = v14
	local v15 = v_u_2.Medium
	local v16 = {
		["iconSize"] = v_u_6.Small,
		["size"] = v_u_5(p7, v_u_2.Medium)
	}
	local v17 = {
		["knob"] = {
			["size"] = v16.size,
			["iconSize"] = v16.iconSize
		}
	}
	v8[v15] = v17
	local v18 = v_u_2.Large
	local v19 = {
		["iconSize"] = v_u_6.Small,
		["size"] = v_u_5(p7, v_u_2.Large)
	}
	local v20 = {
		["knob"] = {
			["size"] = v19.size,
			["iconSize"] = v19.iconSize
		}
	}
	v8[v18] = v20
	local v21 = {}
	local v22 = {
		["knob"] = {
			["style"] = p7.Color.Content.Emphasis
		},
		["iconContainer"] = {
			["backgroundStyle"] = p7.Inverse.Content.Emphasis
		}
	}
	v21[false] = v22
	local v23 = {
		["knob"] = {
			["style"] = p7.Inverse.Content.Emphasis
		},
		["iconContainer"] = {
			["backgroundStyle"] = p7.Color.Content.Emphasis
		}
	}
	v21[true] = v23
	return {
		["common"] = {
			["knob"] = {
				["tag"] = "align-x-center align-y-center position-center-center anchor-center-center auto-xy radius-circle"
			}
		},
		["sizes"] = v8,
		["isInverse"] = v21
	}
end
return function(p25, p26, p27)
	-- upvalues: (copy) v_u_4, (copy) v_u_24, (copy) v_u_3
	local v28 = v_u_4.useVariants("Knob", v_u_24, p25)
	return v_u_3(v28.common, v28.sizes[p26], v28.isInverse[p27])
end