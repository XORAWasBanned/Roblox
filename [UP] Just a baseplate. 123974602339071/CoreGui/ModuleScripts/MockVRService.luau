-- Path: CoreGui.RobloxGui.Modules.TestHelpers.MockVRService
local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.GetPropertyChangedSignal(p2, p3) -- name: GetPropertyChangedSignal
	if p3 == "VRDeviceAvailable" then
		return p2._vrDeviceAvailableChanged.Event
	end
	error(("%s is not a valid property name"):format((tostring(p3))))
end
function v_u_1.toggleHeadsetConnectionState(p4) -- name: toggleHeadsetConnectionState
	local v5 = not p4.VRDeviceAvailable
	p4.VRDeviceAvailable = v5
	p4._vrDeviceAvailableChanged:Fire(v5)
end
function v_u_1.new() -- name: new
	-- upvalues: (copy) v_u_1
	local v6 = {
		["VRDeviceAvailable"] = true,
		["_vrDeviceAvailableChanged"] = nil,
		["_vrDeviceAvailableChanged"] = Instance.new("BindableEvent")
	}
	local v7 = {
		["__index"] = v_u_1
	}
	setmetatable(v6, v7)
	return v6
end
return v_u_1