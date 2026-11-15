-- Path: CoreGui.RobloxGui.Modules.TopBar.TestHelpers.JestSetupDummyInstances
local v1 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
if not v1:FindFirstChild("Sounds") then
	local v2 = Instance.new("Folder")
	v2.Name = "Sounds"
	v2.Parent = v1
end