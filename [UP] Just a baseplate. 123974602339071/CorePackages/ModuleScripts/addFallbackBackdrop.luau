-- Path: CorePackages.Packages._Index.MomentScenes.MomentScenes.Builders.AvatarMoment.addFallbackBackdrop
return function(p1) -- name: addFallbackBackdrop
	local v2 = Instance.new("Part")
	v2.Name = "Floor"
	v2.Anchored = true
	v2.Size = Vector3.new(40, 1, 40)
	v2.Position = Vector3.new(0, -0.5, 0)
	v2.Color = Color3.fromRGB(40, 40, 48)
	v2.Material = Enum.Material.SmoothPlastic
	v2.Parent = p1
	local v3 = Instance.new("Part")
	v3.Name = "SkyDome"
	v3.Anchored = true
	v3.Shape = Enum.PartType.Ball
	v3.Size = Vector3.new(80, 80, 80)
	v3.Position = Vector3.new(0, 10, 0)
	v3.Color = Color3.fromRGB(18, 22, 40)
	v3.Material = Enum.Material.SmoothPlastic
	v3.CastShadow = false
	local v4 = Instance.new("SpecialMesh")
	v4.MeshType = Enum.MeshType.Sphere
	v4.Scale = Vector3.new(-1, -1, -1)
	v4.Parent = v3
	v3.Parent = p1
end