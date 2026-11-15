-- Path: CoreGui.RobloxGui.Modules.FacialAnimationStreaming.RobloxTelemetryConfigs.AvatarChatSubsessionInput
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.LoggingProtocol)
game:DefineFastInt("AvatarChatSubsessionInputEventThrottleHundrethsPercent", 0)
return {
	["eventName"] = "avatarChatSubsessionInput",
	["backends"] = nil,
	["throttlingPercentage"] = nil,
	["lastUpdated"] = nil,
	["description"] = "Report user camera/mic settings for Avatar Chat to EventIngest.",
	["links"] = "https://roblox.atlassian.net/wiki/spaces/DA/pages/1857851197/Logging+Specs+Subsession+Analytics",
	["backends"] = { v2.TelemetryBackends.EventIngest },
	["throttlingPercentage"] = game:GetFastInt("AvatarChatSubsessionInputEventThrottleHundrethsPercent"),
	["lastUpdated"] = { 22, 10, 17 }
}