-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Hooks.useEffectOnce
local v1 = script:FindFirstAncestor("MomentsCreationFlow").Parent
local v_u_2 = require(v1.React)
return function(p_u_3, p_u_4)
	-- upvalues: (copy) v_u_2
	local v_u_5 = v_u_2.useRef(false)
	v_u_2.useEffect(function()
		-- upvalues: (copy) p_u_4, (copy) v_u_5, (copy) p_u_3
		if p_u_4 and not v_u_5.current then
			p_u_3()
			v_u_5.current = true
		end
	end, { p_u_4 })
end