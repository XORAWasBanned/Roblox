-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Alert.useAlertVariants
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Components.Types)
local v_u_2 = require(v1.Enums.AlertSeverity)
local v_u_3 = require(v1.Enums.AlertVariant)
local v_u_4 = require(v1.Enums.ColorMode)
local v_u_5 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
local v_u_6 = require(v1.Providers.Style.VariantsContext)
local function v_u_13(p7, p8, p9, p10) -- name: createSeverityVariant
	local v11 = {}
	local v12 = {
		["backgroundStyle"] = {
			["Color3"] = p7.Color3,
			["Transparency"] = p8
		}
	}
	v11.container = v12
	v11.icon = {
		["style"] = p9
	}
	v11.border = {
		["backgroundStyle"] = p10
	}
	return v11
end
local function v_u_29(p14) -- name: variantsFactory
	-- upvalues: (copy) v_u_2, (copy) v_u_13, (copy) v_u_3
	local v15 = {
		["top"] = UDim.new(0, p14.Size.Size_150 + 1)
	}
	local v16 = {
		["top"] = UDim.new(0, p14.Size.Size_150),
		["bottom"] = UDim.new(0, p14.Size.Size_150)
	}
	local v17 = p14.Size.Size_500
	local v18 = {
		["tag"] = "text-body-medium text-wrap text-align-x-left content-emphasis",
		["padding"] = nil,
		["padding"] = v15
	}
	local v19 = {
		["main"] = {
			["tag"] = "row align-y-top gap-medium size-full-0 auto-y padding-x-large padding-y-medium"
		},
		["stack"] = {
			["tag"] = "col fill gap-small auto-y"
		},
		["iconFrame"] = {
			["Size"] = UDim2.fromOffset(v17, v17)
		},
		["message"] = v18,
		["link"] = v18,
		["border"] = {
			["Size"] = UDim2.new(1, 0, 0, p14.Stroke.Standard)
		}
	}
	local v20 = {
		[v_u_2.Info] = v_u_13(p14.Color.System.Neutral, 0.9, p14.Color.System.Emphasis, p14.Color.Stroke.Emphasis),
		[v_u_2.Success] = v_u_13(p14.Color.System.Success, 0.9, p14.Color.System.Success, p14.Color.Stroke.Emphasis),
		[v_u_2.Warning] = v_u_13(p14.Color.System.Warning, 0.84, p14.Color.System.Warning, p14.Color.System.Warning),
		[v_u_2.Error] = v_u_13(p14.Color.System.Alert, 0.84, p14.Color.System.Alert, p14.Color.System.Alert)
	}
	local v21 = {
		[v_u_3.Feedback] = {
			["container"] = {
				["tag"] = "radius-medium row align-y-top gap-medium size-full-0 auto-y padding-x-large padding-y-medium"
			}
		},
		[v_u_3.System] = {
			["container"] = {
				["tag"] = "col size-full-0 auto-y"
			}
		}
	}
	local v22 = {
		["container"] = {
			["tag"] = "stroke-standard stroke-emphasis"
		}
	}
	local v23 = {
		[v_u_2.Info] = v22,
		[v_u_2.Success] = v22,
		[v_u_2.Warning] = {
			["container"] = {
				["tag"] = "stroke-standard stroke-system-warning"
			}
		},
		[v_u_2.Error] = {
			["container"] = {
				["tag"] = "stroke-standard stroke-system-alert"
			}
		}
	}
	local v24 = v17 - p14.Size.Size_100
	local v25 = {
		["Size"] = nil,
		["Position"] = nil,
		["tag"] = "radius-circle",
		["backgroundStyle"] = nil,
		["Size"] = UDim2.fromOffset(v24, v24),
		["Position"] = UDim2.fromOffset((v17 - v24) / 2, (v17 - v24) / 2),
		["backgroundStyle"] = p14.Color.Extended.White.White_100
	}
	local v26 = {
		[v_u_2.Info] = {
			["iconBackplate"] = v25
		},
		[v_u_2.Success] = {
			["iconBackplate"] = v25
		},
		[v_u_2.Warning] = {},
		[v_u_2.Error] = {
			["iconBackplate"] = v25
		}
	}
	local v27 = {
		[false] = {
			["message"] = {
				["tag"] = "fill auto-y"
			},
			["link"] = {
				["tag"] = "auto-xy"
			},
			["linkContainer"] = {
				["tag"] = "auto-xy"
			}
		}
	}
	local v28 = {
		["message"] = {
			["tag"] = "size-full-0 auto-y"
		},
		["link"] = {
			["tag"] = "size-full-0 auto-y",
			["padding"] = nil,
			["padding"] = v16
		},
		["linkContainer"] = {
			["tag"] = "size-full-0 auto-y"
		}
	}
	v27[true] = v28
	return {
		["common"] = v19,
		["severity"] = v20,
		["variants"] = v21,
		["strokes"] = v23,
		["backplates"] = v26,
		["isStacked"] = v27
	}
end
return function(p30, p31, p32, p33) -- name: useAlertVariants
	-- upvalues: (copy) v_u_6, (copy) v_u_29, (copy) v_u_4, (copy) v_u_5, (copy) v_u_3
	local v34 = v_u_6.useVariants("Alert", v_u_29, p30)
	local v35 = p30.Config.ColorMode.Name == v_u_4.Dark
	return v_u_5(v34.common, v34.severity[p31], v34.variants[p32], v34.isStacked[p33], p32 ~= v_u_3.Feedback and {} or v34.strokes[p31], not v35 and {} or v34.backplates[p31])
end