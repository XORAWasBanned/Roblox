-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Test.getMockModel
return function()
	local v1 = Instance.new("Model")
	local v2 = Instance.new("Part")
	v2.Name = "HumanoidRootPart"
	v2.Parent = v1
	local v3 = Instance.new("Humanoid")
	v3.Name = "Humanoid"
	v3.Parent = v1
	local v4 = Instance.new("HumanoidDescription")
	v4.Name = "HumanoidDescription"
	v4.Parent = v3
	return v1
end