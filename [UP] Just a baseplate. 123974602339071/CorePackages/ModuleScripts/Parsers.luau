-- Path: CorePackages.Packages._Index.Markdown.Markdown.Parsers
local v1 = require(script.Parent.lazyMembers)
local v2 = {
	["CommonMark"] = nil,
	["CommonMarkComplianceParser"] = nil,
	["RobloxMarkdown"] = nil,
	["WikiMarkdownParser"] = nil,
	["CommonMarkComplianceParser"] = require(script.CommonMarkComplianceParser),
	["WikiMarkdownParser"] = require(script.WikiMarkdownParser)
}
v1(v2, {
	["CommonMark"] = function() -- name: CommonMark
		return require(script.CommonMark.RendererParser)
	end,
	["RobloxMarkdown"] = function() -- name: RobloxMarkdown
		return require(script.RobloxMarkdown.RendererParser)
	end
})
return v2