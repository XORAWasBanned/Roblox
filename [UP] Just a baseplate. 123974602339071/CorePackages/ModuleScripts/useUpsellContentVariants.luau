-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Banner.Subcomponents.useUpsellContentVariants
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Components.Types)
local v_u_2 = require(v1.Enums.CardDensity)
local v_u_3 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
local v_u_4 = require(v1.Providers.Style.VariantsContext)
require(script.Parent.Thumbnail)
local function v_u_14(p5) -- name: variantsFactory
	-- upvalues: (copy) v_u_2
	local v6 = p5.Typography.BodySmall
	local v7 = {}
	local v8 = v_u_2.Compact
	local v9 = {}
	local v10 = {
		["sizeConstraint"] = {
			["MaxSize"] = Vector2.new((1 / 0), v6.FontSize * v6.LineHeight * 1)
		}
	}
	v9.description = v10
	v7[v8] = v9
	local v11 = v_u_2.Default
	local v12 = {}
	local v13 = {
		["sizeConstraint"] = {
			["MaxSize"] = Vector2.new((1 / 0), v6.FontSize * v6.LineHeight * 2)
		}
	}
	v12.description = v13
	v7[v11] = v12
	return {
		["common"] = {
			["container"] = {
				["tag"] = "row align-y-center gap-medium size-full-0 auto-y"
			},
			["content"] = {
				["tag"] = "col fill auto-y"
			},
			["title"] = {
				["tag"] = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis"
			},
			["description"] = {
				["tag"] = "size-full-0 auto-y text-body-small text-wrap text-align-x-left content-emphasis"
			}
		},
		["densities"] = v7
	}
end
return function(p15, p16)
	-- upvalues: (copy) v_u_4, (copy) v_u_14, (copy) v_u_3
	local v17 = v_u_4.useVariants("Banner.UpsellContent", v_u_14, p15)
	return v_u_3(v17.common, v17.densities[p16])
end