-- Path: CoreGui.RobloxGui.Modules.CoreUtility
local v1 = {}
local v_u_2 = game:DefineFastInt("WaitForChildOfClassTimeout", 0)
if v_u_2 > 0 then
	function v1.waitForChildOfClass(p3, p4) -- name: waitForChildOfClass
		-- upvalues: (copy) v_u_2
		local v5 = p3:FindFirstChildOfClass(p4)
		local v6 = tick() + v_u_2
		while not v5 and tick() < v6 do
			task.wait()
			v5 = p3:FindFirstChildOfClass(p4)
		end
		return v5
	end
else
	function v1.waitForChildOfClass(p7, p8) -- name: waitForChildOfClass
		local v9 = p7:FindFirstChildOfClass(p8)
		while not v9 or v9.ClassName ~= p8 do
			v9 = p7.ChildAdded:Wait()
		end
		return v9
	end
end
function v1.waitForChildWhichIsA(p10, p11) -- name: waitForChildWhichIsA
	local v12 = p10:FindFirstChildWhichIsA(p11)
	while not (v12 and v12:IsA(p11)) do
		v12 = p10.ChildAdded:Wait()
	end
	return v12
end
return v1