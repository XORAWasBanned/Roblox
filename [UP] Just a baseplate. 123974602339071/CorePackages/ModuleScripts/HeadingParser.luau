-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.HeadingParser
local v1 = script:FindFirstAncestor("CommonMark")
local v2 = require(v1.parser.block.AbstractBlockParser)
local v_u_3 = require(v1.parser.block.BlockContinue)
require(v1.parser.block.BlockParserFactory)
local v_u_4 = require(v1.parser.block.BlockStart)
local v_u_5 = require(v1.text.Characters)
require(v1.parser.InlineParser)
require(v1.parser.block.MatchedBlockParser)
require(v1.node.Node)
local v_u_6 = require(v1.node.Nodes)
require(v1.parser.block.ParserState)
local v_u_7 = require(v1.internal.util.Parsing)
local v_u_8 = require(v1.parser.beta.Scanner)
require(v1.parser.SourceLine)
local v_u_9 = require(v1.parser.SourceLines)
local v_u_10 = string.byte
local v_u_11 = setmetatable({}, {
	["__index"] = v2
})
v_u_11.__index = v_u_11
function v_u_11.new(p12, p13) -- name: new
	-- upvalues: (copy) v_u_6, (copy) v_u_11
	local v14 = v_u_6.Heading()
	v14.level = p12
	local v15 = v_u_11
	return setmetatable({
		["_block"] = v14,
		["_content"] = p13
	}, v15)
end
function v_u_11.getBlock(p16) -- name: getBlock
	return p16._block
end
function v_u_11.tryContinue(_, _) -- name: tryContinue
	-- upvalues: (copy) v_u_3
	return v_u_3.none()
end
function v_u_11.parseInlines(p17, p18) -- name: parseInlines
	p18:parse(p17._content, p17._block)
end
local function v_u_29(p19) -- name: getAtxHeading
	-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_11
	local v20 = v_u_8.of(v_u_9.of(p19))
	local v21 = v20:matchMultiple(35)
	if v21 == 0 or v21 > 6 then
		return nil
	elseif v20:hasNext() then
		local v22 = v20:peek()
		if v22 == 32 or v22 == 9 then
			v20:whitespace()
			local v23 = v20:position()
			local v24 = v23
			local v25 = true
			while v20:hasNext() do
				local v26 = v20:peek()
				if v26 == 35 then
					if v25 then
						v20:matchMultiple(35)
						local v27 = v20:whitespace()
						if v20:hasNext() then
							v24 = v20:position()
						end
						v25 = v27 > 0
					else
						v20:next()
						v24 = v20:position()
					end
				elseif v26 == 32 or v26 == 9 then
					v20:next()
					v25 = true
				else
					v20:next()
					v24 = v20:position()
					v25 = false
				end
			end
			local v28 = v20:getSource(v23, v24)
			if v28:getContent() == "" then
				return v_u_11.new(v21, v_u_9.empty())
			else
				return v_u_11.new(v21, v28)
			end
		else
			return nil
		end
	else
		return v_u_11.new(v21, v_u_9.empty())
	end
end
local v_u_30 = {}
v_u_30.__index = v_u_30
function v_u_30.new() -- name: new
	-- upvalues: (copy) v_u_30
	local v31 = v_u_30
	return setmetatable({}, v31)
end
function v_u_30.tryStart(_, p32, p33) -- name: tryStart
	-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_10, (copy) v_u_29, (copy) v_u_5, (copy) v_u_11
	if p32:getIndent() >= v_u_7.CODE_BLOCK_INDENT then
		return v_u_4.none()
	end
	local v34 = p32:getLine()
	local v35 = p32:getNextNonSpaceIndex()
	if v_u_10(v34:getContent(), v35 + 1) == 35 then
		local v36 = v_u_29(v34:substring(v35, #v34:getContent()))
		if v36 ~= nil then
			return v_u_4.of(v36):atIndex(#v34:getContent())
		end
	end
	local v37 = v34:getContent()
	local v38 = v_u_10(v37, v35 + 1)
	local v39
	if v38 == 61 then
		local v40 = v35 + 1
		local v41 = v_u_5.skip(61, v37, v40, #v37)
		v39 = v_u_5.skipSpaceTab(v37, v41, #v37) >= #v37 and 1 or 0
	elseif v38 == 45 then
		local v42 = v35 + 1
		local v43 = v_u_5.skip(45, v37, v42, #v37)
		v39 = v_u_5.skipSpaceTab(v37, v43, #v37) >= #v37 and 2 or 0
	else
		v39 = 0
	end
	if v39 > 0 then
		local v44 = p33:getParagraphLines()
		if not v44:isEmpty() then
			return v_u_4.of(v_u_11.new(v39, v44)):atIndex(#v34:getContent()):replaceParagraphLines(#v44:getLines())
		end
	end
	return v_u_4.none()
end
v_u_11.Factory = v_u_30
return v_u_11