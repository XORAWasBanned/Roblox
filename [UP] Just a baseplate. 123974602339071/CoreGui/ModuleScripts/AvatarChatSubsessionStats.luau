-- Path: CoreGui.RobloxGui.Modules.FacialAnimationStreaming.RobloxTelemetryConfigs.AvatarChatSubsessionStats
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.LoggingProtocol)
game:DefineFastInt("AvatarChatSubsessionStatsEventThrottleHundrethsPercent", 0)
return {
	["eventName"] = "avatarChatSubsessionStats",
	["backends"] = nil,
	["throttlingPercentage"] = nil,
	["lastUpdated"] = nil,
	["description"] = "Report FACS sending/receiving time per Avatar Chat session to EventIngest.",
	["links"] = "https://roblox.atlassian.net/wiki/spaces/DA/pages/1857851197/Logging+Specs+Subsession+Analytics",
	["backends"] = { v2.TelemetryBackends.EventIngest },
	["throttlingPercentage"] = game:GetFastInt("AvatarChatSubsessionStatsEventThrottleHundrethsPercent"),
	["lastUpdated"] = { 22, 10, 17 }
}