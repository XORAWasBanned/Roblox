-- Path: CoreGui.RobloxGui.Modules.PlayerList.TestHelpers.JestSetupDummyInstances
local v1 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
if not v1:FindFirstChild("SendNotificationInfo") then
	local v2 = Instance.new("BindableEvent")
	v2.Name = "SendNotificationInfo"
	v2.Parent = v1
end