-- Path: CoreGui.RobloxGui.Modules.DevConsole.Util.getClientReplicator
game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_1 = nil
return function() -- name: getClientReplicator
	-- upvalues: (ref) v_u_1
	local v2 = v_u_1 == nil and game:FindService("NetworkClient")
	if v2 then
		v_u_1 = v2:FindFirstChildOfClass("ClientReplicator")
	end
	if v_u_1 and v_u_1:IsDescendantOf(game) then
		return v_u_1
	else
		return nil
	end
end