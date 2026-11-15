-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.inline.EntityInlineParser
local v1 = script:FindFirstAncestor("CommonMark")
local v2 = require(v1.text.AsciiMatcher)
require(v1.text.CharMatcher)
local v_u_3 = require(v1.internal.util.Html5Entities)
require(v1.parser.beta.InlineContentParser)
require(v1.parser.beta.InlineContentParserFactory)
require(v1.parser.beta.InlineParserState)
local v_u_4 = require(v1.node.Nodes)
local v_u_5 = require(v1.parser.beta.ParsedInline)
require(v1.parser.beta.Position)
require(v1.parser.beta.Scanner)
local _ = string.byte
local v_u_6 = {}
v_u_6.__index = v_u_6
local v_u_7 = v2.builder():range(48, 57):range(65, 70):range(97, 102):build()
local v_u_8 = v2.builder():range(48, 57):build()
local v_u_9 = v2.builder():range(65, 90):range(97, 122):build()
local v_u_10 = v_u_9:newBuilder():range(48, 57):build()
function v_u_6.new() -- name: new
	-- upvalues: (copy) v_u_6
	local v11 = v_u_6
	return setmetatable({}, v11)
end
function v_u_6.tryParse(p12, p13) -- name: tryParse
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_5
	local v14 = p13:scanner()
	local v15 = v14:position()
	v14:next()
	local v16 = v14:peek()
	if v16 == 35 then
		v14:next()
		if v14:nextChar(120) or v14:nextChar(88) then
			local v17 = v14:match(v_u_7)
			if v17 >= 1 and (v17 <= 6 and v14:nextChar(59)) then
				return p12:entity(v14, v15)
			end
		else
			local v18 = v14:match(v_u_8)
			if v18 >= 1 and (v18 <= 7 and v14:nextChar(59)) then
				return p12:entity(v14, v15)
			end
		end
	elseif v_u_9:matches(v16) then
		v14:match(v_u_10)
		if v14:nextChar(59) then
			return p12:entity(v14, v15)
		end
	end
	return v_u_5.none()
end
function v_u_6.entity(_, p19, p20) -- name: entity
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_3
	local v21 = p19:getSource(p20, p19:position()):getContent()
	return v_u_5.of(v_u_4.Text(v_u_3.entityToString(v21)), p19:position())
end
local v_u_22 = {}
v_u_22.__index = v_u_22
function v_u_22.new() -- name: new
	-- upvalues: (copy) v_u_22
	local v23 = v_u_22
	return setmetatable({}, v23)
end
function v_u_22.getTriggerCharacters(_) -- name: getTriggerCharacters
	return {
		[38] = true
	}
end
function v_u_22.create(_) -- name: create
	-- upvalues: (copy) v_u_6
	return v_u_6.new()
end
v_u_6.Factory = v_u_22
return v_u_6