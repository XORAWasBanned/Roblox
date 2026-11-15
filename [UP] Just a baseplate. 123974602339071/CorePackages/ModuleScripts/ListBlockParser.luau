-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.ListBlockParser
local v1 = script:FindFirstAncestor("CommonMark")
local v2 = require(v1.parser.block.AbstractBlockParser)
local v_u_3 = require(v1.parser.block.BlockContinue)
require(v1.parser.block.BlockParserFactory)
local v_u_4 = require(v1.parser.block.BlockStart)
local v_u_5 = require(v1.internal.ListItemParser)
require(v1.parser.block.MatchedBlockParser)
require(v1.node.Node)
local v_u_6 = require(v1.node.Nodes)
require(v1.parser.block.ParserState)
local v_u_7 = require(v1.internal.util.Parsing)
local v_u_8 = string.byte
local v_u_9 = string.char
local v_u_10 = string.sub
local v_u_11 = setmetatable({}, {
	["__index"] = v2
})
v_u_11.__index = v_u_11
function v_u_11.new(p12) -- name: new
	-- upvalues: (copy) v_u_11
	local v13 = v_u_11
	return setmetatable({
		["_block"] = nil,
		["_hadBlankLine"] = false,
		["_linesAfterBlank"] = 0,
		["_block"] = p12
	}, v13)
end
function v_u_11.isContainer(_) -- name: isContainer
	return true
end
function v_u_11.canContain(p14, p15) -- name: canContain
	if p15.kind ~= "ListItem" then
		return false
	end
	if p14._hadBlankLine and p14._linesAfterBlank == 1 then
		p14._block.tight = false
		p14._hadBlankLine = false
	end
	return true
end
function v_u_11.getBlock(p16) -- name: getBlock
	return p16._block
end
function v_u_11.tryContinue(p17, p18) -- name: tryContinue
	-- upvalues: (copy) v_u_3
	if p18:isBlank() then
		p17._hadBlankLine = true
		p17._linesAfterBlank = 0
	elseif p17._hadBlankLine then
		p17._linesAfterBlank = p17._linesAfterBlank + 1
	end
	return v_u_3.atIndex(p18:getIndex())
end
local v_u_19 = {}
v_u_19.__index = v_u_19
function v_u_19.new(p20, p21) -- name: new
	-- upvalues: (copy) v_u_19
	local v22 = v_u_19
	return setmetatable({
		["listBlock"] = p20,
		["contentColumn"] = p21
	}, v22)
end
local v_u_23 = {}
v_u_23.__index = v_u_23
function v_u_23.new(p24, p25) -- name: new
	-- upvalues: (copy) v_u_23
	local v26 = v_u_23
	return setmetatable({
		["listBlock"] = p24,
		["indexAfterMarker"] = p25
	}, v26)
end
local function v_u_37(p27, p28) -- name: parseOrderedList
	-- upvalues: (copy) v_u_8, (copy) v_u_10, (copy) v_u_6, (copy) v_u_9, (copy) v_u_23
	local v29 = 0
	for v30 = p28, #p27 - 1 do
		local v31 = v_u_8(p27, v30 + 1)
		if v31 >= 48 and v31 <= 57 then
			v29 = v29 + 1
			if v29 <= 9 then
				continue
			end
			return nil
		else
			if v31 ~= 46 and v31 ~= 41 then
				return nil
			end
			if v29 >= 1 then
				local v32 = v30 + 1
				local v33
				if v32 < #p27 then
					local v34 = v_u_8(p27, v32 + 1)
					v33 = v34 == 32 or v34 == 9
				else
					v33 = true
				end
				if v33 then
					local v35 = v_u_10(p27, p28 + 1, v30)
					local v36 = v_u_6.OrderedList()
					v36.markerStartNumber = tonumber(v35)
					v36.markerDelimiter = v_u_9(v31)
					return v_u_23.new(v36, v30 + 1)
				end
			end
			return nil
		end
	end
	return nil
end
local function v_u_45(p38, p39) -- name: parseListMarker
	-- upvalues: (copy) v_u_8, (copy) v_u_6, (copy) v_u_9, (copy) v_u_23, (copy) v_u_37
	local v40 = v_u_8(p38, p39 + 1)
	if v40 ~= 45 and (v40 ~= 43 and v40 ~= 42) then
		return v_u_37(p38, p39)
	end
	local v41 = p39 + 1
	local v42
	if v41 < #p38 then
		local v43 = v_u_8(p38, v41 + 1)
		v42 = v43 == 32 or v43 == 9
	else
		v42 = true
	end
	if not v42 then
		return nil
	end
	local v44 = v_u_6.BulletList()
	v44.marker = v_u_9(v40)
	return v_u_23.new(v44, p39 + 1)
end
local function v_u_58(p46, p47, p48, p49) -- name: parseList
	-- upvalues: (copy) v_u_45, (copy) v_u_8, (copy) v_u_7, (copy) v_u_19
	local v50 = v_u_45(p46, p47)
	if v50 == nil then
		return nil
	end
	local v51 = v50.listBlock
	local v52 = v50.indexAfterMarker
	local v53 = p48 + (v52 - p47)
	local v54 = v53
	local v55 = false
	for v56 = v52, #p46 - 1 do
		local v57 = v_u_8(p46, v56 + 1)
		if v57 == 9 then
			v54 = v54 + v_u_7.columnsToNextTabStop(v54)
		else
			if v57 ~= 32 then
				v55 = true
				break
			end
			v54 = v54 + 1
		end
	end
	if p49 then
		if v51.kind == "OrderedList" and v51.markerStartNumber ~= 1 then
			return nil
		end
		if not v55 then
			return nil
		end
	end
	if not v55 or v54 - v53 > v_u_7.CODE_BLOCK_INDENT then
		v54 = v53 + 1
	end
	return v_u_19.new(v51, v54)
end
local v_u_59 = {}
v_u_59.__index = v_u_59
function v_u_59.new() -- name: new
	-- upvalues: (copy) v_u_59
	local v60 = v_u_59
	return setmetatable({}, v60)
end
function v_u_59.tryStart(_, p61, p62) -- name: tryStart
	-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_58, (copy) v_u_5, (copy) v_u_11
	local v63 = p62:getMatchedBlockParser()
	if p61:getIndent() >= v_u_7.CODE_BLOCK_INDENT then
		return v_u_4.none()
	end
	local v64 = p61:getNextNonSpaceIndex()
	local v65 = p61:getColumn() + p61:getIndent()
	local v66 = not p62:getParagraphLines():isEmpty()
	local v67 = v_u_58(p61:getLine():getContent(), v64, v65, v66)
	if v67 == nil then
		return v_u_4.none()
	end
	local v68 = v67.contentColumn
	local v69 = v_u_5.new(p61:getIndent(), v68 - p61:getColumn())
	if getmetatable(v63) == v_u_11 then
		local v70 = v63:getBlock()
		local v71 = v67.listBlock
		local v72
		if v70.kind == "BulletList" and v71.kind == "BulletList" then
			v72 = v70.marker == v71.marker
		elseif v70.kind == "OrderedList" and v71.kind == "OrderedList" then
			v72 = v70.markerDelimiter == v71.markerDelimiter
		else
			v72 = false
		end
		if v72 then
			return v_u_4.of(v69):atColumn(v68)
		end
	end
	local v73 = v_u_11.new(v67.listBlock)
	v67.listBlock.tight = true
	return v_u_4.of(v73, v69):atColumn(v68)
end
v_u_11.Factory = v_u_59
return v_u_11