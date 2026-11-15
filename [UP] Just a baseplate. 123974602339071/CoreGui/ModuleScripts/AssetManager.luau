-- Path: CoreGui.RobloxGui.Modules.Shell.AssetManager
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
v1:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell")
local v_u_3 = require(v2.Workspace.Packages.AppCommonLib).Create
return {
	["CreateShadow"] = function(p4) -- name: CreateShadow
		-- upvalues: (copy) v_u_3
		return v_u_3("ImageLabel")({
			["Name"] = "Shadow",
			["Image"] = "rbxasset://textures/ui/Shell/Buttons/Generic9ScaleShadow.png",
			["Size"] = nil,
			["Position"] = nil,
			["ScaleType"] = nil,
			["SliceCenter"] = nil,
			["BackgroundTransparency"] = 1,
			["ZIndex"] = nil,
			["Size"] = UDim2.new(1, 3, 1, 3),
			["Position"] = UDim2.new(0, 0, 0, 0),
			["ScaleType"] = Enum.ScaleType.Slice,
			["SliceCenter"] = Rect.new(10, 10, 28, 28),
			["ZIndex"] = p4 or 1
		})
	end
}