-- Path: CorePackages.Packages._Index.CommonMark.CommonMark
local v_u_1 = script
local v2 = require(v_u_1.parser.block.AbstractBlockParser)
local v3 = require(v_u_1.node.AbstractVisitor)
local v_u_4 = require(v_u_1.internal.port.ApiOptions)
local v5 = require(v_u_1.text.AsciiMatcher)
local v6 = require(v_u_1.internal.inline.AutolinkInlineParser)
local v7 = require(v_u_1.parser.block.BlockContinue)
require(v_u_1.parser.block.BlockParser)
require(v_u_1.parser.block.BlockParserFactory)
local v8 = require(v_u_1.internal.BlockQuoteParser)
local v9 = require(v_u_1.parser.block.BlockStart)
require(v_u_1.text.CharMatcher)
local v10 = require(v_u_1.text.Characters)
local v11 = require(v_u_1.node.CustomBlock)
local v12 = require(v_u_1.node.CustomNode)
require(v_u_1.parser.delimiter.DelimiterProcessor)
require(v_u_1.parser.delimiter.DelimiterRun)
local v13 = require(v_u_1.internal.inline.EmphasisDelimiterProcessor)
require(v_u_1.Extension)
require(v_u_1.parser.IncludeSourceSpans)
require(v_u_1.parser.beta.InlineContentParser)
require(v_u_1.parser.beta.InlineContentParserFactory)
require(v_u_1.parser.InlineParser)
require(v_u_1.parser.InlineParserContext)
require(v_u_1.parser.beta.InlineParserState)
require(v_u_1.parser.beta.LinkInfo)
require(v_u_1.parser.beta.LinkProcessor)
local v14 = require(v_u_1.parser.beta.LinkResult)
local v15 = require(v_u_1.internal.port.LinkedHashMap)
require(v_u_1.parser.block.MatchedBlockParser)
local v16 = require(v_u_1.node.Nodes)
local v17 = require(v_u_1.parser.beta.ParsedInline)
require(v_u_1.parser.block.ParserState)
require(v_u_1.parser.beta.Position)
local v18 = require(v_u_1.parser.beta.Scanner)
local v19 = require(v_u_1.parser.SourceLine)
local v20 = require(v_u_1.parser.SourceLines)
local v21 = require(v_u_1.node.SourceSpan)
local v22 = require(v_u_1.node.SourceSpans)
local v23 = require(v_u_1.ext.gfm.strikethrough.StrikethroughExtension)
require(v_u_1.node.Visitor)
local v24 = {
	["Node"] = table.freeze({
		["AbstractVisitor"] = v3,
		["CustomBlock"] = v11,
		["CustomNode"] = v12,
		["Nodes"] = v16,
		["SourceSpan"] = v21,
		["SourceSpans"] = v22
	})
}
local v25 = table.freeze
local v26 = {
	["SourceLine"] = v19,
	["SourceLines"] = v20,
	["Beta"] = table.freeze({
		["LinkResult"] = v14,
		["ParsedInline"] = v17,
		["Scanner"] = v18
	}),
	["Block"] = table.freeze({
		["AbstractBlockParser"] = v2,
		["BlockContinue"] = v7,
		["BlockStart"] = v9
	}),
	["Delimiter"] = table.freeze({
		["EmphasisLikeDelimiterProcessor"] = v13
	})
}
v24.Parser = v25(v26)
local v27 = table.freeze
local v35 = {
	["Html"] = (function(p28, p_u_29) -- name: freezeWithLazyMembers
		local v_u_30 = table.clone(p28)
		local v31 = table.freeze
		setmetatable(p28, v31({
			["__index"] = function(_, p32) -- name: __index
				-- upvalues: (copy) v_u_30, (copy) p_u_29
				local v33 = v_u_30[p32]
				if v33 == nil and p_u_29[p32] ~= nil then
					v33 = p_u_29[p32]()
					v_u_30[p32] = v33
				end
				return v33
			end,
			["__iter"] = function() -- name: __iter
				-- upvalues: (copy) p_u_29, (copy) v_u_30
				for v34 in p_u_29 do
					if v_u_30[v34] ~= nil or p_u_29[v34] == nil then
						continue
					end
					v_u_30[v34] = p_u_29[v34]()
				end
				return next, v_u_30
			end
		}))
		table.freeze(p28)
		return p28
	end)({
		["DefaultUrlSanitizer"] = nil,
		["LinkedHashMap"] = nil,
		["LinkedHashMap"] = v15
	}, {
		["DefaultUrlSanitizer"] = function() -- name: DefaultUrlSanitizer
			-- upvalues: (copy) v_u_1
			return require(v_u_1.renderer.html.DefaultUrlSanitizer)
		end
	})
}
v24.Renderer = v27(v35)
v24.Text = table.freeze({
	["AsciiMatcher"] = v5,
	["Characters"] = v10
})
local v36 = table.freeze
local v37 = {}
local v38 = table.freeze
local v39 = {
	["Strikethrough"] = table.freeze({
		["StrikethroughExtension"] = v23
	})
}
v37.Gfm = v38(v39)
v24.Ext = v36(v37)
v24.Internal = table.freeze({
	["AutolinkInlineParser"] = v6,
	["BlockQuoteParser"] = v8
})
function v24.parse(p40, p41) -- name: parse
	-- upvalues: (copy) v_u_4
	return v_u_4.getParser(p41):parse(p40)
end
function v24.renderHtml(p42, p43) -- name: renderHtml
	-- upvalues: (copy) v_u_4
	return v_u_4.getHtmlRenderer(p43):render(p42)
end
return v24