-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.ChipGroup.useChipGroupVariants
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.ChipSize)
local v_u_3 = require(v1.Enums.ChipGroupVariant)
require(v1.Providers.Style.Tokens)
local v_u_4 = require(v1.Providers.Style.VariantsContext)
local function v_u_6(p5) -- name: variantsFactory
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	return {
		["scrimWidth"] = {
			[v_u_2.Small] = p5.Size.Size_600,
			[v_u_2.Medium] = p5.Size.Size_800
		},
		["gap"] = {
			[v_u_2.Small] = p5.Padding.XSmall,
			[v_u_2.Medium] = p5.Padding.Small
		},
		["variants"] = {
			[v_u_3.Row] = {
				["isWrapped"] = false,
				["hasScrim"] = true
			},
			[v_u_3.Wrap] = {
				["isWrapped"] = true,
				["hasScrim"] = false
			}
		}
	}
end
return function(p7, p8, p9)
	-- upvalues: (copy) v_u_4, (copy) v_u_6
	local v10 = v_u_4.useVariants("ChipGroup", v_u_6, p7)
	local v11 = v10.variants[p8]
	return {
		["isWrapped"] = v11.isWrapped,
		["hasScrim"] = v11.hasScrim,
		["scrimWidth"] = v10.scrimWidth[p9],
		["gap"] = v10.gap[p9]
	}
end