-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.inline.BackticksInlineParser
local v1 = script:FindFirstAncestor("CommonMark")
local v_u_2 = require(v1.text.Characters)
require(v1.parser.beta.InlineContentParser)
require(v1.parser.beta.InlineContentParserFactory)
require(v1.parser.beta.InlineParserState)
local v_u_3 = require(v1.node.Nodes)
local v_u_4 = require(v1.parser.beta.ParsedInline)
require(v1.parser.beta.Position)
local v_u_5 = string.byte
local v_u_6 = string.gsub
local v_u_7 = string.sub
local v_u_8 = {}
v_u_8.__index = v_u_8
function v_u_8.new() -- name: new
	-- upvalues: (copy) v_u_8
	local v9 = v_u_8
	return setmetatable({
		["_backtickPositions"] = nil,
		["_scannedToEnd"] = false,
		["_backtickPositions"] = {}
	}, v9)
end
function v_u_8.tryParse(p10, p11) -- name: tryParse
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_6, (copy) v_u_5, (copy) v_u_2, (copy) v_u_7
	local v12 = p11:scanner()
	local v13 = v12:position()
	local v14 = v12:matchMultiple(96)
	local v15 = v12:position()
	if p10._scannedToEnd then
		local v16 = p10._backtickPositions[v14]
		if v16 == nil or v16:compareTo(v13) <= 0 then
			local v17 = v_u_3.Text(v12:getSource(v13, v15):getContent())
			return v_u_4.of(v17, v15)
		end
	end
	if v12:findChar(96) <= 0 then
		p10._scannedToEnd = true
		local v18 = v_u_3.Text(v12:getSource(v13, v15):getContent())
		return v_u_4.of(v18, v15)
	end
	local v19 = v12:position()
	local v20 = v12:matchMultiple(96)
	p10._backtickPositions[v20] = v19
	if v20 ~= v14 then
		continue
	end
	local v21 = v_u_3.Code()
	local v22 = v_u_6(v12:getSource(v15, v19):getContent(), "\n", " ")
	if #v22 >= 3 and (v_u_5(v22, 1) == 32 and (v_u_5(v22, #v22) == 32 and v_u_2.hasNonSpace(v22))) then
		v22 = v_u_7(v22, 2, #v22 - 1)
	end
	v21.literal = v22
	return v_u_4.of(v21, v12:position())
end
local v_u_23 = {}
v_u_23.__index = v_u_23
function v_u_23.new() -- name: new
	-- upvalues: (copy) v_u_23
	local v24 = v_u_23
	return setmetatable({}, v24)
end
function v_u_23.getTriggerCharacters(_) -- name: getTriggerCharacters
	return {
		[96] = true
	}
end
function v_u_23.create(_) -- name: create
	-- upvalues: (copy) v_u_8
	return v_u_8.new()
end
v_u_8.Factory = v_u_23
return v_u_8