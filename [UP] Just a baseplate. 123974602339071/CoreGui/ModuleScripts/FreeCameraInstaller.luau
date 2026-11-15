-- Path: CoreGui.RobloxGui.Modules.Server.FreeCamera.FreeCameraInstaller
local v_u_1 = game:DefineFastFlag("AllowLuobuFreecamGroup", false)
local v_u_2 = game:DefineFastFlag("FreeCameraToIAS", false)
if v_u_2 then
	v_u_2 = game:GetEngineFeature("PlayerScriptStatusProperty")
end
local v_u_3 = { 4358041 }
local v_u_4 = { 7842878 }
local v_u_5 = game:GetService("Players")
local v_u_6 = game:GetService("PolicyService")
local v_u_7 = game:GetService("RunService")
local v_u_8 = game:GetService("StarterPlayer")
local v9 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_10 = require(v9.Modules.Server.ServerUtil)
return function() -- name: Install
	-- upvalues: (copy) v_u_2, (copy) v_u_8, (copy) v_u_10, (copy) v_u_7, (copy) v_u_3, (copy) v_u_1, (copy) v_u_6, (copy) v_u_4, (copy) v_u_5
	local function v_u_14(p11, p12) -- name: WaitForChildOfClass
		local v13 = p11:FindFirstChildOfClass(p12)
		while not v13 or v13.ClassName ~= p12 do
			v13 = p11.ChildAdded:Wait()
		end
		return v13
	end
	local function v_u_22(p15) -- name: AddFreeCamera
		-- upvalues: (copy) v_u_14, (ref) v_u_2, (ref) v_u_8, (ref) v_u_10
		local v16 = v_u_14(p15, "PlayerGui")
		local v17
		if v_u_2 then
			local v18 = v_u_8.PlayerModuleStatus
			local v19 = (v18 == 1 and true or v18 == 2) and "FreeCameraIAS" or "FreeCamera"
			v17 = script.Parent:WaitForChild(v19)
		else
			v17 = script.Parent:WaitForChild("FreeCamera")
		end
		local v20 = Instance.new("ScreenGui")
		v20.Name = "Freecam"
		v20.ResetOnSpawn = false
		local v21 = Instance.new("LocalScript")
		v21.Name = "FreecamScript"
		if v_u_10.getFFlagServerCoreScriptSourceCode() then
			v21.Source = v_u_10.getSourceForServerScript(v17)
		else
			v21.Source = v17.Source
		end
		v21.Parent = v20
		v20.Parent = v16
	end
	local function v_u_35(p23) -- name: ShouldAddFreeCam
		-- upvalues: (ref) v_u_7, (ref) v_u_3, (ref) v_u_1, (ref) v_u_6, (ref) v_u_4
		if v_u_7:IsStudio() then
			return true
		end
		if p23.UserId <= 0 then
			return false
		end
		local v24 = p23.GetCanManageAsync
		local v25, v26 = pcall(v24, p23)
		if v25 and v26 then
			return true
		end
		for _, v27 in ipairs(v_u_3) do
			local v28 = p23.IsInGroup
			local v29, v30 = pcall(v28, p23, v27)
			if not (v29 and v30) then
				continue
			end
			return true
		end
		if v_u_1 and (game:GetEngineFeature("LuobuModerationStatus") and v_u_6.IsLuobuServer == Enum.TriStateBoolean.True) then
			for _, v31 in ipairs(v_u_4) do
				local v32 = p23.IsInGroup
				local v33, v34 = pcall(v32, p23, v31)
				if not (v33 and v34) then
					continue
				end
				return true
			end
		end
		return false
	end
	local function v37(p36) -- name: PlayerAdded
		-- upvalues: (copy) v_u_35, (copy) v_u_22
		if v_u_35(p36) then
			v_u_22(p36)
		end
	end
	v_u_5.PlayerAdded:Connect(v37)
	for _, v38 in ipairs(v_u_5:GetPlayers()) do
		coroutine.wrap(v37)(v38)
	end
end