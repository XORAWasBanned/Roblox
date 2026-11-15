-- Path: CorePackages.Packages._Index.MarkdownCore.MarkdownCore.MarkdownCore.storybook
local v1 = script.Parent
return {
	["name"] = "MarkdownCore",
	["exclude"] = nil,
	["storyRoots"] = nil,
	["mapStory"] = nil,
	["roact"] = nil,
	["exclude"] = { "_Index" },
	["storyRoots"] = { v1 },
	["mapStory"] = require(v1.StoryMiddleware),
	["roact"] = require(v1.Parent.Dev.Roact)
}