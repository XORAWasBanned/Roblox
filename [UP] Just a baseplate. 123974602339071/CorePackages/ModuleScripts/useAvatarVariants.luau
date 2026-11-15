-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Avatar.useAvatarVariants
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Utility.composeStyleVariant)
local v_u_3 = require(v1.Utility.Flags)
require(v1.Providers.Style.Tokens)
local v_u_4 = require(v1.Providers.Style.VariantsContext)
local v_u_5 = require(v1.Enums.AvatarSize)
local v_u_6 = require(v1.Enums.UserPresence)
local v_u_7 = require(v1.Enums.StatusIndicatorVariant)
local v_u_8 = require(v1.Enums.StatusIndicatorSize)
local v_u_9 = require(v1.Enums.StatusIndicatorShape)
require(v1.Components.Types)
local v_u_10 = require(v1.Utility.indexBindable)
local function v_u_34(p11) -- name: variantsFactory
	-- upvalues: (copy) v_u_5, (copy) v_u_8, (copy) v_u_3, (copy) v_u_6, (copy) v_u_9, (copy) v_u_7
	local v12 = {
		["container"] = {
			["tag"] = "radius-circle"
		},
		["avatar"] = {
			["tag"] = "size-full radius-circle"
		},
		["statusIndicatorMask"] = {
			["ZIndex"] = 2,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["mask"] = nil,
			["AnchorPoint"] = Vector2.new(1, 1),
			["Position"] = UDim2.new(1, -p11.Size.Size_150 / 2, 1, -p11.Size.Size_150 / 2),
			["mask"] = p11.Color.Surface.Surface_0
		}
	}
	local v13 = {}
	local v14 = v_u_5.XSmall
	local v15 = {
		["statusIndicator"] = {
			["size"] = v_u_8.XSmall
		}
	}
	v13[v14] = v15
	local v16 = v_u_5.Small
	local v17 = {
		["statusIndicator"] = {
			["size"] = v_u_8.XSmall
		}
	}
	v13[v16] = v17
	local v18 = v_u_5.Medium
	local v19 = {
		["statusIndicator"] = {
			["size"] = v_u_8.Small
		}
	}
	v13[v18] = v19
	local v20 = v_u_5.Large
	local v21 = {
		["statusIndicator"] = {
			["size"] = v_u_8.Small
		}
	}
	v13[v20] = v21
	local v22 = v_u_5.XLarge
	local v23 = {
		["statusIndicator"] = {
			["size"] = v_u_8.Medium
		}
	}
	v13[v22] = v23
	local v24 = v_u_5.Pictogram
	local v25 = {}
	local v26 = {}
	local v27
	if v_u_3.FoundationStatusIndicatorDesignUpdate then
		v27 = v_u_8.Large
	else
		v27 = v_u_8.Pictogram
	end
	v26.size = v27
	v25.statusIndicator = v26
	v13[v24] = v25
	local v28 = {
		[v_u_6.InExperience] = {}
	}
	local v29 = v_u_6.Away
	local v30 = {
		["statusIndicator"] = {
			["shape"] = v_u_9.Ring,
			["variant"] = v_u_7.Neutral
		}
	}
	v28[v29] = v30
	local v31 = v_u_6.Active
	local v32 = {
		["statusIndicator"] = {
			["shape"] = v_u_9.Circle,
			["variant"] = v_u_7.Success
		}
	}
	v28[v31] = v32
	v28[v_u_6.None] = {}
	local v33 = {
		[v_u_5.Small] = p11.Stroke.Thicker,
		[v_u_5.Medium] = p11.Stroke.Thicker,
		[v_u_5.Large] = p11.Stroke.Thicker,
		[v_u_5.XLarge] = p11.Stroke.Thicker,
		[v_u_5.Pictogram] = p11.Stroke.Thicker + p11.Stroke.Standard
	}
	return {
		["common"] = v12,
		["sizes"] = v13,
		["presence"] = v28,
		["iconSizeStrokes"] = {
			[v_u_5.XSmall] = p11.Stroke.Standard,
			[v_u_5.Small] = p11.Stroke.Thick,
			[v_u_5.Medium] = p11.Stroke.Thick,
			[v_u_5.Large] = p11.Stroke.Thicker,
			[v_u_5.XLarge] = p11.Stroke.Thicker,
			[v_u_5.Pictogram] = p11.Stroke.Thicker
		},
		["sizeStrokes"] = v33
	}
end
return function(p35, p36, p37, p38, p39)
	-- upvalues: (copy) v_u_4, (copy) v_u_34, (copy) v_u_6, (copy) v_u_2, (copy) v_u_10
	local v40 = v_u_4.useVariants("Avatar", v_u_34, p35)
	local v41 = not p39
	if v41 then
		v41 = p37 == v_u_6.Active and true or p37 == v_u_6.Away
	end
	local v42
	if p39 or p37 ~= v_u_6.InExperience then
		v42 = p38
	else
		v42 = p35.Color.System.Emphasis
	end
	local v43
	if p39 then
		v43 = v40.iconSizeStrokes[p36]
	else
		v43 = v40.sizeStrokes[p36]
	end
	local v44 = v_u_2
	local v45 = v40.common
	local v46 = v40.sizes[p36]
	local v47 = v40.presence[p37]
	local v48 = {
		["container"] = {
			["stroke"] = v42 and {
				["Color"] = v_u_10(v42, "Color3"),
				["Transparency"] = v_u_10(v42, "Transparency"),
				["Thickness"] = v43
			} or nil,
			["backgroundStyle"] = p38
		},
		["statusIndicator"] = {
			["isVisible"] = v41
		}
	}
	return v44(v45, v46, v47, v48)
end