-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.StatusBadge.useStatusBadgeVariants
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.StatusBadgeShape)
local v_u_3 = require(v1.Enums.StatusBadgeSize)
local v_u_4 = require(v1.Enums.StatusBadgeVariant)
require(v1.Components.Types)
local v_u_5 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
local v_u_6 = require(v1.Providers.Style.VariantsContext)
function variantsFactory(p7) -- name: variantsFactory
	-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_3
	local v8 = {
		["container"] = {
			["tag"] = "row align-x-center align-y-center auto-xy"
		},
		["statusLight"] = {
			["tag"] = "row align-x-center align-y-center auto-x size-0-300 padding-x-xxsmall"
		},
		["content"] = {
			["tag"] = "row align-y-center auto-x size-0-full"
		},
		["dot"] = {
			["tag"] = "radius-circle"
		},
		["text"] = {
			["style"] = nil,
			["tag"] = "auto-xy text-align-x-left text-truncate-split padding-right-xxsmall",
			["style"] = p7.Color.Content.Emphasis
		}
	}
	local v9 = {
		[v_u_4.Standard] = {
			["dot"] = {
				["tag"] = "bg-system-neutral"
			}
		},
		[v_u_4.Emphasis] = {
			["dot"] = {
				["tag"] = "bg-system-emphasis"
			}
		},
		[v_u_4.Success] = {
			["dot"] = {
				["tag"] = "bg-system-success"
			}
		},
		[v_u_4.Warning] = {
			["dot"] = {
				["tag"] = "bg-system-warning"
			}
		},
		[v_u_4.Alert] = {
			["dot"] = {
				["tag"] = "bg-system-alert"
			}
		}
	}
	local v10 = {
		[v_u_2.Utility] = {},
		[v_u_2.Box] = {
			["container"] = {
				["tag"] = "radius-small bg-shift-200"
			}
		}
	}
	local v11 = {
		[v_u_3.XSmall] = {
			["container"] = {
				["tag"] = "size-0-400"
			},
			["content"] = {
				["tag"] = "gap-xxsmall"
			},
			["dot"] = {
				["tag"] = "size-150"
			},
			["text"] = {
				["tag"] = "text-caption-small"
			}
		}
	}
	local v12 = v_u_3.Small
	local v13 = {
		["container"] = {
			["tag"] = "size-0-600"
		},
		["content"] = {
			["gap"] = p7.Size.Size_150
		},
		["dot"] = {
			["tag"] = "size-200"
		},
		["text"] = {
			["tag"] = "text-caption-medium"
		}
	}
	v11[v12] = v13
	local v14 = {
		[v_u_3.XSmall] = {
			["container"] = {
				["tag"] = "padding-x-xsmall"
			}
		},
		[v_u_3.Small] = {
			["container"] = {
				["tag"] = "padding-x-small"
			}
		}
	}
	return {
		["common"] = v8,
		["variants"] = v9,
		["shapes"] = v10,
		["sizes"] = v11,
		["boxSizes"] = v14
	}
end
return function(p15, p16, p17, p18)
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_2
	local v19 = v_u_6.useVariants("StatusBadge", variantsFactory, p15)
	local v20 = v_u_5
	local v21 = v19.common
	local v22 = v19.variants[p16]
	local v23 = v19.shapes[p17]
	local v24 = v19.sizes[p18]
	local v25
	if p17 == v_u_2.Box then
		v25 = v19.boxSizes[p18]
	else
		v25 = nil
	end
	return v20(v21, v22, v23, v24, v25)
end