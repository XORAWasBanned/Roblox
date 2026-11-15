-- Path: CoreGui.RobloxGui.Modules.Server.ServerChat.ChatServiceInstaller
local v_u_1 = game:GetService("Chat")
local v_u_2 = game:GetService("ServerScriptService")
local v3 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_4 = require(v3.Modules.Server.ServerUtil)
local v_u_5 = require(v3.Modules.Server.SendChatAnalytics)
local function v_u_10(p6, p7) -- name: LoadScript
	-- upvalues: (copy) v_u_4
	local v8 = script.Parent:WaitForChild(p6)
	local v9 = Instance.new("Script")
	v9.Name = p6
	if v_u_4.getFFlagServerCoreScriptSourceCode() then
		v9.Source = v_u_4.getSourceForServerScript(v8)
	else
		v9.Source = v8.Source
	end
	v9.Parent = p7
	return v9
end
local function v_u_13(p11) -- name: makeDefaultLocalizationTable
	local v12 = Instance.new("LocalizationTable")
	v12.Name = "ChatLocalization"
	v12.Archivable = false
	v12.SourceLocaleId = "en-us"
	v12:SetEntries(require(script.Parent:WaitForChild("DefaultChatLocalization")))
	v12:SetIsExemptFromUGCAnalytics(true)
	v12.Parent = p11
end
return function() -- name: Install
	-- upvalues: (copy) v_u_1, (copy) v_u_13, (copy) v_u_10, (copy) v_u_4, (copy) v_u_2, (copy) v_u_5
	local v14 = {}
	local v15 = v_u_1:FindFirstChild("ChatLocalization")
	if v15 then
		if v15:IsA("LocalizationTable") then
			v15:SetIsExemptFromUGCAnalytics(true)
		end
	else
		v_u_13(v_u_1)
	end
	local v16 = true
	local v17 = v_u_1:FindFirstChild("ChatServiceRunner")
	if v17 then
		v14.ChatServiceRunner = "True"
	else
		v16 = false
		v17 = v_u_10("ChatServiceRunner", v_u_1)
		local v18 = script.Parent:WaitForChild("ChatService")
		local v19 = Instance.new("ModuleScript")
		v19.Name = "ChatService"
		if v_u_4.getFFlagServerCoreScriptSourceCode() then
			v19.Source = v_u_4.getSourceForServerScript(v18)
		else
			v19.Source = v18.Source
		end
		v19.Parent = v17
		local v20 = script.Parent:WaitForChild("ChatChannel")
		local v21 = Instance.new("ModuleScript")
		v21.Name = "ChatChannel"
		if v_u_4.getFFlagServerCoreScriptSourceCode() then
			v21.Source = v_u_4.getSourceForServerScript(v20)
		else
			v21.Source = v20.Source
		end
		v21.Parent = v17
		local v22 = script.Parent:WaitForChild("Speaker")
		local v23 = Instance.new("ModuleScript")
		v23.Name = "Speaker"
		if v_u_4.getFFlagServerCoreScriptSourceCode() then
			v23.Source = v_u_4.getSourceForServerScript(v22)
		else
			v23.Source = v22.Source
		end
		v23.Parent = v17
		local v24 = script.Parent:WaitForChild("Util")
		local v25 = Instance.new("ModuleScript")
		v25.Name = "Util"
		if v_u_4.getFFlagServerCoreScriptSourceCode() then
			v25.Source = v_u_4.getSourceForServerScript(v24)
		else
			v25.Source = v24.Source
		end
		v25.Parent = v17
	end
	local v26 = v_u_1:FindFirstChild("ChatModules")
	if not v26 then
		v26 = Instance.new("Folder")
		v26.Name = "ChatModules"
		v26.Archivable = false
		local v27 = Instance.new("BoolValue")
		v27.Name = "InsertDefaultModules"
		v27.Value = true
		v27.Parent = v26
		v26.Parent = v_u_1
	end
	assert(v26, "")
	local v28 = v26:FindFirstChild("InsertDefaultModules")
	local v29
	if v28 and v28:IsA("BoolValue") then
		v29 = v28.Value
	else
		v29 = false
	end
	if v29 then
		if not v26:FindFirstChild("Utility") then
			local v30 = Instance.new("Folder")
			v30.Name = "Utility"
			v30.Parent = v26
		end
		local v31 = script.Parent.DefaultChatModules:GetChildren()
		for v32 = 1, #v31 do
			if v31.className == "Folder" or v26:FindFirstChild(v31[v32].Name) then
				if v31.className == "Folder" then
					continue
				end
				v14[v31[v32].Name] = "True"
			else
				local v33 = script.Parent.DefaultChatModules
				local v34 = v31[v32].Name
				local v35 = v33:WaitForChild(v34)
				local v36 = Instance.new("ModuleScript")
				v36.Name = v34
				if v_u_4.getFFlagServerCoreScriptSourceCode() then
					v36.Source = v_u_4.getSourceForServerScript(v35)
				else
					v36.Source = v35.Source
				end
				v36.Parent = v26
			end
		end
		for _, v37 in pairs(script.Parent.DefaultChatModules.Utility:GetChildren()) do
			if v26.Utility:FindFirstChild(v37.Name) then
				v14[v37.Name] = "True"
			else
				local v38 = script.Parent.DefaultChatModules.Utility
				local v39 = v37.Name
				local v40 = v26.Utility
				local v41 = v38:WaitForChild(v39)
				local v42 = Instance.new("ModuleScript")
				v42.Name = v39
				if v_u_4.getFFlagServerCoreScriptSourceCode() then
					v42.Source = v_u_4.getSourceForServerScript(v41)
				else
					v42.Source = v41.Source
				end
				v42.Parent = v40
			end
		end
	end
	if not v_u_2:FindFirstChild("ChatServiceRunner") then
		local v43 = v17:Clone()
		v43.Archivable = false
		v43.Parent = v_u_2
	end
	v17.Archivable = v16
	v_u_5("LoadServerDefaultChatForkedModules", v14)
end