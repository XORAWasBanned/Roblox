-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Dropdown.useDropdownVariants
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
require(v1.Components.Types)
local v_u_4 = require(v1.Enums.ControlState)
local v_u_5 = require(v1.Enums.InputSize)
local v_u_6 = require(v1.Enums.IconSize)
require(v1.Enums.InputLabelSize)
local v_u_7 = require(v1.Enums.InputVariant)
local v_u_8 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
local v_u_9 = require(v1.Providers.Style.VariantsContext)
local v_u_10 = require(v1.Components.InputField.getInputVariantsFactory)
local function v_u_22() -- name: variantsFactory
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_4, (copy) v_u_3
	local v11 = {}
	local v12 = v_u_5.XSmall
	local v13 = {
		["container"] = {
			["tag"] = "gap-small size-full-600 padding-small radius-small"
		},
		["text"] = {
			["tag"] = "text-body-small"
		},
		["arrow"] = {
			["size"] = v_u_6.XSmall
		}
	}
	v11[v12] = v13
	local v14 = v_u_5.Small
	local v15 = {
		["container"] = {
			["tag"] = "gap-small size-full-800 padding-medium radius-medium"
		},
		["text"] = {
			["tag"] = "text-body-small"
		},
		["arrow"] = {
			["size"] = v_u_6.Small
		}
	}
	v11[v14] = v15
	local v16 = v_u_5.Medium
	local v17 = {
		["container"] = {
			["tag"] = "gap-small size-full-1000 padding-medium radius-medium"
		},
		["text"] = {
			["tag"] = "text-body-medium"
		},
		["arrow"] = {
			["size"] = v_u_6.Medium
		}
	}
	v11[v16] = v17
	local v18 = v_u_5.Large
	local v19 = {
		["container"] = {
			["tag"] = "gap-small size-full-1200 padding-medium radius-medium"
		},
		["text"] = {
			["tag"] = "text-body-large"
		},
		["arrow"] = {
			["size"] = v_u_6.Large
		}
	}
	v11[v18] = v19
	local v20 = {
		[v_u_4.Disabled] = {
			["container"] = nil,
			["text"] = nil,
			["text"] = {
				["tag"] = "content-muted"
			}
		},
		[v_u_4.Initialize] = {
			["container"] = nil,
			["text"] = nil,
			["text"] = {
				["tag"] = "content-default"
			}
		},
		[v_u_4.Default] = nil,
		[v_u_4.Hover] = nil,
		[v_u_4.Pressed] = nil
	}
	return {
		["common"] = {
			["container"] = {
				["tag"] = "row flex-x-between align-y-center"
			},
			["text"] = {
				["tag"] = "shrink auto-xy text-truncate-split content-emphasis"
			}
		},
		["sizes"] = v11,
		["states"] = v20,
		["placeholderStates"] = v_u_3.map(v20, function(p21)
			-- upvalues: (ref) v_u_3
			return v_u_3.join(p21, {
				["text"] = {
					["tag"] = "content-muted"
				}
			})
		end)
	}
end
return function(p23, p24, p25, p26, p27, p28, p29, p30)
	-- upvalues: (copy) v_u_9, (copy) v_u_22, (copy) v_u_10, (copy) v_u_7, (copy) v_u_8
	local v31 = v_u_9.useVariants("Dropdown", v_u_22, p23)
	local v32 = v_u_9.useVariants("InputField", v_u_10, p23)
	local v33 = v32.variants[p25 or v_u_7.Standard]
	local v34 = v_u_8
	local v35 = v32.common
	local v36 = v31.common
	local v37 = v32.sizes[p24]
	local v38 = v31.sizes[p24]
	local v39 = p25 == v_u_7.Utility and {} or v33
	local v40 = v32.hoverState[p30]
	local v41 = v32.focusedState[p29]
	local v42 = v32.errorState[p28]
	local v43
	if p27 then
		v43 = v31.placeholderStates[p26]
	else
		v43 = v31.states[p26]
	end
	return v34(v35, v36, v37, v38, v39, v40, v41, v42, v43, p25 ~= v_u_7.Utility and {} or v33)
end