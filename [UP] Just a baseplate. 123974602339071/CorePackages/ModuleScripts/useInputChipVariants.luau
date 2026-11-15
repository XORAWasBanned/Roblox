-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InputChip.useInputChipVariants
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.InputSize)
require(v1.Components.Types)
local v_u_3 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
local v_u_4 = require(v1.Providers.Style.VariantsContext)
local function v_u_24(p5) -- name: variantsFactory
	-- upvalues: (copy) v_u_2
	local v6 = {
		["container"] = {
			["tag"] = "row align-x-center align-y-center auto-x radius-small bg-action-standard clip"
		},
		["text"] = {
			["tag"] = "shrink size-0-full auto-x text-truncate-end",
			["contentStyle"] = nil,
			["contentStyle"] = p5.Color.ActionStandard.Foreground
		},
		["close"] = {
			["tag"] = "auto-xy"
		}
	}
	local v7 = {}
	local v8 = v_u_2.XSmall
	local v9 = {
		["container"] = {
			["tag"] = "size-0-400"
		}
	}
	local v10 = {
		["tag"] = "text-caption-small",
		["padding"] = nil,
		["padding"] = {
			["left"] = UDim.new(0, p5.Size.Size_150),
			["right"] = UDim.new(0, p5.Padding.XSmall)
		}
	}
	v9.text = v10
	local v11 = {
		["padding"] = {
			["right"] = UDim.new(0, p5.Size.Size_150)
		}
	}
	v9.close = v11
	v7[v8] = v9
	local v12 = v_u_2.Small
	local v13 = {
		["container"] = {
			["tag"] = "size-0-500"
		}
	}
	local v14 = {
		["tag"] = "text-label-small",
		["padding"] = nil,
		["padding"] = {
			["left"] = UDim.new(0, p5.Padding.Small),
			["right"] = UDim.new(0, p5.Size.Size_150)
		}
	}
	v13.text = v14
	local v15 = {
		["padding"] = {
			["right"] = UDim.new(0, p5.Padding.Small)
		}
	}
	v13.close = v15
	v7[v12] = v13
	local v16 = v_u_2.Medium
	local v17 = {
		["container"] = {
			["tag"] = "size-0-600"
		}
	}
	local v18 = {
		["tag"] = "text-label-small",
		["padding"] = nil,
		["padding"] = {
			["left"] = UDim.new(0, p5.Padding.Small),
			["right"] = UDim.new(0, p5.Size.Size_150)
		}
	}
	v17.text = v18
	local v19 = {
		["padding"] = {
			["right"] = UDim.new(0, p5.Padding.Small)
		}
	}
	v17.close = v19
	v7[v16] = v17
	local v20 = v_u_2.Large
	local v21 = {
		["container"] = {
			["tag"] = "size-0-800"
		}
	}
	local v22 = {
		["tag"] = "text-label-medium",
		["padding"] = nil,
		["padding"] = {
			["left"] = UDim.new(0, p5.Padding.Medium),
			["right"] = UDim.new(0, p5.Padding.Small)
		}
	}
	v21.text = v22
	local v23 = {
		["padding"] = {
			["right"] = UDim.new(0, p5.Padding.Medium)
		}
	}
	v21.close = v23
	v7[v20] = v21
	return {
		["common"] = v6,
		["sizes"] = v7
	}
end
return function(p25, p26)
	-- upvalues: (copy) v_u_4, (copy) v_u_24, (copy) v_u_3
	local v27 = v_u_4.useVariants("InputChip", v_u_24, p25)
	return v_u_3(v27.common, v27.sizes[p26])
end