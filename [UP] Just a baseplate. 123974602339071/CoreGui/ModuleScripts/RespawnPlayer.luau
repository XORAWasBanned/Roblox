-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Thunks.RespawnPlayer
local v_u_1 = game:GetService("AvatarEditorService")
local v_u_2 = game:GetService("Players")
local v3 = script.Parent.Parent
local v_u_4 = require(v3.Thunks.CloseMenu)
local v_u_5 = require(v3.Actions.SetRespawning)
local v_u_6 = require(v3.Utility.SendAnalytics)
local v_u_7 = require(v3.Resources.Constants)
return function(p8)
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_5, (copy) v_u_4, (copy) v_u_6, (copy) v_u_7
	local v9 = p8:getState()
	if v9.respawn.enabled then
		v_u_1:BustAvatarFetchCache()
		if v9.respawn.customCallback then
			v9.respawn.customCallback:Fire()
		else
			local v10 = v_u_2.LocalPlayer.Character
			if v10 ~= nil then
				local v11 = v10:FindFirstChild("Humanoid")
				if v11 ~= nil and v11:IsA("Humanoid") then
					v11.Health = 0
				end
			end
		end
	end
	p8:dispatch(v_u_5(false))
	p8:dispatch(v_u_4)
	v_u_6(v_u_7.AnalyticsInGameMenuName, v_u_7.AnalyticsRespawnCharacterName, {
		["confirmed"] = v_u_7.AnalyticsConfirmedName
	})
end