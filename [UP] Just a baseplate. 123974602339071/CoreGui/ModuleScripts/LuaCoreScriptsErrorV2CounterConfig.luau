-- Path: CoreGui.RobloxGui.Modules.ErrorReporting.LuaCoreScriptsErrorV2CounterConfig
-- https://lua.expert

local CorePackages = game:GetService("CorePackages")
local LoggingProtocol = require(CorePackages.Workspace.Packages.LoggingProtocol)
local v1 = game:DefineFastInt("LuaCoreScriptsErrorV2ThrottleHundredthPercentage", 0)

return {
    eventName = "LuaCoreScriptsError",
    description = "V2 Counter to for Lua CoreScripts Error.",
    backends = { LoggingProtocol.TelemetryBackends.Counter },
    throttlingPercentage = v1,
    lastUpdated = { 25, 1, 29 }
}
