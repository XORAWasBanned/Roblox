-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.IndentedCodeBlockParser
local v1 = script:FindFirstAncestor("CommonMark")
local v2 = require(v1.parser.block.AbstractBlockParser)
local v_u_3 = require(v1.parser.block.BlockContinue)
require(v1.parser.block.BlockParserFactory)
local v_u_4 = require(v1.parser.block.BlockStart)
local v_u_5 = require(v1.text.Characters)
require(v1.parser.block.MatchedBlockParser)
require(v1.node.Node)
local v_u_6 = require(v1.node.Nodes)
require(v1.parser.block.ParserState)
local v_u_7 = require(v1.internal.util.Parsing)
require(v1.parser.SourceLine)
local v_u_8 = setmetatable({}, {
	["__index"] = v2
})
v_u_8.__index = v_u_8
function v_u_8.new() -- name: new
	-- upvalues: (copy) v_u_6, (copy) v_u_8
	local v9 = {
		["_block"] = v_u_6.IndentedCodeBlock(),
		["_lines"] = {}
	}
	local v10 = v_u_8
	return setmetatable(v9, v10)
end
function v_u_8.getBlock(p11) -- name: getBlock
	return p11._block
end
function v_u_8.tryContinue(_, p12) -- name: tryContinue
	-- upvalues: (copy) v_u_7, (copy) v_u_3
	if p12:getIndent() >= v_u_7.CODE_BLOCK_INDENT then
		return v_u_3.atColumn(p12:getColumn() + v_u_7.CODE_BLOCK_INDENT)
	elseif p12:isBlank() then
		return v_u_3.atIndex(p12:getNextNonSpaceIndex())
	else
		return v_u_3.none()
	end
end
function v_u_8.addLine(p13, p14) -- name: addLine
	local v15 = p13._lines
	table.insert(v15, p14:getContent())
end
function v_u_8.closeBlock(p16) -- name: closeBlock
	-- upvalues: (copy) v_u_5
	local v17 = p16._lines
	local v18 = #v17 - 1
	while v18 >= 0 and v_u_5.isBlank(v17[v18 + 1]) do
		v18 = v18 - 1
	end
	local v19 = 0
	local v20 = {}
	for v21 = 0, v18 do
		local v22 = v19 + 1
		v20[v22] = v17[v21 + 1]
		v19 = v22 + 1
		v20[v19] = "\n"
	end
	local v23 = table.concat(v20)
	p16._block.literal = v23
end
local v_u_24 = {}
v_u_24.__index = v_u_24
function v_u_24.new() -- name: new
	-- upvalues: (copy) v_u_24
	local v25 = v_u_24
	return setmetatable({}, v25)
end
function v_u_24.tryStart(_, p26, _) -- name: tryStart
	-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_8
	if p26:getIndent() >= v_u_7.CODE_BLOCK_INDENT and (not p26:isBlank() and p26:getActiveBlockParser():getBlock().kind ~= "Paragraph") then
		return v_u_4.of(v_u_8.new()):atColumn(p26:getColumn() + v_u_7.CODE_BLOCK_INDENT)
	else
		return v_u_4.none()
	end
end
v_u_8.Factory = v_u_24
return v_u_8