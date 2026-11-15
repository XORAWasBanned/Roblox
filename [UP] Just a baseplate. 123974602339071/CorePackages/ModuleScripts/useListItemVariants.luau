-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.List.Item.useListItemVariants
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.IconSize)
local v_u_3 = require(v1.Enums.InputSize)
local v_u_4 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
local v_u_5 = require(v1.Providers.Style.VariantsContext)
local function v_u_15(_) -- name: variantsFactory
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v6 = {}
	local v7 = v_u_3.XSmall
	local v8 = {
		["title"] = {
			["tag"] = "text-title-small"
		},
		["metadata"] = {
			["tag"] = "text-body-small"
		},
		["description"] = {
			["tag"] = "text-body-small"
		},
		["icon"] = {
			["size"] = v_u_2.XSmall
		}
	}
	v6[v7] = v8
	local v9 = v_u_3.Small
	local v10 = {
		["title"] = {
			["tag"] = "text-title-medium"
		},
		["metadata"] = {
			["tag"] = "text-body-small"
		},
		["description"] = {
			["tag"] = "text-body-small"
		},
		["icon"] = {
			["size"] = v_u_2.Small
		}
	}
	v6[v9] = v10
	local v11 = v_u_3.Medium
	local v12 = {
		["title"] = {
			["tag"] = "text-title-medium"
		},
		["metadata"] = {
			["tag"] = "text-body-medium"
		},
		["description"] = {
			["tag"] = "text-body-medium"
		},
		["icon"] = {
			["size"] = v_u_2.Medium
		}
	}
	v6[v11] = v12
	local v13 = v_u_3.Large
	local v14 = {
		["title"] = {
			["tag"] = "text-title-large"
		},
		["metadata"] = {
			["tag"] = "text-body-medium"
		},
		["description"] = {
			["tag"] = "text-body-medium"
		},
		["icon"] = {
			["size"] = v_u_2.Large
		}
	}
	v6[v13] = v14
	return {
		["common"] = {
			["title"] = {
				["tag"] = "auto-xy text-wrap text-align-x-left content-emphasis"
			},
			["metadata"] = {
				["tag"] = "auto-xy text-align-x-left text-truncate-split"
			},
			["description"] = {
				["tag"] = "auto-xy text-wrap text-align-x-left"
			}
		},
		["sizes"] = v6
	}
end
return function(p16, p17)
	-- upvalues: (copy) v_u_5, (copy) v_u_15, (copy) v_u_4
	local v18 = v_u_5.useVariants("ListItem", v_u_15, p16)
	return v_u_4(v18.common, v18.sizes[p17])
end