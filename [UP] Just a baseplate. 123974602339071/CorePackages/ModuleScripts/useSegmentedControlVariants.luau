-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.SegmentedControl.useSegmentedControlVariants
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Components.Types)
local v_u_2 = require(v1.Enums.FillBehavior)
local v_u_3 = require(v1.Enums.InputSize)
local v_u_4 = require(v1.Enums.IconSize)
local v_u_5 = require(v1.Enums.SegmentedControlVariant)
local v_u_6 = require(v1.Utility.Flags)
local v_u_7 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
local v_u_8 = require(v1.Providers.Style.VariantsContext)
local function v_u_21(p9) -- name: variantsFactory_DEPRECATED
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v10 = {
		["container"] = {
			["tag"] = "row align-y-center auto-x bg-surface-300"
		},
		["segment"] = {
			["tag"] = "row align-y-center size-0-full auto-x"
		},
		["text"] = {
			["tag"] = "auto-x text-truncate-end content-emphasis"
		},
		["icon"] = {
			["style"] = p9.Color.Content.Emphasis
		},
		["divider"] = {
			["tag"] = "row"
		}
	}
	local v11 = {}
	local v12 = v_u_3.XSmall
	local v13 = {
		["container"] = {
			["tag"] = "size-600"
		},
		["segment"] = {
			["tag"] = "padding-small"
		},
		["text"] = {
			["tag"] = "text-caption-small"
		},
		["icon"] = {
			["size"] = v_u_4.Small
		},
		["divider"] = {
			["Size"] = UDim2.new(0, p9.Stroke.Standard, 1, 0)
		}
	}
	v11[v12] = v13
	local v14 = v_u_3.Small
	local v15 = {
		["container"] = {
			["tag"] = "size-800"
		},
		["segment"] = {
			["tag"] = "padding-small"
		},
		["text"] = {
			["tag"] = "text-caption-small"
		},
		["icon"] = {
			["size"] = v_u_4.Medium
		},
		["divider"] = {
			["Size"] = UDim2.new(0, p9.Stroke.Standard, 1, 0)
		}
	}
	v11[v14] = v15
	local v16 = v_u_3.Medium
	local v17 = {
		["container"] = {
			["tag"] = "size-1000 padding-xsmall"
		},
		["segment"] = {
			["tag"] = "padding-small"
		},
		["text"] = {
			["tag"] = "text-caption-medium"
		},
		["icon"] = {
			["size"] = v_u_4.Medium
		},
		["divider"] = {
			["Size"] = UDim2.new(0, p9.Stroke.Standard, 1, 0)
		}
	}
	v11[v16] = v17
	local v18 = v_u_3.Large
	local v19 = {
		["container"] = {
			["tag"] = "size-1200 padding-xsmall"
		},
		["segment"] = {
			["tag"] = "padding-medium"
		},
		["text"] = {
			["tag"] = "text-caption-medium"
		},
		["icon"] = {
			["size"] = v_u_4.Large
		},
		["divider"] = {
			["Size"] = UDim2.new(0, p9.Stroke.Standard, 1, 0)
		}
	}
	v11[v18] = v19
	local v20 = {
		[v_u_3.XSmall] = {
			["container"] = {
				["tag"] = "radius-medium"
			},
			["segment"] = {
				["tag"] = "radius-medium"
			}
		},
		[v_u_3.Small] = {
			["container"] = {
				["tag"] = "radius-medium"
			},
			["segment"] = {
				["tag"] = "radius-medium"
			}
		},
		[v_u_3.Medium] = {
			["container"] = {
				["tag"] = "radius-medium"
			},
			["segment"] = {
				["tag"] = "radius-small"
			}
		},
		[v_u_3.Large] = {
			["container"] = {
				["tag"] = "radius-medium"
			},
			["segment"] = {
				["tag"] = "radius-small"
			}
		}
	}
	return {
		["common"] = v10,
		["sizes"] = v11,
		["defaultRadius"] = v20,
		["circularRadius"] = {
			["container"] = {
				["tag"] = "radius-circle"
			},
			["segment"] = {
				["tag"] = "radius-circle"
			}
		}
	}
end
local function v_u_47(p22) -- name: variantsFactory
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_4, (copy) v_u_2
	local v23 = {
		[v_u_5.Filled] = {
			["container"] = {
				["tag"] = "bg-shift-200"
			}
		}
	}
	local v24 = v_u_5.Stroke
	local v25 = {}
	local v26 = {}
	local v27 = p22.Color.Stroke.Emphasis
	local v28 = p22.Stroke.Standard
	v26.stroke = {
		["Color"] = v27.Color3,
		["Transparency"] = v27.Transparency,
		["Thickness"] = v28,
		["BorderStrokePosition"] = Enum.BorderStrokePosition.Outer
	}
	v25.container = v26
	v23[v24] = v25
	v23[v_u_5.Utility] = {}
	local v29 = {}
	local v30 = v_u_3.XSmall
	local v31 = {
		["segment"] = {
			["tag"] = "padding-x-small"
		},
		["text"] = {
			["tag"] = "text-label-small"
		},
		["icon"] = {
			["size"] = v_u_4.XSmall
		}
	}
	v29[v30] = v31
	local v32 = v_u_3.Small
	local v33 = {
		["segment"] = {
			["tag"] = "padding-x-medium"
		},
		["text"] = {
			["tag"] = "text-label-small"
		},
		["icon"] = {
			["size"] = v_u_4.Small
		}
	}
	v29[v32] = v33
	local v34 = v_u_3.Medium
	local v35 = {
		["container"] = {
			["tag"] = "padding-xsmall"
		},
		["segment"] = {
			["tag"] = "padding-x-medium"
		},
		["text"] = {
			["tag"] = "text-label-medium"
		},
		["icon"] = {
			["size"] = v_u_4.Medium
		}
	}
	v29[v34] = v35
	local v36 = v_u_3.Large
	local v37 = {
		["container"] = {
			["tag"] = "padding-xsmall"
		},
		["segment"] = {
			["tag"] = "padding-x-large"
		},
		["text"] = {
			["tag"] = "text-label-large"
		},
		["icon"] = {
			["size"] = v_u_4.Large
		}
	}
	v29[v36] = v37
	local v38 = {
		[v_u_3.XSmall] = {
			["container"] = {
				["tag"] = "size-0-600 auto-x"
			}
		},
		[v_u_3.Small] = {
			["container"] = {
				["tag"] = "size-0-800 auto-x"
			}
		},
		[v_u_3.Medium] = {
			["container"] = {
				["tag"] = "size-0-1000 auto-x"
			}
		},
		[v_u_3.Large] = {
			["container"] = {
				["tag"] = "size-0-1200 auto-x"
			}
		}
	}
	local v39 = {
		[v_u_2.Fit] = {
			["segment"] = {
				["tag"] = "size-0-full auto-xy"
			}
		},
		[v_u_2.Fill] = {
			["segment"] = {
				["tag"] = "grow auto-xy"
			}
		}
	}
	local v40 = {
		[v_u_3.XSmall] = {
			["container"] = {
				["tag"] = "size-full-600"
			}
		},
		[v_u_3.Small] = {
			["container"] = {
				["tag"] = "size-full-800"
			}
		},
		[v_u_3.Medium] = {
			["container"] = {
				["tag"] = "size-full-1000"
			}
		},
		[v_u_3.Large] = {
			["container"] = {
				["tag"] = "size-full-1200"
			}
		}
	}
	local v41 = {
		[v_u_3.XSmall] = {},
		[v_u_3.Small] = {
			["segment"] = {
				["tag"] = "padding-x-medium"
			}
		},
		[v_u_3.Medium] = {
			["segment"] = {
				["tag"] = "padding-x-large"
			}
		},
		[v_u_3.Large] = {
			["segment"] = {
				["tag"] = "padding-x-xlarge"
			}
		}
	}
	local v42 = {}
	local v43 = {
		["text"] = {
			["style"] = p22.Color.Content.Emphasis
		},
		["icon"] = {
			["style"] = p22.Color.Content.Emphasis
		}
	}
	v42[true] = v43
	local v44 = {
		["text"] = {
			["style"] = p22.Color.Content.Default
		},
		["icon"] = {
			["style"] = p22.Color.Content.Default
		}
	}
	v42[false] = v44
	local v45 = {
		[v_u_3.XSmall] = {
			["container"] = {
				["tag"] = "radius-medium"
			},
			["segment"] = {
				["tag"] = "radius-medium"
			}
		},
		[v_u_3.Small] = {
			["container"] = {
				["tag"] = "radius-medium"
			},
			["segment"] = {
				["tag"] = "radius-medium"
			}
		},
		[v_u_3.Medium] = {
			["container"] = {
				["tag"] = "radius-medium"
			},
			["segment"] = {
				["tag"] = "radius-small"
			}
		},
		[v_u_3.Large] = {
			["container"] = {
				["tag"] = "radius-medium"
			},
			["segment"] = {
				["tag"] = "radius-small"
			}
		}
	}
	local v46 = {
		["common"] = {
			["container"] = {
				["tag"] = "row flex-y-fill align-y-center gap-xxsmall"
			},
			["segment"] = {
				["tag"] = "row align-x-center align-y-center"
			},
			["text"] = {
				["tag"] = "auto-x text-align-x-center text-truncate-end"
			},
			["icon"] = {}
		},
		["activeStyles"] = v42,
		["variantStyles"] = v23,
		["sizes"] = v29,
		["fitSizes"] = v38,
		["fillBehaviorStyles"] = v39,
		["fillSizes"] = v40,
		["utilityPadding"] = v41,
		["defaultRadius"] = v45,
		["circularRadius"] = {
			["container"] = {
				["tag"] = "radius-circle"
			},
			["segment"] = {
				["tag"] = "radius-circle"
			}
		}
	}
	return v46
end
return function(p48, p49, p50, p51, p52, p53)
	-- upvalues: (copy) v_u_6, (copy) v_u_8, (copy) v_u_47, (copy) v_u_7, (copy) v_u_5, (copy) v_u_2, (copy) v_u_21
	if not v_u_6.FoundationSegmentedControlBeta then
		local v54 = v_u_8.useVariants("SegmentedControl", v_u_21, p48)
		local v55 = v_u_7
		local v56 = v54.common
		local v57 = v54.sizes[p49]
		local v58
		if p52 then
			v58 = v54.circularRadius
		else
			v58 = v54.defaultRadius[p49]
		end
		return v55(v56, v57, v58)
	end
	local v59 = v_u_8.useVariants("SegmentedControl", v_u_47, p48)
	local v60 = v_u_7
	local v61 = v59.common
	local v62 = v59.sizes[p49]
	local v63 = p50 ~= v_u_5.Utility and {} or v59.utilityPadding[p49]
	local v64
	if p51 == v_u_2.Fill then
		v64 = v59.fillSizes[p49]
	else
		v64 = v59.fitSizes[p49]
	end
	local v65 = v59.fillBehaviorStyles[p51]
	local v66 = v59.activeStyles[p53 == true]
	local v67 = v59.variantStyles[p50]
	local v68
	if p52 then
		v68 = v59.circularRadius
	else
		v68 = v59.defaultRadius[p49]
	end
	return v60(v61, v62, v63, v64, v65, v66, v67, v68)
end