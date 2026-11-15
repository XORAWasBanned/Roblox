-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.SystemBanner.useSystemBannerVariants
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Components.Types)
local v_u_2 = require(v1.Enums.ColorNamespace)
local v_u_3 = require(v1.Enums.AlertVariant)
local v_u_4 = require(v1.Enums.AlertSeverity)
local v_u_5 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
local v_u_6 = require(v1.Providers.Style.VariantsContext)
local function v_u_10(p7, p8) -- name: createStandardVariantStyles
	-- upvalues: (copy) v_u_2
	local v9 = {
		["container"] = {
			["tag"] = "bg-shift-200",
			["colorNamespace"] = nil,
			["colorNamespace"] = v_u_2.Color
		},
		["title"] = {
			["style"] = p7.Color.Content.Emphasis
		},
		["description"] = {
			["style"] = p7.Color.Content.Default
		},
		["icon"] = {
			["style"] = p8
		}
	}
	return v9
end
local function v_u_15(p11, p12, p13) -- name: createEmphasisVariantStyles
	local v14 = {
		["container"] = {
			["tag"] = p12,
			["colorNamespace"] = p13
		},
		["title"] = {
			["style"] = p11[p13].Content.Emphasis
		},
		["description"] = {
			["style"] = p11[p13].Content.Default
		},
		["icon"] = {
			["style"] = p11[p13].Content.Emphasis
		}
	}
	return v14
end
local function v_u_18(p16) -- name: variantsFactory
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_10, (copy) v_u_15, (copy) v_u_2
	local v17 = {
		[v_u_3.Standard] = {
			[v_u_4.Info] = v_u_10(p16, p16.Color.System.Emphasis),
			[v_u_4.Warning] = v_u_10(p16, p16.Color.System.Warning),
			[v_u_4.Success] = v_u_10(p16, p16.Color.System.Success),
			[v_u_4.Error] = v_u_10(p16, p16.Color.System.Alert)
		},
		[v_u_3.Emphasis] = {
			[v_u_4.Info] = v_u_15(p16, "bg-system-emphasis", v_u_2.DarkMode),
			[v_u_4.Warning] = v_u_15(p16, "bg-system-warning", v_u_2.LightMode),
			[v_u_4.Success] = v_u_15(p16, "bg-system-success", v_u_2.LightMode),
			[v_u_4.Error] = v_u_15(p16, "bg-system-alert", v_u_2.DarkMode)
		}
	}
	return {
		["common"] = {
			["container"] = {
				["tag"] = "row gap-medium size-full-0 auto-y padding-x-medium padding-y-large"
			},
			["title"] = {
				["tag"] = "auto-xy padding-y-xxsmall text-title-medium text-wrap text-align-x-left"
			},
			["description"] = {
				["tag"] = "auto-xy text-body-medium text-wrap text-align-x-left"
			}
		},
		["severity"] = v17
	}
end
return function(p19, p20, p21)
	-- upvalues: (copy) v_u_6, (copy) v_u_18, (copy) v_u_5
	local v22 = v_u_6.useVariants("SystemBanner", v_u_18, p19)
	return v_u_5(v22.common, v22.severity[p20][p21])
end