-- Path: CorePackages.Packages._Index.ReactFocusNavigation.ReactFocusNavigation.useActiveEventMap
local v1 = script.Parent.Parent
local v_u_2 = require(v1.React)
require(v1.FocusNavigation)
local v_u_3 = require(script.Parent.FocusNavigationContext)
return function() -- name: useActiveEventMap
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v_u_4 = v_u_2.useContext(v_u_3)
	local v_u_5 = not v_u_4 and {} or v_u_4.activeEventMap:getValue()
	local v_u_6, v_u_7 = v_u_2.useState(v_u_5)
	v_u_2.useEffect(function()
		-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_7, (copy) v_u_4
		if v_u_6 ~= v_u_5 then
			v_u_7(v_u_5)
		end
		if not v_u_4 then
			return nil
		end
		local v_u_8 = v_u_4.activeEventMap:subscribe(v_u_7)
		return function()
			-- upvalues: (copy) v_u_8
			v_u_8:unsubscribe()
		end
	end, { v_u_4 })
	return v_u_6
end