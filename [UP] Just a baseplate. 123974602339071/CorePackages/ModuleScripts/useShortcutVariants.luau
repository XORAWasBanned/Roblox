-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Shortcut.useShortcutVariants
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.IconSize)
local v_u_3 = require(v1.Enums.InputSize)
local v_u_4 = require(v1.Enums.ShortcutVariant)
require(v1.Components.Types)
local v_u_5 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
local v_u_6 = require(v1.Providers.Style.VariantsContext)
local function v_u_21(p7) -- name: variantsFactory
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4
	local v8 = {
		["container"] = {
			["tag"] = "auto-xy",
			["gap"] = nil,
			["gap"] = p7.Size.Size_150
		},
		["keys"] = {
			["tag"] = "row align-y-center auto-xy"
		},
		["cap"] = {
			["tag"] = "row align-x-center align-y-center auto-x"
		},
		["capless"] = {
			["tag"] = "row align-x-center align-y-center auto-xy"
		},
		["text"] = {
			["tag"] = "auto-xy text-align-x-center"
		},
		["separator"] = {
			["tag"] = "auto-x padding-x-xxsmall text-align-x-center content-emphasis"
		},
		["keybinding"] = {
			["tag"] = "auto-xy text-align-x-left content-default"
		},
		["icon"] = {
			["size"] = v_u_2.XSmall
		},
		["gamepadIcon"] = {
			["style"] = p7.Color.Content.Emphasis
		}
	}
	local v9 = {}
	local v10 = v_u_3.XSmall
	local v11 = {
		["keys"] = {
			["tag"] = "gap-xxsmall"
		},
		["cap"] = {
			["tag"] = "size-400 radius-xsmall"
		},
		["capWide"] = {
			["padding"] = p7.Padding.XSmall
		},
		["text"] = {
			["tag"] = "text-caption-small"
		},
		["separator"] = {
			["tag"] = "size-0-400 text-label-small"
		},
		["keybinding"] = {
			["tag"] = "text-label-small"
		},
		["gamepadIcon"] = {
			["size"] = p7.Size.Size_400
		}
	}
	v9[v10] = v11
	local v12 = v_u_3.Small
	local v13 = {
		["keys"] = {
			["tag"] = "gap-xsmall"
		},
		["cap"] = {
			["tag"] = "size-500 radius-small"
		},
		["capWide"] = {
			["padding"] = p7.Size.Size_150
		},
		["text"] = {
			["tag"] = "text-caption-small"
		},
		["separator"] = {
			["tag"] = "size-0-500 text-label-medium"
		},
		["keybinding"] = {
			["tag"] = "text-label-medium"
		},
		["gamepadIcon"] = {
			["size"] = p7.Size.Size_500
		}
	}
	v9[v12] = v13
	local v14 = v_u_3.Medium
	local v15 = {
		["container"] = {
			["gap"] = p7.Size.Size_200
		},
		["keys"] = {
			["tag"] = "gap-xsmall"
		},
		["cap"] = {
			["tag"] = "size-600 radius-small"
		},
		["capWide"] = {
			["padding"] = p7.Padding.Small
		},
		["text"] = {
			["tag"] = "text-caption-medium"
		},
		["separator"] = {
			["tag"] = "size-0-600 text-label-large"
		},
		["keybinding"] = {
			["tag"] = "text-label-medium"
		},
		["icon"] = {
			["size"] = v_u_2.Small
		},
		["gamepadIcon"] = {
			["size"] = p7.Size.Size_600
		}
	}
	v9[v14] = v15
	local v16 = {}
	local v17 = v_u_4.Standard
	local v18 = {
		["cap"] = {
			["tag"] = "bg-shift-200"
		},
		["text"] = {
			["tag"] = "content-emphasis"
		},
		["icon"] = {
			["style"] = p7.Color.Content.Emphasis
		}
	}
	v16[v17] = v18
	local v19 = v_u_4.Contrast
	local v20 = {
		["cap"] = {
			["tag"] = "bg-system-contrast"
		},
		["text"] = {
			["tag"] = "content-inverse-emphasis"
		},
		["icon"] = {
			["style"] = p7.Inverse.Content.Emphasis
		}
	}
	v16[v19] = v20
	return {
		["common"] = v8,
		["sizes"] = v9,
		["variants"] = v16
	}
end
return function(p22, p23, p24) -- name: useShortcutVariants
	-- upvalues: (copy) v_u_6, (copy) v_u_21, (copy) v_u_5
	local v25 = v_u_6.useVariants("Shortcut", v_u_21, p22)
	return v_u_5(v25.common, v25.sizes[p23], v25.variants[p24])
end