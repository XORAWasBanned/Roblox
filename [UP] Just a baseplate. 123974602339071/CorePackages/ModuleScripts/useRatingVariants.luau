-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Rating.useRatingVariants
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.IconSize)
local v_u_3 = require(v1.Enums.ChipSize)
require(v1.Components.Types)
local v_u_4 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
local v_u_5 = require(v1.Providers.Style.VariantsContext)
local function v_u_9(p6) -- name: variantsFactory
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v7 = {
		["container"] = {
			["tag"] = "row align-y-center auto-xy radius-circle clip",
			["backgroundStyle"] = nil,
			["backgroundStyle"] = p6.Color.ActionStandard.Background
		},
		["thumbUpSegment"] = {
			["tag"] = "row align-x-center align-y-center shrink-1 auto-x radius-circle"
		},
		["thumbDownSegment"] = {
			["tag"] = "row align-x-center align-y-center auto-x radius-circle"
		},
		["text"] = {
			["contentStyle"] = p6.Color.ActionStandard.Foreground
		}
	}
	local v8 = {
		[v_u_3.Small] = {
			["thumbSegment"] = {
				["tag"] = "size-0-600"
			},
			["dividerContainer"] = {
				["tag"] = "align-y-center size-0-600 auto-x padding-y-xsmall"
			},
			["thumbUpIcon"] = {
				["tag"] = "auto-xy padding-left-small padding-right-xsmall"
			},
			["thumbDownIcon"] = {
				["tag"] = "auto-xy padding-left-small padding-right-medium"
			},
			["text"] = {
				["tag"] = "shrink size-0-full auto-x text-label-small text-truncate-end padding-right-small"
			},
			["iconSize"] = v_u_2.XSmall
		},
		[v_u_3.Medium] = {
			["thumbSegment"] = {
				["tag"] = "size-0-800"
			},
			["dividerContainer"] = {
				["tag"] = "align-y-center size-0-800 auto-x padding-y-small"
			},
			["thumbUpIcon"] = {
				["tag"] = "auto-xy padding-left-medium padding-right-xsmall"
			},
			["thumbDownIcon"] = {
				["tag"] = "auto-xy padding-left-medium padding-right-medium"
			},
			["text"] = {
				["tag"] = "shrink size-0-full auto-x text-label-medium text-truncate-end padding-right-medium"
			},
			["iconSize"] = v_u_2.Small
		},
		[v_u_3.Large] = {
			["thumbSegment"] = {
				["tag"] = "size-0-1000"
			},
			["dividerContainer"] = {
				["tag"] = "align-y-center size-0-1000 auto-x padding-y-small"
			},
			["thumbUpIcon"] = {
				["tag"] = "auto-xy padding-left-medium padding-right-small"
			},
			["thumbDownIcon"] = {
				["tag"] = "auto-xy padding-left-medium padding-right-medium"
			},
			["text"] = {
				["tag"] = "shrink size-0-full auto-x text-label-medium text-truncate-end padding-right-large"
			},
			["iconSize"] = v_u_2.Medium
		}
	}
	return {
		["common"] = v7,
		["sizes"] = v8
	}
end
return function(p10, p11)
	-- upvalues: (copy) v_u_5, (copy) v_u_9, (copy) v_u_4
	local v12 = v_u_5.useVariants("Rating", v_u_9, p10)
	local v13 = v12.sizes[p11]
	local v14 = v_u_4(v12.common, {
		["thumbUpSegment"] = v13.thumbSegment,
		["thumbDownSegment"] = v13.thumbSegment,
		["text"] = v13.text
	})
	local v15 = {
		["container"] = v14.container,
		["thumbUpSegment"] = v14.thumbUpSegment,
		["thumbDownSegment"] = v14.thumbDownSegment,
		["dividerContainer"] = v13.dividerContainer,
		["thumbUpIcon"] = v13.thumbUpIcon,
		["thumbDownIcon"] = v13.thumbDownIcon,
		["text"] = {
			["tag"] = v14.text.tag,
			["contentStyle"] = v14.text.contentStyle
		},
		["iconSize"] = v13.iconSize
	}
	return v15
end