-- Path: CorePackages.Packages._Index.ReactFocusNavigation.ReactFocusNavigation.useFocusGuiObject
local v1 = script.Parent.Parent
local v_u_2 = require(v1.React)
local v_u_3 = require(v1.FocusNavigationUtils).mockableWarn
local v_u_4 = require(script.Parent.FocusNavigationContext)
return function() -- name: useFocusGuiObject
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_3
	local v_u_5 = v_u_2.useContext(v_u_4)
	return v_u_2.useCallback(function(p6, p7)
		-- upvalues: (copy) v_u_5, (ref) v_u_3
		if v_u_5 then
			v_u_5:focusGuiObject(p6, p7 and true or false)
		elseif _G.__DEV__ then
			v_u_3("Could not capture focus with no FocusNavigationService.\n\nIntroduce a ReactFocusNavigation.FocusNavigationProvider above this component in the tree and provide it with a value returned from FocusNavigationService.new(...)")
		end
	end, { v_u_5 })
end