-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Link.useLinkVariants
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.InputSize)
local v_u_3 = require(v1.Enums.LinkVariant)
local v_u_4 = require(v1.Enums.TextOverflow)
require(v1.Components.Types)
local v_u_5 = require(v1.Utility.composeStyleVariant)
local v_u_6 = require(v1.Providers.Style.VariantsContext)
require(v1.Providers.Style.Tokens)
local function v_u_15(p7) -- name: variantsFactory
	-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_4
	local v8 = {}
	local v9 = v_u_3.Standard
	local v10 = {
		["content"] = {
			["style"] = p7.Color.Content.Emphasis
		}
	}
	v8[v9] = v10
	local v11 = v_u_3.Inverse
	local v12 = {
		["content"] = {
			["style"] = p7.Inverse.Content.Default
		}
	}
	v8[v11] = v12
	local v13 = {
		[v_u_2.XSmall] = {
			["text"] = {
				["tag"] = "text-body-small"
			}
		},
		[v_u_2.Small] = {
			["text"] = {
				["tag"] = "text-body-small"
			}
		},
		[v_u_2.Medium] = {
			["text"] = {
				["tag"] = "text-body-medium"
			}
		},
		[v_u_2.Large] = {
			["text"] = {
				["tag"] = "text-body-large"
			}
		}
	}
	local v14 = {
		[v_u_4.None] = {
			["container"] = {
				["tag"] = "auto-xy"
			},
			["text"] = {
				["tag"] = "auto-xy"
			}
		},
		[v_u_4.Wrap] = {
			["container"] = {
				["tag"] = "size-full-0 auto-y"
			},
			["text"] = {
				["tag"] = "size-full-0 auto-y text-wrap text-align-x-left"
			}
		},
		[v_u_4.Truncate] = {
			["container"] = {
				["tag"] = "size-full-0 auto-y"
			},
			["text"] = {
				["tag"] = "size-full-0 auto-y text-align-x-left text-truncate-end"
			}
		},
		[v_u_4.TruncateSplit] = {
			["container"] = {
				["tag"] = "size-full-0 auto-y"
			},
			["text"] = {
				["tag"] = "size-full-0 auto-y text-align-x-left text-truncate-split"
			}
		}
	}
	return {
		["common"] = {
			["container"] = {
				["tag"] = "row align-y-center"
			}
		},
		["variants"] = v8,
		["sizes"] = v13,
		["textOverflows"] = v14
	}
end
return function(p16, p17, p18, p19)
	-- upvalues: (copy) v_u_6, (copy) v_u_15, (copy) v_u_5
	local v20 = v_u_6.useVariants("Link", v_u_15, p16)
	return v_u_5(v20.common, v20.variants[p18], v20.sizes[p17], v20.textOverflows[p19])
end