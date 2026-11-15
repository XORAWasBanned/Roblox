-- Path: CorePackages.Packages._Index.Markdown.Markdown.Parsers.DefaultParserOptions
local v1 = script:FindFirstAncestor("Markdown")
local v2 = require(v1.Enums.NodeType)
return {
	["inlineTags"] = require(v1.Parent.MarkdownCore).Flags.FFlagMarkdownTagFallbacks and {
		["font"] = true,
		["img"] = true,
		["a"] = true,
		["abbr"] = true,
		["b"] = true,
		["code"] = true,
		["del"] = true,
		["em"] = true,
		["i"] = true,
		["kbd"] = true,
		["mark"] = true,
		["s"] = true,
		["small"] = true,
		["span"] = true,
		["strike"] = true,
		["strong"] = true,
		["sub"] = true,
		["sup"] = true,
		["u"] = true
	} or {
		["font"] = true,
		["img"] = true
	},
	["nodeConfiguration"] = {
		["ROOT"] = {
			["type"] = v2.Root
		},
		["LIST_ITEM"] = {
			["type"] = v2.TextBlock
		},
		["PARAGRAPH"] = {
			["type"] = v2.TextBlock
		},
		["HEADING"] = {
			["type"] = v2.TextBlock
		},
		["STYLED_TEXT"] = {
			["type"] = v2.InlineSpan
		},
		["LINK"] = {
			["type"] = v2.InlineSpan
		},
		["IMAGE"] = {
			["type"] = v2.InlineLeaf
		},
		["ACTION"] = {
			["type"] = v2.InlineLeaf
		},
		["TABLE_DIVIDER"] = {
			["type"] = v2.Block
		},
		["TABLE_HEADER"] = {
			["type"] = v2.Block
		},
		["TABLE_HEADER_2"] = {
			["type"] = v2.Block
		},
		["TABLE"] = {
			["type"] = v2.Block
		},
		["TABLE_CELL"] = {
			["type"] = v2.TextBlock
		},
		["TABLE_ROW"] = {
			["type"] = v2.Block
		},
		["LIST"] = {
			["type"] = v2.Block
		},
		["TEXT"] = {
			["type"] = v2.InlineLeaf
		},
		["BREAK"] = {
			["type"] = v2.InlineLeaf
		},
		["LINE_BREAK"] = {
			["type"] = v2.InlineLeaf
		},
		["DIVIDER"] = {
			["type"] = v2.Block
		},
		["CODE_BLOCK"] = {
			["type"] = v2.Block
		},
		["QUOTE"] = {
			["type"] = v2.TextBlock
		}
	}
}