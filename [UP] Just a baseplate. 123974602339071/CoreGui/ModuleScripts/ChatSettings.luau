-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.ChatSettings
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.Style).AppFonts
local v3 = {
	["BubbleDuration"] = 15,
	["MaxBubbles"] = 3,
	["BackgroundColor3"] = nil,
	["TextColor3"] = nil,
	["TextSize"] = 16,
	["Font"] = nil,
	["Transparency"] = 0.1,
	["CornerEnabled"] = true,
	["CornerRadius"] = nil,
	["TailVisible"] = true,
	["Padding"] = 8,
	["MaxWidth"] = 300,
	["BackgroundImage"] = nil,
	["BackgroundGradient"] = nil,
	["SizeAnimation"] = nil,
	["TransparencyAnimation"] = nil,
	["VerticalStudsOffset"] = 0,
	["LocalPlayerStudsOffset"] = Vector3.new(0, 0, 2),
	["BubblesSpacing"] = 6,
	["MinimizeDistance"] = 40,
	["MaxDistance"] = 100,
	["AdorneeName"] = "HumanoidRootPart",
	["Voice"] = nil,
	["UserSpecificSettings"] = nil,
	["BackgroundColor3"] = Color3.fromRGB(250, 250, 250),
	["TextColor3"] = Color3.fromRGB(57, 59, 61),
	["Font"] = v2.default:getMedium(),
	["CornerRadius"] = UDim.new(0, 12),
	["BackgroundImage"] = {
		["Image"] = "",
		["ImageColor3"] = nil,
		["ImageRectOffset"] = nil,
		["ImageRectSize"] = nil,
		["ScaleType"] = nil,
		["SliceCenter"] = nil,
		["SliceScale"] = 1,
		["TileSize"] = nil,
		["ImageColor3"] = Color3.new(1, 1, 1),
		["ImageRectOffset"] = Vector2.new(),
		["ImageRectSize"] = Vector2.new(),
		["ScaleType"] = Enum.ScaleType.Stretch,
		["SliceCenter"] = Rect.new(Vector2.new(), Vector2.new()),
		["TileSize"] = UDim2.fromScale(1, 1)
	},
	["BackgroundGradient"] = {
		["Enabled"] = false,
		["Color"] = nil,
		["Offset"] = nil,
		["Rotation"] = 0,
		["Transparency"] = nil,
		["Color"] = ColorSequence.new(Color3.fromRGB(150, 150, 150), Color3.fromRGB(250, 250, 250)),
		["Offset"] = Vector2.new(),
		["Transparency"] = NumberSequence.new(0)
	},
	["SizeAnimation"] = {
		["Enabled"] = true,
		["SpringDampingRatio"] = 1,
		["SpringFrequency"] = 2
	},
	["TransparencyAnimation"] = {
		["Enabled"] = true,
		["SpringDampingRatio"] = 1,
		["SpringFrequency"] = 2
	},
	["Voice"] = {
		["ShowIndicator"] = true
	},
	["UserSpecificSettings"] = {}
}
return v3