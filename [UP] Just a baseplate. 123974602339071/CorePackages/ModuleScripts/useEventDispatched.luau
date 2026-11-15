-- Path: CorePackages.Packages._Index.ReactFocusNavigation.ReactFocusNavigation.useEventDispatched
local v1 = script.Parent.Parent
local v_u_2 = require(v1.React)
require(v1.FocusNavigation)
local v_u_3 = require(script.Parent.FocusNavigationContext)
return function(p4) -- name: useEventDispatched
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v_u_5 = v_u_2.useContext(v_u_3)
	local v_u_6 = v_u_2.useRef(p4)
	v_u_6.current = p4
	v_u_2.useEffect(function()
		-- upvalues: (copy) v_u_5, (copy) v_u_6
		if not v_u_5 then
			return nil
		end
		local v_u_8 = v_u_5.eventDispatched:subscribe(function(p7)
			-- upvalues: (ref) v_u_6
			if p7 then
				v_u_6.current(p7)
			end
		end)
		return function()
			-- upvalues: (copy) v_u_8
			v_u_8:unsubscribe()
		end
	end, { v_u_5 })
end