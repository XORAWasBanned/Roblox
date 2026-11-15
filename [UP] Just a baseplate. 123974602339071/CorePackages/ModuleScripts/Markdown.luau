-- Path: CorePackages.Packages._Index.Markdown.Markdown
local v1 = require(script.Flags)
require(script.Components.MarkdownViewer)
require(script.Enums.NodeType)
require(script.Types)
local v2 = require(script.lazyMembers)
local v4 = {
	["Components"] = nil,
	["Enums"] = nil,
	["Parsers"] = nil,
	["Utils"] = nil,
	["parse"] = nil,
	["safeParse"] = nil,
	["toRendererAst"] = nil,
	["parseOptions"] = nil,
	["createParser"] = nil,
	["Adapter"] = nil,
	["Flags"] = nil,
	["Components"] = require(script.Components),
	["Enums"] = require(script.Enums),
	["Parsers"] = require(script.Parsers),
	["Utils"] = require(script.Utils),
	["toRendererAst"] = function(p3) -- name: toRendererAst
		return require(script.Parsers.RobloxMarkdown).toRendererAst(p3)
	end,
	["Flags"] = v1
}
v2(v4, {
	["parse"] = function() -- name: parse
		return require(script.Parsers.RobloxMarkdown).parse
	end,
	["safeParse"] = function() -- name: safeParse
		return require(script.Parsers.RobloxMarkdown).safeParse
	end,
	["parseOptions"] = function() -- name: parseOptions
		return require(script.Parsers.RobloxMarkdown).parseOptions
	end,
	["createParser"] = function() -- name: createParser
		return require(script.Adapter.createParser)
	end,
	["Adapter"] = function() -- name: Adapter
		return table.freeze({
			["Rules"] = require(script.Adapter).Rules
		})
	end
})
return v4