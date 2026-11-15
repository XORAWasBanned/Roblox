-- Path: CoreGui.RobloxGui.Modules.FTUX.Resources.FTUXSlideshowData
local v1 = script.Parent.Parent
local v2 = require(v1.Enums.ButtonEnum)
local v3 = {
	[require(v1.Enums.PlatformEnum).QuestVR] = {
		{
			["title"] = "CoreScripts.VRFTUX.Heading.Perspective",
			["text"] = nil,
			["image"] = "rbxassetid://13251804809",
			["button"] = nil,
			["text"] = { "CoreScripts.VRFTUX.Description.Perspective.Body1", "CoreScripts.VRFTUX.Description.Perspective.Body2" },
			["button"] = v2.SkipButton
		},
		{
			["title"] = "CoreScripts.VRFTUX.Heading.Movement",
			["text"] = nil,
			["image"] = "rbxassetid://13251750527",
			["button"] = nil,
			["text"] = { "CoreScripts.VRFTUX.Description.Movement.Body1", "CoreScripts.VRFTUX.Description.Movement.Body2", "CoreScripts.VRFTUX.Description.Movement.Body3" },
			["button"] = v2.SkipButton
		},
		{
			["title"] = "CoreScripts.VRFTUX.Heading.SafetyBubble.Title",
			["text"] = nil,
			["image"] = "rbxassetid://13251806846",
			["button"] = nil,
			["text"] = { "CoreScripts.VRFTUX.Description.SafetyBubble.Body1", "CoreScripts.VRFTUX.Description.SafetyBubble.Body2" },
			["button"] = v2.NextButton
		},
		{
			["title"] = "CoreScripts.VRFTUX.Heading.OtherSettings.Title",
			["text"] = nil,
			["image"] = "",
			["button"] = nil,
			["text"] = { "CoreScripts.VRFTUX.Description.OtherSettings.Body1", "CoreScripts.VRFTUX.Description.OtherSettings.Body2" },
			["button"] = v2.NextButton
		}
	}
}
return v3