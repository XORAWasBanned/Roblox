-- Path: CoreGui.RobloxGui.Modules.FacialAnimationStreaming.RobloxTelemetryConfigs.AvatarChatHeartbeatStats
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.LoggingProtocol)
game:DefineFastInt("AvatarChatHeartbeatStatsEventThrottleHundrethsPercent", 0)
return {
	["eventName"] = "avatarChatHeartbeatStats",
	["backends"] = nil,
	["throttlingPercentage"] = nil,
	["lastUpdated"] = nil,
	["description"] = "Report Avatar Chat session heartbeat to EventIngest.",
	["links"] = "https://roblox.atlassian.net/wiki/spaces/DA/pages/2025358355/Logging+Specs+Avatar+Chat+Heartbeat+Stats",
	["backends"] = { v2.TelemetryBackends.Points },
	["throttlingPercentage"] = game:GetFastInt("AvatarChatHeartbeatStatsEventThrottleHundrethsPercent"),
	["lastUpdated"] = { 23, 3, 15 }
}