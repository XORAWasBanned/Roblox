-- Path: CorePackages.Packages._Index.ReactFocusNavigation.ReactFocusNavigation.useEventMap
local v1 = script.Parent.Parent
local v_u_2 = require(v1.React)
require(v1.FocusNavigation)
local v_u_3 = require(script.Parent.FocusNavigationContext)
local v_u_4 = require(script.Parent.useComposedRef)
local v_u_5 = require(script.Parent.useEventLifecycleRef)
return function(p_u_6, p7) -- name: useEventMap
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_5, (copy) v_u_4
	local v_u_8 = v_u_2.useContext(v_u_3)
	return v_u_4(v_u_5(v_u_2.useCallback(function(p9)
		-- upvalues: (copy) v_u_8, (copy) p_u_6
		if v_u_8 then
			local v10 = p9:IsA("GuiObject")
			assert(v10, "EventMaps can only be mapped to GuiObjects")
			v_u_8:registerEventMap(p9, p_u_6)
		end
	end, { v_u_8, p_u_6 }), (v_u_2.useCallback(function(p11)
		-- upvalues: (copy) v_u_8, (copy) p_u_6
		if v_u_8 then
			local v12 = p11:IsA("GuiObject")
			assert(v12, "EventMaps can only be mapped to GuiObjects")
			v_u_8:deregisterEventMap(p11, p_u_6)
		end
	end, { v_u_8, p_u_6 }))), p7)
end