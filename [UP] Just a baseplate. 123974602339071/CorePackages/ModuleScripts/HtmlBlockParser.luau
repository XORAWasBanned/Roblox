-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.HtmlBlockParser
local v1 = script:FindFirstAncestor("CommonMark")
local v2 = require(v1.parser.block.AbstractBlockParser)
local v3 = require(v1.text.AsciiMatcher)
local v_u_4 = require(v1.internal.BlockContent)
local v_u_5 = require(v1.parser.block.BlockContinue)
require(v1.parser.block.BlockParserFactory)
local v_u_6 = require(v1.parser.block.BlockStart)
require(v1.text.CharMatcher)
local v_u_7 = require(v1.internal.inline.HtmlInlineParser)
require(v1.parser.block.MatchedBlockParser)
local v_u_8 = require(v1.node.Nodes)
require(v1.parser.block.ParserState)
local v_u_9 = require(v1.parser.beta.Scanner)
local v_u_10 = require(v1.parser.SourceLine)
local v_u_11 = string.byte
local v_u_12 = string.find
local v_u_13 = string.gsub
local v_u_14 = string.lower
local v_u_15 = string.sub
local v_u_16 = {
	["\n"] = true,
	["\r"] = true,
	["\r\n"] = true,
	["\194\133"] = true,
	["\226\128\168"] = true,
	["\226\128\169"] = true
}
local v_u_17 = {
	["script"] = true,
	["pre"] = true,
	["style"] = true,
	["textarea"] = true
}
local v_u_18 = {}
local function v23(p19) -- name: isType1Opener
	-- upvalues: (copy) v_u_11, (copy) v_u_12, (copy) v_u_14, (copy) v_u_15, (copy) v_u_17, (copy) v_u_16
	if v_u_11(p19, 1) ~= 60 then
		return false
	end
	local _, v20 = v_u_12(p19, "^[A-Za-z0-9]*", 2)
	if not v_u_17[v_u_14((v_u_15(p19, 2, v20)))] then
		return false
	end
	local v21 = v_u_11(p19, v20 + 1)
	local v22 = (v21 == 32 or (v21 == 9 or (v21 == 10 or (v21 == 11 or v21 == 12)))) and true or v21 == 13
	if not v22 then
		if v21 == 62 then
			v22 = true
		else
			if v20 == #p19 then
				return true
			end
			if v_u_11(p19, v20 + 1) == 10 and (v20 > 0 and v_u_11(p19, v20 - 1 + 1) == 13) then
				return false
			end
			v22 = v_u_16[v_u_15(p19, v20 + 1)] == true
		end
	end
	return v22
end
local function v26(p24) -- name: findType1Closer
	-- upvalues: (copy) v_u_14, (copy) v_u_12
	local v25 = v_u_14(p24)
	return (v_u_12(v25, "</script>", 1, true) ~= nil or (v_u_12(v25, "</pre>", 1, true) ~= nil or v_u_12(v25, "</style>", 1, true) ~= nil)) and true or v_u_12(v25, "</textarea>", 1, true) ~= nil
end
local function v28(p27) -- name: isType2Opener
	-- upvalues: (copy) v_u_15
	return v_u_15(p27, 1, 4) == "<!--"
end
local function v30(p29) -- name: findType2Closer
	-- upvalues: (copy) v_u_12
	return v_u_12(p29, "-->", 1, true) ~= nil
end
local function v32(p31) -- name: isType3Opener
	-- upvalues: (copy) v_u_15
	return v_u_15(p31, 1, 2) == "<?"
end
local function v34(p33) -- name: findType3Closer
	-- upvalues: (copy) v_u_12
	return v_u_12(p33, "?>", 1, true) ~= nil
end
local function v36(p35) -- name: isType4Opener
	-- upvalues: (copy) v_u_12
	return v_u_12(p35, "^<![A-Z]") ~= nil
end
local function v38(p37) -- name: findType4Closer
	-- upvalues: (copy) v_u_12
	return v_u_12(p37, ">", 1, true) ~= nil
end
local function v40(p39) -- name: findType5Closer
	-- upvalues: (copy) v_u_12
	return v_u_12(p39, "]]>", 1, true) ~= nil
end
local function v42(p41) -- name: isType5Opener
	-- upvalues: (copy) v_u_15
	return v_u_15(p41, 1, 9) == "<![CDATA["
end
for _, v43 in {
	"address",
	"article",
	"aside",
	"base",
	"basefont",
	"blockquote",
	"body",
	"caption",
	"center",
	"col",
	"colgroup",
	"dd",
	"details",
	"dialog",
	"dir",
	"div",
	"dl",
	"dt",
	"fieldset",
	"figcaption",
	"figure",
	"footer",
	"form",
	"frame",
	"frameset",
	"h1",
	"h2",
	"h3",
	"h4",
	"h5",
	"h6",
	"head",
	"header",
	"hr",
	"html",
	"iframe",
	"legend",
	"li",
	"link",
	"main",
	"menu",
	"menuitem",
	"nav",
	"noframes",
	"ol",
	"optgroup",
	"option",
	"p",
	"param",
	"search",
	"section",
	"summary",
	"table",
	"tbody",
	"td",
	"tfoot",
	"th",
	"thead",
	"title",
	"tr",
	"track",
	"ul"
} do
	v_u_18[v43] = true
end
local v_u_44 = v3.builder():range(65, 90):range(97, 122):build()
local v_u_45 = v3.builder():range(0, 32):anyOf("\"\'=<>`"):build()
local v_u_56 = {
	{
		["opener"] = v23,
		["closer"] = v26
	},
	{
		["opener"] = v28,
		["closer"] = v30
	},
	{
		["opener"] = v32,
		["closer"] = v34
	},
	{
		["opener"] = v36,
		["closer"] = v38
	},
	{
		["opener"] = v42,
		["closer"] = v40
	},
	{
		["opener"] = nil,
		["closer"] = nil,
		["opener"] = function(p46) -- name: isType6Opener
			-- upvalues: (copy) v_u_11, (copy) v_u_12, (copy) v_u_14, (copy) v_u_15, (copy) v_u_18, (copy) v_u_16
			if v_u_11(p46, 1) ~= 60 then
				return false
			end
			local v47 = v_u_11(p46, 2) == 47 and 2 or 1
			local _, v48 = v_u_12(p46, "^[A-Za-z0-9]*", v47 + 1)
			if not v_u_18[v_u_14((v_u_15(p46, v47 + 1, v48)))] then
				return false
			end
			local v49 = v_u_11(p46, v48 + 1)
			local v50 = (v49 == 32 or (v49 == 9 or (v49 == 10 or (v49 == 11 or v49 == 12)))) and true or v49 == 13
			if not v50 then
				if v49 == 62 or v49 == 47 and v_u_11(p46, v48 + 1 + 1) == 62 then
					v50 = true
				else
					if v48 == #p46 then
						return true
					end
					if v_u_11(p46, v48 + 1) == 10 and (v48 > 0 and v_u_11(p46, v48 - 1 + 1) == 13) then
						return false
					end
					v50 = v_u_16[v_u_15(p46, v48 + 1)] == true
				end
			end
			return v50
		end
	},
	{
		["opener"] = nil,
		["closer"] = nil,
		["opener"] = function(p51) -- name: isType7Opener
			-- upvalues: (copy) v_u_11, (copy) v_u_12, (copy) v_u_13, (copy) v_u_9, (copy) v_u_10, (copy) v_u_44, (copy) v_u_7, (copy) v_u_45, (copy) v_u_16, (copy) v_u_15
			if v_u_11(p51, 1) == 60 then
				if v_u_12(p51, "\0", 1, true) ~= nil then
					p51 = v_u_13(p51, "%z", "\1")
				end
				local v52 = v_u_9.new({ v_u_10.of(p51, nil) }, 0, 1)
				local v53 = v52:peek()
				local v54
				if v_u_44:matches(v53) then
					v54 = v_u_7.tryOpenTag(v52, v_u_45)
				elseif v53 == 47 then
					v54 = v_u_7.tryClosingTag(v52)
				else
					v54 = false
				end
				if v54 then
					v52:whitespace()
					local v55 = v52:position().index
					if v55 == #p51 then
						return true
					elseif v_u_11(p51, v55 + 1) == 10 and (v55 > 0 and v_u_11(p51, v55 - 1 + 1) == 13) then
						return false
					else
						return v_u_16[v_u_15(p51, v55 + 1)] == true
					end
				else
					return false
				end
			else
				return false
			end
		end
	}
}
local v_u_57 = setmetatable({}, {
	["__index"] = v2
})
v_u_57.__index = v_u_57
function v_u_57.new(p58) -- name: new
	-- upvalues: (copy) v_u_8, (copy) v_u_4, (copy) v_u_57
	local v59 = {
		["_block"] = nil,
		["_closingPattern"] = nil,
		["_finished"] = false,
		["_content"] = nil,
		["_block"] = v_u_8.HtmlBlock(),
		["_closingPattern"] = p58,
		["_content"] = v_u_4.new()
	}
	local v60 = v_u_57
	return setmetatable(v59, v60)
end
function v_u_57.getBlock(p61) -- name: getBlock
	return p61._block
end
function v_u_57.tryContinue(p62, p63) -- name: tryContinue
	-- upvalues: (copy) v_u_5
	if p62._finished then
		return v_u_5.none()
	elseif p63:isBlank() and p62._closingPattern == nil then
		return v_u_5.none()
	else
		return v_u_5.atIndex(p63:getIndex())
	end
end
function v_u_57.addLine(p64, p65) -- name: addLine
	p64._content:add(p65:getContent())
	local v66 = p64._closingPattern
	if v66 ~= nil and v66(p65:getContent()) then
		p64._finished = true
	end
end
function v_u_57.closeBlock(p67) -- name: closeBlock
	p67._block.literal = p67._content:getString()
	p67._content = nil
end
local v_u_68 = {}
v_u_68.__index = v_u_68
function v_u_68.new() -- name: new
	-- upvalues: (copy) v_u_68
	local v69 = v_u_68
	return setmetatable({}, v69)
end
function v_u_68.tryStart(_, p70, p71) -- name: tryStart
	-- upvalues: (copy) v_u_11, (copy) v_u_56, (copy) v_u_15, (copy) v_u_6, (copy) v_u_57
	local v72 = p70:getNextNonSpaceIndex()
	local v73 = p70:getLine():getContent()
	if p70:getIndent() < 4 and v_u_11(v73, v72 + 1) == 60 then
		for v74 = 1, 7 do
			if v74 == 7 and (p71:getMatchedBlockParser():getBlock().kind == "Paragraph" or p70:getActiveBlockParser():canHaveLazyContinuationLines()) then
				continue
			end
			local v75 = v_u_56[v74].opener
			local v76 = v_u_56[v74].closer
			if not v75((v_u_15(v73, v72 + 1))) then
				continue
			end
			return v_u_6.of(v_u_57.new(v76)):atIndex(p70:getIndex())
		end
	end
	return v_u_6.none()
end
v_u_57.Factory = v_u_68
v_u_57._BLOCK_PATTERNS = v_u_56
return v_u_57