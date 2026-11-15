-- Path: CoreGui.RobloxGui.Modules.Settings.cameraDevicesHelper
local v_u_1 = game:GetService("VideoCaptureService")
local v_u_2 = nil
v_u_1.DevicesChanged:Connect(function()
	-- upvalues: (ref) v_u_2, (copy) v_u_1
	v_u_2 = v_u_1:GetCameraDevices()
end)
return {
	["GetDevices"] = function()
		-- upvalues: (ref) v_u_2, (copy) v_u_1
		if not v_u_2 then
			v_u_2 = v_u_1:GetCameraDevices()
		end
		return v_u_2
	end
}