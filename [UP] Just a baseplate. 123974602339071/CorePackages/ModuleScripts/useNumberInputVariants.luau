-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.NumberInput.useNumberInputVariants
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Enums.NumberInputControlsVariant)
local v_u_2 = require(v1.Enums.InputSize)
local v_u_3 = require(v1.Enums.IconSize)
local v_u_4 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
local v_u_5 = require(v1.Providers.Style.VariantsContext)
local function v_u_16(p6) -- name: variantsFactory
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v7 = {}
	local v8 = v_u_2.XSmall
	local v9 = {
		["controls"] = {
			["width"] = nil,
			["buttonSize"] = nil,
			["iconSize"] = nil,
			["tag"] = "radius-small",
			["radius"] = nil,
			["width"] = p6.Size.Size_1200,
			["buttonSize"] = p6.Size.Size_600,
			["iconSize"] = v_u_3.XSmall,
			["radius"] = p6.Radius.Small
		}
	}
	v7[v8] = v9
	local v10 = v_u_2.Small
	local v11 = {
		["controls"] = {
			["width"] = nil,
			["buttonSize"] = nil,
			["iconSize"] = nil,
			["tag"] = "radius-medium",
			["radius"] = nil,
			["width"] = p6.Size.Size_1600,
			["buttonSize"] = p6.Size.Size_800,
			["iconSize"] = v_u_3.Small,
			["radius"] = p6.Radius.Medium
		}
	}
	v7[v10] = v11
	local v12 = v_u_2.Medium
	local v13 = {
		["controls"] = {
			["width"] = nil,
			["buttonSize"] = nil,
			["iconSize"] = nil,
			["tag"] = "radius-medium",
			["radius"] = nil,
			["width"] = p6.Size.Size_2000,
			["buttonSize"] = p6.Size.Size_1000,
			["iconSize"] = v_u_3.Medium,
			["radius"] = p6.Radius.Medium
		}
	}
	v7[v12] = v13
	local v14 = v_u_2.Large
	local v15 = {
		["controls"] = {
			["width"] = nil,
			["buttonSize"] = nil,
			["iconSize"] = nil,
			["tag"] = "radius-medium",
			["radius"] = nil,
			["width"] = p6.Size.Size_2400,
			["buttonSize"] = p6.Size.Size_1200,
			["iconSize"] = v_u_3.Large,
			["radius"] = p6.Radius.Medium
		}
	}
	v7[v14] = v15
	return {
		["common"] = {
			["controls"] = {
				["tag"] = "row align-y-center bg-action-standard"
			}
		},
		["sizes"] = v7
	}
end
return function(p17, p18)
	-- upvalues: (copy) v_u_5, (copy) v_u_16, (copy) v_u_4
	local v19 = v_u_5.useVariants("NumberInput", v_u_16, p17)
	return v_u_4(v19.common, v19.sizes[p18])
end