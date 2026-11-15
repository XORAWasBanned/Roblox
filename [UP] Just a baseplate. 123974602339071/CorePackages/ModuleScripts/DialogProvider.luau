-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Dialog.DialogProvider
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
require(v1.Enums.DialogSize)
local v_u_4 = require(script.Parent.getResponsiveSize)
local v_u_5 = require(v1.Providers.Overlay.useOverlay)
local v_u_6 = require(v1.Providers.Style.useTokens)
local v_u_7 = require(script.Parent.DialogContext)
return function(p_u_8) -- name: DialogProvider
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_3, (copy) v_u_4, (copy) v_u_7
	local v_u_9 = v_u_5()
	local v_u_10 = v_u_6()
	local v_u_11, v_u_12 = v_u_3.useState(function()
		-- upvalues: (copy) v_u_9, (ref) v_u_4, (copy) p_u_8, (copy) v_u_10
		if v_u_9 then
			return v_u_4(v_u_9.AbsoluteSize.X, p_u_8.size, v_u_10)
		else
			return p_u_8.responsiveSize or p_u_8.size
		end
	end)
	local v_u_13, v_u_14 = v_u_3.useState(p_u_8.hasHeroMedia)
	local v_u_15 = v_u_3.useRef(nil)
	local v_u_16, v_u_17 = v_u_3.useState(nil)
	local v18 = {
		["value"] = v_u_3.useMemo(function()
			-- upvalues: (copy) p_u_8, (copy) v_u_11, (copy) v_u_12, (copy) v_u_13, (copy) v_u_14, (copy) v_u_15, (copy) v_u_16, (copy) v_u_17
			return {
				["size"] = p_u_8.size,
				["responsiveSize"] = v_u_11,
				["setResponsiveSize"] = v_u_12,
				["hasHeroMedia"] = v_u_13,
				["setHasHeroMedia"] = v_u_14,
				["testId"] = p_u_8.testId,
				["closeAffordanceRef"] = v_u_15,
				["contentStartRef"] = v_u_16,
				["setContentStartRef"] = v_u_17
			}
		end, {
			p_u_8.size,
			v_u_11,
			v_u_13,
			p_u_8.testId,
			v_u_16
		})
	}
	return v_u_3.createElement(v_u_7.Provider, v18, p_u_8.children)
end