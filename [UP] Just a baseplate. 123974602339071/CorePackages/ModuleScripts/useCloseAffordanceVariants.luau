-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.CloseAffordance.useCloseAffordanceVariants
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v_u_4 = require(v1.Enums.ColorNamespace)
local v_u_5 = require(v1.Enums.InputSize)
require(v1.Components.Types)
local v_u_6 = require(v1.Enums.IconSize)
local v_u_7 = require(v1.Providers.Style.VariantsContext)
local v_u_8 = require(v1.Utility.composeStyleVariant)
local v_u_9 = require(v1.Enums.CloseAffordanceVariant)
require(v1.Providers.Style.Tokens)
local v_u_10 = require(v1.Constants)
local v_u_11 = require(v1.Components.Button.getSharedVariants)
local function v_u_38(p_u_12)
	-- upvalues: (copy) v_u_11, (copy) v_u_5, (copy) v_u_6, (copy) v_u_9, (copy) v_u_3, (copy) v_u_4, (copy) v_u_10
	local v13 = v_u_11(p_u_12)
	local v14 = {}
	local v15 = {}
	local v16 = v_u_5.XSmall
	local v17 = {
		["container"] = {
			["size"] = UDim2.fromOffset(v13.sizes[v_u_5.XSmall].container.height, v13.sizes[v_u_5.XSmall].container.height),
			["padding"] = UDim.new(0, p_u_12.Size.Size_100)
		},
		["content"] = {
			["iconSize"] = v_u_6.Small
		}
	}
	v15[v16] = v17
	local v18 = v_u_5.Small
	local v19 = {
		["container"] = {
			["size"] = UDim2.fromOffset(v13.sizes[v_u_5.Small].container.height, v13.sizes[v_u_5.Small].container.height),
			["padding"] = UDim.new(0, p_u_12.Size.Size_150)
		},
		["content"] = {
			["iconSize"] = v_u_6.Medium
		}
	}
	v15[v18] = v19
	local v20 = v_u_5.Medium
	local v21 = {
		["container"] = {
			["size"] = UDim2.fromOffset(v13.sizes[v_u_5.Medium].container.height, v13.sizes[v_u_5.Medium].container.height),
			["padding"] = UDim.new(0, p_u_12.Size.Size_200)
		},
		["content"] = {
			["iconSize"] = v_u_6.Large
		}
	}
	v15[v20] = v21
	v14[true] = v15
	local v22 = {}
	local v23 = v_u_5.XSmall
	local v24 = {
		["content"] = {
			["iconSize"] = v_u_6.XSmall
		}
	}
	v22[v23] = v24
	local v25 = v_u_5.Small
	local v26 = {
		["content"] = {
			["iconSize"] = v_u_6.Small
		}
	}
	v22[v25] = v26
	local v27 = v_u_5.Medium
	local v28 = {
		["content"] = {
			["iconSize"] = v_u_6.Large
		}
	}
	v22[v27] = v28
	v14[false] = v22
	local v33 = {
		[v_u_9.OverMedia] = v_u_3.map(v_u_4, function()
			-- upvalues: (copy) p_u_12
			local v29 = {
				["container"] = {
					["tag"] = "bg-over-media-100"
				},
				["content"] = {
					["style"] = p_u_12.Color.Content.Emphasis
				}
			}
			return v29
		end),
		[v_u_9.Utility] = v_u_3.map(v_u_4, function(p30)
			-- upvalues: (ref) v_u_10, (copy) p_u_12
			local v31 = {}
			local v32 = {
				["stateLayer"] = {
					["mode"] = v_u_10.COLOR_NAMESPACE_TO_STATE_LAYER_MODE[false][p30]
				}
			}
			v31.container = v32
			v31.content = {
				["style"] = p_u_12[p30].Content.Emphasis
			}
			return v31
		end)
	}
	local v34 = {}
	local v35 = {
		["container"] = {
			["radius"] = p_u_12.Radius.Medium
		}
	}
	v34[true] = v35
	v34[false] = {
		["container"] = {
			["radius"] = 0
		}
	}
	local v36 = {}
	local v37 = {
		["container"] = {
			["radius"] = p_u_12.Radius.Circle
		}
	}
	v36[true] = v37
	v36[false] = {}
	return {
		["common"] = {
			["container"] = {
				["tag"] = "row align-x-center align-y-center auto-xy clip"
			}
		},
		["types"] = v33,
		["sizes"] = v14,
		["padding"] = v34,
		["circular"] = v36
	}
end
return function(p39, p40, p41, p42, p43, p44)
	-- upvalues: (copy) v_u_7, (copy) v_u_38, (copy) v_u_9, (copy) v_u_8, (copy) v_u_4
	local v45 = v_u_7.useVariants("CloseAffordance", v_u_38, p39)
	local v46 = p41 == v_u_9.OverMedia and true or p44
	return v_u_8(v45.common, v45.types[p41][p42 or v_u_4.Color], v45.sizes[p43][p40], v45.padding[p43], v45.circular[v46])
end