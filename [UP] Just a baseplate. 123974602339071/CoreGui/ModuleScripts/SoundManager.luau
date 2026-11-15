-- Path: CoreGui.RobloxGui.Modules.Shell.SoundManager
local v_u_1 = game:GetService("GuiService")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("CoreGui")
local v4 = v_u_3:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell")
local v_u_5 = require(v4:FindFirstChild("Utility"))
local v_u_6 = {
	["BackgroundLoop"] = "RobloxMusic.ogg",
	["Error"] = "Error.mp3",
	["ButtonPress"] = "ButtonPress.mp3",
	["MoveSelection"] = "MoveSelection.mp3",
	["OverlayOpen"] = "OverlayOpen.mp3",
	["PopUp"] = "PopUp.mp3",
	["PurchaseSuccess"] = "PurchaseSuccess.mp3",
	["ScreenChange"] = "ScreenChange.mp3",
	["SideMenuSlideIn"] = "SideMenuSlideIn.mp3"
}
local v_u_7 = {}
local function v_u_8() -- name: IsGameRunning
	-- upvalues: (copy) v_u_2
	return (not UserSettings().GameSettings:InStudioMode() or game:GetService("UserInputService"):GetPlatform() == Enum.Platform.Windows) and true or v_u_2:IsRunning()
end
function GetSoundManager()
	-- upvalues: (copy) v_u_7, (copy) v_u_6, (copy) v_u_8, (copy) v_u_5, (copy) v_u_3, (copy) v_u_1
	local v_u_9 = {
		["SoundHolder"] = nil
	}
	local v_u_10 = {}
	function v_u_9.CreateSound(_, p11) -- name: CreateSound
		-- upvalues: (ref) v_u_6
		local v12 = "rbxasset://sounds/ui/Shell/" .. v_u_6[p11]
		local v13 = Instance.new("Sound")
		v13.Name = p11
		v13.SoundId = v12
		return v13
	end
	function v_u_9.Play(_, p_u_14, p15, p16, p17, ...) -- name: Play
		-- upvalues: (ref) v_u_6, (ref) v_u_7, (copy) v_u_10, (ref) v_u_8
		local v18 = nil
		if v_u_6[p_u_14] then
			local v19 = v_u_7[p_u_14] and table.remove(v_u_7[p_u_14], 1)
			if v19 then
				local v20 = v_u_7[p_u_14]
				table.insert(v20, v19)
			else
				v19 = nil
			end
			if v19 then
				v19.Volume = p15 or 1
				v19.Looped = p16 or false
				v19.Pitch = p17 or 1
				v19:Play(...)
				v_u_10[v19] = v19.Volume
				if not v_u_8() then
					v19.Volume = 0
				end
				return v19
			end
		else
			spawn(function()
				-- upvalues: (copy) p_u_14
				local v21 = p_u_14
				error("Unable to find sound: " .. tostring(v21))
			end)
		end
		return v18
	end
	function v_u_9.IsPlaying(_, p22) -- name: IsPlaying
		-- upvalues: (copy) v_u_9
		local v23 = v_u_9.SoundHolder:FindFirstChild(p22)
		if v23 then
			return v23.IsPlaying
		else
			return false
		end
	end
	function v_u_9.Stop(_, p24, ...) -- name: Stop
		-- upvalues: (copy) v_u_9, (ref) v_u_6
		local v25 = v_u_9.SoundHolder and (v_u_6[p24] and v_u_9.SoundHolder:FindFirstChild(p24))
		if v25 then
			v25:Stop()
		end
	end
	function v_u_9.TweenSound(_, p_u_26, p_u_27, p28) -- name: TweenSound
		-- upvalues: (copy) v_u_10, (ref) v_u_5, (ref) v_u_8
		v_u_10[p_u_26] = nil
		v_u_5.PropertyTweener(p_u_26, "Volume", p_u_26.Volume, p_u_27, p28, function(...)
			-- upvalues: (ref) v_u_8, (ref) v_u_5
			return v_u_8() and v_u_5.EaseInOutQuad(...) or 0
		end, true, function()
			-- upvalues: (ref) v_u_10, (copy) p_u_26, (copy) p_u_27
			v_u_10[p_u_26] = p_u_27
		end)
	end
	(function() -- name: Initialize
		-- upvalues: (ref) v_u_3, (copy) v_u_9, (ref) v_u_6, (ref) v_u_7, (ref) v_u_1, (ref) v_u_8, (copy) v_u_10
		local v29 = Instance.new("Folder")
		v29.Name = "AppShellSounds"
		v29.Parent = v_u_3
		v_u_9.SoundHolder = v29
		for v30, _ in pairs(v_u_6) do
			local v31 = Instance.new("Folder")
			v31.Name = v30
			v31.Parent = v_u_9.SoundHolder
			v_u_7[v30] = {}
			local v32 = v_u_9:CreateSound(v30)
			v32.Parent = v31
			local v33 = v_u_7[v30]
			table.insert(v33, v32)
			local v34 = v_u_9:CreateSound(v30)
			v34.Parent = v31
			local v35 = v_u_7[v30]
			table.insert(v35, v34)
			local v36 = v_u_9:CreateSound(v30)
			v36.Parent = v31
			local v37 = v_u_7[v30]
			table.insert(v37, v36)
		end
		local v_u_38 = nil
		v_u_1:GetPropertyChangedSignal("SelectedCoreObject"):connect(function()
			-- upvalues: (ref) v_u_1, (ref) v_u_38
			local v39 = v_u_1.SelectedCoreObject
			if v39 and v_u_38 then
				local v40 = v39:FindFirstChild("MoveSelection")
				if v40 and v40:IsA("Sound") then
					v40.Volume = 0.35
					v40:Play()
				end
			end
			v_u_38 = v39
		end)
		if not v_u_8() then
			spawn(function()
				-- upvalues: (ref) v_u_8, (ref) v_u_10
				while not v_u_8() do
					wait(0.1)
				end
				for v41, v42 in pairs(v_u_10) do
					v41.Volume = v42
				end
			end)
		end
	end)()
	return v_u_9
end
return GetSoundManager()