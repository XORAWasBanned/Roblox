-- Path: CorePackages.Packages._Index.ReactFocusNavigation.ReactFocusNavigation.useFocusedGuiObject
local v1 = script.Parent.Parent
local v_u_2 = require(v1.React)
local v_u_3 = require(script.Parent.FocusNavigationContext)
return function() -- name: useCurrentFocus
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v_u_4 = v_u_2.useContext(v_u_3)
	local v_u_5
	if v_u_4 then
		v_u_5 = v_u_4.focusedGuiObject:getValue()
	else
		v_u_5 = nil
	end
	local v_u_6, v_u_7 = v_u_2.useState(v_u_5)
	v_u_2.useEffect(function()
		-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_7, (copy) v_u_4
		if v_u_6 ~= v_u_5 then
			v_u_7(v_u_5)
		end
		if not v_u_4 then
			return nil
		end
		local v_u_8 = v_u_4.focusedGuiObject:subscribe(v_u_7)
		return function()
			-- upvalues: (copy) v_u_8
			v_u_8:unsubscribe()
		end
	end, { v_u_4 })
	return v_u_6
end