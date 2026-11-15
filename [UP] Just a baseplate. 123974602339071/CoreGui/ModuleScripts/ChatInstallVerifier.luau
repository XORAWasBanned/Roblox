-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.ChatInstallVerifier
local v1 = game:GetService("Players")
local v2 = game:GetService("StarterPlayer")
local function v6(p3, p4) -- name: waitForChildOfClass
	local v5 = p3:FindFirstChildOfClass(p4)
	while not v5 or v5.ClassName ~= p4 do
		v5 = p3.ChildAdded:Wait()
	end
	return v5
end
local v_u_7 = v6(v1.LocalPlayer, "PlayerScripts")
local v_u_8 = v6(v2, "StarterPlayerScripts")
function VerifyScriptExistence() -- name: VerifyScriptExistence
	-- upvalues: (copy) v_u_7, (copy) v_u_8
	local v9 = script:WaitForChild("ScriptToVerify").Value
	local v10 = not v_u_7:FindFirstChild(v9) and v_u_8:FindFirstChild(v9)
	if v10 then
		local v11 = v10.Archivable
		v10.Archivable = true
		v10:Clone().Parent = v_u_7
		v10.Archivable = v11
	end
end
VerifyScriptExistence()
script:Destroy()