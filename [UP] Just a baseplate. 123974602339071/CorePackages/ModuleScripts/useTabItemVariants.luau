-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Tabs.useTabItemVariants
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
local v_u_3 = require(v1.Providers.Style.VariantsContext)
local v_u_4 = require(v1.Enums.InputSize)
local v_u_5 = require(v1.Enums.IconSize)
local function v_u_18(_) -- name: variantsFactory
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	local v6 = {}
	local v7 = v_u_4.XSmall
	local v8 = {
		["text"] = {
			["tag"] = "size-0-400 text-label-small"
		},
		["content"] = {
			["tag"] = "padding-y-small"
		},
		["icon"] = {
			["size"] = v_u_5.XSmall
		}
	}
	v6[v7] = v8
	local v9 = v_u_4.Small
	local v10 = {
		["text"] = {
			["tag"] = "size-0-600 text-label-medium"
		},
		["content"] = {
			["tag"] = "padding-y-small"
		},
		["icon"] = {
			["size"] = v_u_5.Medium
		}
	}
	v6[v9] = v10
	local v11 = v_u_4.Medium
	local v12 = {
		["text"] = {
			["tag"] = "size-0-600 text-label-medium"
		},
		["content"] = {
			["tag"] = "padding-y-medium"
		},
		["icon"] = {
			["size"] = v_u_5.Medium
		}
	}
	v6[v11] = v12
	local v13 = v_u_4.Large
	local v14 = {
		["text"] = {
			["tag"] = "size-0-600 text-label-medium"
		},
		["content"] = {
			["tag"] = "padding-y-xlarge"
		},
		["icon"] = {
			["size"] = v_u_5.Medium
		}
	}
	v6[v13] = v14
	local v15 = {
		[v_u_4.XSmall] = {
			["content"] = {
				["tag"] = "padding-x-xsmall"
			}
		},
		[v_u_4.Small] = {
			["content"] = {
				["tag"] = "padding-x-small"
			}
		},
		[v_u_4.Medium] = {
			["content"] = {
				["tag"] = "padding-x-medium"
			}
		},
		[v_u_4.Large] = {
			["content"] = {
				["tag"] = "padding-x-large"
			}
		}
	}
	local v16 = {
		[false] = {
			["container"] = {
				["tag"] = "auto-xy"
			},
			["content"] = {
				["tag"] = "size-0-0 auto-xy"
			}
		}
	}
	local v17 = {
		["container"] = {
			["tag"] = "grow auto-xy"
		},
		["content"] = {
			["tag"] = "auto-y",
			["Size"] = nil,
			["Size"] = UDim2.fromScale(1, 0)
		}
	}
	v16[true] = v17
	return {
		["common"] = {
			["text"] = {
				["tag"] = "auto-x"
			},
			["content"] = {
				["tag"] = "row align-x-center align-y-center gap-small"
			}
		},
		["sizes"] = v6,
		["isFill"] = v16,
		["paddings"] = v15
	}
end
return function(p19, p20, p21)
	-- upvalues: (copy) v_u_3, (copy) v_u_18, (copy) v_u_2
	local v22 = v_u_3.useVariants("Tab", v_u_18, p19)
	return v_u_2(v22.common, v22.sizes[p20], v22.isFill[p21], v22.paddings[p20])
end