-- Path: CorePackages.Packages._Index.ReactFocusNavigation.ReactFocusNavigation.useComposedRef
local v1 = script.Parent.Parent
local v_u_2 = require(v1.React)
return function(p_u_3, p_u_4) -- name: useComposedRef
	-- upvalues: (copy) v_u_2
	return v_u_2.useCallback(function(p5)
		-- upvalues: (copy) p_u_3, (copy) p_u_4
		local v6 = p_u_3
		if type(v6) == "function" then
			v6(p5)
		elseif type(v6) == "table" then
			v6.current = p5
		end
		local v7 = p_u_4
		if type(v7) == "function" then
			v7(p5)
		elseif type(v7) == "table" then
			v7.current = p5
		end
	end, { p_u_3, p_u_4 })
end