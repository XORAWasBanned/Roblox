-- Path: CoreGui.RobloxGui.Modules.FTUX.Events.VR.HapticFeedbackTwiceEvent
local v_u_1 = game:GetService("HapticService")
require(script.Parent.Parent.EventType)
return {
	["Name"] = "HapticFeedbackTwiceEvent",
	["StartEvent"] = function() -- name: StartEvent
		-- upvalues: (copy) v_u_1
		local v2 = Enum.UserInputType.Gamepad1
		local v3 = Enum.UserInputType.Gamepad2
		for _ = 1, 2 do
			v_u_1:SetMotor(v2, Enum.VibrationMotor.Large, 5)
			v_u_1:SetMotor(v3, Enum.VibrationMotor.Large, 5)
			task.wait(0.5)
			v_u_1:SetMotor(v2, Enum.VibrationMotor.Large, 0)
			v_u_1:SetMotor(v3, Enum.VibrationMotor.Large, 0)
			task.wait(0.125)
		end
	end
}