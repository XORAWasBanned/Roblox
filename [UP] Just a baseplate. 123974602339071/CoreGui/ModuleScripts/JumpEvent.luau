-- Path: CoreGui.RobloxGui.Modules.FTUX.Events.VR.JumpEvent
local v_u_1 = game:GetService("ContextActionService")
local v_u_2 = game:GetService("RunService")
require(script.Parent.Parent.EventType)
local v3 = {
	["Name"] = "FirstPersonToggleEvent"
}
local v_u_4 = false
local v_u_5 = nil
local function v_u_8(p6, p7, _) -- name: onJumpInput
	-- upvalues: (ref) v_u_4
	if p6 == "JumpAction" and p7 == Enum.UserInputState.Begin then
		v_u_4 = true
	end
	return Enum.ContextActionResult.Pass
end
function startJumpEventListener() -- name: startJumpEventListener
	-- upvalues: (copy) v_u_1, (copy) v_u_8
	v_u_1:BindCoreAction("JumpAction", v_u_8, false, Enum.KeyCode.Space)
end
function stopJumpEventListener() -- name: stopJumpEventListener
	-- upvalues: (copy) v_u_1
	v_u_1:UnbindAction("JumpAction")
end
function v3.StartEvent(p_u_9) -- name: StartEvent
	-- upvalues: (ref) v_u_4, (ref) v_u_5, (copy) v_u_2
	startJumpEventListener()
	local function v10(_) -- name: onRenderStepped
		-- upvalues: (ref) v_u_4, (copy) p_u_9, (ref) v_u_5
		if v_u_4 then
			stopJumpEventListener()
			p_u_9()
			if v_u_5 then
				v_u_5:Disconnect()
				v_u_5 = nil
			end
		end
	end
	v_u_5 = v_u_2.RenderStepped:Connect(v10)
end
function v3.StopEvent() -- name: StopEvent
	-- upvalues: (ref) v_u_5
	if v_u_5 then
		v_u_5:Disconnect()
		v_u_5 = nil
	end
	stopJumpEventListener()
end
return v3