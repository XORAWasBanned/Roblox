-- Path: CorePackages.Packages._Index.ReactFocusNavigation.ReactFocusNavigation.useDispatchSyntheticEvent
local v1 = script.Parent.Parent
local v_u_2 = require(v1.React)
require(v1.FocusNavigation)
local v_u_3 = require(script.Parent.FocusNavigationContext)
return function() -- name: useDispatchSyntheticEvent
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v_u_4 = v_u_2.useContext(v_u_3)
	return v_u_2.useCallback(function(p5, p6, p7)
		-- upvalues: (copy) v_u_4
		if not v_u_4 then
			if _G.__DEV__ then
				warn("useDispatchSyntheticEvent: No FocusNavigationService available in context")
			end
			return false
		end
		local v8 = p6:IsA("GuiObject")
		assert(v8, "Synthetic events must be dispatched on GuiObjects")
		return v_u_4:dispatchSyntheticEvent(p5, p6, p7)
	end, { v_u_4 })
end