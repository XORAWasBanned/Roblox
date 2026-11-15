-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Badge.useBadgeVariants
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v1.Enums.BadgeVariant)
local v_u_4 = require(v2.Dash)
local v_u_5 = require(v1.Enums.BadgeShape)
local v_u_6 = require(v1.Enums.BadgeSize)
local v_u_7 = require(v1.Enums.IconPosition)
local v_u_8 = require(v1.Enums.IconSize)
require(v1.Components.Types)
local v_u_9 = require(v1.Utility.composeStyleVariant)
local v_u_10 = require(v1.Utility.Flags)
require(v1.Providers.Style.Tokens)
local v_u_11 = require(v1.Providers.Style.VariantsContext)
function variantsFactory(p12) -- name: variantsFactory
	-- upvalues: (copy) v_u_10, (copy) v_u_3, (copy) v_u_6, (copy) v_u_8, (copy) v_u_5, (copy) v_u_7, (copy) v_u_4
	local v13 = {
		["container"] = {
			["tag"] = v_u_10.FoundationBadgeBetaUpdate and "row align-x-center align-y-center auto-xy" or "row align-x-center align-y-center gap-xsmall"
		},
		["text"] = {
			["tag"] = v_u_10.FoundationBadgeBetaUpdate and "auto-xy text-align-x-left text-truncate-split" or "auto-xy text-label-small text-align-x-left text-truncate-split"
		}
	}
	local v14 = {}
	local v15 = v_u_3.Alert
	local v16 = {}
	local v17 = {}
	local v18
	if v_u_10.FoundationBadgeBetaUpdate then
		v18 = {
			["Color3"] = nil,
			["Transparency"] = 0.8,
			["Color3"] = p12.Color.System.Alert.Color3
		}
	else
		v18 = p12.Color.System.Alert
	end
	v17.backgroundStyle = v18
	v16.container = v17
	local v19 = {}
	local v20
	if v_u_10.FoundationBadgeBetaUpdate then
		v20 = p12.Color.Content.Emphasis
	else
		v20 = p12.DarkMode.Content.Emphasis
	end
	v19.style = v20
	v16.content = v19
	v16.icon = {
		["style"] = p12.Color.System.Alert
	}
	v14[v15] = v16
	local v21 = v_u_3.Success
	local v22 = {}
	local v23 = {}
	local v24
	if v_u_10.FoundationBadgeBetaUpdate then
		v24 = {
			["Color3"] = nil,
			["Transparency"] = 0.8,
			["Color3"] = p12.Color.System.Success.Color3
		}
	else
		v24 = p12.Color.System.Success
	end
	v23.backgroundStyle = v24
	v22.container = v23
	local v25 = {}
	local v26
	if v_u_10.FoundationBadgeBetaUpdate then
		v26 = p12.Color.Content.Emphasis
	else
		v26 = p12.LightMode.Content.Emphasis
	end
	v25.style = v26
	v22.content = v25
	v22.icon = {
		["style"] = p12.Color.System.Success
	}
	v14[v21] = v22
	local v27 = v_u_3.Warning
	local v28 = {}
	local v29 = {}
	local v30
	if v_u_10.FoundationBadgeBetaUpdate then
		v30 = {
			["Color3"] = nil,
			["Transparency"] = 0.8,
			["Color3"] = p12.Color.System.Warning.Color3
		}
	else
		v30 = p12.Color.System.Warning
	end
	v29.backgroundStyle = v30
	v28.container = v29
	local v31 = {}
	local v32
	if v_u_10.FoundationBadgeBetaUpdate then
		v32 = p12.Color.Content.Emphasis
	else
		v32 = p12.LightMode.Content.Emphasis
	end
	v31.style = v32
	v28.content = v31
	v28.icon = {
		["style"] = p12.Color.System.Warning
	}
	v14[v27] = v28
	v14[v_u_3.Contrast] = {
		["container"] = {
			["backgroundStyle"] = p12.Color.System.Contrast
		},
		["content"] = {
			["style"] = p12.Inverse.Content.Emphasis
		},
		["icon"] = {
			["style"] = p12.Inverse.Content.Emphasis
		}
	}
	v14[v_u_3.Standard] = {
		["container"] = {
			["backgroundStyle"] = p12.Color.ActionStandard.Background
		},
		["content"] = {
			["style"] = p12.Color.ActionStandard.Foreground
		},
		["icon"] = {
			["style"] = p12.Color.ActionStandard.Foreground
		}
	}
	v14[v_u_3.Neutral] = not v_u_10.FoundationBadgeBetaUpdate and {
		["container"] = {
			["backgroundStyle"] = p12.Color.Shift.Shift_300
		},
		["content"] = {
			["style"] = p12.Color.Content.Emphasis
		},
		["icon"] = {
			["style"] = p12.Color.ActionStandard.Foreground
		}
	} or nil
	local v33 = v_u_3.OverMedia
	local v34 = {}
	local v35 = {}
	local v36
	if v_u_10.FoundationBadgeOverMediaAdaptive then
		v36 = p12.Color.OverMedia.OverMedia_0
	else
		v36 = p12.LightMode.Surface.Surface_100
	end
	v35.backgroundStyle = v36
	v35.stroke = not v_u_10.FoundationBadgeOverMediaAdaptive and {
		["Color"] = p12.LightMode.Stroke.Default.Color3,
		["Transparency"] = p12.LightMode.Stroke.Default.Transparency
	} or nil
	v34.container = v35
	local v37 = {}
	local v38
	if v_u_10.FoundationBadgeOverMediaAdaptive then
		v38 = p12.Inverse.OverMedia.OverMedia_0
	else
		v38 = p12.LightMode.Content.Emphasis
	end
	v37.style = v38
	v34.content = v37
	local v39 = {}
	local v40
	if v_u_10.FoundationBadgeOverMediaAdaptive then
		v40 = p12.Inverse.OverMedia.OverMedia_0
	else
		v40 = p12.LightMode.Content.Emphasis
	end
	v39.style = v40
	v34.icon = v39
	v14[v33] = v34
	v14[v_u_3.OverMediaWhite] = {
		["container"] = {
			["backgroundStyle"] = p12.LightMode.Surface.Surface_100,
			["stroke"] = {
				["Color"] = p12.LightMode.Stroke.Default.Color3,
				["Transparency"] = p12.LightMode.Stroke.Default.Transparency
			}
		},
		["content"] = {
			["style"] = p12.LightMode.Content.Emphasis
		},
		["icon"] = {
			["style"] = p12.LightMode.Content.Emphasis
		}
	}
	v14[v_u_3.Emphasis] = {
		["container"] = {
			["backgroundStyle"] = p12.Color.System.Emphasis
		},
		["content"] = {
			["style"] = p12.DarkMode.Content.Emphasis
		},
		["icon"] = {
			["style"] = p12.DarkMode.Content.Emphasis
		}
	}
	local v41 = not v_u_10.FoundationBadgeBetaUpdate and {
		[true] = {
			["container"] = {
				["tag"] = "size-600"
			}
		},
		[false] = {
			["container"] = {
				["tag"] = "size-0-600 auto-x padding-x-small"
			}
		}
	} or nil
	local v42 = v_u_10.FoundationBadgeBetaUpdate and {
		[v_u_6.XSmall] = {
			["container"] = {
				["tag"] = "gap-xxsmall size-0-400 padding-x-xsmall"
			},
			["text"] = {
				["tag"] = "text-caption-small"
			},
			["icon"] = {
				["size"] = v_u_8.XSmall
			}
		},
		[v_u_6.Small] = {
			["container"] = {
				["tag"] = "gap-xsmall size-0-600 padding-x-small"
			},
			["text"] = {
				["tag"] = "text-caption-medium"
			},
			["icon"] = {
				["size"] = v_u_8.XSmall
			}
		},
		[v_u_6.Medium] = {
			["container"] = {
				["tag"] = "gap-xsmall size-0-600 padding-x-small"
			},
			["text"] = {
				["tag"] = "text-caption-medium"
			},
			["icon"] = {
				["size"] = v_u_8.XSmall
			}
		}
	} or nil
	local v43 = {
		[v_u_5.Pill] = {
			["container"] = {
				["tag"] = "radius-circle"
			}
		},
		[v_u_5.Box] = {
			["container"] = {
				["tag"] = "radius-small"
			}
		}
	}
	local v44 = v_u_10.FoundationBadgeBetaUpdate and {
		[v_u_7.Left] = {
			["text"] = {
				["tag"] = "padding-right-xsmall"
			}
		},
		[v_u_7.Right] = {
			["text"] = {
				["tag"] = "padding-left-xsmall"
			}
		},
		[v_u_4.None] = {
			["text"] = {
				["tag"] = "padding-x-xsmall"
			}
		}
	} or nil
	local v45 = {
		["common"] = v13,
		["variants"] = v14,
		["shapes"] = v43
	}
	if v_u_10.FoundationBadgeBetaUpdate then
		v41 = nil
	end
	v45.iconOnly = v41
	v45.sizes = v42
	v45.iconPlacement = v44
	return v45
end
return function(p46, p47, p48, p49, p50, p51)
	-- upvalues: (copy) v_u_11, (copy) v_u_9, (copy) v_u_10, (copy) v_u_4
	local v52 = v_u_11.useVariants("Badge", variantsFactory, p46)
	local v53 = v_u_9
	local v54 = v52.common
	local v55 = v52.variants[p47]
	local v56 = v52.shapes[p48]
	local v57
	if v_u_10.FoundationBadgeBetaUpdate then
		v57 = v52.sizes[p49]
	else
		v57 = nil
	end
	local v58
	if v_u_10.FoundationBadgeBetaUpdate then
		v58 = v52.iconPlacement[p50 or v_u_4.None]
	else
		v58 = nil
	end
	local v59
	if v_u_10.FoundationBadgeBetaUpdate then
		v59 = nil
	else
		v59 = v52.iconOnly[p51]
	end
	return v53(v54, v55, v56, v57, v58, v59)
end