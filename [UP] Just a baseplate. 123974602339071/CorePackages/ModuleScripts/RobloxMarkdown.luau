-- Path: CorePackages.Packages._Index.Markdown.Markdown.Parsers.RobloxMarkdown
local v1 = script:FindFirstAncestor("Markdown")
local v2 = v1.Parent
require(v1.Adapter)
local v_u_3 = require(v2.CommonMark)
local v4 = require(script.Mention.MentionExtension)
local v5 = require(script.NoNestedQuote)
require(v1.Types)
local v6 = require(script.Underline.UnderlineExtension)
local v7 = require(v1.Adapter.createParser)
local v8 = table.freeze({
	"Heading",
	"FencedCodeBlock",
	"IndentedCodeBlock",
	"ThematicBreak",
	"ListBlock"
})
local v9 = table.freeze({
	"Code",
	"BackslashEscape",
	"Emphasis",
	"Link",
	"Image",
	"HardLineBreak"
})
local v10 = table.freeze({
	table.freeze(v5.extension()),
	table.freeze(v_u_3.Ext.Gfm.Strikethrough.StrikethroughExtension.builder():requireTwoTildes(false):build()),
	table.freeze(v6.create()),
	table.freeze(v4.create())
})
local v11 = {
	["extensions"] = v10,
	["parserOptions"] = {
		["enabledBlockTypes"] = nil,
		["enabledInlineTypes"] = nil,
		["linkReferenceDefinitions"] = false,
		["maxOpenBlockParsers"] = 32,
		["maxInlineNesting"] = 32,
		["enabledBlockTypes"] = v8,
		["enabledInlineTypes"] = v9
	}
}
local v_u_12 = v7(v11)
local v_u_13 = table.freeze({
	["extensions"] = v10
})
local v_u_20 = {
	["parseOptions"] = v_u_12.parseOptions,
	["renderOptions"] = v_u_13,
	["parse"] = function(p14) -- name: parse
		-- upvalues: (copy) v_u_12
		return v_u_12.parseDocument(p14)
	end,
	["toRendererAst"] = function(p15, p16) -- name: toRendererAst
		-- upvalues: (copy) v_u_12
		return v_u_12.toRendererAst(p15, p16)
	end,
	["safeParse"] = function(p17) -- name: safeParse
		-- upvalues: (copy) v_u_20
		local v18 = v_u_20.parse
		return pcall(v18, p17)
	end,
	["renderHtml"] = function(p19) -- name: renderHtml
		-- upvalues: (copy) v_u_3, (copy) v_u_13
		return v_u_3.renderHtml(p19, v_u_13)
	end
}
return v_u_20