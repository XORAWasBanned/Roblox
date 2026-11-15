-- Path: CoreGui.RobloxGui.Modules.ProximityPromptsTests.jest.config
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.JestConfigs)
return {
	["displayName"] = "ProximityPrompts",
	["testMatch"] = nil,
	["setupFilesAfterEnv"] = nil,
	["testMatch"] = { "**/*.test" },
	["setupFilesAfterEnv"] = { v2.setupFiles.UIBloxInitializer, v2.setupFiles.createPromiseRejectionHandler(), v2.setupFiles.RetryTimes }
}