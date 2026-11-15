-- Path: CoreGui.RobloxGui.Modules.SelfieView.Hooks.useCameraOn
local v_u_1 = require(script.Parent.useTrackerMode)
return function() -- name: useCameraOn
	-- upvalues: (copy) v_u_1
	local v2 = v_u_1()
	return v2 == Enum.TrackerMode.Video and true or v2 == Enum.TrackerMode.AudioVideo
end