-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Chip.useChipVariants
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.ChipSize)
local v_u_3 = require(v1.Enums.ChipVariant)
local v_u_4 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
local v_u_5 = require(v1.Providers.Style.VariantsContext)
local function v_u_18(p6) -- name: variantsFactory
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v7 = {
		[v_u_2.Small] = UDim.new(0, p6.Padding.Small),
		[v_u_2.Medium] = UDim.new(0, p6.Padding.Medium),
		[v_u_2.Large] = UDim.new(0, p6.Padding.Large)
	}
	local v8 = {
		[v_u_2.Small] = {
			["chip"] = {
				["tag"] = "size-0-600"
			},
			["text"] = {
				["tag"] = "text-label-small"
			}
		},
		[v_u_2.Medium] = {
			["chip"] = {
				["tag"] = "size-0-800"
			},
			["text"] = {
				["tag"] = "text-label-medium"
			}
		},
		[v_u_2.Large] = {
			["chip"] = {
				["tag"] = "size-0-1000"
			},
			["text"] = {
				["tag"] = "text-label-medium"
			}
		}
	}
	local v9 = {}
	local v10 = v_u_3.Utility
	local v11 = {}
	local v12 = {
		["chip"] = {
			["backgroundStyle"] = p6.Inverse.Surface.Surface_0
		},
		["text"] = {
			["contentStyle"] = p6.Inverse.Content.Emphasis
		}
	}
	v11[true] = v12
	local v13 = {
		["chip"] = {
			["backgroundStyle"] = p6.Color.ActionUtility.Background
		},
		["text"] = {
			["contentStyle"] = p6.Color.ActionUtility.Foreground
		}
	}
	v11[false] = v13
	v9[v10] = v11
	local v14 = v_u_3.Standard
	local v15 = {}
	local v16 = {
		["chip"] = {
			["backgroundStyle"] = p6.Inverse.Surface.Surface_0
		},
		["text"] = {
			["contentStyle"] = p6.Inverse.Content.Emphasis
		}
	}
	v15[true] = v16
	local v17 = {
		["chip"] = {
			["backgroundStyle"] = p6.Color.ActionStandard.Background
		},
		["text"] = {
			["contentStyle"] = p6.Color.ActionStandard.Foreground
		}
	}
	v15[false] = v17
	v9[v14] = v15
	return {
		["common"] = {
			["chip"] = {
				["tag"] = "row align-x-center align-y-center auto-x radius-circle clip"
			},
			["text"] = {
				["tag"] = "shrink size-0-full auto-x text-truncate-end"
			}
		},
		["sizes"] = v8,
		["types"] = v9,
		["textSpacing"] = v7
	}
end
return function(p19, p20, p21, p22, p23, p24)
	-- upvalues: (copy) v_u_5, (copy) v_u_18, (copy) v_u_4
	local v25 = v_u_5.useVariants("Chip", v_u_18, p19)
	local v26 = v_u_4
	local v27 = v25.common
	local v28 = v25.sizes[p20]
	local v29 = v25.types[p21][p22]
	local v30 = {}
	local v31 = {}
	local v32 = {}
	local v33
	if p23 then
		v33 = nil
	else
		v33 = v25.textSpacing[p20]
	end
	v32.left = v33
	local v34
	if p24 then
		v34 = nil
	else
		v34 = v25.textSpacing[p20]
	end
	v32.right = v34
	v31.padding = v32
	v30.text = v31
	return v26(v27, v28, v29, v30)
end