-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.ThematicBreakParser
local v1 = script:FindFirstAncestor("CommonMark")
local v2 = require(v1.parser.block.AbstractBlockParser)
local v_u_3 = require(v1.parser.block.BlockContinue)
require(v1.parser.block.BlockParserFactory)
local v_u_4 = require(v1.parser.block.BlockStart)
require(v1.parser.block.MatchedBlockParser)
local v_u_5 = require(v1.node.Nodes)
require(v1.parser.block.ParserState)
local v_u_6 = string.byte
local v_u_7 = string.sub
local v_u_8 = setmetatable({}, {
	["__index"] = v2
})
v_u_8.__index = v_u_8
function v_u_8.new(p9) -- name: new
	-- upvalues: (copy) v_u_5, (copy) v_u_8
	local v10 = v_u_5.ThematicBreak()
	v10.literal = p9
	local v11 = v_u_8
	return setmetatable({
		["_block"] = v10
	}, v11)
end
function v_u_8.getBlock(p12) -- name: getBlock
	return p12._block
end
function v_u_8.tryContinue(_, _) -- name: tryContinue
	-- upvalues: (copy) v_u_3
	return v_u_3.none()
end
local function v_u_21(p13, p14) -- name: isThematicBreak
	-- upvalues: (copy) v_u_6
	local v15 = 0
	local v16 = 0
	local v17 = 0
	for v18 = p14, #p13 - 1 do
		local v19 = v_u_6(p13, v18 + 1)
		if v19 == 45 then
			v17 = v17 + 1
		elseif v19 == 95 then
			v16 = v16 + 1
		else
			if v19 ~= 42 then
				if v19 == 32 or v19 == 9 then
					continue
				end
				return false
			end
			v15 = v15 + 1
		end
	end
	local v20
	if v17 >= 3 and (v16 == 0 and v15 == 0) or v16 >= 3 and (v17 == 0 and v15 == 0) then
		v20 = true
	elseif v15 >= 3 and v17 == 0 then
		v20 = v16 == 0
	else
		v20 = false
	end
	return v20
end
local v_u_22 = {}
v_u_22.__index = v_u_22
function v_u_22.new() -- name: new
	-- upvalues: (copy) v_u_22
	local v23 = v_u_22
	return setmetatable({}, v23)
end
function v_u_22.tryStart(_, p24, _) -- name: tryStart
	-- upvalues: (copy) v_u_4, (copy) v_u_21, (copy) v_u_7, (copy) v_u_8
	if p24:getIndent() >= 4 then
		return v_u_4.none()
	end
	local v25 = p24:getNextNonSpaceIndex()
	local v26 = p24:getLine():getContent()
	if not v_u_21(v26, v25) then
		return v_u_4.none()
	end
	local v27 = v_u_7(v26, p24:getIndex() + 1, #v26)
	return v_u_4.of(v_u_8.new(v27)):atIndex(#v26)
end
v_u_8.Factory = v_u_22
return v_u_8