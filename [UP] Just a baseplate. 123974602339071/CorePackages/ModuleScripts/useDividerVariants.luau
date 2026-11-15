-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Divider.useDividerVariants
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Components.Types)
local v_u_2 = require(v1.Enums.DividerVariant)
local v_u_3 = require(v1.Enums.Orientation)
local v_u_4 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
local v_u_5 = require(v1.Providers.Style.VariantsContext)
local function v_u_14(p6) -- name: variantsFactory
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v7 = {
		["container"] = {
			["tag"] = "col"
		},
		["stroke"] = {
			["backgroundStyle"] = p6.Color.Stroke.Default
		},
		["line"] = {
			["tag"] = "size-full-200",
			["position"] = nil,
			["backgroundStyle"] = nil,
			["position"] = UDim2.fromOffset(0, p6.Size.Size_50),
			["backgroundStyle"] = p6.Color.Common.HeavyDivider
		}
	}
	local v8 = {}
	local v9 = v_u_3.Horizontal
	local v10 = {
		["container"] = {
			["tag"] = "size-full-0 auto-y"
		},
		["stroke"] = {
			["Size"] = UDim2.new(1, 0, 0, p6.Stroke.Standard)
		}
	}
	v8[v9] = v10
	local v11 = v_u_3.Vertical
	local v12 = {
		["container"] = {
			["tag"] = "size-0-full auto-x"
		},
		["stroke"] = {
			["Size"] = UDim2.new(0, p6.Stroke.Standard, 1, 0)
		}
	}
	v8[v11] = v12
	local v13 = {
		[v_u_2.Inset] = {
			["container"] = {
				["tag"] = "padding-x-xlarge"
			}
		},
		[v_u_2.InsetLeft] = {
			["container"] = {
				["tag"] = "padding-left-xlarge"
			}
		},
		[v_u_2.InsetRight] = {
			["container"] = {
				["tag"] = "padding-right-xlarge"
			}
		}
	}
	return {
		["common"] = v7,
		["padding"] = v13,
		["orientation"] = v8
	}
end
return function(p15, p16, p17)
	-- upvalues: (copy) v_u_5, (copy) v_u_14, (copy) v_u_4, (copy) v_u_3
	local v18 = v_u_5.useVariants("Divider", v_u_14, p15)
	return v_u_4(v18.common, p17 ~= v_u_3.Horizontal and {} or v18.padding[p16], v18.orientation[p17])
end