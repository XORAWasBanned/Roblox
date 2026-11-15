-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Breadcrumb.useBreadcrumbVariants
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.IconSize)
local v_u_3 = require(v1.Enums.InputSize)
local v_u_4 = require(v1.Enums.AvatarIconSize)
require(v1.Components.Types)
local v_u_5 = require(v1.Utility.composeStyleVariant)
local v_u_6 = require(v1.Providers.Style.VariantsContext)
require(v1.Providers.Style.Tokens)
local function v_u_18(p7) -- name: variantsFactory
	-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_4
	local v8 = {
		["container"] = {
			["tag"] = "row align-y-center auto-xy padding-y-xsmall"
		},
		["item"] = {
			["tag"] = "row align-y-center gap-small auto-x"
		},
		["itemText"] = {
			["tag"] = "row align-y-center gap-xsmall auto-xy"
		},
		["separator"] = {
			["tag"] = "row align-x-center align-y-center size-600-0 auto-y"
		},
		["current"] = {
			["tag"] = "content-emphasis"
		},
		["label"] = {
			["tag"] = "content-emphasis"
		},
		["accessory"] = {
			["style"] = p7.Color.Content.Emphasis
		}
	}
	local v9 = {}
	local v10 = v_u_3.XSmall
	local v11 = {
		["separator"] = {
			["textTag"] = "auto-xy text-body-small content-default"
		},
		["current"] = {
			["tag"] = "auto-xy text-title-small"
		},
		["label"] = {
			["tag"] = "auto-xy text-body-small"
		},
		["accessory"] = {
			["iconSize"] = nil,
			["avatarSize"] = nil,
			["tag"] = "size-400-400 radius-small",
			["iconSize"] = v_u_2.XSmall,
			["avatarSize"] = v_u_4.Small
		},
		["item"] = {
			["tag"] = "size-0-600"
		},
		["overflow"] = {
			["size"] = v_u_3.XSmall
		}
	}
	v9[v10] = v11
	local v12 = v_u_3.Small
	local v13 = {
		["separator"] = {
			["textTag"] = "auto-xy text-body-small content-default"
		},
		["current"] = {
			["tag"] = "auto-xy text-title-small"
		},
		["label"] = {
			["tag"] = "auto-xy text-body-small"
		},
		["accessory"] = {
			["iconSize"] = nil,
			["avatarSize"] = nil,
			["tag"] = "size-400-400 radius-small",
			["iconSize"] = v_u_2.XSmall,
			["avatarSize"] = v_u_4.Small
		},
		["item"] = {
			["tag"] = "size-0-600"
		},
		["overflow"] = {
			["size"] = v_u_3.XSmall
		}
	}
	v9[v12] = v13
	local v14 = v_u_3.Medium
	local v15 = {
		["separator"] = {
			["textTag"] = "auto-xy text-body-medium content-default"
		},
		["current"] = {
			["tag"] = "auto-xy text-title-medium"
		},
		["label"] = {
			["tag"] = "auto-xy text-body-medium"
		},
		["accessory"] = {
			["iconSize"] = nil,
			["avatarSize"] = nil,
			["tag"] = "size-500-500 radius-small",
			["iconSize"] = v_u_2.Small,
			["avatarSize"] = v_u_4.Medium
		},
		["item"] = {
			["tag"] = "size-0-600"
		},
		["overflow"] = {
			["size"] = v_u_3.XSmall
		}
	}
	v9[v14] = v15
	local v16 = v_u_3.Large
	local v17 = {
		["separator"] = {
			["textTag"] = "auto-xy text-body-large content-default"
		},
		["current"] = {
			["tag"] = "auto-xy text-title-large"
		},
		["label"] = {
			["tag"] = "auto-xy text-body-large"
		},
		["accessory"] = {
			["iconSize"] = nil,
			["avatarSize"] = nil,
			["tag"] = "size-600-600 radius-medium",
			["iconSize"] = v_u_2.Medium,
			["avatarSize"] = v_u_4.Large
		},
		["item"] = {
			["tag"] = "size-0-800"
		},
		["overflow"] = {
			["size"] = v_u_3.Small
		}
	}
	v9[v16] = v17
	return {
		["common"] = v8,
		["sizes"] = v9
	}
end
return function(p19, p20)
	-- upvalues: (copy) v_u_6, (copy) v_u_18, (copy) v_u_5
	local v21 = v_u_6.useVariants("Breadcrumb", v_u_18, p19)
	return v_u_5(v21.common, v21.sizes[p20])
end