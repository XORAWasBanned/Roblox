-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Checkbox.useCheckboxVariants
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Components.Types)
require(v1.Components.InternalInput)
local v_u_2 = require(v1.Enums.InputSize)
require(v1.Enums.ControlState)
local v_u_3 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
local v_u_4 = require(v1.Providers.Style.VariantsContext)
local function v_u_17(p5) -- name: variantsFactory
	-- upvalues: (copy) v_u_2
	local v6 = {}
	local v7 = {
		["tag"] = "radius-small",
		["colors"] = nil,
		["cursorRadius"] = nil,
		["colors"] = {
			["checkedStyle"] = p5.Color.ActionSubEmphasis.Background
		},
		["cursorRadius"] = UDim.new(0, p5.Radius.Small)
	}
	v6.input = v7
	v6.checkmark = {
		["tag"] = "position-center-center anchor-center-center content-action-sub-emphasis"
	}
	local v8 = {}
	local v9 = v_u_2.XSmall
	local v10 = {
		["input"] = {
			["size"] = UDim2.fromOffset(p5.Size.Size_400, p5.Size.Size_400)
		},
		["checkmark"] = {
			["tag"] = "size-400"
		}
	}
	v8[v9] = v10
	local v11 = v_u_2.Small
	local v12 = {
		["input"] = {
			["size"] = UDim2.fromOffset(p5.Size.Size_500, p5.Size.Size_500)
		},
		["checkmark"] = {
			["tag"] = "size-500"
		}
	}
	v8[v11] = v12
	local v13 = v_u_2.Medium
	local v14 = {
		["input"] = {
			["size"] = UDim2.fromOffset(p5.Size.Size_600, p5.Size.Size_600)
		},
		["checkmark"] = {
			["tag"] = "size-600"
		}
	}
	v8[v13] = v14
	local v15 = v_u_2.Large
	local v16 = {
		["input"] = {
			["size"] = UDim2.fromOffset(p5.Size.Size_600, p5.Size.Size_600)
		},
		["checkmark"] = {
			["tag"] = "size-600"
		}
	}
	v8[v15] = v16
	return {
		["common"] = v6,
		["sizes"] = v8
	}
end
return function(p18, p19)
	-- upvalues: (copy) v_u_4, (copy) v_u_17, (copy) v_u_3
	local v20 = v_u_4.useVariants("Checkbox", v_u_17, p18)
	return v_u_3(v20.common, v20.sizes[p19])
end