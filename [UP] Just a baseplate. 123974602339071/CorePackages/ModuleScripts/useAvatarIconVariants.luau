-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.AvatarIcon.useAvatarIconVariants
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Providers.Style.Tokens)
local v_u_2 = require(v1.Providers.Style.VariantsContext)
local v_u_3 = require(v1.Utility.composeStyleVariant)
local v_u_4 = require(v1.Enums.AvatarIconSize)
require(v1.Components.Types)
local v_u_5 = require(v1.Utility.indexBindable)
local function v_u_10(p6, p7) -- name: composeStroke
	-- upvalues: (copy) v_u_5
	if not (p6 and p7) then
		return {}
	end
	local v8 = {}
	local v9 = {
		["stroke"] = {
			["Color"] = v_u_5(p6, "Color3"),
			["Transparency"] = v_u_5(p6, "Transparency"),
			["Thickness"] = p7
		}
	}
	v8.container = v9
	return v8
end
local function v_u_24(p11) -- name: variantsFactory
	-- upvalues: (copy) v_u_4
	local v12 = {
		[true] = {
			[v_u_4.XSmall] = p11.Stroke.Standard,
			[v_u_4.Small] = p11.Stroke.Standard,
			[v_u_4.Medium] = p11.Stroke.Thick,
			[v_u_4.Large] = p11.Stroke.Thicker,
			[v_u_4.XLarge] = p11.Stroke.Thicker
		},
		[false] = {}
	}
	local v13 = {}
	local v14 = v_u_4.XSmall
	local v15 = {
		["container"] = {
			["size"] = p11.Size.Size_300
		}
	}
	v13[v14] = v15
	local v16 = v_u_4.Small
	local v17 = {
		["container"] = {
			["size"] = p11.Size.Size_400
		}
	}
	v13[v16] = v17
	local v18 = v_u_4.Medium
	local v19 = {
		["container"] = {
			["size"] = p11.Size.Size_500
		}
	}
	v13[v18] = v19
	local v20 = v_u_4.Large
	local v21 = {
		["container"] = {
			["size"] = p11.Size.Size_600
		}
	}
	v13[v20] = v21
	local v22 = v_u_4.XLarge
	local v23 = {
		["container"] = {
			["size"] = p11.Size.Size_700
		}
	}
	v13[v22] = v23
	return {
		["strokes"] = v12,
		["common"] = {
			["container"] = {
				["tag"] = "radius-circle"
			},
			["avatar"] = {
				["tag"] = "size-full radius-circle"
			}
		},
		["sizes"] = v13
	}
end
return function(p25, p26, p27)
	-- upvalues: (copy) v_u_2, (copy) v_u_24, (copy) v_u_3, (copy) v_u_10
	local v28 = v_u_2.useVariants("AvatarIcon", v_u_24, p25)
	return v_u_3(v28.common, v28.sizes[p26], (v_u_10(p27, v28.strokes[p27 ~= nil][p26])))
end