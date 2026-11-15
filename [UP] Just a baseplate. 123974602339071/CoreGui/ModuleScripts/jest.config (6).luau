-- Path: CoreGui.RobloxGui.Modules.EmotesMenu.jest.config
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.JestConfigs)
return {
	["displayName"] = "EmotesMenu",
	["testMatch"] = nil,
	["setupFilesAfterEnv"] = nil,
	["testMatch"] = { "**/*.test" },
	["setupFilesAfterEnv"] = { v2.setupFiles.UIBloxInitializer, v2.setupFiles.createPromiseRejectionHandler(10, 10), v2.setupFiles.RetryTimes }
}