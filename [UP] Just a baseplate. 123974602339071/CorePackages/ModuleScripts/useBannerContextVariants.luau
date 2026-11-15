-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.BannerContext.useBannerContextVariants
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.BannerContextPresentation)
local v_u_3 = require(v1.Enums.BannerContextVariant)
local v_u_4 = require(v1.Enums.IconSize)
require(v1.Components.InternalNotice)
require(v1.Components.Types)
local v_u_5 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
local v_u_6 = require(v1.Providers.Style.VariantsContext)
local function v_u_9(p7, p8) -- name: affixedContentPadding
	return {
		["top"] = UDim.new(0, p8),
		["right"] = UDim.new(0, p7.Margin.Medium),
		["bottom"] = UDim.new(0, p8),
		["left"] = UDim.new(0, p7.Margin.Medium)
	}
end
local function v_u_35(p10) -- name: variantsFactory
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_3, (copy) v_u_9
	local v11 = p10.Typography.BodySmall.FontSize
	local v12 = {}
	local v13 = UDim.new
	local v14 = (p10.Size.Size_600 - v11) / 2
	v12.top = v13(0, (math.round(v14)))
	local v15 = p10.Typography.BodyMedium.FontSize
	local v16 = {}
	local v17 = UDim.new
	local v18 = (p10.Size.Size_600 - v15) / 2
	v16.top = v17(0, (math.round(v18)))
	local v19 = {
		["content"] = {
			["gap"] = "gap-large"
		},
		["stack"] = {
			["gap"] = "gap-xxsmall"
		},
		["icon"] = {
			["style"] = p10.Color.Content.Emphasis
		},
		["message"] = {
			["tag"] = "content-emphasis"
		},
		["link"] = {
			["tag"] = "content-emphasis"
		}
	}
	local v20 = {}
	local v21 = v_u_2.Inline
	local v22 = {
		["container"] = {
			["tag"] = "radius-medium"
		},
		["content"] = {
			["tag"] = "padding-medium"
		},
		["leading"] = {
			["gap"] = "gap-small"
		},
		["icon"] = {
			["size"] = v_u_4.Small
		},
		["message"] = {
			["tag"] = "text-body-small",
			["padding"] = nil,
			["padding"] = v12
		},
		["link"] = {
			["tag"] = "text-body-small",
			["padding"] = nil,
			["padding"] = v12
		}
	}
	v20[v21] = v22
	local v23 = v_u_2.Affixed
	local v24 = {
		["leading"] = {
			["gap"] = "gap-medium"
		},
		["icon"] = {
			["size"] = v_u_4.Medium
		},
		["message"] = {
			["tag"] = "text-body-medium",
			["padding"] = nil,
			["padding"] = v16
		},
		["link"] = {
			["tag"] = "text-body-medium",
			["padding"] = nil,
			["padding"] = v16
		}
	}
	v20[v23] = v24
	local v25 = {
		[v_u_3.Standard] = {},
		[v_u_3.Emphasis] = {
			["container"] = {
				["tag"] = "bg-shift-200"
			}
		}
	}
	local v26 = {}
	local v27 = v_u_2.Inline
	local v28 = {
		[v_u_3.Standard] = {
			["container"] = {
				["tag"] = "stroke-standard stroke-default"
			}
		},
		[v_u_3.Emphasis] = {}
	}
	v26[v27] = v28
	local v29 = v_u_2.Affixed
	local v30 = {}
	local v31 = v_u_3.Standard
	local v32 = {
		["content"] = {
			["padding"] = v_u_9(p10, p10.Padding.Large - p10.Stroke.Standard)
		},
		["border"] = {
			["Size"] = UDim2.new(1, 0, 0, p10.Stroke.Standard),
			["backgroundStyle"] = p10.Color.Stroke.Default
		}
	}
	v30[v31] = v32
	local v33 = v_u_3.Emphasis
	local v34 = {
		["content"] = {
			["padding"] = v_u_9(p10, p10.Padding.Large)
		}
	}
	v30[v33] = v34
	v26[v29] = v30
	return {
		["common"] = v19,
		["presentations"] = v20,
		["variants"] = v25,
		["presentationVariants"] = v26
	}
end
return function(p36, p37, p38) -- name: useBannerContextVariants
	-- upvalues: (copy) v_u_6, (copy) v_u_35, (copy) v_u_5
	local v39 = v_u_6.useVariants("BannerContext", v_u_35, p36)
	return v_u_5(v39.common, v39.presentations[p37], v39.variants[p38], v39.presentationVariants[p37][p38])
end