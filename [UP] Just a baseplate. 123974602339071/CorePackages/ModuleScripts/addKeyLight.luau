-- Path: CorePackages.Packages._Index.MomentScenes.MomentScenes.Builders.AvatarMoment.addKeyLight
return function(p1) -- name: addKeyLight
	local v2 = Instance.new("Part")
	v2.Name = "KeyLight"
	v2.Anchored = true
	v2.Transparency = 1
	v2.CanCollide = false
	v2.Size = Vector3.new(1, 1, 1)
	v2.Position = Vector3.new(-4, 8, 6)
	v2.Parent = p1
	local v3 = Instance.new("PointLight")
	v3.Brightness = 0.7
	v3.Range = 16
	v3.Color = Color3.fromRGB(255, 244, 220)
	v3.Parent = v2
end