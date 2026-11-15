-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.BaseMenu.useBaseMenuItemVariants
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.InputSize)
local v_u_3 = require(v1.Providers.Style.VariantsContext)
local v_u_4 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
require(v1.Components.Types)
local v_u_5 = require(v1.Enums.IconSize)
local function v_u_18(p6) -- name: variantsMap
	-- upvalues: (copy) v_u_2, (copy) v_u_5
	local v7 = {
		["container"] = {
			["tag"] = ""
		},
		["icon"] = {
			["tag"] = "radius-small content-emphasis",
			["style"] = nil,
			["style"] = p6.Color.Content.Emphasis
		},
		["text"] = {
			["tag"] = "fill auto-xy text-align-x-left text-truncate-end content-emphasis"
		},
		["title"] = {
			["tag"] = "fill auto-xy text-align-x-left text-truncate-end content-default"
		},
		["check"] = {
			["tag"] = "content-emphasis",
			["style"] = nil,
			["style"] = p6.Color.Content.Emphasis
		},
		["slotAlign"] = {
			["tag"] = "align-x-center align-y-center"
		},
		["submenuContent"] = {
			["tag"] = "stroke-standard stroke-default radius-medium"
		}
	}
	local v8 = {}
	local v9 = v_u_2.XSmall
	local v10 = {
		["container"] = {
			["tag"] = "size-full-600 radius-small",
			["paddingLeftWithCheck"] = 0,
			["paddingLeftWithoutCheck"] = nil,
			["paddingRight"] = nil,
			["paddingLeftWithoutCheck"] = p6.Padding.Small,
			["paddingRight"] = p6.Padding.Small
		},
		["wrapper"] = {
			["gap"] = p6.Size.Size_150
		},
		["icon"] = {
			["tag"] = "size-400",
			["size"] = nil,
			["size"] = v_u_5.XSmall
		},
		["text"] = {
			["tag"] = "text-body-small"
		},
		["title"] = {
			["tag"] = "text-caption-small",
			["checkColumnWidth"] = nil,
			["checkColumnWidth"] = p6.Size.Size_500
		},
		["check"] = {
			["tag"] = "size-500-400",
			["size"] = nil,
			["size"] = p6.Size.Size_400
		},
		["chevron"] = {
			["size"] = v_u_5.Small
		},
		["groupPadding"] = {
			["size"] = p6.Padding.XSmall
		}
	}
	v8[v9] = v10
	local v11 = v_u_2.Small
	local v12 = {
		["container"] = {
			["tag"] = "size-full-800 radius-small",
			["paddingLeftWithCheck"] = 0,
			["paddingLeftWithoutCheck"] = nil,
			["paddingRight"] = nil,
			["paddingLeftWithoutCheck"] = p6.Padding.Small,
			["paddingRight"] = p6.Padding.Small
		},
		["wrapper"] = {
			["gap"] = p6.Size.Size_150
		},
		["icon"] = {
			["tag"] = "size-500",
			["size"] = nil,
			["size"] = v_u_5.Small
		},
		["text"] = {
			["tag"] = "text-body-small"
		},
		["title"] = {
			["tag"] = "text-caption-small",
			["checkColumnWidth"] = nil,
			["checkColumnWidth"] = p6.Size.Size_600
		},
		["check"] = {
			["tag"] = "size-600-400",
			["size"] = nil,
			["size"] = p6.Size.Size_400
		},
		["chevron"] = {
			["size"] = v_u_5.Small
		},
		["groupPadding"] = {
			["size"] = p6.Padding.Small
		}
	}
	v8[v11] = v12
	local v13 = v_u_2.Medium
	local v14 = {
		["container"] = {
			["tag"] = "size-full-1000 radius-medium",
			["paddingLeftWithCheck"] = 0,
			["paddingLeftWithoutCheck"] = nil,
			["paddingRight"] = nil,
			["paddingLeftWithoutCheck"] = p6.Size.Size_250,
			["paddingRight"] = p6.Size.Size_250
		},
		["wrapper"] = {
			["gap"] = p6.Size.Size_150
		},
		["icon"] = {
			["tag"] = "size-500",
			["size"] = nil,
			["size"] = v_u_5.Medium
		},
		["text"] = {
			["tag"] = "text-body-medium"
		},
		["title"] = {
			["tag"] = "text-caption-medium",
			["checkColumnWidth"] = nil,
			["checkColumnWidth"] = p6.Size.Size_700
		},
		["check"] = {
			["tag"] = "size-700-500",
			["size"] = nil,
			["size"] = p6.Size.Size_500
		},
		["chevron"] = {
			["size"] = v_u_5.Medium
		},
		["groupPadding"] = {
			["size"] = p6.Padding.Small
		}
	}
	v8[v13] = v14
	local v15 = v_u_2.Large
	local v16 = {
		["container"] = {
			["tag"] = "size-full-1200 radius-medium",
			["paddingLeftWithCheck"] = 0,
			["paddingLeftWithoutCheck"] = nil,
			["paddingRight"] = nil,
			["paddingLeftWithoutCheck"] = p6.Size.Size_350,
			["paddingRight"] = p6.Size.Size_350
		},
		["wrapper"] = {
			["gap"] = p6.Padding.Small
		},
		["icon"] = {
			["tag"] = "size-600",
			["size"] = nil,
			["size"] = v_u_5.Large
		},
		["text"] = {
			["tag"] = "text-body-large"
		},
		["title"] = {
			["tag"] = "text-caption-large",
			["checkColumnWidth"] = nil,
			["checkColumnWidth"] = p6.Size.Size_800
		},
		["check"] = {
			["tag"] = "size-800-600",
			["size"] = nil,
			["size"] = p6.Size.Size_600
		},
		["chevron"] = {
			["size"] = v_u_5.Large
		},
		["groupPadding"] = {
			["size"] = p6.Padding.Small
		}
	}
	v8[v15] = v16
	local v17 = {
		[false] = {
			["submenuContent"] = {
				["tag"] = "col auto-xy"
			}
		},
		[true] = {
			["submenuContent"] = {
				["tag"] = ""
			}
		}
	}
	return {
		["common"] = v7,
		["sizes"] = v8,
		["isScrollable"] = v17,
		["defaultSize"] = {
			["container"] = {
				["tag"] = "auto-x"
			}
		}
	}
end
return function(p19, p20, p21)
	-- upvalues: (copy) v_u_3, (copy) v_u_18, (copy) v_u_4
	local v22 = v_u_3.useVariants("BaseMenuItem", v_u_18, p19)
	return v_u_4(v22.common, v22.sizes[p20], v22.defaultSize, v22.isScrollable[p21])
end