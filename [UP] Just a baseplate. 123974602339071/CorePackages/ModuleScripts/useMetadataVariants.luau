-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Metadata.useMetadataVariants
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.AvatarIconSize)
local v_u_3 = require(v1.Enums.IconSize)
local v_u_4 = require(v1.Enums.MetadataSize)
require(v1.Components.Types)
local v_u_5 = require(v1.Utility.composeStyleVariant)
local v_u_6 = require(v1.Providers.Style.VariantsContext)
require(v1.Providers.Style.Tokens)
local function v_u_15(p7) -- name: variantsFactory
	-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_4
	local v8 = {
		["container"] = {
			["tag"] = "row align-y-center auto-xy"
		},
		["item"] = {
			["tag"] = "row align-y-center gap-xsmall auto-xy"
		},
		["truncatedItem"] = {
			["tag"] = "row align-y-center shrink gap-xsmall auto-xy"
		},
		["text"] = {
			["tag"] = "auto-xy content-default"
		},
		["truncatedText"] = {
			["tag"] = "shrink auto-xy text-truncate-split content-default"
		},
		["wrappedText"] = {
			["tag"] = "shrink auto-xy text-wrap text-align-x-left text-align-y-top text-truncate-split content-default"
		},
		["accessory"] = {
			["iconSize"] = nil,
			["avatarSize"] = nil,
			["avatarTag"] = "auto-xy padding-right-xxsmall",
			["style"] = nil,
			["iconSize"] = v_u_3.Small,
			["avatarSize"] = v_u_2.Small,
			["style"] = p7.Color.Content.Default
		}
	}
	local v9 = {}
	local v10 = v_u_4.Medium
	local v11 = {
		["text"] = {
			["tag"] = "text-body-medium",
			["fontStyle"] = nil,
			["fontStyle"] = p7.Typography.BodyMedium
		},
		["truncatedText"] = {
			["tag"] = "text-body-medium"
		},
		["wrappedText"] = {
			["tag"] = "text-body-medium"
		}
	}
	v9[v10] = v11
	local v12 = v_u_4.Small
	local v13 = {
		["text"] = {
			["tag"] = "text-body-small",
			["fontStyle"] = nil,
			["fontStyle"] = p7.Typography.BodySmall
		},
		["truncatedText"] = {
			["tag"] = "text-body-small"
		},
		["wrappedText"] = {
			["tag"] = "text-body-small"
		}
	}
	v9[v12] = v13
	local v14 = {
		[true] = {
			["container"] = {
				["tag"] = "gap-small"
			}
		},
		[false] = {
			["container"] = {
				["tag"] = "gap-xsmall"
			}
		}
	}
	return {
		["common"] = v8,
		["sizes"] = v9,
		["spacing"] = v14
	}
end
return function(p16, p17, p18)
	-- upvalues: (copy) v_u_6, (copy) v_u_15, (copy) v_u_5
	local v19 = v_u_6.useVariants("Metadata", v_u_15, p16)
	return v_u_5(v19.common, v19.sizes[p17], v19.spacing[p18])
end