-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.InternalDrawer.useInternalDrawerVariants
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Utility.composeStyleVariant)
local v_u_3 = require(v1.Enums.InternalDrawerLayout)
local v_u_4 = require(v1.Enums.InternalDrawerSide)
require(v1.Providers.Style.Tokens)
require(v1.Components.Types)
local v_u_5 = require(v1.Providers.Style.VariantsContext)
local v_u_6 = require(v1.Providers.Style.useTokens)
local function v_u_13(p7) -- name: variantsFactory
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v8 = {
		["innerEdge"] = {
			["backgroundStyle"] = p7.Color.Stroke.Default,
			["thickness"] = p7.Stroke.Standard
		},
		["shadow"] = {
			["tag"] = "shadow-overlay-300"
		}
	}
	local v9 = {
		[v_u_3.FullBleed] = {
			["surface"] = {
				["margin"] = 0
			},
			["innerEdge"] = {
				["isVisible"] = true
			}
		}
	}
	local v10 = v_u_3.Inset
	local v11 = {
		["surface"] = {
			["tag"] = "stroke-standard stroke-default radius-large",
			["margin"] = nil,
			["margin"] = p7.Padding.Medium
		},
		["innerEdge"] = {
			["isVisible"] = false
		},
		["shadow"] = {
			["tag"] = "radius-large"
		}
	}
	v9[v10] = v11
	local v12 = {
		[v_u_4.Start] = {
			["surface"] = {
				["tag"] = "anchor-top-left",
				["anchorScaleX"] = 0,
				["openOffsetSign"] = 1,
				["hiddenOffsetSign"] = -1
			},
			["innerEdge"] = {
				["tag"] = "position-top-right anchor-top-right"
			},
			["shadow"] = {
				["tag"] = "anchor-top-left"
			}
		},
		[v_u_4.End] = {
			["surface"] = {
				["tag"] = "anchor-top-right",
				["anchorScaleX"] = 1,
				["openOffsetSign"] = -1,
				["hiddenOffsetSign"] = 1
			},
			["innerEdge"] = {
				["tag"] = "position-top-left anchor-top-left"
			},
			["shadow"] = {
				["tag"] = "anchor-top-right"
			}
		}
	}
	return {
		["common"] = v8,
		["layout"] = v9,
		["side"] = v12
	}
end
return function(p14, p15) -- name: useInternalDrawerVariants
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_13, (copy) v_u_2
	local v16 = v_u_6()
	local v17 = v_u_5.useVariants("InternalDrawer", v_u_13, v16)
	return v_u_2(v17.common, v17.layout[p14], v17.side[p15])
end