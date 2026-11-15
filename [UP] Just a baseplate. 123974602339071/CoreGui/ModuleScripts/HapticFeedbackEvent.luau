-- Path: CoreGui.RobloxGui.Modules.FTUX.Events.VR.HapticFeedbackEvent
local v_u_1 = game:GetService("HapticService")
require(script.Parent.Parent.EventType)
return {
	["Name"] = "HapticFeedbackEvent",
	["StartEvent"] = function() -- name: StartEvent
		-- upvalues: (copy) v_u_1
		local v2 = Enum.UserInputType.Gamepad1
		local v3 = Enum.UserInputType.Gamepad2
		v_u_1:SetMotor(v2, Enum.VibrationMotor.Large, 10)
		v_u_1:SetMotor(v3, Enum.VibrationMotor.Large, 10)
		task.wait(1)
		v_u_1:SetMotor(v2, Enum.VibrationMotor.Large, 0)
		v_u_1:SetMotor(v3, Enum.VibrationMotor.Large, 0)
	end
}