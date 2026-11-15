-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.IconButton.useIconButtonVariants
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.InputSize)
require(v1.Enums.ButtonVariant)
local v_u_3 = require(v1.Enums.ColorNamespace)
require(v1.Components.Types)
local v_u_4 = require(v1.Providers.Style.VariantsContext)
local v_u_5 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
local v_u_6 = require(v1.Components.Button.getSharedVariants)
local function v_u_18(p7)
	-- upvalues: (copy) v_u_6, (copy) v_u_2
	local v8 = v_u_6(p7)
	local v9 = {}
	local v10 = v_u_2.XSmall
	local v11 = {
		["container"] = {
			["radius"] = v8.sizes[v_u_2.XSmall].container.radius,
			["size"] = UDim2.fromOffset(v8.sizes[v_u_2.XSmall].container.height, v8.sizes[v_u_2.XSmall].container.height),
			["padding"] = UDim.new(0, p7.Size.Size_150)
		}
	}
	v9[v10] = v11
	local v12 = v_u_2.Small
	local v13 = {
		["container"] = {
			["radius"] = v8.sizes[v_u_2.Small].container.radius,
			["size"] = UDim2.fromOffset(v8.sizes[v_u_2.Small].container.height, v8.sizes[v_u_2.Small].container.height),
			["padding"] = UDim.new(0, p7.Size.Size_200)
		}
	}
	v9[v12] = v13
	local v14 = v_u_2.Medium
	local v15 = {
		["container"] = {
			["radius"] = v8.sizes[v_u_2.Medium].container.radius,
			["size"] = UDim2.fromOffset(v8.sizes[v_u_2.Medium].container.height, v8.sizes[v_u_2.Medium].container.height),
			["padding"] = UDim.new(0, p7.Size.Size_250)
		}
	}
	v9[v14] = v15
	local v16 = v_u_2.Large
	local v17 = {
		["container"] = {
			["radius"] = v8.sizes[v_u_2.Large].container.radius,
			["size"] = UDim2.fromOffset(v8.sizes[v_u_2.Large].container.height, v8.sizes[v_u_2.Large].container.height),
			["padding"] = UDim.new(0, p7.Size.Size_300)
		}
	}
	v9[v16] = v17
	return {
		["common"] = {},
		["sizes"] = v9,
		["types"] = v8.types
	}
end
return function(p19, p20, p21, p22)
	-- upvalues: (copy) v_u_4, (copy) v_u_18, (copy) v_u_5, (copy) v_u_3
	local v23 = v_u_4.useVariants("IconButton", v_u_18, p19)
	return v_u_5(v23.common, v23.sizes[p20], v23.types[p21][p22 or v_u_3.Color])
end