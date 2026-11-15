-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Dialog.useDialogVariants
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Components.Types)
local v_u_2 = require(v1.Enums.DialogSize)
local v_u_3 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
local v_u_4 = require(v1.Providers.Style.useTokens)
local v_u_5 = require(v1.Providers.Style.VariantsContext)
local v_u_6 = require(script.Parent.useDialog)
local v_u_7 = {
	[v_u_2.Small] = 320,
	[v_u_2.Medium] = 480,
	[v_u_2.Large] = 640
}
local function v_u_17(p8) -- name: variantsFactory
	-- upvalues: (copy) v_u_2, (copy) v_u_7
	local v9 = {
		["backdrop"] = {
			["backgroundStyle"] = p8.Color.Common.Backdrop
		},
		["shadow"] = {
			["tag"] = "auto-xy",
			["imageStyle"] = nil,
			["imageStyle"] = p8.Color.Extended.Black.Black_15
		},
		["container"] = {
			["tag"] = "col align-x-center align-y-center size-full-full"
		},
		["inner"] = {
			["tag"] = "shrink-1 size-full-0 auto-y clip bg-surface-100 stroke-default"
		},
		["body"] = {
			["tag"] = "col size-full auto-y padding-bottom-xlarge"
		},
		["heroMediaWrapper"] = {
			["tag"] = "position-top-center size-full-full auto-y"
		},
		["title"] = {
			["tag"] = "size-full-0 auto-y"
		},
		["titleText"] = {
			["tag"] = "size-full-0 auto-y text-wrap text-align-x-left content-emphasis"
		},
		["content"] = {
			["tag"] = "fill size-full auto-y"
		},
		["contentText"] = {
			["tag"] = "size-full-0 auto-y text-wrap text-align-x-left text-align-y-top"
		},
		["actionsLabel"] = {
			["tag"] = "size-full-0 auto-y text-body-small text-wrap text-align-x-left text-align-y-top"
		}
	}
	local v10 = {}
	local v11 = v_u_2.Small
	local v12 = {
		["shadow"] = {
			["tag"] = "padding-large"
		},
		["inner"] = {
			["maxWidth"] = nil,
			["tag"] = "radius-large",
			["maxWidth"] = v_u_7[v_u_2.Small]
		},
		["body"] = {
			["tag"] = "gap-large padding-x-large"
		},
		["closeAffordance"] = {
			["offset"] = p8.Size.Size_300
		},
		["heroMedia"] = {
			["tag"] = "radius-top-large",
			["offsetX"] = nil,
			["offsetX"] = p8.Padding.Large
		},
		["titleText"] = {
			["tag"] = "text-heading-small"
		},
		["contentText"] = {
			["tag"] = "text-body-medium"
		},
		["actionsLabel"] = {
			["tag"] = "padding-top-large"
		}
	}
	v10[v11] = v12
	local v13 = v_u_2.Medium
	local v14 = {
		["shadow"] = {
			["tag"] = "padding-xlarge"
		},
		["inner"] = {
			["maxWidth"] = nil,
			["tag"] = "radius-large",
			["maxWidth"] = v_u_7[v_u_2.Medium]
		},
		["body"] = {
			["tag"] = "gap-xlarge padding-x-xlarge"
		},
		["closeAffordance"] = {
			["offset"] = p8.Size.Size_400
		},
		["heroMedia"] = {
			["tag"] = "radius-top-large",
			["offsetX"] = nil,
			["offsetX"] = p8.Padding.XLarge
		},
		["titleText"] = {
			["tag"] = "text-heading-medium"
		},
		["contentText"] = {
			["tag"] = "text-body-medium"
		},
		["actionsLabel"] = {
			["tag"] = "padding-top-xlarge"
		}
	}
	v10[v13] = v14
	local v15 = v_u_2.Large
	local v16 = {
		["shadow"] = {
			["tag"] = "padding-xlarge"
		},
		["inner"] = {
			["maxWidth"] = nil,
			["tag"] = "radius-large",
			["maxWidth"] = v_u_7[v_u_2.Large]
		},
		["body"] = {
			["tag"] = "gap-xlarge padding-x-xlarge"
		},
		["closeAffordance"] = {
			["offset"] = p8.Size.Size_400
		},
		["heroMedia"] = {
			["tag"] = "radius-top-large",
			["offsetX"] = nil,
			["offsetX"] = p8.Padding.XLarge
		},
		["titleText"] = {
			["tag"] = "text-heading-large"
		},
		["contentText"] = {
			["tag"] = "text-body-large"
		},
		["actionsLabel"] = {
			["tag"] = "padding-top-xlarge"
		}
	}
	v10[v15] = v16
	return {
		["common"] = v9,
		["size"] = v10
	}
end
function useDialogVariants() -- name: useDialogVariants
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_17, (copy) v_u_6, (copy) v_u_3
	local v18 = v_u_4()
	local v19 = v_u_5.useVariants("Dialog", v_u_17, v18)
	local v20 = v_u_6()
	return v_u_3(v19.common, v19.size[v20.responsiveSize])
end
return {
	["useDialogVariants"] = useDialogVariants,
	["DIALOG_SIZES"] = v_u_7
}