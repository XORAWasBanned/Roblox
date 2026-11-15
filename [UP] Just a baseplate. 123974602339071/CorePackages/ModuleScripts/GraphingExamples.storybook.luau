-- Path: CorePackages.Packages._Index.Graphing.Graphing.GraphingExamples.storybook
local v1 = script:FindFirstAncestor("Graphing")
local v2 = v1.Parent
local v3 = require(v2.React)
local v4 = require(v2.ReactRoblox)
return {
	["name"] = "Graphing Examples",
	["storyRoots"] = nil,
	["roact"] = nil,
	["reactRoblox"] = nil,
	["storyRoots"] = { v1.Stories },
	["roact"] = v3,
	["reactRoblox"] = v4
}