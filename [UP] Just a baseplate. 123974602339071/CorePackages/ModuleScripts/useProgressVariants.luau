-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Progress.useProgressVariants
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.ProgressSize)
local v_u_3 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
local v_u_4 = require(v1.Providers.Style.VariantsContext)
local function v_u_13(p5) -- name: variantsFactory
	-- upvalues: (copy) v_u_2
	local v6 = {}
	local v7 = v_u_2.Small
	local v8 = {
		["bar"] = {
			["height"] = p5.Size.Size_50
		},
		["circle"] = {
			["size"] = p5.Size.Size_400
		}
	}
	v6[v7] = v8
	local v9 = v_u_2.Medium
	local v10 = {
		["bar"] = {
			["height"] = p5.Size.Size_100
		},
		["circle"] = {
			["size"] = p5.Size.Size_800
		}
	}
	v6[v9] = v10
	local v11 = v_u_2.Large
	local v12 = {
		["bar"] = {
			["height"] = p5.Size.Size_150
		},
		["circle"] = {
			["size"] = p5.Size.Size_1300,
			["labelFont"] = p5.Typography.LabelMedium
		}
	}
	v6[v11] = v12
	return {
		["sizes"] = v6
	}
end
return function(p14, p15)
	-- upvalues: (copy) v_u_4, (copy) v_u_13, (copy) v_u_3
	return v_u_3(v_u_4.useVariants("Progress", v_u_13, p14).sizes[p15])
end