-- Path: CoreGui.RobloxGui.Modules.CoreScriptsRhodiumTest.jest.config
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Workspace.Packages.JestConfigs)
_G.__TESTEZ_RUNNING_TEST__ = true
return {
	["displayName"] = "CoreScriptsRhodiumTest",
	["testMatch"] = nil,
	["testPathIgnorePatterns"] = nil,
	["setupFilesAfterEnv"] = nil,
	["testMatch"] = { "**/*.test" },
	["testPathIgnorePatterns"] = { "TestHelpers" },
	["setupFilesAfterEnv"] = {
		script.Parent.TestHelpers.JestSetupDummyInstances,
		v2.setupFiles.UIBloxInitializer,
		v2.setupFiles.createPromiseRejectionHandler(),
		v2.setupFiles.RetryTimes,
		script.Parent.TestHelpers["JestResetInputDevice.test"]
	}
}