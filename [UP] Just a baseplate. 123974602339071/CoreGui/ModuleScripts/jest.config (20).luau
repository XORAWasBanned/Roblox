-- Path: CoreGui.RobloxGui.Modules.TopBar.jest.config
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.JestConfigs)
return {
	["displayName"] = "TopBar",
	["testMatch"] = nil,
	["setupFilesAfterEnv"] = nil,
	["testMatch"] = { "**/*.test" },
	["setupFilesAfterEnv"] = {
		script.Parent.TestHelpers.JestSetupDummyInstances,
		v2.setupFiles.UIBloxInitializer,
		v2.setupFiles.createPromiseRejectionHandler(10, 10),
		v2.setupFiles.RetryTimes
	}
}