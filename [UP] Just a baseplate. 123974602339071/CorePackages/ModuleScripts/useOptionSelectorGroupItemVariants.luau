-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.OptionSelectorGroup.Item.useOptionSelectorGroupItemVariants
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.IconSize)
require(v1.Enums.InputSize)
local v_u_3 = require(v1.Enums.OptionSelectorGroupSize)
local v_u_4 = require(v1.Enums.FillBehavior)
local v_u_5 = require(v1.Enums.Orientation)
local v_u_6 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
require(v1.Components.Types)
local v_u_7 = require(v1.Providers.Style.VariantsContext)
local function v_u_20(p8) -- name: groupSizeVariantsFactory
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_6
	local v9 = {
		["container"] = {
			["tag"] = "col align-x-left align-y-center gap-xsmall"
		},
		["content"] = p8.Color.Content.Emphasis,
		["supportingContent"] = p8.Color.Content.Default,
		["label"] = {
			["tag"] = "content-emphasis"
		},
		["metadata"] = {
			["tag"] = "content-default"
		},
		["description"] = {
			["tag"] = "content-default"
		}
	}
	local v10 = {
		["container"] = {
			["tag"] = "padding-xlarge radius-medium",
			["radius"] = nil,
			["radius"] = p8.Radius.Medium
		},
		["icon"] = {
			["size"] = v_u_2.Medium,
			["extent"] = p8.Size.Size_500
		},
		["label"] = {
			["tag"] = "text-title-medium"
		},
		["metadata"] = {
			["tag"] = "text-caption-medium"
		},
		["description"] = {
			["tag"] = "text-body-medium"
		}
	}
	local v11 = {
		["container"] = {
			["tag"] = "padding-large radius-medium",
			["radius"] = nil,
			["radius"] = p8.Radius.Medium
		},
		["icon"] = {
			["size"] = v_u_2.Small,
			["extent"] = p8.Size.Size_400
		},
		["label"] = {
			["tag"] = "text-title-small"
		},
		["metadata"] = {
			["tag"] = "text-caption-small"
		},
		["description"] = {
			["tag"] = "text-body-small"
		}
	}
	local v12 = {
		["container"] = {
			["tag"] = "padding-medium radius-small",
			["radius"] = nil,
			["radius"] = p8.Radius.Small
		},
		["icon"] = {
			["size"] = v_u_2.XSmall,
			["extent"] = p8.Size.Size_300
		},
		["label"] = {
			["tag"] = "text-title-small"
		},
		["metadata"] = {
			["tag"] = "text-caption-small"
		},
		["description"] = {
			["tag"] = "text-body-small"
		}
	}
	local v13 = {
		[v_u_3.XSmall] = v12,
		[v_u_3.Small] = v11,
		[v_u_3.Medium] = v10
	}
	local v14 = {
		["label"] = {
			["tag"] = "size-full-0 auto-y"
		},
		["metadata"] = {
			["tag"] = "size-full-0 auto-y"
		},
		["description"] = {
			["tag"] = "size-full-0 auto-y"
		}
	}
	local v15 = {
		["Inline"] = v_u_6({
			["container"] = {
				["tag"] = "size-full-0 auto-y"
			},
			["itemInner"] = {
				["tag"] = "row align-y-center gap-small size-full-0 auto-y"
			},
			["textContainer"] = {
				["tag"] = "col fill gap-xsmall size-full-0 auto-y"
			}
		}, v14),
		["StackedFill"] = v_u_6({
			["container"] = {
				["tag"] = "fill auto-y"
			},
			["itemInner"] = {
				["tag"] = "col gap-small size-full-0 auto-y"
			},
			["textContainer"] = {
				["tag"] = "col gap-xsmall size-full-0 auto-y"
			}
		}, v14),
		["StackedFit"] = v_u_6({
			["container"] = {
				["tag"] = "auto-xy"
			},
			["itemInner"] = {
				["tag"] = "col gap-small auto-xy"
			},
			["textContainer"] = {
				["tag"] = "col gap-xsmall auto-xy"
			}
		}, {
			["label"] = {
				["tag"] = "auto-xy"
			},
			["metadata"] = {
				["tag"] = "auto-xy"
			},
			["description"] = {
				["tag"] = "auto-xy"
			}
		})
	}
	local v16 = {
		["common"] = v9,
		["sizes"] = v13,
		["layouts"] = v15
	}
	local v17 = {}
	local v18 = {
		["container"] = {
			["stroke"] = p8.Color.Stroke.Emphasis
		}
	}
	v17[false] = v18
	local v19 = {
		["container"] = {
			["stroke"] = p8.Color.System.Contrast
		}
	}
	v17[true] = v19
	v16.selection = v17
	return v16
end
local function v_u_22(p21) -- name: variantsFactory
	-- upvalues: (copy) v_u_20
	return {
		["groupSize"] = v_u_20(p21)
	}
end
return function(p23, p24, p25, p26, p27)
	-- upvalues: (copy) v_u_7, (copy) v_u_22, (copy) v_u_5, (copy) v_u_4, (copy) v_u_6
	local v28 = v_u_7.useVariants("OptionSelectorGroupItem", v_u_22, p23).groupSize
	local v29
	if p25 == v_u_5.Vertical then
		v29 = p26 == v_u_4.Fit
	else
		v29 = false
	end
	local v30
	if p25 == v_u_5.Horizontal then
		v30 = v28.layouts.Inline
	elseif v29 then
		v30 = v28.layouts.StackedFit
	else
		v30 = v28.layouts.StackedFill
	end
	return v_u_6(v28.common, v28.sizes[p24], v30, v28.selection[p27 == true])
end