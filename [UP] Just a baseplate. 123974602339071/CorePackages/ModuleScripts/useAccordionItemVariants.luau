-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Accordion.useAccordionItemVariants
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.InputSize)
local v_u_3 = require(v1.Providers.Style.VariantsContext)
local v_u_4 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
require(v1.Components.Types)
local v_u_5 = require(v1.Enums.StateLayerAffordance)
local v_u_6 = require(v1.Enums.IconSize)
local function v_u_20(p7)
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_6
	local v8 = {}
	local v9 = {
		["tag"] = "col flex-y-between align-x-center size-full-0 auto-y",
		["stateLayer"] = nil,
		["stateLayer"] = {
			["affordance"] = v_u_5.None
		}
	}
	v8.container = v9
	v8.header = {
		["tag"] = "row flex-x-between align-y-center"
	}
	v8.content = {
		["tag"] = "size-full-0 auto-y padding-top-xsmall"
	}
	v8.icon = {
		["style"] = p7.Color.Content.Emphasis
	}
	v8.text = {
		["tag"] = "auto-y text-align-x-left text-truncate-end content-emphasis"
	}
	v8.textContainer = {
		["tag"] = "col grow auto-y"
	}
	v8.description = {
		["tag"] = "size-full-0 auto-y text-align-x-left text-truncate-end"
	}
	local v10 = {}
	local v11 = v_u_2.XSmall
	local v12 = {
		["container"] = {
			["tag"] = "radius-small"
		},
		["header"] = {
			["tag"] = "gap-small size-full-600"
		},
		["content"] = {
			["tag"] = "padding-bottom-small"
		},
		["icon"] = {
			["size"] = v_u_6.XSmall
		},
		["text"] = {
			["tag"] = "text-title-small"
		},
		["description"] = {
			["tag"] = "text-body-small"
		}
	}
	v10[v11] = v12
	local v13 = v_u_2.Small
	local v14 = {
		["container"] = {
			["tag"] = "radius-medium"
		},
		["header"] = {
			["tag"] = "gap-small size-full-800"
		},
		["content"] = {
			["tag"] = "padding-bottom-large"
		},
		["icon"] = {
			["size"] = v_u_6.Small
		},
		["text"] = {
			["tag"] = "text-title-small"
		},
		["description"] = {
			["tag"] = "text-body-small"
		}
	}
	v10[v13] = v14
	local v15 = v_u_2.Medium
	local v16 = {
		["container"] = {
			["tag"] = "radius-medium"
		},
		["header"] = {
			["tag"] = "gap-small size-full-1000"
		},
		["content"] = {
			["tag"] = "padding-bottom-xlarge"
		},
		["icon"] = {
			["size"] = v_u_6.Medium
		},
		["text"] = {
			["tag"] = "text-title-medium"
		},
		["description"] = {
			["tag"] = "text-body-medium"
		}
	}
	v10[v15] = v16
	local v17 = v_u_2.Large
	local v18 = {
		["container"] = {
			["tag"] = "radius-medium"
		},
		["header"] = {
			["tag"] = "gap-small size-full-1200"
		},
		["content"] = {
			["tag"] = "padding-bottom-xlarge"
		},
		["icon"] = {
			["size"] = v_u_6.Large
		},
		["text"] = {
			["tag"] = "text-title-large"
		},
		["description"] = {
			["tag"] = "text-body-medium"
		}
	}
	v10[v17] = v18
	local v19 = {
		[true] = {
			["header"] = {
				["tag"] = "padding-x-medium"
			},
			["content"] = {
				["tag"] = "padding-x-medium"
			}
		}
	}
	return {
		["common"] = v8,
		["sizes"] = v10,
		["isContained"] = v19
	}
end
return function(p21, p22, p23)
	-- upvalues: (copy) v_u_3, (copy) v_u_20, (copy) v_u_4
	local v24 = v_u_3.useVariants("AccordionItem", v_u_20, p21)
	return v_u_4(v24.common, v24.sizes[p22], v24.isContained[p23])
end