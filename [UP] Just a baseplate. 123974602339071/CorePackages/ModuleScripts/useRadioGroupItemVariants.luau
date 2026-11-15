-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.RadioGroup.Item.useRadioGroupItemVariants
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Components.InternalInput)
local v_u_2 = require(v1.Enums.InputSize)
require(v1.Enums.ControlState)
local v_u_3 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
require(v1.Components.Types)
local v_u_4 = require(v1.Providers.Style.VariantsContext)
local function v_u_16(p5) -- name: variantsFactory
	-- upvalues: (copy) v_u_2
	local v6 = {
		["input"] = {
			["tag"] = "radius-circle",
			["cursorRadius"] = nil,
			["cursorRadius"] = UDim.new(0, p5.Radius.Circle)
		},
		["checkmark"] = {
			["tag"] = "position-center-center anchor-center-center radius-circle",
			["style"] = nil,
			["style"] = p5.Inverse.Content.Emphasis
		}
	}
	local v7 = {}
	local v8 = v_u_2.XSmall
	local v9 = {
		["input"] = {
			["size"] = UDim2.fromOffset(p5.Size.Size_400, p5.Size.Size_400)
		},
		["checkmark"] = {
			["tag"] = "size-150"
		}
	}
	v7[v8] = v9
	local v10 = v_u_2.Small
	local v11 = {
		["input"] = {
			["size"] = UDim2.fromOffset(p5.Size.Size_500, p5.Size.Size_500)
		},
		["checkmark"] = {
			["tag"] = "size-200"
		}
	}
	v7[v10] = v11
	local v12 = v_u_2.Medium
	local v13 = {
		["input"] = {
			["size"] = UDim2.fromOffset(p5.Size.Size_600, p5.Size.Size_600)
		},
		["checkmark"] = {
			["tag"] = "size-250"
		}
	}
	v7[v12] = v13
	local v14 = v_u_2.Large
	local v15 = {
		["input"] = {
			["size"] = UDim2.fromOffset(p5.Size.Size_600, p5.Size.Size_600)
		},
		["checkmark"] = {
			["tag"] = "size-250"
		}
	}
	v7[v14] = v15
	return {
		["common"] = v6,
		["sizes"] = v7
	}
end
return function(p17, p18)
	-- upvalues: (copy) v_u_4, (copy) v_u_16, (copy) v_u_3
	local v19 = v_u_4.useVariants("RadioItem", v_u_16, p17)
	return v_u_3(v19.common, v19.sizes[p18])
end