-- Path: CoreGui.RobloxGui.Modules.TopBar.Thunks.GetCanChat
local v_u_1 = game:GetService("Chat")
local v_u_2 = game:GetService("RunService")
local v3 = game:GetService("Players")
local v4 = game:GetService("CoreGui")
local v5 = script.Parent.Parent
local v_u_6 = require(v5.Actions.SetCanChat)
if require(v5.Flags.FFlagTopBarDeprecateChatRodux) then
	return nil
end
local v7 = v4:WaitForChild("RobloxGui")
local v_u_8 = require(v7.Modules.ChatSelector)
local v_u_9 = v3.LocalPlayer
while not v_u_9 do
	v3:GetPropertyChangedSignal("LocalPlayer"):Wait()
	v_u_9 = v3.LocalPlayer
end
return function(p_u_10)
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (ref) v_u_9, (copy) v_u_6, (copy) v_u_8
	coroutine.wrap(function()
		-- upvalues: (ref) v_u_2, (ref) v_u_1, (ref) v_u_9, (copy) p_u_10, (ref) v_u_6, (ref) v_u_8
		local v11
		if v_u_2:IsStudio() then
			v11 = true
		else
			local function v12()
				-- upvalues: (ref) v_u_1, (ref) v_u_9
				return v_u_1:CanUserChatAsync(v_u_9.UserId)
			end
			local v13, v14 = pcall(v12)
			v11 = v13 and v14
		end
		p_u_10:dispatch(v_u_6(v11))
		if not v11 then
			v_u_8:SetVisible(false)
		end
	end)()
end