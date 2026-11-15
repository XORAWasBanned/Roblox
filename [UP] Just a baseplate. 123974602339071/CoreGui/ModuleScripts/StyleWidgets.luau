-- Path: CoreGui.RobloxGui.Modules.StyleWidgets
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
v1:WaitForChild("RobloxGui")
local v_u_3 = require(v2.Workspace.Packages.AppCommonLib).Create
local v_u_5 = {
	["TabSelectionHeight"] = 6,
	["MakeTabSelectionWidget"] = function(p4) -- name: MakeTabSelectionWidget
		-- upvalues: (copy) v_u_3, (copy) v_u_5
		return v_u_3("ImageLabel")({
			["Name"] = "TabSelection",
			["Image"] = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuSelection.png",
			["ScaleType"] = nil,
			["SliceCenter"] = nil,
			["Visible"] = false,
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Position"] = nil,
			["Parent"] = nil,
			["ScaleType"] = Enum.ScaleType.Slice,
			["SliceCenter"] = Rect.new(3, 1, 4, 5),
			["Size"] = UDim2.new(1, 0, 0, v_u_5.TabSelectionHeight),
			["Position"] = UDim2.new(0, 0, 1, -v_u_5.TabSelectionHeight),
			["Parent"] = p4
		})
	end
}
return v_u_5