-- Path: CorePackages.Packages._Index.Markdown.Markdown.ParserTypes
local v1 = script.Parent
local v2 = v1.Parent
require(v1.Adapter)
require(v2.CommonMark)
require(v1.Parsers.RobloxMarkdown.Mention.Mention)
require(v1.Parsers.RobloxMarkdown.Underline.Underline)
require(v1.Adapter.createParser)
return {
	["ParserDocument"] = nil,
	["ParserNode"] = nil,
	["Mention"] = nil,
	["Underline"] = nil,
	["Parser"] = nil,
	["ParserConfig"] = nil,
	["Extension"] = nil,
	["AdapterAsName"] = nil,
	["AdapterAttributes"] = nil,
	["AdapterBlockName"] = nil,
	["AdapterBlockRule"] = nil,
	["AdapterBuilder"] = nil,
	["AdapterContext"] = nil,
	["AdapterEntryOptions"] = nil,
	["AdapterExtension"] = nil,
	["AdapterFallback"] = nil,
	["AdapterFlattenOptions"] = nil,
	["AdapterGap"] = nil,
	["AdapterGapKind"] = nil,
	["AdapterHandler"] = nil,
	["AdapterInlineName"] = nil,
	["AdapterInlineRule"] = nil,
	["AdapterListOptions"] = nil,
	["AdapterPassName"] = nil,
	["AdapterQuoteOptions"] = nil,
	["AdapterRendererName"] = nil,
	["AdapterStyle"] = nil
}