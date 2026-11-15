-- Path: CoreGui.RobloxGui.Modules.CoreScriptsRhodiumTest.TestHelpers.JestSetupDummyInstances
local v1 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v2 = game:GetService("RobloxReplicatedStorage")
if not v1:FindFirstChild("SendNotificationInfo") then
	local v3 = Instance.new("BindableEvent")
	v3.Name = "SendNotificationInfo"
	v3.Parent = v1
end
if not v1:FindFirstChild("Sounds") then
	local v4 = Instance.new("Folder")
	v4.Name = "Sounds"
	v4.Parent = v1
end
if not v2:FindFirstChild("NewPlayerGroupDetails") then
	local v5 = Instance.new("RemoteEvent")
	v5.Name = "NewPlayerGroupDetails"
	v5.Parent = v2
end
if not v2:FindFirstChild("UpdatePlayerBlockList") then
	local v6 = Instance.new("RemoteEvent")
	v6.Name = "UpdatePlayerBlockList"
	v6.Parent = v2
end
if not v2:FindFirstChild("NewPlayerCanManageDetails") then
	local v7 = Instance.new("RemoteEvent")
	v7.Name = "NewPlayerCanManageDetails"
	v7.Parent = v2
end