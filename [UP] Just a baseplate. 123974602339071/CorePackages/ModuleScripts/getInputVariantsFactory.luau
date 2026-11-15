-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InputField.getInputVariantsFactory
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
require(v1.Components.Types)
local v_u_4 = require(v1.Enums.InputSize)
local v_u_5 = require(v1.Enums.InputVariant)
require(v1.Enums.IconSize)
local v_u_6 = require(v1.Enums.Radius)
require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
local v_u_7 = require(v1.Utility.Flags)
return function(p8) -- name: getInputVariantsFactory
	-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_5, (copy) v_u_3, (copy) v_u_6
	local v9 = {}
	local v10 = {}
	local v11
	if v_u_7.FoundationFixColorOnScrubbableNumberInput then
		v11 = p8.Color.Shift.Shift_200
	else
		v11 = nil
	end
	v10.fgStyle = v11
	v10.strokeStyle = p8.Color.Stroke.Emphasis
	v10.strokeThickness = p8.Stroke.Standard
	v9.container = v10
	local v12 = {
		[v_u_4.XSmall] = {
			["container"] = {
				["tag"] = "size-full-600"
			}
		},
		[v_u_4.Small] = {
			["container"] = {
				["tag"] = "size-full-800"
			}
		},
		[v_u_4.Medium] = {
			["container"] = {
				["tag"] = "size-full-1000"
			}
		},
		[v_u_4.Large] = {
			["container"] = {
				["tag"] = "size-full-1200"
			}
		}
	}
	local v13 = {
		[v_u_5.Standard] = {}
	}
	local v14 = v_u_5.Contrast
	local v15 = {}
	local v16 = {}
	local v17
	if v_u_7.FoundationFixColorOnScrubbableNumberInput then
		v17 = p8.Color.Shift.Shift_300
	else
		v17 = nil
	end
	v16.fgStyle = v17
	v16.bgStyle = p8.Color.Shift.Shift_200
	v16.strokeStyle = v_u_3.None
	v15.container = v16
	v13[v14] = v15
	v13[v_u_5.Utility] = {
		["container"] = {
			["fgStyle"] = v_u_3.None,
			["bgStyle"] = v_u_3.None,
			["strokeStyle"] = v_u_3.None
		}
	}
	local v18 = {
		[true] = {
			["container"] = {
				["strokeStyle"] = p8.Color.System.Alert
			}
		},
		[false] = {}
	}
	local v19 = {
		[true] = {
			["container"] = {
				["strokeStyle"] = p8.Color.System.Emphasis,
				["strokeThickness"] = p8.Stroke.Standard * 2
			}
		},
		[false] = {}
	}
	local v20 = {
		[true] = {
			["container"] = {
				["strokeThickness"] = p8.Stroke.Standard * 2
			}
		},
		[false] = {}
	}
	local v21 = {}
	local v22 = {
		["container"] = {
			["tag"] = {
				["radius-small"] = true
			}
		}
	}
	v21[v_u_4.XSmall] = v22
	local v23 = {
		["container"] = {
			["tag"] = {
				["radius-medium"] = true
			}
		}
	}
	v21[v_u_4.Small] = v23
	local v24 = {
		["container"] = {
			["tag"] = {
				["radius-medium"] = true
			}
		}
	}
	v21[v_u_4.Medium] = v24
	local v25 = {
		["container"] = {
			["tag"] = {
				["radius-medium"] = true
			}
		}
	}
	v21[v_u_4.Large] = v25
	local v26 = {}
	local v27 = {
		["container"] = {
			["tag"] = {
				["radius-none"] = true
			}
		}
	}
	v26[v_u_6.None] = v27
	local v28 = {
		["container"] = {
			["tag"] = {
				["radius-xsmall"] = true
			}
		}
	}
	v26[v_u_6.XSmall] = v28
	local v29 = {
		["container"] = {
			["tag"] = {
				["radius-small"] = true
			}
		}
	}
	v26[v_u_6.Small] = v29
	local v30 = {
		["container"] = {
			["tag"] = {
				["radius-medium"] = true
			}
		}
	}
	v26[v_u_6.Medium] = v30
	local v31 = {
		["container"] = {
			["tag"] = {
				["radius-large"] = true
			}
		}
	}
	v26[v_u_6.Large] = v31
	return {
		["common"] = v9,
		["sizes"] = v12,
		["variants"] = v13,
		["defaultRadius"] = v21,
		["radius"] = v26,
		["errorState"] = v18,
		["focusedState"] = v19,
		["hoverState"] = v20
	}
end