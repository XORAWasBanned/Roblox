-- Path: CorePackages.Packages._Index.InlineLayout.InlineLayout.InlineLayout.storybook
local v1 = script.Parent
local v2 = v1.Parent
return {
	["name"] = "InlineLayout",
	["exclude"] = nil,
	["storyRoots"] = nil,
	["mapStory"] = nil,
	["roact"] = nil,
	["exclude"] = { "_Index" },
	["storyRoots"] = { v1 },
	["mapStory"] = require(v2.MarkdownCore).StoryMiddleware,
	["roact"] = require(v2.Dev.Roact)
}