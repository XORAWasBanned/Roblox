-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Dialog.useDialogResponsiveSize
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
require(v1.Enums.DialogSize)
local v_u_4 = require(v1.Providers.Overlay.useOverlay)
local v_u_5 = require(v1.Providers.Style.useTokens)
local v_u_6 = require(script.Parent.getResponsiveSize)
local v_u_7 = require(script.Parent.useDialog)
return function(p_u_8) -- name: useDialogResponsiveSize
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_7, (copy) v_u_3, (copy) v_u_6
	local v_u_9 = v_u_5()
	local v_u_10 = v_u_4()
	local v_u_11 = v_u_7()
	local v_u_12 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_10, (copy) v_u_11, (ref) v_u_6, (copy) p_u_8, (copy) v_u_9
		if v_u_10 then
			v_u_11.setResponsiveSize(v_u_6(v_u_10.AbsoluteSize.X, p_u_8, v_u_9))
		end
	end, {
		v_u_10,
		p_u_8,
		v_u_9,
		v_u_11.size
	})
	v_u_3.useLayoutEffect(function()
		-- upvalues: (copy) v_u_10, (copy) v_u_12
		if v_u_10 then
			v_u_12()
			local v_u_13 = v_u_10:GetPropertyChangedSignal("AbsoluteSize"):Connect(v_u_12)
			return function()
				-- upvalues: (copy) v_u_13
				v_u_13:Disconnect()
			end
		end
	end, { v_u_10, p_u_8, v_u_12 })
end