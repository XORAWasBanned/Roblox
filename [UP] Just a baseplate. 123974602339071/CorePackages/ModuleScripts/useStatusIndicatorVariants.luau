-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.StatusIndicator.useStatusIndicatorVariants
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Utility.Flags)
local v_u_3 = require(v1.Enums.StatusIndicatorSize)
local v_u_4 = require(v1.Enums.StatusIndicatorVariant)
local v_u_5 = require(v1.Enums.StatusIndicatorShape)
require(v1.Components.Types)
local v_u_6 = require(v1.Utility.composeStyleVariant)
local v_u_7 = require(v1.Utility.indexBindable)
require(v1.Providers.Style.Tokens)
local v_u_8 = require(v1.Providers.Style.VariantsContext)
local v_u_9 = require(v1.Utility.devAssert)
local v10 = require(v1.Constants)
local v_u_11 = Font.new(v10.BUILDER_SANS_FONT_ASSET, Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
function variantsFactory(p12) -- name: variantsFactory
	-- upvalues: (copy) v_u_11, (copy) v_u_2, (copy) v_u_4, (copy) v_u_5, (copy) v_u_3
	local v13 = {
		["content"] = {
			["tag"] = "auto-xy text-align-x-left",
			["font"] = nil,
			["typography"] = nil,
			["font"] = v_u_11,
			["typography"] = p12.Typography.LabelSmall
		},
		["stroke"] = v_u_2.FoundationStatusIndicatorDesignUpdate and {
			["Thickness"] = p12.Stroke.Thicker
		} or nil
	}
	local v14 = {
		[v_u_4.Alert] = {
			["container"] = {
				["tag"] = "bg-system-alert"
			},
			["content"] = {
				["style"] = p12.DarkMode.Content.Emphasis
			}
		},
		[v_u_4.Success] = {
			["container"] = {
				["tag"] = "bg-system-success"
			},
			["content"] = {
				["style"] = p12.LightMode.Content.Emphasis
			}
		},
		[v_u_4.Warning] = {
			["container"] = {
				["tag"] = "bg-system-warning"
			},
			["content"] = {
				["style"] = p12.LightMode.Content.Emphasis
			}
		},
		[v_u_4.Emphasis] = {
			["container"] = {
				["tag"] = "bg-system-emphasis"
			},
			["content"] = {
				["style"] = p12.DarkMode.Content.Emphasis
			}
		},
		[v_u_4.Neutral] = {
			["container"] = {
				["tag"] = "bg-system-neutral"
			},
			["content"] = {
				["style"] = p12.Inverse.Content.Emphasis
			}
		},
		[v_u_4.Standard] = {
			["container"] = {
				["tag"] = "bg-action-standard"
			},
			["content"] = {
				["style"] = p12.Color.Content.Emphasis
			}
		},
		[v_u_4.Contrast_Experiment] = {
			["container"] = {
				["tag"] = "bg-system-contrast"
			},
			["content"] = {
				["style"] = p12.Inverse.Content.Emphasis
			}
		},
		[v_u_4.Voice] = {
			["container"] = {
				["backgroundStyle"] = p12.Color.Extended.Orange.Orange_600
			}
		}
	}
	local v15 = {
		[true] = {
			["container"] = {
				["tag"] = v_u_2.FoundationStatusIndicatorDesignUpdate and "row align-x-center align-y-center auto-x padding-xsmall" or "row align-x-center align-y-center size-400-400 auto-x padding-xsmall"
			}
		}
	}
	local v16 = {
		[v_u_5.Circle] = {
			["container"] = {
				["tag"] = "radius-circle"
			},
			["stroke"] = {
				["LineJoinMode"] = Enum.LineJoinMode.Round
			}
		},
		[v_u_5.Ring] = {
			["container"] = {
				["tag"] = "align-x-center align-y-center radius-circle"
			},
			["ring"] = {
				["tag"] = "radius-circle bg-surface-100"
			},
			["stroke"] = {
				["LineJoinMode"] = Enum.LineJoinMode.Round
			}
		},
		[v_u_5.Square] = {
			["container"] = {
				["tag"] = "radius-none"
			},
			["stroke"] = {
				["LineJoinMode"] = Enum.LineJoinMode.Miter
			}
		}
	}
	local v17 = {
		[v_u_3.XSmall] = {
			["container"] = {
				["size"] = UDim2.fromOffset(p12.Size.Size_150, p12.Size.Size_150)
			},
			["ring"] = {
				["size"] = UDim2.fromOffset(p12.Size.Size_150 / 2, p12.Size.Size_150 / 2)
			},
			["stroke"] = not v_u_2.FoundationStatusIndicatorDesignUpdate and {
				["Thickness"] = p12.Stroke.Standard
			} or nil
		},
		[v_u_3.Small] = {
			["container"] = {
				["size"] = UDim2.fromOffset(p12.Size.Size_200, p12.Size.Size_200)
			},
			["ring"] = {
				["size"] = UDim2.fromOffset(p12.Size.Size_200 / 2, p12.Size.Size_200 / 2)
			},
			["stroke"] = not v_u_2.FoundationStatusIndicatorDesignUpdate and {
				["Thickness"] = p12.Size.Size_50
			} or nil
		},
		[v_u_3.Medium] = {
			["container"] = {
				["size"] = UDim2.fromOffset(p12.Size.Size_250, p12.Size.Size_250)
			},
			["ring"] = {
				["size"] = UDim2.fromOffset(p12.Size.Size_250 / 2, p12.Size.Size_250 / 2)
			},
			["stroke"] = not v_u_2.FoundationStatusIndicatorDesignUpdate and {
				["Thickness"] = p12.Size.Size_50
			} or nil
		},
		[v_u_3.Large] = {
			["container"] = {
				["size"] = UDim2.fromOffset(p12.Size.Size_500, p12.Size.Size_500)
			},
			["ring"] = {
				["size"] = UDim2.fromOffset(p12.Size.Size_500 / 2, p12.Size.Size_500 / 2)
			},
			["stroke"] = {
				["Thickness"] = p12.Stroke.Thicker
			}
		},
		[v_u_3.Pictogram] = {
			["container"] = {
				["size"] = UDim2.fromOffset(p12.Size.Size_500, p12.Size.Size_500)
			},
			["ring"] = {
				["size"] = UDim2.fromOffset(p12.Size.Size_500 / 2, p12.Size.Size_500 / 2)
			},
			["stroke"] = {
				["Thickness"] = p12.Stroke.Thicker
			}
		}
	}
	local v18 = {
		["container"] = {
			["size"] = UDim2.fromOffset(p12.Size.Size_400, p12.Size.Size_400)
		}
	}
	local v19 = {
		["container"] = {
			["size"] = UDim2.fromOffset(p12.Size.Size_500, p12.Size.Size_500)
		},
		["content"] = {
			["typography"] = p12.Typography.LabelMedium
		}
	}
	local v20 = {
		[v_u_3.XSmall] = v18,
		[v_u_3.Small] = v18,
		[v_u_3.Medium] = v18,
		[v_u_3.Large] = v19,
		[v_u_3.Pictogram] = v19
	}
	local v21 = {
		["common"] = v13,
		["variants"] = v14,
		["hasValue"] = v15,
		["shape"] = v16,
		["sizes"] = v17
	}
	if not v_u_2.FoundationStatusIndicatorDesignUpdate then
		v20 = nil
	end
	v21.numericSizes = v20
	return v21
end
return function(p22, p23, p24, p25, p26, p27)
	-- upvalues: (copy) v_u_9, (copy) v_u_4, (copy) v_u_7, (copy) v_u_8, (copy) v_u_6, (copy) v_u_2
	v_u_9(p23 ~= v_u_4.Contrast_Experiment, "Contrast is not a supported StatusIndicator variant.")
	local v28 = v_u_9
	local v29
	if p23 == v_u_4.Alert then
		v29 = p24
	else
		v29 = false
	end
	v28(not v29, "Alert is not a supported numeric StatusIndicator variant.")
	local v30 = p27 and {
		["stroke"] = {
			["Color"] = v_u_7(p27, "Color3"),
			["Transparency"] = v_u_7(p27, "Transparency")
		}
	} or nil
	local v31 = v_u_8.useVariants("StatusIndicator", variantsFactory, p22)
	local v32 = v_u_6
	local v33 = v31.common
	local v34 = v31.variants[p23]
	local v35 = v31.hasValue[p24]
	local v36 = v31.shape[p25]
	local v37
	if v_u_2.FoundationStatusIndicatorDesignUpdate then
		if p24 then
			v37 = v31.numericSizes[p26]
		else
			v37 = v31.sizes[p26]
		end
	else
		v37 = p24 and {} or v31.sizes[p26]
	end
	return v32(v33, v34, v35, v36, v37, v30)
end