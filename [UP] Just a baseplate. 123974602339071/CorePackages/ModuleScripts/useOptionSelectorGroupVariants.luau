-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.OptionSelectorGroup.useOptionSelectorGroupVariants
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.InputLabelSize)
local v_u_3 = require(v1.Enums.OptionSelectorGroupSize)
local v_u_4 = require(v1.Enums.Orientation)
local v_u_5 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
require(v1.Components.Types)
local v_u_6 = require(v1.Providers.Style.VariantsContext)
local function v_u_21(_) -- name: variantsFactory
	-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_4
	local v7 = {}
	local v8 = v_u_3.XSmall
	local v9 = {
		["legend"] = {
			["size"] = v_u_2.Small
		}
	}
	v7[v8] = v9
	local v10 = v_u_3.Small
	local v11 = {
		["legend"] = {
			["size"] = v_u_2.Small
		}
	}
	v7[v10] = v11
	local v12 = v_u_3.Medium
	local v13 = {
		["legend"] = {
			["size"] = v_u_2.Medium
		}
	}
	v7[v12] = v13
	local v14 = {}
	local v15 = v_u_4.Vertical
	local v16 = {}
	local v17 = {
		["tag"] = {
			["col"] = true
		}
	}
	v16.list = v17
	v14[v15] = v16
	local v18 = v_u_4.Horizontal
	local v19 = {}
	local v20 = {
		["tag"] = {
			["row"] = true
		}
	}
	v19.list = v20
	v14[v18] = v19
	return {
		["common"] = {
			["container"] = {
				["tag"] = "col gap-small size-full-0 auto-y"
			},
			["list"] = {
				["tag"] = "gap-medium size-full-0 auto-y"
			}
		},
		["sizes"] = v7,
		["orientations"] = v14
	}
end
return function(p22, p23, p24)
	-- upvalues: (copy) v_u_6, (copy) v_u_21, (copy) v_u_5
	local v25 = v_u_6.useVariants("OptionSelectorGroup", v_u_21, p22)
	return v_u_5(v25.common, v25.sizes[p23], v25.orientations[p24])
end