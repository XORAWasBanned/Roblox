-- Path: CoreGui.RobloxGui.Modules.Server.ServerSound.SoundDispatcherInstaller
local v_u_1 = game:GetService("ServerScriptService")
local v_u_2 = game:GetService("StarterPlayer")
local v_u_3 = require(script.Parent.Parent.ServerUtil)
local function v_u_8(p4, p5) -- name: LoadScript
	-- upvalues: (copy) v_u_3
	local v6 = script.Parent:WaitForChild(p4)
	local v7 = Instance.new("Script")
	v7.Name = p4
	if v_u_3.getFFlagServerCoreScriptSourceCode() then
		v7.Source = v_u_3.getSourceForServerScript(v6)
	else
		v7.Source = v6.Source
	end
	v7.Parent = p5
	return v7
end
return function() -- name: TryInstall
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_8
	local v9
	if v_u_1:FindFirstChild("SoundDispatcher") then
		v9 = true
	else
		local v10 = v_u_2:FindFirstChildOfClass("StarterCharacterScripts")
		v9 = v10 and v10:FindFirstChild("Sound") and true or false
	end
	if v9 then
		local v11 = v_u_1:FindFirstChild("SoundDispatcher")
		local v12
		if v11 then
			v12 = true
		else
			v11 = v_u_8("SoundDispatcher", v_u_1)
			v12 = false
		end
		if not v_u_1:FindFirstChild("SoundDispatcher") then
			local v13 = v11:Clone()
			v13.Archivable = false
			v13.Parent = v_u_1
		end
		v11.Archivable = v12
	end
end