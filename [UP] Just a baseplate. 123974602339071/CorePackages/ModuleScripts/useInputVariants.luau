-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InternalInput.useInputVariants
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Components.Types)
local v_u_2 = require(v1.Enums.InputSize)
local v_u_3 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
local v_u_4 = require(v1.Providers.Style.VariantsContext)
local function v_u_12(p5) -- name: variantsFactory
	-- upvalues: (copy) v_u_2
	local v6 = p5.Stroke.Standard
	local v7 = math.ceil(v6)
	local v8 = {
		["container"] = {
			["tag"] = "row align-x-left align-y-top auto-xy",
			["padding"] = nil,
			["padding"] = UDim.new(0, v7)
		}
	}
	local v9 = {
		["stroke"] = {
			["thickness"] = v7
		}
	}
	v8.input = v9
	local v10 = {
		[v_u_2.XSmall] = {
			["container"] = {
				["tag"] = "gap-medium"
			}
		},
		[v_u_2.Small] = {
			["container"] = {
				["tag"] = "gap-medium"
			}
		},
		[v_u_2.Medium] = {
			["container"] = {
				["tag"] = "gap-medium"
			}
		},
		[v_u_2.Large] = {
			["container"] = {
				["tag"] = "gap-medium"
			}
		}
	}
	local v11 = {
		[Enum.HorizontalAlignment.Left] = {
			["container"] = {
				["tag"] = "flex-x-between size-full-0"
			}
		},
		[Enum.HorizontalAlignment.Right] = {
			["container"] = {
				["tag"] = ""
			}
		}
	}
	return {
		["common"] = v8,
		["sizes"] = v10,
		["labelPosition"] = v11
	}
end
return function(p13, p14, p15)
	-- upvalues: (copy) v_u_4, (copy) v_u_12, (copy) v_u_3
	local v16 = v_u_4.useVariants("InternalInput", v_u_12, p13)
	return v_u_3(v16.common, v16.sizes[p14], v16.labelPosition[p15])
end