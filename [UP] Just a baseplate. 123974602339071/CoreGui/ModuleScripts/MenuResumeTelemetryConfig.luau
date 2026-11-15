-- Path: CoreGui.RobloxGui.Modules.Settings.Analytics.MenuResumeTelemetryConfig
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v3 = require(v2.Workspace.Packages.LoggingProtocol)
local v4 = v1:WaitForChild("RobloxGui")
local v5 = require(v4.Modules.Settings.Flags.FIntMenuButtonsThrottleHundredthsPercent)
return {
	["eventName"] = "experienceMenuResume",
	["backends"] = nil,
	["throttlingPercentage"] = nil,
	["lastUpdated"] = nil,
	["description"] = "Report when resume button in experience menu is activated",
	["backends"] = { v3.TelemetryBackends.Counter },
	["throttlingPercentage"] = v5,
	["lastUpdated"] = { 25, 4, 23 }
}