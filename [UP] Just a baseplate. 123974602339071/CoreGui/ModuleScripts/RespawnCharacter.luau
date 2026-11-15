-- Path: CoreGui.RobloxGui.Modules.TopBar.Thunks.RespawnCharacter
local v_u_1 = game:GetService("AvatarEditorService")
local v_u_2 = game:GetService("Players")
local v3 = script.Parent.Parent
return not require(v3.Flags.FFlagTopBarDeprecateRespawnRodux) and function(p4)
	-- upvalues: (copy) v_u_1, (copy) v_u_2
	local v5 = p4:getState()
	v_u_1:BustAvatarFetchCache()
	if v5.respawn.customCallback then
		v5.respawn.customCallback:Fire()
	else
		local v6 = v_u_2.LocalPlayer.Character
		if v6 ~= nil then
			local v7 = v6:FindFirstChild("Humanoid")
			if v7 ~= nil and v7:IsA("Humanoid") then
				v7.Health = 0
			end
		end
	end
end or nil