-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Card.useCardVariants
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Enums.CardDensity)
local v_u_3 = require(v1.Enums.CardHeaderSize)
local v_u_4 = require(v1.Enums.CardHeight)
local v_u_5 = require(v1.Enums.CardVariant)
local v_u_6 = require(v1.Enums.IconSize)
local v_u_7 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
local v_u_8 = require(v1.Providers.Style.VariantsContext)
local function v_u_28(p9) -- name: variantsFactory
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_6, (copy) v_u_5, (copy) v_u_4
	local v10 = {
		[v_u_2.Compact] = {
			["container"] = {
				["tag"] = "radius-medium"
			},
			["content"] = {
				["tag"] = "padding-medium"
			},
			["actionsPadding"] = {
				["tag"] = "padding-medium"
			},
			["mediaEnd"] = {
				["tag"] = "radius-right-medium"
			},
			["mediaBottom"] = {
				["tag"] = "radius-bottom-medium"
			}
		},
		[v_u_2.Default] = {
			["container"] = {
				["tag"] = "radius-large"
			},
			["content"] = {
				["tag"] = "padding-large"
			},
			["actionsPadding"] = {
				["tag"] = "padding-large"
			},
			["mediaEnd"] = {
				["tag"] = "radius-right-large"
			},
			["mediaBottom"] = {
				["tag"] = "radius-bottom-large"
			}
		},
		[v_u_2.Comfortable] = {
			["container"] = {
				["tag"] = "radius-large"
			},
			["content"] = {
				["tag"] = "padding-xlarge"
			},
			["actionsPadding"] = {
				["tag"] = "padding-xlarge"
			},
			["mediaEnd"] = {
				["tag"] = "radius-right-large"
			},
			["mediaBottom"] = {
				["tag"] = "radius-bottom-large"
			}
		}
	}
	local v11 = p9.Typography.BodySmall.FontSize * p9.Typography.BodySmall.LineHeight
	local v12 = p9.Typography.BodyMedium.FontSize * p9.Typography.BodyMedium.LineHeight
	local v13 = {}
	local v14 = v_u_3.XXSmall
	local v15 = {
		["content"] = {
			["tag"] = "gap-medium"
		},
		["eyebrow"] = {
			["tag"] = "text-body-small"
		},
		["description"] = {
			["tag"] = "text-body-small",
			["lineHeight"] = nil,
			["lineHeight"] = v11
		},
		["title"] = {
			["tag"] = "text-title-medium"
		},
		["titleRow"] = {
			["tag"] = "gap-xsmall"
		},
		["icon"] = {
			["size"] = v_u_6.Medium
		}
	}
	v13[v14] = v15
	local v16 = v_u_3.XSmall
	local v17 = {
		["content"] = {
			["tag"] = "gap-medium"
		},
		["eyebrow"] = {
			["tag"] = "text-body-small"
		},
		["description"] = {
			["tag"] = "text-body-small",
			["lineHeight"] = nil,
			["lineHeight"] = v11
		},
		["title"] = {
			["tag"] = "text-title-large"
		},
		["titleRow"] = {
			["tag"] = "gap-xsmall"
		},
		["icon"] = {
			["size"] = v_u_6.Medium
		}
	}
	v13[v16] = v17
	local v18 = v_u_3.Small
	local v19 = {
		["content"] = {
			["tag"] = "gap-medium"
		},
		["eyebrow"] = {
			["tag"] = "text-body-medium"
		},
		["description"] = {
			["tag"] = "text-body-medium",
			["lineHeight"] = nil,
			["lineHeight"] = v12
		},
		["title"] = {
			["tag"] = "text-heading-small"
		},
		["titleRow"] = {
			["gap"] = p9.Size.Size_150
		},
		["icon"] = {
			["size"] = v_u_6.Large
		}
	}
	v13[v18] = v19
	local v20 = v_u_3.Medium
	local v21 = {
		["content"] = {
			["tag"] = "gap-large"
		},
		["eyebrow"] = {
			["tag"] = "text-body-medium"
		},
		["description"] = {
			["tag"] = "text-body-medium",
			["lineHeight"] = nil,
			["lineHeight"] = v12
		},
		["title"] = {
			["tag"] = "text-heading-medium"
		},
		["titleRow"] = {
			["tag"] = "gap-small"
		},
		["icon"] = {
			["size"] = v_u_6.Large
		}
	}
	v13[v20] = v21
	local v22 = v_u_3.Large
	local v23 = {
		["content"] = {
			["tag"] = "gap-large"
		},
		["eyebrow"] = {
			["tag"] = "text-body-medium"
		},
		["description"] = {
			["tag"] = "text-body-medium",
			["lineHeight"] = nil,
			["lineHeight"] = v12
		},
		["title"] = {
			["tag"] = "text-heading-large"
		},
		["titleRow"] = {
			["tag"] = "gap-small"
		},
		["icon"] = {
			["size"] = v_u_6.Large
		}
	}
	v13[v22] = v23
	local v24 = {
		[v_u_5.Standard] = {
			["container"] = {
				["tag"] = "stroke-standard stroke-default"
			}
		},
		[v_u_5.Emphasis] = {
			["container"] = {
				["tag"] = "bg-shift-200"
			}
		}
	}
	local v25 = {
		[v_u_4.Fit] = {
			["container"] = {
				["tag"] = "size-full-0 auto-y"
			},
			["body"] = {
				["tag"] = "size-full-0 auto-y"
			}
		},
		[v_u_4.Fill] = {
			["container"] = {
				["tag"] = "fill self-stretch size-full-0"
			},
			["body"] = {
				["tag"] = "size-full"
			}
		}
	}
	local v26 = {
		[true] = {
			["body"] = {
				["tag"] = "row"
			},
			["content"] = {
				["tag"] = "fill"
			}
		},
		[false] = {
			["body"] = {
				["tag"] = "col"
			},
			["content"] = {
				["tag"] = "size-full-0"
			}
		}
	}
	local v27 = {
		[true] = {
			["header"] = {
				["tag"] = "align-y-center"
			}
		},
		[false] = {
			["header"] = {
				["tag"] = "align-y-top"
			}
		}
	}
	return {
		["common"] = {
			["container"] = {
				["tag"] = "clip"
			},
			["content"] = {
				["tag"] = "col auto-y"
			},
			["children"] = {
				["tag"] = "col gap-large size-full-0 auto-y"
			},
			["header"] = {
				["tag"] = "row gap-small size-full-0 auto-y"
			},
			["headerText"] = {
				["tag"] = "col fill auto-y"
			},
			["eyebrow"] = {
				["tag"] = "size-full-0 auto-y text-wrap text-align-x-left content-default"
			},
			["titleRow"] = {
				["tag"] = "row align-y-center size-full-0 auto-y padding-y-xxsmall"
			},
			["title"] = {
				["tag"] = "shrink auto-xy text-wrap text-align-x-left content-emphasis"
			},
			["description"] = {
				["tag"] = "size-full-0 auto-y padding-bottom-xxsmall text-wrap text-align-x-left content-default"
			},
			["actions"] = {
				["tag"] = "row gap-small auto-xy"
			}
		},
		["densities"] = v10,
		["headerSizes"] = v13,
		["variants"] = v24,
		["heights"] = v25,
		["endMedia"] = v26,
		["singleLine"] = v27
	}
end
return function(p29, p30, p31, p32, p33, p34, p35, p36) -- name: useCardVariants
	-- upvalues: (copy) v_u_8, (copy) v_u_28, (copy) v_u_7
	local v37 = v_u_8.useVariants("Card", v_u_28, p29)
	local v38 = v37.densities[p31]
	local v39 = v_u_7(v37.common, v38, v37.headerSizes[p32], v37.variants[p30], v37.heights[p33], v37.endMedia[p34], v37.singleLine[p35])
	if not p36 then
		v39 = v_u_7(v39, {
			["actions"] = v38.actionsPadding
		})
	end
	local v40
	if p34 then
		v40 = v38.mediaEnd
	else
		v40 = v38.mediaBottom
	end
	v39.media = v40
	return v39
end