-- Path: CoreGui.RobloxGui.Modules.FTUX.Events.VR.LeaveGameIconHighlightEvent
local v1 = game:GetService("CorePackages")
require(script.Parent.Parent.EventType)
local v_u_2 = require(v1.Workspace.Packages.VrCommon).VRHub
return {
	["Name"] = "LeaveGameIconHighlightEvent",
	["StartEvent"] = function() -- name: StartEvent
		-- upvalues: (copy) v_u_2
		v_u_2:SetShowHighlightedLeaveGameIconToggled(true)
	end,
	["StopEvent"] = function() -- name: StopEvent
		-- upvalues: (copy) v_u_2
		v_u_2:SetShowHighlightedLeaveGameIconToggled(false)
	end
}