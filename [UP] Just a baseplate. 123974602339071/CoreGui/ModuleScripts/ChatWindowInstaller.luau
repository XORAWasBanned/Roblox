-- Path: CoreGui.RobloxGui.Modules.Server.ClientChat.ChatWindowInstaller
local v_u_1 = game:GetService("Chat")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("StarterPlayer"):WaitForChild("StarterPlayerScripts")
local v4 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_5 = require(v4.Modules.Server.ServerUtil)
local v_u_6 = require(v4.Modules.Server.SendChatAnalytics)
local v_u_7 = game:DefineFastFlag("ChatWindowInstallerCheckClassName", false)
local v8, v9 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2")
end)
local v_u_10 = v8 and v9
local function v_u_16(p11, p12, p13) -- name: LoadLocalScript
	-- upvalues: (copy) v_u_7, (copy) v_u_5
	local v14 = p11:WaitForChild(p12)
	if v_u_7 and v14.ClassName ~= "ModuleScript" then
		return v14:Clone()
	end
	local v15 = Instance.new("LocalScript")
	v15.Name = p12
	if v_u_5.getFFlagServerCoreScriptSourceCode() then
		v15.Source = v_u_5.getSourceForServerScript(v14)
	else
		v15.Source = v14.Source
	end
	v15.Parent = p13
	return v15
end
local function v_u_22(p17, p18, p19) -- name: LoadModule
	-- upvalues: (copy) v_u_7, (copy) v_u_5
	local v20 = p17:WaitForChild(p18)
	if v_u_7 and v20.ClassName ~= "ModuleScript" then
		return v20:Clone()
	end
	local v21 = Instance.new("ModuleScript")
	v21.Name = p18
	if v_u_5.getFFlagServerCoreScriptSourceCode() then
		v21.Source = v_u_5.getSourceForServerScript(v20)
	else
		v21.Source = v20.Source
	end
	v21.Parent = p19
	return v21
end
return function() -- name: Install
	-- upvalues: (copy) v_u_1, (copy) v_u_16, (copy) v_u_22, (ref) v_u_10, (copy) v_u_3, (copy) v_u_2, (copy) v_u_6
	local v23 = {}
	local v24 = true
	local v25 = v_u_1:FindFirstChild("ChatScript")
	if v25 then
		v23.ChatScript = "True"
	else
		v24 = false
		v25 = v_u_16(script.Parent, "ChatScript", v_u_1)
		local v26 = v_u_22(script.Parent, "ChatMain", v25)
		v_u_22(script.Parent, "ChannelsBar", v26)
		v_u_22(script.Parent, "ChatBar", v26)
		v_u_22(script.Parent, "ChatChannel", v26)
		v_u_22(script.Parent, "MessageLogDisplay", v26)
		v_u_22(script.Parent, "ChatWindow", v26)
		v_u_22(script.Parent, "MessageLabelCreator", v26)
		v_u_22(script.Parent, "CommandProcessor", v26)
		v_u_22(script.Parent, "ChannelsTab", v26)
		v_u_22(script.Parent.Parent.Parent.Common, "ObjectPool", v26)
		v_u_22(script.Parent, "MessageSender", v26)
		v_u_22(script.Parent, "CurveUtil", v26)
		if v_u_10 then
			local v27 = Instance.new("BoolValue")
			v27.Name = "ChatTranslationEnabled"
			v27.Value = false
			v27.Parent = v26
		end
	end
	local v28 = true
	local v29 = v_u_1:FindFirstChild("BubbleChat")
	if v29 then
		v23.BubbleChat = "True"
	else
		v29 = v_u_16(script.Parent.BubbleChat, "BubbleChat", v_u_1)
		v28 = false
	end
	local v30 = v_u_1:FindFirstChild("ClientChatModules")
	if v30 then
		v23.ClientChatModules = "True"
	else
		v30 = Instance.new("Folder")
		v30.Name = "ClientChatModules"
		v30.Archivable = false
		v30.Parent = v_u_1
	end
	if v30:FindFirstChild("ChatSettings") then
		v23.ChatSettings = "True"
	else
		v_u_22(script.Parent.DefaultClientChatModules, "ChatSettings", v30)
	end
	if v30:FindFirstChild("ChatConstants") then
		v23.ChatConstants = "True"
	else
		v_u_22(script.Parent.DefaultClientChatModules, "ChatConstants", v30)
	end
	if v30:FindFirstChild("ChatLocalization") then
		v23.ChatLocalization = "True"
	else
		v_u_22(script.Parent.DefaultClientChatModules, "ChatLocalization", v30)
	end
	local v31 = v30:FindFirstChild("MessageCreatorModules")
	if not v31 then
		v31 = Instance.new("Folder")
		v31.Name = "MessageCreatorModules"
		v31.Archivable = false
		local v32 = Instance.new("BoolValue")
		v32.Name = "InsertDefaultModules"
		v32.Value = true
		v32.Parent = v31
		v31.Parent = v30
	end
	local v33 = v31:FindFirstChild("InsertDefaultModules")
	local v34
	if v33 and v33:IsA("BoolValue") then
		v34 = v33.Value
	else
		v34 = false
	end
	if v34 then
		local v35 = script.Parent.DefaultClientChatModules.MessageCreatorModules:GetChildren()
		for v36 = 1, #v35 do
			if v31:FindFirstChild(v35[v36].Name) then
				v23[v35[v36].Name] = "True"
			else
				v_u_22(script.Parent.DefaultClientChatModules.MessageCreatorModules, v35[v36].Name, v31)
			end
		end
	end
	local v37 = v30:FindFirstChild("CommandModules")
	if not v37 then
		v37 = Instance.new("Folder")
		v37.Name = "CommandModules"
		v37.Archivable = false
		local v38 = Instance.new("BoolValue")
		v38.Name = "InsertDefaultModules"
		v38.Value = true
		v38.Parent = v37
		v37.Parent = v30
	end
	local v39 = v37:FindFirstChild("InsertDefaultModules")
	local v40
	if v39 and v39:IsA("BoolValue") then
		v40 = v39.Value
	else
		v40 = false
	end
	if v40 then
		local v41 = script.Parent.DefaultClientChatModules.CommandModules:GetChildren()
		for v42 = 1, #v41 do
			if v37:FindFirstChild(v41[v42].Name) then
				v23[v41[v42].Name] = "True"
			else
				v_u_22(script.Parent.DefaultClientChatModules.CommandModules, v41[v42].Name, v37)
			end
		end
	end
	if not v_u_3:FindFirstChild("ChatScript") then
		local v43 = v25:Clone()
		v43.Parent = v_u_3
		v43.Archivable = false
		local v44 = v_u_2:GetPlayers()
		for _, v45 in pairs(v44) do
			if not v45:FindFirstChildOfClass("PlayerGui") then
				continue
			end
			local v46 = v_u_16(script.Parent, "ChatInstallVerifier", v45.PlayerGui)
			local v47 = Instance.new("StringValue")
			v47.Name = "ScriptToVerify"
			v47.Value = "ChatScript"
			v47.Parent = v46
		end
	end
	v25.Archivable = v24
	if not v_u_3:FindFirstChild("BubbleChat") then
		local v48 = v29:Clone()
		v48.Parent = v_u_3
		v48.Archivable = false
		local v49 = v_u_2:GetPlayers()
		for _, v50 in pairs(v49) do
			if not v50:FindFirstChildOfClass("PlayerGui") then
				continue
			end
			local v51 = v_u_16(script.Parent, "ChatInstallVerifier", v50.PlayerGui)
			local v52 = Instance.new("StringValue")
			v52.Name = "ScriptToVerify"
			v52.Value = "BubbleChat"
			v52.Parent = v51
		end
	end
	v29.Archivable = v28
	v_u_6("LoadClientDefaultChatForkedModules", v23)
end