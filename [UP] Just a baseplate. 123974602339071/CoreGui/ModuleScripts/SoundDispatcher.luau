-- Path: CoreGui.RobloxGui.Modules.Server.ServerSound.SoundDispatcher
local v1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = {}
local v4 = v2:FindFirstChild("DefaultSoundEvents")
if not v4 then
	v4 = Instance.new("Folder")
	v4.Name = "DefaultSoundEvents"
	v4.Archivable = false
	v4.Parent = v2
end
local v_u_5 = v4:FindFirstChild("DefaultServerSoundEvent")
if not v_u_5 then
	v_u_5 = Instance.new("RemoteEvent")
	v_u_5.Name = "DefaultServerSoundEvent"
	v_u_5.Parent = v4
end
local v6 = v4:FindFirstChild("AddCharacterLoadedEvent")
if not v6 then
	v6 = Instance.new("RemoteEvent")
	v6.Name = "AddCharacterLoadedEvent"
	v6.Parent = v4
end
local v7 = v4:FindFirstChild("RemoveCharacterEvent")
if not v7 then
	v7 = Instance.new("RemoteEvent")
	v7.Name = "RemoveCharacterEvent"
	v7.Parent = v4
end
local function v12(p8, p9, p10, p11) -- name: fireDefaultServerSoundEventToClient
	-- upvalues: (copy) v_u_3, (copy) v_u_5
	if v_u_3[p8] then
		v_u_5:FireClient(p8, p9, p10, p11)
	end
end
local function v14(p13) -- name: addCharacterLoaded
	-- upvalues: (copy) v_u_3
	v_u_3[p13] = true
end
local function v16(p15) -- name: removeCharacter
	-- upvalues: (copy) v_u_3
	v_u_3[p15] = nil
end
local v17 = v4:FindFirstChild("SoundDispatcher")
if not v17 then
	v17 = Instance.new("BindableEvent")
	v17.Name = "SoundDispatcher"
	v17.Parent = v4
end
v17.Event:Connect(v12)
v_u_5.OnServerEvent:Connect(function() end)
v6.OnServerEvent:Connect(v14)
v7.OnServerEvent:Connect(v16)
v1.PlayerRemoving:Connect(v16)