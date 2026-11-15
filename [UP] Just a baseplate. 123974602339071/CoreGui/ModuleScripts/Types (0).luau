-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.Types
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.t)
local v3 = {
	["IMessage"] = v2.strictInterface({
		["id"] = v2.string,
		["name"] = v2.string,
		["text"] = v2.string,
		["userId"] = v2.string,
		["timestamp"] = v2.number,
		["adornee"] = v2.union(v2.instanceIsA("BasePart"), v2.instanceOf("Model"))
	}),
	["IMessageData"] = v2.interface({
		["ID"] = v2.number,
		["SpeakerUserId"] = v2.number,
		["FromSpeaker"] = v2.string,
		["Time"] = v2.number,
		["Message"] = v2.optional(v2.string)
	})
}
local v4 = {
	["BubbleDuration"] = v2.optional(v2.number),
	["MaxBubbles"] = v2.optional(v2.number),
	["BackgroundColor3"] = v2.optional(v2.Color3),
	["TextColor3"] = v2.optional(v2.Color3),
	["TextSize"] = v2.optional(v2.number),
	["Font"] = v2.optional(v2.enum(Enum.Font)),
	["Transparency"] = v2.optional(v2.number),
	["CornerEnabled"] = v2.optional(v2.boolean),
	["CornerRadius"] = v2.optional(v2.UDim),
	["TailVisible"] = v2.optional(v2.boolean),
	["Padding"] = v2.optional(v2.number),
	["MaxWidth"] = v2.optional(v2.number),
	["BackgroundImage"] = v2.optional(v2.strictInterface({
		["Image"] = v2.optional(v2.string),
		["ImageColor3"] = v2.optional(v2.Color3),
		["ImageRectOffset"] = v2.optional(v2.Vector2),
		["ImageRectSize"] = v2.optional(v2.Vector2),
		["ScaleType"] = v2.optional(v2.enum(Enum.ScaleType)),
		["SliceCenter"] = v2.optional(v2.Rect),
		["SliceScale"] = v2.optional(v2.number),
		["TileSize"] = v2.optional(v2.UDim2)
	})),
	["BackgroundGradient"] = v2.optional(v2.strictInterface({
		["Enabled"] = v2.optional(v2.boolean),
		["Color"] = v2.optional(v2.ColorSequence),
		["Offset"] = v2.optional(v2.Vector2),
		["Rotation"] = v2.optional(v2.number),
		["Transparency"] = v2.optional(v2.NumberSequence)
	})),
	["SizeAnimation"] = v2.optional(v2.strictInterface({
		["Enabled"] = v2.optional(v2.boolean),
		["SpringDampingRatio"] = v2.optional(v2.number),
		["SpringFrequency"] = v2.optional(v2.number)
	})),
	["TransparencyAnimation"] = v2.optional(v2.strictInterface({
		["Enabled"] = v2.optional(v2.boolean),
		["SpringDampingRatio"] = v2.optional(v2.number),
		["SpringFrequency"] = v2.optional(v2.number)
	})),
	["VerticalStudsOffset"] = v2.optional(v2.number),
	["LocalPlayerStudsOffset"] = v2.optional(v2.Vector3),
	["BubblesSpacing"] = v2.optional(v2.number),
	["MinimizeDistance"] = v2.optional(v2.number),
	["MaxDistance"] = v2.optional(v2.number),
	["AdorneeName"] = v2.optional(v2.string),
	["Voice"] = v2.optional(v2.strictInterface({
		["ShowIndicator"] = v2.optional(v2.boolean)
	}))
}
local v5 = {}
for v6, v7 in pairs(v4) do
	v5[v6] = v7
end
v4.UserSpecificSettings = v2.optional(v2.map(v2.string, v2.strictInterface(v5)))
v3.IChatSettings = v2.strictInterface(v4)
return v3