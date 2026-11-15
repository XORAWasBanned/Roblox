-- Path: CoreGui.RobloxGui.Modules.Feedback.Thunks.ShowOnboardingModalThunk
local v1 = script.Parent.Parent
local v_u_2 = require(v1.Actions.ShowOnboardingModal)
return function(p_u_3)
	-- upvalues: (copy) v_u_2
	return function(p4)
		-- upvalues: (ref) v_u_2, (copy) p_u_3
		p4:dispatch(v_u_2(p_u_3))
	end
end