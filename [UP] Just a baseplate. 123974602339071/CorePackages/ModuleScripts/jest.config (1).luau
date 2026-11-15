-- Path: CorePackages.Packages._Index.MarkdownCore.MarkdownCore.jest.config
local v1 = script:FindFirstAncestor("Packages")._Workspace
return {
	["testMatch"] = { "**/*.test" },
	["testPathIgnorePatterns"] = { "_Index" },
	["setupFilesAfterEnv"] = { script.Parent.setupJest },
	["rootDir"] = v1
}