-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InternalInputGroup.useInputGroupVariants
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.InputSize)
local v_u_3 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
local v_u_4 = require(v1.Providers.Style.VariantsContext)
require(v1.Components.Types)
local function v_u_6(_) -- name: variantsFactory
	-- upvalues: (copy) v_u_2
	local v5 = {
		[v_u_2.XSmall] = {
			["container"] = {
				["tag"] = "gap-medium"
			},
			["children"] = {
				["tag"] = "gap-small"
			},
			["legend"] = {
				["tag"] = "text-title-small"
			}
		},
		[v_u_2.Small] = {
			["container"] = {
				["tag"] = "gap-large"
			},
			["children"] = {
				["tag"] = "gap-medium"
			},
			["legend"] = {
				["tag"] = "text-title-small"
			}
		},
		[v_u_2.Medium] = {
			["container"] = {
				["tag"] = "gap-large"
			},
			["children"] = {
				["tag"] = "gap-medium"
			},
			["legend"] = {
				["tag"] = "text-title-medium"
			}
		}
	}
	return {
		["common"] = {
			["container"] = {
				["tag"] = "col auto-xy"
			},
			["children"] = {
				["tag"] = "col auto-xy"
			},
			["legend"] = {
				["tag"] = "auto-xy text-wrap text-align-x-left content-emphasis"
			}
		},
		["sizes"] = v5
	}
end
return function(p7, p8) -- name: useInputGroupVariants
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_3
	local v9 = v_u_4.useVariants("InputGroup", v_u_6, p7)
	return v_u_3(v9.common, v9.sizes[p8])
end