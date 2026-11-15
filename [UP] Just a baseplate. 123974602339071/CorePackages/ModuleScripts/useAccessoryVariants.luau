-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Chip.useAccessoryVariants
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.ChipSize)
local v_u_3 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
local v_u_4 = require(v1.Providers.Style.VariantsContext)
local function v_u_10(p5) -- name: variantsFactory
	-- upvalues: (copy) v_u_2
	local v6 = {
		["Default"] = {
			[v_u_2.Small] = UDim2.fromOffset(p5.Size.Size_300, p5.Size.Size_300),
			[v_u_2.Medium] = UDim2.fromOffset(p5.Size.Size_400, p5.Size.Size_400),
			[v_u_2.Large] = UDim2.fromOffset(p5.Size.Size_500, p5.Size.Size_500)
		},
		["Circular"] = {
			[v_u_2.Small] = UDim2.fromOffset(p5.Size.Size_400, p5.Size.Size_400),
			[v_u_2.Medium] = UDim2.fromOffset(p5.Size.Size_500, p5.Size.Size_500),
			[v_u_2.Large] = UDim2.fromOffset(p5.Size.Size_600, p5.Size.Size_600)
		}
	}
	local v7 = {
		["Circular"] = {
			[v_u_2.Small] = UDim.new(0, p5.Size.Size_150),
			[v_u_2.Medium] = UDim.new(0, p5.Size.Size_200),
			[v_u_2.Large] = UDim.new(0, p5.Size.Size_250)
		},
		["Default"] = {
			[v_u_2.Small] = UDim.new(0, p5.Padding.Small),
			[v_u_2.Medium] = UDim.new(0, p5.Padding.Medium),
			[v_u_2.Large] = UDim.new(0, p5.Padding.Medium)
		}
	}
	local v8 = {
		["Default"] = {
			[v_u_2.Small] = UDim.new(0, p5.Size.Size_150),
			[v_u_2.Medium] = UDim.new(0, p5.Size.Size_200),
			[v_u_2.Large] = UDim.new(0, p5.Size.Size_250)
		},
		["Circular"] = {
			[v_u_2.Small] = UDim.new(0, p5.Padding.XSmall),
			[v_u_2.Medium] = UDim.new(0, p5.Size.Size_150),
			[v_u_2.Large] = UDim.new(0, p5.Padding.Small)
		}
	}
	local v9 = {
		["Leading"] = {
			[v_u_2.Small] = UDim.new(0, p5.Padding.XSmall),
			[v_u_2.Medium] = UDim.new(0, p5.Size.Size_150),
			[v_u_2.Large] = UDim.new(0, p5.Padding.Small)
		},
		["Trailing"] = {
			[v_u_2.Small] = UDim.new(0, p5.Size.Size_150),
			[v_u_2.Medium] = UDim.new(0, p5.Padding.Small),
			[v_u_2.Large] = UDim.new(0, p5.Size.Size_250)
		}
	}
	return {
		["textSpacing"] = v9,
		["accessorySpacing"] = v7,
		["accessorySize"] = v6,
		["iconOnlySpacing"] = v8
	}
end
return function(p11, p12, p13, p14, p15)
	-- upvalues: (copy) v_u_4, (copy) v_u_10, (copy) v_u_3
	local v16 = v_u_4.useVariants("ChipAccessory", v_u_10, p11)
	local v17 = p14 and "Circular" or "Default"
	local v18 = p13 and "Leading" or "Trailing"
	local v19 = v_u_3
	local v20 = {}
	local v21 = {
		["Size"] = v16.accessorySize[v17][p12]
	}
	local v22
	if p15 then
		v22 = {
			["left"] = v16.iconOnlySpacing[v17][p12],
			["right"] = v16.iconOnlySpacing[v17][p12]
		}
	elseif p13 then
		v22 = {
			["left"] = v16.accessorySpacing[v17][p12],
			["right"] = v16.textSpacing[v18][p12]
		}
	else
		v22 = {
			["left"] = v16.textSpacing[v18][p12],
			["right"] = v16.accessorySpacing[v17][p12]
		}
	end
	v21.padding = v22
	v20.accessory = v21
	return v19(v20)
end