-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Dialog.Content.useScrollBarPadding
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Utility.isScrollingFrameOverflowingY)
local v_u_5 = require(v1.Providers.Style.useTokens)
return function() -- name: useScrollBarPadding
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4
	local v6, v_u_7 = v_u_3.useState(false)
	local v_u_8 = v_u_5()
	local v9, v_u_10 = v_u_3.useBinding(0)
	return v6, v9, v_u_3.useCallback(function(p11)
		-- upvalues: (ref) v_u_4, (copy) v_u_7, (copy) v_u_10, (copy) v_u_8
		local v12 = v_u_4(p11, 1)
		v_u_7(v12)
		v_u_10(not v12 and 0 or v_u_8.Size.Size_150)
	end, { v_u_8.Size.Size_150 })
end