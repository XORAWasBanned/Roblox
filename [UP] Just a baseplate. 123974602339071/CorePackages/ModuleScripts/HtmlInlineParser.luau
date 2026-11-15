-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.inline.HtmlInlineParser
local v1 = script:FindFirstAncestor("CommonMark")
local v2 = require(v1.text.AsciiMatcher)
require(v1.text.CharMatcher)
require(v1.parser.beta.InlineContentParser)
require(v1.parser.beta.InlineContentParserFactory)
require(v1.parser.beta.InlineParserState)
local v_u_3 = require(v1.node.Nodes)
local v_u_4 = require(v1.parser.beta.ParsedInline)
require(v1.parser.beta.Position)
require(v1.parser.beta.Scanner)
local _ = string.byte
local v_u_5 = {}
v_u_5.__index = v_u_5
local v_u_6 = v2.builder():range(65, 90):range(97, 122):build()
local v_u_7 = v_u_6:newBuilder():range(48, 57):c(45):build()
local v_u_8 = v_u_6:newBuilder():c(95):c(58):build()
local v_u_9 = v_u_8:newBuilder():range(48, 57):c(46):c(45):build()
local v_u_10 = v2.builder():c(32):c(9):c(10):c(11):c(12):c(13):c(34):c(39):c(61):c(60):c(62):c(96):build()
local function v_u_15(p11, p12) -- name: htmlInline
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v13 = p12:getSource(p11, p12:position()):getContent()
	local v14 = v_u_3.HtmlInline()
	v14.literal = v13
	return v_u_4.of(v14, p12:position())
end
local function v_u_20(p16, p17) -- name: tryOpenTag
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_9
	p16:next()
	p16:match(v_u_7)
	local v18
	if p16:whitespace() >= 1 then
		v18 = true
	else
		v18 = false
	end
	while v18 and p16:match(v_u_8) >= 1 do
		p16:match(v_u_9)
		v18 = p16:whitespace() >= 1
		if not p16:nextChar(61) then
			continue
		end
		p16:whitespace()
		local v19 = p16:peek()
		if v19 == 39 then
			p16:next()
			if p16:findChar(39) < 0 then
				return false
			end
			p16:next()
		elseif v19 == 34 then
			p16:next()
			if p16:findChar(34) < 0 then
				return false
			end
			p16:next()
		elseif p16:findMatcher(p17) <= 0 then
			return false
		end
		v18 = p16:whitespace() >= 1
	end
	p16:nextChar(47)
	return p16:nextChar(62)
end
function v_u_5.new() -- name: new
	-- upvalues: (copy) v_u_5
	local v21 = v_u_5
	return setmetatable({
		["_noProcessingInstructionEnd"] = false,
		["_noCommentEnd"] = false,
		["_noCdataEnd"] = false,
		["_noDeclarationEnd"] = false
	}, v21)
end
function v_u_5.tryParse(p22, p23) -- name: tryParse
	-- upvalues: (copy) v_u_6, (copy) v_u_20, (copy) v_u_10, (copy) v_u_15, (copy) v_u_7, (copy) v_u_6, (copy) v_u_4
	local v24 = p23:scanner()
	local v25 = v24:position()
	v24:next()
	local v26 = v24:peek()
	if v_u_6:matches(v26) then
		if v_u_20(v24, v_u_10) then
			return v_u_15(v25, v24)
		end
	elseif v26 == 47 then
		v24:next()
		local v27
		if v24:match(v_u_6) >= 1 then
			v24:match(v_u_7)
			v24:whitespace()
			v27 = v24:nextChar(62)
		else
			v27 = false
		end
		if v27 then
			return v_u_15(v25, v24)
		end
	elseif v26 == 63 then
		if p22:tryProcessingInstruction(v24) then
			return v_u_15(v25, v24)
		end
	elseif v26 == 33 then
		v24:next()
		local v28 = v24:peek()
		if v28 == 45 then
			if p22:tryComment(v24) then
				return v_u_15(v25, v24)
			end
		elseif v28 == 91 then
			if p22:tryCdata(v24) then
				return v_u_15(v25, v24)
			end
		elseif v_u_6:matches(v28) and p22:tryDeclaration(v24) then
			return v_u_15(v25, v24)
		end
	end
	return v_u_4.none()
end
function v_u_5.tryProcessingInstruction(p29, p30) -- name: tryProcessingInstruction
	if p29._noProcessingInstructionEnd then
		return false
	end
	p30:next()
	local v31 = p30:findChar(63)
	if v31 <= 0 then
		p29._noProcessingInstructionEnd = v31 < 0
		return false
	end
	p30:next()
	if not p30:nextChar(62) then
		continue
	end
	return true
end
function v_u_5.tryComment(p32, p33) -- name: tryComment
	if p32._noCommentEnd then
		return false
	end
	p33:next()
	if not p33:nextChar(45) then
		return false
	end
	if p33:nextChar(62) or p33:nextString("->") then
		return true
	end
	while p33:findChar(45) >= 0 do
		if p33:nextString("-->") then
			return true
		end
		p33:next()
	end
	p32._noCommentEnd = true
	return false
end
function v_u_5.tryCdata(p34, p35) -- name: tryCdata
	if p34._noCdataEnd then
		return false
	end
	p35:next()
	if p35:nextString("CDATA[") then
		while p35:findChar(93) >= 0 do
			if p35:nextString("]]>") then
				return true
			end
			p35:next()
		end
		p34._noCdataEnd = true
	end
	return false
end
function v_u_5.tryDeclaration(p36, p37) -- name: tryDeclaration
	-- upvalues: (copy) v_u_6
	if p36._noDeclarationEnd then
		return false
	else
		p37:match(v_u_6)
		if p37:whitespace() <= 0 then
			return false
		elseif p37:findChar(62) >= 0 then
			p37:next()
			return true
		else
			p36._noDeclarationEnd = true
			return false
		end
	end
end
local v_u_38 = {}
v_u_38.__index = v_u_38
function v_u_38.new() -- name: new
	-- upvalues: (copy) v_u_38
	local v39 = v_u_38
	return setmetatable({}, v39)
end
function v_u_38.getTriggerCharacters(_) -- name: getTriggerCharacters
	return {
		[60] = true
	}
end
function v_u_38.create(_) -- name: create
	-- upvalues: (copy) v_u_5
	return v_u_5.new()
end
v_u_5.Factory = v_u_38
v_u_5.tryOpenTag = v_u_20
function v_u_5.tryClosingTag(p40) -- name: tryClosingTag
	-- upvalues: (copy) v_u_6, (copy) v_u_7
	p40:next()
	if p40:match(v_u_6) < 1 then
		return false
	end
	p40:match(v_u_7)
	p40:whitespace()
	return p40:nextChar(62)
end
return v_u_5