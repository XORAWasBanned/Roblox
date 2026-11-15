-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.Helpers.getPlayerFromPart
local v_u_1 = game:GetService("Players")
return function(p2) -- name: getPlayerFromPart
	-- upvalues: (copy) v_u_1
	if not p2 then
		return nil
	end
	for _, v3 in pairs(v_u_1:GetPlayers()) do
		local v4 = v3.Character
		if not (v4 and p2:IsDescendantOf(v4)) then
			continue
		end
		return v3
	end
	return nil
end