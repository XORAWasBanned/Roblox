-- Path: CoreGui.RobloxGui.Modules.Server.ServerPlayer.ServerPlayerInstaller
local v1 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_2 = require(v1.Modules.Server.ServerUtil)
return function()
	-- upvalues: (copy) v_u_2
	if game:GetService("StarterPlayer"):FindFirstChild("PlayerSettings") == nil then
		local v3 = Instance.new("ModuleScript")
		v3.Name = "PlayerSettings"
		if v_u_2.getFFlagServerCoreScriptSourceCode() then
			v3.Source = v_u_2.getSourceForServerScript(script.Parent.DefaultServerPlayerModules:WaitForChild("PlayerSettings"))
		else
			v3.Source = script.Parent.DefaultServerPlayerModules:WaitForChild("PlayerSettings").Source
		end
		v3.Parent = game:GetService("StarterPlayer")
		v3.Archivable = false
	end
end