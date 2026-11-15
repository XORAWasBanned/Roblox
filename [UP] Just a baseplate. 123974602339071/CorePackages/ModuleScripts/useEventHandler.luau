-- Path: CorePackages.Packages._Index.ReactFocusNavigation.ReactFocusNavigation.useEventHandler
local v1 = script.Parent.Parent
local v_u_2 = require(v1.React)
require(v1.FocusNavigation)
local v_u_3 = require(script.Parent.FocusNavigationContext)
local v_u_4 = require(script.Parent.useComposedRef)
local v_u_5 = require(script.Parent.useEventLifecycleRef)
return function(p_u_6, p_u_7, p_u_8, p9) -- name: useEventHandler
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_5, (copy) v_u_4
	local v_u_10 = v_u_2.useContext(v_u_3)
	return v_u_4(v_u_5(v_u_2.useCallback(function(p11)
		-- upvalues: (copy) v_u_10, (copy) p_u_6, (copy) p_u_7, (copy) p_u_8
		if v_u_10 then
			local v12 = p11:IsA("GuiObject")
			assert(v12, "Event handlers can only be applied to GuiObjects")
			v_u_10:registerEventHandler(p11, p_u_6, p_u_7, p_u_8)
		end
	end, {
		v_u_10,
		p_u_6,
		p_u_7,
		p_u_8
	}), (v_u_2.useCallback(function(p13)
		-- upvalues: (copy) v_u_10, (copy) p_u_6, (copy) p_u_7, (copy) p_u_8
		if v_u_10 then
			local v14 = p13:IsA("GuiObject")
			assert(v14, "Event handlers can only be applied to GuiObjects")
			v_u_10:deregisterEventHandler(p13, p_u_6, p_u_7, p_u_8)
		end
	end, {
		v_u_10,
		p_u_6,
		p_u_7,
		p_u_8
	}))), p9)
end