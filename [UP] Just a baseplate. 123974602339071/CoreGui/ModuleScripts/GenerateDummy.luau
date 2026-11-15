-- Path: CoreGui.RobloxGui.Modules.FTUX.Utility.GenerateDummy
local v_u_1 = {}
local v_u_2 = {}
local v_u_3 = {
	["ID"] = 0,
	["Type"] = "Model",
	["Properties"] = nil,
	["Children"] = nil,
	["Properties"] = {
		["Name"] = "Safety Bubble Dummy",
		["PrimaryPart"] = "_R:1_"
	}
}
local v4 = {}
local v5 = {
	["ID"] = 1,
	["Type"] = "Part",
	["Properties"] = nil,
	["Children"] = nil,
	["Properties"] = {
		["Transparency"] = 0.5,
		["Name"] = "HumanoidRootPart",
		["Size"] = Vector3.new(2, 2, 1),
		["Anchored"] = true,
		["BottomSurface"] = nil,
		["TopSurface"] = nil,
		["BottomSurface"] = Enum.SurfaceType.Smooth,
		["TopSurface"] = Enum.SurfaceType.Smooth
	}
}
local v6 = {}
local v7 = {
	["ID"] = 2,
	["Type"] = "Motor6D",
	["Properties"] = nil,
	["Children"] = nil,
	["Properties"] = {
		["Part1"] = "_R:3_",
		["Name"] = "Root Hip",
		["C1"] = nil,
		["C0"] = nil,
		["Part0"] = "_R:1_",
		["MaxVelocity"] = 0.10000000149011612,
		["C1"] = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
		["C0"] = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
	},
	["Children"] = {}
}
__set_list(v6, 1, {v7})
v5.Children = v6
local v8 = {
	["ID"] = 3,
	["Type"] = "Part",
	["Properties"] = nil,
	["Children"] = nil,
	["Properties"] = {
		["Size"] = Vector3.new(2, 2, 1),
		["BottomSurface"] = nil,
		["Name"] = "Torso",
		["TopSurface"] = nil,
		["BottomSurface"] = Enum.SurfaceType.Smooth,
		["TopSurface"] = Enum.SurfaceType.Smooth
	}
}
local v9 = {}
local v10 = {
	["ID"] = 4,
	["Type"] = "Motor6D",
	["Properties"] = nil,
	["Children"] = nil,
	["Properties"] = {
		["Part1"] = "_R:9_",
		["Name"] = "Left Hip",
		["C1"] = nil,
		["C0"] = nil,
		["Part0"] = "_R:3_",
		["MaxVelocity"] = 0.10000000149011612,
		["C1"] = CFrame.new(-0.5, 1, 0, -4.371138828673793e-8, 0, -1, 0, 0.9999999403953552, 0, 1, 0, -4.371138828673793e-8),
		["C0"] = CFrame.new(-1, -1, 0, -4.371138828673793e-8, 0, -1, 0, 0.9999999403953552, 0, 1, 0, -4.371138828673793e-8)
	},
	["Children"] = {}
}
local v11 = {
	["ID"] = 5,
	["Type"] = "Motor6D",
	["Properties"] = nil,
	["Children"] = nil,
	["Properties"] = {
		["Part1"] = "_R:10_",
		["Name"] = "Right Hip",
		["C1"] = nil,
		["C0"] = nil,
		["Part0"] = "_R:3_",
		["MaxVelocity"] = 0.10000000149011612,
		["C1"] = CFrame.new(0.5, 1, 0, -4.371138828673793e-8, 0, 1, 0, 0.9999999403953552, 0, -1, 0, -4.371138828673793e-8),
		["C0"] = CFrame.new(1, -1, 0, -4.371138828673793e-8, 0, 1, -0, 0.9999999403953552, 0, -1, 0, -4.371138828673793e-8)
	},
	["Children"] = {}
}
local v12 = {
	["ID"] = 6,
	["Type"] = "Motor6D",
	["Properties"] = nil,
	["Children"] = nil,
	["Properties"] = {
		["Part1"] = "_R:11_",
		["Name"] = "Left Shoulder",
		["C1"] = nil,
		["C0"] = nil,
		["Part0"] = "_R:3_",
		["MaxVelocity"] = 0.10000000149011612,
		["C1"] = CFrame.new(0.5, 0.5, 0, -4.371138828673793e-8, 0, -1, 0, 0.9999999403953552, 0, 1, 0, -4.371138828673793e-8),
		["C0"] = CFrame.new(-1, 0.5, 0, -4.371138828673793e-8, 0, -1, 0, 0.9999999403953552, 0, 1, 0, -4.371138828673793e-8)
	},
	["Children"] = {}
}
local v13 = {
	["ID"] = 7,
	["Type"] = "Motor6D",
	["Properties"] = nil,
	["Children"] = nil,
	["Properties"] = {
		["Part1"] = "_R:12_",
		["Name"] = "Right Shoulder",
		["C1"] = nil,
		["C0"] = nil,
		["Part0"] = "_R:3_",
		["MaxVelocity"] = 0.10000000149011612,
		["C1"] = CFrame.new(-0.5, 0.5, 0, -4.371138828673793e-8, 0, 1, 0, 0.9999999403953552, 0, -1, 0, -4.371138828673793e-8),
		["C0"] = CFrame.new(1, 0.5, 0, -4.371138828673793e-8, 0, 1, -0, 0.9999999403953552, 0, -1, 0, -4.371138828673793e-8)
	},
	["Children"] = {}
}
local v14 = {
	["ID"] = 8,
	["Type"] = "Motor6D",
	["Properties"] = nil,
	["Children"] = nil,
	["Properties"] = {
		["Part1"] = "_R:13_",
		["Name"] = "Neck",
		["C1"] = nil,
		["C0"] = nil,
		["Part0"] = "_R:3_",
		["MaxVelocity"] = 0.10000000149011612,
		["C1"] = CFrame.new(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
		["C0"] = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
	},
	["Children"] = {}
}
__set_list(v9, 1, {v10, v11, v12, v13, v14})
v8.Children = v9
local v15 = {
	["ID"] = 9,
	["Type"] = "Part",
	["Properties"] = nil,
	["Children"] = nil,
	["Properties"] = {
		["Size"] = Vector3.new(1, 2, 1),
		["Name"] = "Left Leg",
		["CanCollide"] = false,
		["BottomSurface"] = nil,
		["CFrame"] = nil,
		["Position"] = Vector3.new(-0.5, -1.9999999, 0),
		["TopSurface"] = nil,
		["BottomSurface"] = Enum.SurfaceType.Smooth,
		["CFrame"] = CFrame.new(-0.5, -1.9999998807907104, 0, 1, 0, 0, 0, 0.9999998807907104, 0, 0, 0, 1),
		["TopSurface"] = Enum.SurfaceType.Smooth
	},
	["Children"] = {}
}
local v16 = {
	["ID"] = 10,
	["Type"] = "Part",
	["Properties"] = nil,
	["Children"] = nil,
	["Properties"] = {
		["Size"] = Vector3.new(1, 2, 1),
		["Name"] = "Right Leg",
		["CanCollide"] = false,
		["BottomSurface"] = nil,
		["CFrame"] = nil,
		["Position"] = Vector3.new(0.5, -1.9999999, 0),
		["TopSurface"] = nil,
		["BottomSurface"] = Enum.SurfaceType.Smooth,
		["CFrame"] = CFrame.new(0.5, -1.9999998807907104, 0, 1, 0, 0, 0, 0.9999998807907104, 0, 0, 0, 1),
		["TopSurface"] = Enum.SurfaceType.Smooth
	},
	["Children"] = {}
}
local v17 = {
	["ID"] = 11,
	["Type"] = "Part",
	["Properties"] = nil,
	["Children"] = nil,
	["Properties"] = {
		["Size"] = Vector3.new(1, 2, 1),
		["Name"] = "Left Arm",
		["CanCollide"] = false,
		["BottomSurface"] = nil,
		["CFrame"] = nil,
		["Position"] = Vector3.new(-1.5, 0.000000059604645, 0),
		["TopSurface"] = nil,
		["BottomSurface"] = Enum.SurfaceType.Smooth,
		["CFrame"] = CFrame.new(-1.5, 5.960464477539063e-8, 0, 1, 0, 0, 0, 0.9999998807907104, 0, 0, 0, 1),
		["TopSurface"] = Enum.SurfaceType.Smooth
	},
	["Children"] = {}
}
local v18 = {
	["ID"] = 12,
	["Type"] = "Part",
	["Properties"] = nil,
	["Children"] = nil,
	["Properties"] = {
		["Size"] = Vector3.new(1, 2, 1),
		["Name"] = "Right Arm",
		["CanCollide"] = false,
		["BottomSurface"] = nil,
		["CFrame"] = nil,
		["Position"] = Vector3.new(1.5, 0.000000059604645, 0),
		["TopSurface"] = nil,
		["BottomSurface"] = Enum.SurfaceType.Smooth,
		["CFrame"] = CFrame.new(1.5, 5.960464477539063e-8, 0, 1, 0, 0, 0, 0.9999998807907104, 0, 0, 0, 1),
		["TopSurface"] = Enum.SurfaceType.Smooth
	},
	["Children"] = {}
}
local v19 = {
	["ID"] = 13,
	["Type"] = "Part",
	["Properties"] = nil,
	["Children"] = nil,
	["Properties"] = {
		["Name"] = "Head",
		["Position"] = Vector3.new(0, 1.5, 0),
		["Size"] = Vector3.new(2, 1, 1),
		["CFrame"] = nil,
		["BottomSurface"] = nil,
		["TopSurface"] = nil,
		["CFrame"] = CFrame.new(0, 1.5, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
		["BottomSurface"] = Enum.SurfaceType.Smooth,
		["TopSurface"] = Enum.SurfaceType.Smooth
	},
	["Children"] = {
		{
			["ID"] = 14,
			["Type"] = "Decal",
			["Properties"] = nil,
			["Children"] = nil,
			["Properties"] = {
				["Name"] = "Face",
				["Texture"] = "rbxasset://textures/face.png"
			},
			["Children"] = {}
		},
		{
			["ID"] = 15,
			["Type"] = "SpecialMesh",
			["Properties"] = nil,
			["Children"] = nil,
			["Properties"] = {
				["Scale"] = Vector3.new(1.25, 1.25, 1.25)
			},
			["Children"] = {}
		}
	}
}
__set_list(v4, 1, {v5, v8, v15, v16, v17, v18, v19, {
	["ID"] = 16,
	["Type"] = "Humanoid",
	["Properties"] = nil,
	["Children"] = nil,
	["Properties"] = {},
	["Children"] = {}
}})
v_u_3.Children = v4
local function v_u_31(p20, p21, p22, p23) -- name: Scan
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_31
	local v24 = Instance.new(p20.Type)
	if p20.ID then
		local v25 = v_u_2[p20.ID]
		if v25 then
			v25[1][v25[2]] = v24
			v_u_2[p20.ID] = nil
		else
			v_u_1[p20.ID] = v24
		end
	end
	for v26, v29 in pairs(p20.Properties) do
		if type(v29) == "string" then
			local v28 = tonumber(v29:match("^_R:(%w+)_$"))
			if v28 then
				local v29
				if v_u_1[v28] then
					v29 = v_u_1[v28]
				else
					v_u_2[v28] = { v24, v26 }
					v29 = nil
				end
			end
		end
		v24[v26] = v29
	end
	for _, v30 in pairs(p20.Children) do
		v_u_31(v30, v24, p22, p23)
	end
	v24.Parent = p21
	if v24:IsA("Part") then
		v24.Position = v24.Position + p22
		v24.Orientation = v24.Orientation + p23
		v24.Anchored = true
	end
	return v24
end
return function(p32, p33)
	-- upvalues: (copy) v_u_31, (copy) v_u_3
	return v_u_31(v_u_3, nil, p32, p33)
end