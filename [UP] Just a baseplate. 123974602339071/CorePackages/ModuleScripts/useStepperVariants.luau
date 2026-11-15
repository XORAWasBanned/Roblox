-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Stepper.useStepperVariants
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.IconSize)
local v_u_3 = require(v1.Enums.InputSize)
local v_u_4 = require(v1.Enums.StepperStepState)
require(v1.Providers.Style.Tokens)
local v_u_5 = require(v1.Providers.Style.VariantsContext)
local v_u_6 = require(v1.Utility.composeStyleVariant)
require(v1.Components.Types)
local function v_u_23(p7) -- name: variantsFactory
	-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_4
	local v8 = {}
	local v9 = v_u_3.XSmall
	local v10 = {}
	local v11 = {
		["tag"] = "size-0-800",
		["padding"] = nil,
		["padding"] = {
			["left"] = UDim.new(0, p7.Padding.XSmall),
			["right"] = UDim.new(0, p7.Padding.Small),
			["top"] = UDim.new(0, p7.Size.Size_250),
			["bottom"] = UDim.new(0, p7.Size.Size_250)
		}
	}
	v10.content = v11
	local v12 = {
		["padding"] = {
			["left"] = UDim.new(0, p7.Size.Size_250)
		}
	}
	v10.textColumn = v12
	v10.indicatorInner = {
		["tag"] = "size-300-300"
	}
	v10.index = {
		["tag"] = "text-caption-small"
	}
	v10.label = {
		["tag"] = "text-label-small"
	}
	v10.description = {
		["tag"] = "text-body-small"
	}
	v10.icon = {
		["size"] = v_u_2.XSmall
	}
	v8[v9] = v10
	local v13 = v_u_3.Small
	local v14 = {}
	local v15 = {
		["tag"] = "size-0-1000",
		["padding"] = nil,
		["padding"] = {
			["left"] = UDim.new(0, p7.Size.Size_150),
			["right"] = UDim.new(0, p7.Size.Size_300),
			["top"] = UDim.new(0, p7.Size.Size_300),
			["bottom"] = UDim.new(0, p7.Size.Size_300)
		}
	}
	v14.content = v15
	local v16 = {
		["padding"] = {
			["left"] = UDim.new(0, p7.Gap.Medium)
		}
	}
	v14.textColumn = v16
	v14.indicatorInner = {
		["tag"] = "size-400-400"
	}
	v14.index = {
		["tag"] = "text-caption-medium"
	}
	v14.label = {
		["tag"] = "text-label-small"
	}
	v14.description = {
		["tag"] = "text-body-small"
	}
	v14.icon = {
		["size"] = v_u_2.Small
	}
	v8[v13] = v14
	local v17 = v_u_3.Medium
	local v18 = {}
	local v19 = {
		["tag"] = "size-0-1200",
		["padding"] = nil,
		["padding"] = {
			["left"] = UDim.new(0, p7.Padding.Small),
			["right"] = UDim.new(0, p7.Padding.Large),
			["top"] = UDim.new(0, p7.Size.Size_350),
			["bottom"] = UDim.new(0, p7.Size.Size_350)
		}
	}
	v18.content = v19
	local v20 = {
		["padding"] = {
			["left"] = UDim.new(0, p7.Gap.Medium)
		}
	}
	v18.textColumn = v20
	v18.indicatorInner = {
		["tag"] = "size-500-500"
	}
	v18.index = {
		["tag"] = "text-caption-large"
	}
	v18.label = {
		["tag"] = "text-label-medium"
	}
	v18.description = {
		["tag"] = "text-body-medium"
	}
	v18.icon = {
		["size"] = v_u_2.Medium
	}
	v8[v17] = v18
	local v21 = {
		[false] = {},
		[true] = {
			["container"] = {
				["tag"] = "grow"
			}
		}
	}
	local v22 = {
		[v_u_4.Complete] = {
			["indicatorInner"] = {
				["tag"] = "bg-system-contrast"
			},
			["description"] = {
				["tag"] = "content-default"
			}
		},
		[v_u_4.Current] = {
			["indicatorInner"] = {
				["tag"] = "bg-system-contrast"
			},
			["description"] = {
				["tag"] = "content-emphasis"
			},
			["index"] = {
				["tag"] = "content-inverse-emphasis"
			}
		},
		[v_u_4.Incomplete] = {
			["indicatorInner"] = {
				["tag"] = "bg-shift-300"
			},
			["description"] = {
				["tag"] = "content-default"
			},
			["index"] = {
				["tag"] = "content-default"
			}
		}
	}
	return {
		["common"] = {
			["container"] = {
				["tag"] = "auto-xy"
			},
			["label"] = {
				["tag"] = "auto-xy text-align-x-left content-emphasis"
			},
			["description"] = {
				["tag"] = "auto-xy text-align-x-left"
			},
			["textColumn"] = {
				["tag"] = "col auto-xy"
			},
			["content"] = {
				["tag"] = "row align-y-center auto-xy"
			},
			["index"] = {
				["tag"] = "auto-xy text-align-x-center text-align-y-center"
			},
			["indicatorOuter"] = {
				["tag"] = "row align-x-center align-y-center auto-xy"
			},
			["indicatorInner"] = {
				["tag"] = "row align-x-center align-y-center radius-circle"
			}
		},
		["sizes"] = v8,
		["isFill"] = v21,
		["stepStates"] = v22
	}
end
return function(p24, p25, p26, p27)
	-- upvalues: (copy) v_u_5, (copy) v_u_23, (copy) v_u_6
	local v28 = v_u_5.useVariants("Stepper", v_u_23, p24)
	return v_u_6(v28.common, v28.sizes[p25], v28.isFill[p27], v28.stepStates[p26])
end