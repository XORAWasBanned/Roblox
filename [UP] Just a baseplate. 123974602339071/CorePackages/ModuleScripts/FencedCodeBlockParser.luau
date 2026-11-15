-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.FencedCodeBlockParser
local v1 = script:FindFirstAncestor("CommonMark")
local v2 = require(v1.parser.block.AbstractBlockParser)
local v_u_3 = require(v1.parser.block.BlockContinue)
require(v1.parser.block.BlockParserFactory)
local v_u_4 = require(v1.parser.block.BlockStart)
local v_u_5 = require(v1.text.Characters)
local v6 = require(v1.internal.util.Escaping)
require(v1.parser.block.MatchedBlockParser)
local v_u_7 = require(v1.node.Nodes)
require(v1.parser.block.ParserState)
local v_u_8 = require(v1.internal.util.Parsing)
require(v1.parser.SourceLine)
local v_u_9 = string.byte
local v_u_10 = string.char
local v_u_11 = string.sub
local v_u_12 = v6.unescapeString
local v_u_13 = setmetatable({}, {
	["__index"] = v2
})
v_u_13.__index = v_u_13
function v_u_13.new(p14, p15, p16) -- name: new
	-- upvalues: (copy) v_u_7, (copy) v_u_10, (copy) v_u_13
	local v17 = v_u_7.FencedCodeBlock()
	v17.fenceCharacter = v_u_10(p14)
	v17:setOpeningFenceLength(p15)
	v17.fenceIndent = p16
	local v18 = v_u_13
	return setmetatable({
		["_block"] = nil,
		["_fenceChar"] = nil,
		["_openingFenceLength"] = nil,
		["_firstLine"] = nil,
		["_otherLines"] = nil,
		["_block"] = v17,
		["_fenceChar"] = p14,
		["_openingFenceLength"] = p15,
		["_otherLines"] = {}
	}, v18)
end
function v_u_13.getBlock(p19) -- name: getBlock
	return p19._block
end
function v_u_13.tryContinue(p20, p21) -- name: tryContinue
	-- upvalues: (copy) v_u_8, (copy) v_u_3, (copy) v_u_9
	local v22 = p21:getNextNonSpaceIndex()
	local v23 = p21:getIndex()
	local v24 = p21:getLine():getContent()
	if p21:getIndent() < v_u_8.CODE_BLOCK_INDENT and (v22 < #v24 and p20:tryClosing(v24, v22)) then
		return v_u_3.finished()
	end
	local v25 = p20._block.fenceIndent
	local v26 = #v24
	while v25 > 0 and (v23 < v26 and v_u_9(v24, v23 + 1) == 32) do
		v23 = v23 + 1
		v25 = v25 - 1
	end
	return v_u_3.atIndex(v23)
end
function v_u_13.addLine(p27, p28) -- name: addLine
	if p27._firstLine == nil then
		p27._firstLine = p28:getContent()
	else
		local v29 = p27._otherLines
		table.insert(v29, p28:getContent())
		local v30 = p27._otherLines
		table.insert(v30, "\n")
	end
end
local function v_u_34(p31) -- name: trim
	-- upvalues: (copy) v_u_9, (copy) v_u_11
	local v32 = #p31
	local v33 = 0
	while v33 < v32 and v_u_9(p31, v33 + 1) <= 32 do
		v33 = v33 + 1
	end
	while v33 < v32 and v_u_9(p31, v32 - 1 + 1) <= 32 do
		v32 = v32 - 1
	end
	return v_u_11(p31, v33 + 1, v32)
end
function v_u_13.closeBlock(p35) -- name: closeBlock
	-- upvalues: (copy) v_u_12, (copy) v_u_34
	p35._block.info = v_u_12((v_u_34(p35._firstLine)))
	p35._block.literal = table.concat(p35._otherLines)
end
local function v_u_43(p36, p37, p38) -- name: checkOpener
	-- upvalues: (copy) v_u_9, (copy) v_u_5, (copy) v_u_13
	local v39 = 0
	local v40 = 0
	for v41 = p37, #p36 - 1 do
		local v42 = v_u_9(p36, v41 + 1)
		if v42 == 96 then
			v39 = v39 + 1
		else
			if v42 ~= 126 then
				break
			end
			v40 = v40 + 1
		end
	end
	if v39 >= 3 and v40 == 0 then
		if v_u_5.find(96, p36, p37 + v39) == -1 then
			return v_u_13.new(96, v39, p38)
		else
			return nil
		end
	elseif v40 >= 3 and v39 == 0 then
		return v_u_13.new(126, v40, p38)
	else
		return nil
	end
end
local v_u_44 = {}
v_u_44.__index = v_u_44
function v_u_44.new() -- name: new
	-- upvalues: (copy) v_u_44
	local v45 = v_u_44
	return setmetatable({}, v45)
end
function v_u_44.tryStart(_, p46, _) -- name: tryStart
	-- upvalues: (copy) v_u_8, (copy) v_u_4, (copy) v_u_43
	local v47 = p46:getIndent()
	if v_u_8.CODE_BLOCK_INDENT <= v47 then
		return v_u_4.none()
	else
		local v48 = p46:getNextNonSpaceIndex()
		local v49 = v_u_43(p46:getLine():getContent(), v48, v47)
		if v49 == nil then
			return v_u_4.none()
		else
			return v_u_4.of(v49):atIndex(v48 + v49._block:getOpeningFenceLength())
		end
	end
end
v_u_13.Factory = v_u_44
function v_u_13.tryClosing(p50, p51, p52) -- name: tryClosing
	-- upvalues: (copy) v_u_5
	local v53 = v_u_5.skip(p50._fenceChar, p51, p52, #p51) - p52
	if v53 < p50._openingFenceLength then
		return false
	end
	if v_u_5.skipSpaceTab(p51, p52 + v53, #p51) ~= #p51 then
		return false
	end
	p50._block:setClosingFenceLength(v53)
	return true
end
return v_u_13