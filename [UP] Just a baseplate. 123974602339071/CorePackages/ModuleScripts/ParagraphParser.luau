-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.ParagraphParser
local v1 = script:FindFirstAncestor("CommonMark")
local v2 = require(v1.parser.block.AbstractBlockParser)
local v_u_3 = require(v1.parser.block.BlockContinue)
local v_u_4 = require(v1.node.DefinitionMap)
require(v1.parser.InlineParser)
local v_u_5 = require(v1.internal.LinkReferenceDefinitionParser)
require(v1.node.Node)
local v_u_6 = require(v1.node.Nodes)
require(v1.parser.block.ParserState)
require(v1.parser.SourceLine)
require(v1.parser.SourceLines)
require(v1.node.SourceSpan)
local v_u_7 = setmetatable({}, {
	["__index"] = v2
})
v_u_7.__index = v_u_7
function v_u_7.new(p8) -- name: new
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_7
	local v9 = {
		["_block"] = v_u_6.Paragraph(),
		["_linkReferenceDefinitionParser"] = v_u_5.new(p8)
	}
	local v10 = v_u_7
	return setmetatable(v9, v10)
end
function v_u_7.canHaveLazyContinuationLines(_) -- name: canHaveLazyContinuationLines
	return true
end
function v_u_7.getBlock(p11) -- name: getBlock
	return p11._block
end
function v_u_7.tryContinue(_, p12) -- name: tryContinue
	-- upvalues: (copy) v_u_3
	if p12:isBlank() then
		return v_u_3.none()
	else
		return v_u_3.atIndex(p12:getIndex())
	end
end
function v_u_7.addLine(p13, p14) -- name: addLine
	p13._linkReferenceDefinitionParser:parse(p14)
end
function v_u_7.addSourceSpan(p15, p16) -- name: addSourceSpan
	p15._linkReferenceDefinitionParser:addSourceSpan(p16)
end
function v_u_7.getDefinitions(p17) -- name: getDefinitions
	-- upvalues: (copy) v_u_4
	local v18 = v_u_4.new("LinkReferenceDefinition")
	for _, v19 in ipairs(p17._linkReferenceDefinitionParser:getDefinitions()) do
		v18:putIfAbsent(v19.label, v19)
	end
	return table.freeze({ v18 })
end
function v_u_7.closeBlock(p20) -- name: closeBlock
	for _, v21 in ipairs(p20._linkReferenceDefinitionParser:getDefinitions()) do
		p20._block:insertBefore(v21)
	end
	if p20._linkReferenceDefinitionParser:getParagraphLines():isEmpty() then
		p20._block:unlink()
	else
		p20._block:setSourceSpans(p20._linkReferenceDefinitionParser:getParagraphSourceSpans())
	end
end
function v_u_7.parseInlines(p22, p23) -- name: parseInlines
	local v24 = p22._linkReferenceDefinitionParser:getParagraphLines()
	if not v24:isEmpty() then
		p23:parse(v24, p22._block)
	end
end
function v_u_7.getParagraphLines(p25) -- name: getParagraphLines
	return p25._linkReferenceDefinitionParser:getParagraphLines()
end
function v_u_7.removeLines(p26, p27) -- name: removeLines
	return p26._linkReferenceDefinitionParser:removeLines(p27)
end
return v_u_7