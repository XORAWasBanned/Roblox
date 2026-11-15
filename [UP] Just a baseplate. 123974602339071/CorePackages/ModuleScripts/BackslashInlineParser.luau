-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.inline.BackslashInlineParser
local v1 = script:FindFirstAncestor("CommonMark")
local v2 = require(v1.internal.util.Escaping)
require(v1.parser.beta.InlineContentParser)
require(v1.parser.beta.InlineContentParserFactory)
require(v1.parser.beta.InlineParserState)
local v_u_3 = require(v1.node.Nodes)
local v_u_4 = require(v1.parser.beta.ParsedInline)
local _ = string.byte
local v_u_5 = string.char
local v_u_6 = string.find
local v_u_7 = {}
v_u_7.__index = v_u_7
local v_u_8 = "^" .. v2.ESCAPABLE .. "$"
function v_u_7.new(p9) -- name: new
	-- upvalues: (copy) v_u_7
	local v10 = {
		["_hardLineBreakEnabled"] = p9 ~= false
	}
	local v11 = v_u_7
	return setmetatable(v10, v11)
end
function v_u_7.tryParse(p12, p13) -- name: tryParse
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_6, (copy) v_u_5, (copy) v_u_8
	local v14 = p13:scanner()
	v14:next()
	local v15 = v14:peek()
	if v15 == 10 and p12._hardLineBreakEnabled then
		v14:next()
		return v_u_4.of(v_u_3.HardLineBreak(), v14:position())
	end
	if v_u_6(v_u_5(v15), v_u_8) == nil then
		return v_u_4.of(v_u_3.Text("\\"), v14:position())
	end
	v14:next()
	return v_u_4.of(v_u_3.Text((v_u_5(v15))), v14:position())
end
local v_u_16 = {}
v_u_16.__index = v_u_16
function v_u_16.new(p17) -- name: new
	-- upvalues: (copy) v_u_16
	local v18 = v_u_16
	return setmetatable({
		["_hardLineBreakEnabled"] = p17
	}, v18)
end
function v_u_16.getTriggerCharacters(_) -- name: getTriggerCharacters
	return {
		[92] = true
	}
end
function v_u_16.create(p19) -- name: create
	-- upvalues: (copy) v_u_7
	return v_u_7.new(p19._hardLineBreakEnabled)
end
v_u_7.Factory = v_u_16
return v_u_7