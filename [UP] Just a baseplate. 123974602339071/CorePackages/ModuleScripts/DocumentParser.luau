-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.DocumentParser
local v1 = script:FindFirstAncestor("CommonMark")
require(v1.parser.block.BlockParser)
require(v1.parser.block.BlockParserFactory)
local v2 = require(v1.internal.BlockQuoteParser)
require(v1.parser.block.BlockStart)
local v_u_3 = require(v1.text.Characters)
local v_u_4 = require(v1.internal.Definitions)
require(v1.parser.delimiter.DelimiterProcessor)
local v_u_5 = require(v1.internal.DocumentBlockParser)
local v6 = require(v1.internal.FencedCodeBlockParser)
local v7 = require(v1.internal.HeadingParser)
local v8 = require(v1.internal.HtmlBlockParser)
local v_u_9 = require(v1.parser.IncludeSourceSpans)
local v10 = require(v1.internal.IndentedCodeBlockParser)
require(v1.parser.beta.InlineContentParserFactory)
local v_u_11 = require(v1.internal.InlineParserContextImpl)
require(v1.parser.InlineParserFactory)
local v_u_12 = require(v1.internal.port.Integer)
local v_u_13 = require(v1.internal.util.LineReader)
require(v1.parser.beta.LinkProcessor)
local v14 = require(v1.internal.ListBlockParser)
require(v1.parser.block.MatchedBlockParser)
require(v1.node.Nodes)
local v_u_15 = require(v1.internal.ParagraphParser)
require(v1.parser.block.ParserState)
local v_u_16 = require(v1.internal.util.Parsing)
local v_u_17 = require(v1.parser.SourceLine)
local v_u_18 = require(v1.parser.SourceLines)
local v_u_19 = require(v1.node.SourceSpan)
local v20 = require(v1.internal.ThematicBreakParser)
local v_u_21 = string.byte
local v_u_22 = string.find
local v_u_23 = string.gsub
local v_u_24 = string.rep
local v_u_25 = string.sub
local v_u_26 = {
	"BlockQuote",
	"Heading",
	"FencedCodeBlock",
	"HtmlBlock",
	"ThematicBreak",
	"ListBlock",
	"IndentedCodeBlock"
}
local v_u_27 = table.freeze({
	["BlockQuote"] = v2.Factory.new(),
	["Heading"] = v7.Factory.new(),
	["FencedCodeBlock"] = v6.Factory.new(),
	["HtmlBlock"] = v8.Factory.new(),
	["ThematicBreak"] = v20.Factory.new(),
	["ListBlock"] = v14.Factory.new(),
	["IndentedCodeBlock"] = v10.Factory.new()
})
local v_u_28 = {}
v_u_28.__index = v_u_28
function v_u_28.new(p29) -- name: new
	-- upvalues: (copy) v_u_28
	local v30 = v_u_28
	return setmetatable({
		["_matchedBlockParser"] = p29
	}, v30)
end
function v_u_28.getMatchedBlockParser(p31) -- name: getMatchedBlockParser
	return p31._matchedBlockParser
end
function v_u_28.getParagraphLines(p32) -- name: getParagraphLines
	-- upvalues: (copy) v_u_15, (copy) v_u_18
	local v33 = p32._matchedBlockParser
	if getmetatable(v33) == v_u_15 then
		return p32._matchedBlockParser:getParagraphLines()
	else
		return v_u_18.empty()
	end
end
local v_u_34 = {}
v_u_34.__index = v_u_34
function v_u_34.new(p35, p36) -- name: new
	-- upvalues: (copy) v_u_34
	local v37 = v_u_34
	return setmetatable({
		["_blockParser"] = p35,
		["_sourceIndex"] = p36
	}, v37)
end
local v_u_38 = {}
v_u_38.__index = v_u_38
function v_u_38.new(p39, p40, p41, p42, p43, p44, p45, p46, p47, p48, p49) -- name: new
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_38, (copy) v_u_34
	local v50 = {
		["_line"] = nil,
		["_lineIndex"] = -1,
		["_index"] = 0,
		["_column"] = 0,
		["_columnIsInTab"] = false,
		["_nextNonSpace"] = 0,
		["_nextNonSpaceColumn"] = 0,
		["_indent"] = 0,
		["_blank"] = false,
		["_blockParserFactories"] = nil,
		["_inlineParserFactory"] = nil,
		["_inlineContentParserFactories"] = nil,
		["_delimiterProcessors"] = nil,
		["_linkProcessors"] = nil,
		["_linkMarkers"] = nil,
		["_includeSourceSpans"] = nil,
		["_maxOpenBlockParsers"] = nil,
		["_maxInlineNesting"] = nil,
		["_enabledInlineTypes"] = nil,
		["_linkReferenceDefinitions"] = nil,
		["_documentBlockParser"] = nil,
		["_definitions"] = nil,
		["_openBlockParsers"] = nil,
		["_allBlockParsers"] = nil,
		["_blockParserFactories"] = p39,
		["_inlineParserFactory"] = p40,
		["_inlineContentParserFactories"] = p41,
		["_delimiterProcessors"] = p42,
		["_linkProcessors"] = p43,
		["_linkMarkers"] = p44,
		["_includeSourceSpans"] = p45,
		["_maxOpenBlockParsers"] = p46,
		["_maxInlineNesting"] = p47,
		["_enabledInlineTypes"] = p48,
		["_linkReferenceDefinitions"] = p49 ~= false,
		["_documentBlockParser"] = v_u_5.new(),
		["_definitions"] = v_u_4.new(),
		["_openBlockParsers"] = {},
		["_allBlockParsers"] = {}
	}
	local v51 = v_u_38
	local v52 = setmetatable(v50, v51)
	v52:activateBlockParser(v_u_34.new(v52._documentBlockParser, 0))
	return v52
end
function v_u_38.getDefaultBlockParserTypes() -- name: getDefaultBlockParserTypes
	-- upvalues: (copy) v_u_26
	return v_u_26
end
function v_u_38.calculateBlockParserFactories(p53, p54) -- name: calculateBlockParserFactories
	-- upvalues: (copy) v_u_27
	local v55 = table.clone(p53)
	for _, v56 in ipairs(p54) do
		local v57 = v_u_27[v56]
		table.insert(v55, v57)
	end
	return v55
end
function v_u_38.checkEnabledBlockTypes(p58) -- name: checkEnabledBlockTypes
	-- upvalues: (copy) v_u_27, (copy) v_u_26
	for _, v59 in ipairs(p58) do
		if v_u_27[v59] ~= nil then
			continue
		end
		local v60 = table.concat(v_u_26, ", ")
		error((("Can\'t enable block type %*, possible options are: [%*]"):format(v59, v60)))
	end
end
function v_u_38.parse(p61, p62) -- name: parse
	-- upvalues: (copy) v_u_3, (copy) v_u_25, (copy) v_u_21
	local v63 = 0
	local v64 = v_u_3.findLineBreak(p62, v63)
	while v64 ~= -1 do
		p61:parseLine(v_u_25(p62, v63 + 1, v64), v63)
		if v64 + 1 < #p62 and (v_u_21(p62, v64 + 1) == 13 and v_u_21(p62, v64 + 1 + 1) == 10) then
			v63 = v64 + 2
		else
			v63 = v64 + 1
		end
		v64 = v_u_3.findLineBreak(p62, v63)
	end
	if p62 ~= "" and (v63 == 0 or v63 < #p62) then
		p61:parseLine(v_u_25(p62, v63 + 1), v63)
	end
	return p61:finalizeAndProcess()
end
function v_u_38.parseReader(p65, p66) -- name: parseReader
	-- upvalues: (copy) v_u_13
	local v67 = v_u_13.new(p66)
	local v68 = v67:readLine()
	local v69 = 0
	while v68 ~= nil do
		p65:parseLine(v68, v69)
		v69 = v69 + #v68
		local v70 = v67:getLineTerminator()
		if v70 ~= nil then
			v69 = v69 + #v70
		end
		v68 = v67:readLine()
	end
	return p65:finalizeAndProcess()
end
function v_u_38.getLine(p71) -- name: getLine
	return p71._line
end
function v_u_38.getIndex(p72) -- name: getIndex
	return p72._index
end
function v_u_38.getNextNonSpaceIndex(p73) -- name: getNextNonSpaceIndex
	return p73._nextNonSpace
end
function v_u_38.getColumn(p74) -- name: getColumn
	return p74._column
end
function v_u_38.getIndent(p75) -- name: getIndent
	return p75._indent
end
function v_u_38.isBlank(p76) -- name: isBlank
	return p76._blank
end
function v_u_38.getActiveBlockParser(p77) -- name: getActiveBlockParser
	local v78 = p77._openBlockParsers
	return v78[#v78 - 1 + 1]._blockParser
end
function v_u_38.parseLine(p79, p80, p81) -- name: parseLine
	-- upvalues: (copy) v_u_16, (copy) v_u_3, (copy) v_u_15, (copy) v_u_12, (copy) v_u_34
	p79:setLine(p80, p81)
	local v82 = p79._openBlockParsers
	local v83 = 1
	for v84 = 1, #v82 - 1 do
		local v85 = v82[v84 + 1]
		local v86 = v85._blockParser
		p79:findNextNonSpace()
		local v87 = v86:tryContinue(p79)
		if v87 == nil then
			break
		end
		v85._sourceIndex = p79:getIndex()
		if v87:isFinalize() then
			p79:addSourceSpans()
			p79:closeBlockParsers(#v82 - v84)
			return
		end
		if v87:getNewIndex() == -1 then
			if v87:getNewColumn() ~= -1 then
				p79:setNewColumn(v87:getNewColumn())
			end
		else
			p79:setNewIndex(v87:getNewIndex())
		end
		v83 = v83 + 1
	end
	local v88 = #v82 - v83
	local v89 = v82[v83 - 1 + 1]._blockParser
	local v90 = false
	local v91 = p79._index
	local v92
	if v89:getBlock().kind == "Paragraph" then
		v92 = true
	else
		v92 = v89:isContainer()
	end
	while v92 do
		v91 = p79._index
		p79:findNextNonSpace()
		if p79:isBlank() or p79._indent < v_u_16.CODE_BLOCK_INDENT and v_u_3.isLetter(p79._line:getContent(), p79._nextNonSpace) then
			p79:setNewIndex(p79._nextNonSpace)
			break
		end
		local v93 = p79:findBlockStart(v89)
		if v93 == nil then
			p79:setNewIndex(p79._nextNonSpace)
			break
		end
		v90 = true
		local v94 = p79:getIndex()
		if v88 > 0 then
			p79:closeBlockParsers(v88)
			v88 = 0
		end
		if v93:getNewIndex() == -1 then
			if v93:getNewColumn() ~= -1 then
				p79:setNewColumn(v93:getNewColumn())
			end
		else
			p79:setNewIndex(v93:getNewIndex())
		end
		local v95 = nil
		if v93:getReplaceParagraphLines() >= 1 or v93:isReplaceActiveBlockParser() then
			local v96 = p79:getActiveBlockParser()
			if getmetatable(v96) == v_u_15 then
				local v97
				if v93:isReplaceActiveBlockParser() then
					v97 = v_u_12.MAX_VALUE
				else
					v97 = v93:getReplaceParagraphLines()
				end
				v95 = p79:replaceParagraphLines(v97, v96)
			elseif v93:isReplaceActiveBlockParser() then
				v95 = p79:prepareActiveBlockParserForReplacement(v96)
			end
		end
		for _, v98 in ipairs(v93:getBlockParsers()) do
			p79:addChild(v_u_34.new(v98, v94))
			if v95 ~= nil then
				v98:getBlock():setSourceSpans(v95)
			end
			v92 = v98:isContainer()
			v89 = v98
		end
	end
	if v90 or (p79:isBlank() or not p79:getActiveBlockParser():canHaveLazyContinuationLines()) then
		if v88 > 0 then
			p79:closeBlockParsers(v88)
		end
		if v89:isContainer() then
			if p79:isBlank() then
				p79:addSourceSpans()
			else
				local v99 = v_u_15.new(p79._linkReferenceDefinitions)
				p79:addChild(v_u_34.new(v99, v91))
				p79:addLine()
			end
		else
			p79:addLine()
			return
		end
	else
		v82[#v82 - 1 + 1]._sourceIndex = v91
		p79:addLine()
		return
	end
end
function v_u_38.setLine(p100, p101, p102) -- name: setLine
	-- upvalues: (copy) v_u_22, (copy) v_u_23, (copy) v_u_9, (copy) v_u_19, (copy) v_u_17
	p100._lineIndex = p100._lineIndex + 1
	p100._index = 0
	p100._column = 0
	p100._columnIsInTab = false
	if v_u_22(p101, "\0", 1, true) ~= nil then
		p101 = v_u_23(p101, "%z", "\239\191\189")
	end
	local v103
	if p100._includeSourceSpans == v_u_9.NONE then
		v103 = nil
	else
		v103 = v_u_19.of(p100._lineIndex, 0, p102, #p101)
	end
	p100._line = v_u_17.of(p101, v103)
end
function v_u_38.findNextNonSpace(p104) -- name: findNextNonSpace
	-- upvalues: (copy) v_u_21
	local v105 = p104._index
	local v106 = p104._column
	p104._blank = true
	local v107 = p104._line:getContent()
	local v108 = #v107
	while v105 < v108 do
		local v109 = v_u_21(v107, v105 + 1)
		if v109 == 32 then
			v105 = v105 + 1
			v106 = v106 + 1
		else
			if v109 ~= 9 then
				p104._blank = false
				break
			end
			v105 = v105 + 1
			v106 = v106 + (4 - v106 % 4)
		end
	end
	p104._nextNonSpace = v105
	p104._nextNonSpaceColumn = v106
	p104._indent = p104._nextNonSpaceColumn - p104._column
end
function v_u_38.setNewIndex(p110, p111) -- name: setNewIndex
	if p110._nextNonSpace <= p111 then
		p110._index = p110._nextNonSpace
		p110._column = p110._nextNonSpaceColumn
	end
	local v112 = #p110._line:getContent()
	while p110._index < p111 and p110._index ~= v112 do
		p110:advance()
	end
	p110._columnIsInTab = false
end
function v_u_38.setNewColumn(p113, p114) -- name: setNewColumn
	if p113._nextNonSpaceColumn <= p114 then
		p113._index = p113._nextNonSpace
		p113._column = p113._nextNonSpaceColumn
	end
	local v115 = #p113._line:getContent()
	while p113._column < p114 and p113._index ~= v115 do
		p113:advance()
	end
	if p114 < p113._column then
		p113._index = p113._index - 1
		p113._column = p114
		p113._columnIsInTab = true
	else
		p113._columnIsInTab = false
	end
end
function v_u_38.advance(p116) -- name: advance
	-- upvalues: (copy) v_u_21, (copy) v_u_16
	local v117 = v_u_21(p116._line:getContent(), p116._index + 1)
	p116._index = p116._index + 1
	if v117 == 9 then
		p116._column = p116._column + v_u_16.columnsToNextTabStop(p116._column)
	else
		p116._column = p116._column + 1
	end
end
function v_u_38.addLine(p118) -- name: addLine
	-- upvalues: (copy) v_u_25, (copy) v_u_16, (copy) v_u_24, (copy) v_u_9, (copy) v_u_17
	local v119 = p118._line
	local v120 = p118._index
	local v121
	if p118._columnIsInTab then
		local v122 = v120 + 1
		local v123 = v_u_25(v119:getContent(), v122 + 1, #v119:getContent())
		v121 = v_u_24(" ", (v_u_16.columnsToNextTabStop(p118._column))) .. v123
	elseif v120 == 0 then
		v121 = v119:getContent()
	else
		v121 = v_u_25(v119:getContent(), v120 + 1, #v119:getContent())
	end
	local v124 = nil
	if p118._includeSourceSpans == v_u_9.BLOCKS_AND_INLINES then
		local v125 = v119:getSourceSpan()
		if v120 < v125:getLength() then
			v124 = v125:subSpan(v120)
		end
	end
	p118:getActiveBlockParser():addLine(v_u_17.of(v121, v124))
	p118:addSourceSpans()
end
function v_u_38.addSourceSpans(p126) -- name: addSourceSpans
	-- upvalues: (copy) v_u_9
	if p126._includeSourceSpans ~= v_u_9.NONE then
		local v127 = p126._openBlockParsers
		local v128 = p126._line
		for v129 = 1, #v127 - 1 do
			local v130 = v127[v129 + 1]
			local v131 = v130._sourceIndex
			local v132 = p126._index
			local v133 = math.min(v131, v132)
			if #v128:getContent() - v133 == 0 then
				continue
			end
			v130._blockParser:addSourceSpan(v128:getSourceSpan():subSpan(v133))
		end
	end
end
function v_u_38.findBlockStart(p134, p135) -- name: findBlockStart
	-- upvalues: (copy) v_u_28
	if #p134._openBlockParsers > p134._maxOpenBlockParsers then
		return nil
	end
	local v136 = v_u_28.new(p135)
	for _, v137 in ipairs(p134._blockParserFactories) do
		local v138 = v137:tryStart(p134, v136)
		if v138 == nil then
			continue
		end
		return v138
	end
	return nil
end
function v_u_38.processInlines(p139) -- name: processInlines
	-- upvalues: (copy) v_u_11
	local v140 = v_u_11.new(p139._inlineContentParserFactories, p139._delimiterProcessors, p139._linkProcessors, p139._linkMarkers, p139._maxInlineNesting, p139._definitions, p139._enabledInlineTypes)
	local v141 = p139._inlineParserFactory:create(v140)
	for _, v142 in ipairs(p139._allBlockParsers) do
		v142:parseInlines(v141)
	end
end
function v_u_38.addChild(p143, p144) -- name: addChild
	while not p143:getActiveBlockParser():canContain(p144._blockParser:getBlock()) do
		p143:closeBlockParsers(1)
	end
	p143:getActiveBlockParser():getBlock():appendChild(p144._blockParser:getBlock())
	p143:activateBlockParser(p144)
end
function v_u_38.activateBlockParser(p145, p146) -- name: activateBlockParser
	local v147 = p145._openBlockParsers
	table.insert(v147, p146)
end
function v_u_38.deactivateBlockParser(p148) -- name: deactivateBlockParser
	return table.remove(p148._openBlockParsers)
end
function v_u_38.replaceParagraphLines(p149, p150, p151) -- name: replaceParagraphLines
	local v152 = p151:removeLines(p150)
	p149:closeBlockParsers(1)
	return v152
end
function v_u_38.prepareActiveBlockParserForReplacement(p153, p154) -- name: prepareActiveBlockParserForReplacement
	p153:deactivateBlockParser()
	p154:closeBlock()
	p154:getBlock():unlink()
	return p154:getBlock():getSourceSpans()
end
function v_u_38.finalizeAndProcess(p155) -- name: finalizeAndProcess
	p155:closeBlockParsers(#p155._openBlockParsers)
	p155:processInlines()
	return p155._documentBlockParser:getBlock()
end
function v_u_38.closeBlockParsers(p156, p157) -- name: closeBlockParsers
	for _ = 0, p157 - 1 do
		local v158 = p156:deactivateBlockParser()._blockParser
		p156:finalize(v158)
		local v159 = p156._allBlockParsers
		table.insert(v159, v158)
	end
end
function v_u_38.finalize(p160, p161) -- name: finalize
	p160:addDefinitionsFrom(p161)
	p161:closeBlock()
end
function v_u_38.addDefinitionsFrom(p162, p163) -- name: addDefinitionsFrom
	for _, v164 in ipairs(p163:getDefinitions()) do
		p162._definitions:addDefinitions(v164)
	end
end
return v_u_38