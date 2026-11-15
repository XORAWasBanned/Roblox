-- Path: CoreGui.RobloxGui.Modules.FTUX.Events.VR.FirstPersonToggleEvent
local v_u_1 = game:GetService("ContextActionService")
local v_u_2 = game:GetService("RunService")
require(script.Parent.Parent.EventType)
local v3 = {
	["Name"] = "FirstPersonToggleEvent"
}
local v_u_4 = false
local v_u_5 = nil
local function v_u_8(p6, p7, _) -- name: onFirstPersonToggleInput
	-- upvalues: (ref) v_u_4
	if p6 == "FirstPersonToggleAction" and p7 == Enum.UserInputState.Begin then
		v_u_4 = true
	end
	return Enum.ContextActionResult.Pass
end
function startFirstPersonToggleListener() -- name: startFirstPersonToggleListener
	-- upvalues: (copy) v_u_1, (copy) v_u_8
	v_u_1:BindCoreAction("FirstPersonToggleAction", v_u_8, false, Enum.KeyCode.ButtonR3)
end
function stopFirstPersonToggleListener() -- name: stopFirstPersonToggleListener
	-- upvalues: (copy) v_u_1
	v_u_1:UnbindAction("FirstPersonToggleAction")
end
function v3.StartEvent(p_u_9) -- name: StartEvent
	-- upvalues: (ref) v_u_4, (ref) v_u_5, (copy) v_u_2
	startFirstPersonToggleListener()
	local function v10(_) -- name: onRenderStepped
		-- upvalues: (ref) v_u_4, (copy) p_u_9, (ref) v_u_5
		if v_u_4 then
			stopFirstPersonToggleListener()
			task.wait(0.2)
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
	end
	stopFirstPersonToggleListener()
end
return v3