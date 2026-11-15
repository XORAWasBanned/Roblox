-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.BlockQuoteParser
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
local v_u_8 = string.byte
local v_u_9 = setmetatable({}, {
	["__index"] = v2
})
v_u_9.__index = v_u_9
function v_u_9.new() -- name: new
	-- upvalues: (copy) v_u_6, (copy) v_u_9
	local v10 = {
		["_block"] = v_u_6.BlockQuote()
	}
	local v11 = v_u_9
	return setmetatable(v10, v11)
end
function v_u_9.isContainer(_) -- name: isContainer
	return true
end
function v_u_9.canContain(_, _) -- name: canContain
	return true
end
function v_u_9.getBlock(p12) -- name: getBlock
	return p12._block
end
function v_u_9.tryContinue(_, p13) -- name: tryContinue
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_5, (copy) v_u_3
	local v14 = p13:getNextNonSpaceIndex()
	local v15 = p13:getLine():getContent()
	local v16
	if p13:getIndent() < v_u_7.CODE_BLOCK_INDENT and v14 < #v15 then
		v16 = v_u_8(v15, v14 + 1) == 62
	else
		v16 = false
	end
	if not v16 then
		return v_u_3.none()
	end
	local v17 = p13:getColumn() + p13:getIndent() + 1
	if v_u_5.isSpaceOrTab(p13:getLine():getContent(), v14 + 1) then
		v17 = v17 + 1
	end
	return v_u_3.atColumn(v17)
end
local v_u_18 = {}
v_u_18.__index = v_u_18
function v_u_18.new() -- name: new
	-- upvalues: (copy) v_u_18
	local v19 = v_u_18
	return setmetatable({}, v19)
end
function v_u_18.tryStart(_, p20, _) -- name: tryStart
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_5, (copy) v_u_4, (copy) v_u_9
	local v21 = p20:getNextNonSpaceIndex()
	local v22 = p20:getLine():getContent()
	local v23
	if p20:getIndent() < v_u_7.CODE_BLOCK_INDENT and v21 < #v22 then
		v23 = v_u_8(v22, v21 + 1) == 62
	else
		v23 = false
	end
	if not v23 then
		return v_u_4.none()
	end
	local v24 = p20:getColumn() + p20:getIndent() + 1
	if v_u_5.isSpaceOrTab(p20:getLine():getContent(), v21 + 1) then
		v24 = v24 + 1
	end
	return v_u_4.of(v_u_9.new()):atColumn(v24)
end
v_u_9.Factory = v_u_18
return v_u_9