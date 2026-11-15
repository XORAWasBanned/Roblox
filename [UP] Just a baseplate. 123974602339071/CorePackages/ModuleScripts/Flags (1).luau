-- Path: CorePackages.Packages._Index.Markdown.Markdown.Flags
local v1 = script:FindFirstAncestor("Markdown").Parent
local v2 = require(v1.SafeFlags)
return {
	["FFlagMarkdownUseRobloxProfileParser"] = v2.createGetFFlag("MarkdownUseRobloxProfileParser")(),
	["FFlagMarkdownDefaultRobloxProfile"] = v2.createGetFFlag("MarkdownDefaultRobloxProfile")()
}