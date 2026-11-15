-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.List.Item.useListAccessoryVariants
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.AccessoryType)
local v_u_3 = require(v1.Enums.InputSize)
local v_u_4 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
local v_u_5 = require(v1.Providers.Style.VariantsContext)
local function v_u_8(p6) -- name: variantsFactory
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v7 = {
		[v_u_2.Icon] = {
			[v_u_3.XSmall] = p6.Size.Size_400,
			[v_u_3.Small] = p6.Size.Size_500,
			[v_u_3.Medium] = p6.Size.Size_600,
			[v_u_3.Large] = p6.Size.Size_600
		},
		[v_u_2.Media] = {
			[v_u_3.XSmall] = p6.Size.Size_600,
			[v_u_3.Small] = p6.Size.Size_800,
			[v_u_3.Medium] = p6.Size.Size_1000,
			[v_u_3.Large] = p6.Size.Size_1400
		},
		[v_u_2.Avatar] = {
			[v_u_3.XSmall] = p6.Size.Size_600,
			[v_u_3.Small] = p6.Size.Size_800,
			[v_u_3.Medium] = p6.Size.Size_1000,
			[v_u_3.Large] = p6.Size.Size_1400
		}
	}
	return {
		["accessorySize"] = v7,
		["containerSize"] = {
			[v_u_3.XSmall] = p6.Size.Size_600,
			[v_u_3.Small] = p6.Size.Size_800,
			[v_u_3.Medium] = p6.Size.Size_1000,
			[v_u_3.Large] = p6.Size.Size_1400
		},
		["cornerRadius"] = {
			[v_u_3.XSmall] = p6.Radius.Small,
			[v_u_3.Small] = p6.Radius.Medium,
			[v_u_3.Medium] = p6.Radius.Medium,
			[v_u_3.Large] = p6.Radius.Medium
		}
	}
end
return function(p9, p10, p11)
	-- upvalues: (copy) v_u_5, (copy) v_u_8, (copy) v_u_4
	local v12 = v_u_5.useVariants("ListAccessory", v_u_8, p9)
	local v13 = v_u_4
	local v14 = {
		["accessory"] = {
			["Size"] = UDim2.fromOffset(v12.accessorySize[p11][p10], v12.accessorySize[p11][p10]),
			["cornerRadius"] = UDim.new(0, v12.cornerRadius[p10])
		},
		["container"] = {
			["Size"] = UDim2.fromOffset(v12.containerSize[p10], v12.containerSize[p10])
		}
	}
	return v13(v14)
end