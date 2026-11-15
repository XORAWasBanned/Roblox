-- Path: CoreGui.RobloxGui.Modules.FTUX.Events.VR.MoveToGoalEvent
require(script.Parent.Parent.EventType)
local v1 = {
	["Name"] = "MoveToGoalEvent"
}
local v_u_2 = nil
function v1.StartEvent(p_u_3) -- name: StartEvent
	-- upvalues: (ref) v_u_2
	local v_u_4 = Instance.new("Part")
	v_u_4.Anchored = true
	v_u_4.CanCollide = false
	v_u_4.Transparency = 1
	v_u_4.Size = Vector3.new(17, 1, 18)
	v_u_4.Position = Vector3.new(0.5, 6.3, -40)
	v_u_4.Parent = workspace
	task.wait(1)
	v_u_2 = v_u_4.Touched:Connect(function(p5)
		-- upvalues: (copy) v_u_4, (copy) p_u_3, (ref) v_u_2
		if game.Players:GetPlayerFromCharacter(p5.Parent) then
			v_u_4:Destroy()
			task.wait(0.2)
			p_u_3()
			if v_u_2 then
				v_u_2:Disconnect()
				v_u_2 = nil
			end
		end
	end)
end
function v1.StopEvent() -- name: StopEvent
	-- upvalues: (ref) v_u_2
	if v_u_2 then
		v_u_2:Disconnect()
		v_u_2 = nil
	end
end
return v1