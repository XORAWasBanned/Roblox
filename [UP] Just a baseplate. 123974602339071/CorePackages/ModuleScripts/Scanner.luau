-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.parser.beta.Scanner
local v1 = script:FindFirstAncestor("CommonMark")
require(v1.text.CharMatcher)
local v_u_2 = require(v1.parser.beta.Position)
local v_u_3 = require(v1.parser.SourceLine)
local v_u_4 = require(v1.parser.SourceLines)
require(v1.node.SourceSpan)
local v_u_5 = require(v1.internal.port.Utf8)
local v_u_6 = string.byte
local v_u_7 = string.char
local v_u_8 = string.find
local v_u_9 = string.sub
local v_u_10 = {}
v_u_10.__index = v_u_10
v_u_10.END = 0
function v_u_10.new(p11, p12, p13) -- name: new
	-- upvalues: (copy) v_u_3, (copy) v_u_10
	local v14 = {
		["_lines"] = nil,
		["_lineIndex"] = nil,
		["_index"] = nil,
		["_line"] = nil,
		["_lineLength"] = 0,
		["_lines"] = p11,
		["_lineIndex"] = p12,
		["_index"] = p13,
		["_line"] = v_u_3.of("", nil)
	}
	local v15 = v_u_10
	local v16 = setmetatable(v14, v15)
	if #p11 > 0 then
		v16:checkPosition(p12, p13)
		v16:setLine(p11[p12 + 1])
	end
	return v16
end
function v_u_10.of(p17) -- name: of
	-- upvalues: (copy) v_u_10
	return v_u_10.new(p17:getLines(), 0, 0)
end
function v_u_10.peek(p18) -- name: peek
	-- upvalues: (copy) v_u_6
	return p18._index >= p18._lineLength and (p18._lineIndex < #p18._lines - 1 and 10 or 0) or v_u_6(p18._line:getContent(), p18._index + 1)
end
function v_u_10.peekCodePoint(p19) -- name: peekCodePoint
	-- upvalues: (copy) v_u_5
	return p19._index >= p19._lineLength and (p19._lineIndex < #p19._lines - 1 and 10 or 0) or v_u_5.codePointAt(p19._line:getContent(), p19._index)
end
function v_u_10.peekPreviousCodePoint(p20) -- name: peekPreviousCodePoint
	-- upvalues: (copy) v_u_5
	return p20._index <= 0 and (p20._lineIndex > 0 and 10 or 0) or v_u_5.codePointBefore(p20._line:getContent(), p20._index)
end
function v_u_10.hasNext(p21) -- name: hasNext
	return p21._index < p21._lineLength and true or p21._lineIndex < #p21._lines - 1
end
function v_u_10.next(p22) -- name: next
	-- upvalues: (copy) v_u_3
	p22._index = p22._index + 1
	if p22._index > p22._lineLength then
		p22._lineIndex = p22._lineIndex + 1
		if p22._lineIndex < #p22._lines then
			p22:setLine(p22._lines[p22._lineIndex + 1])
		else
			p22:setLine(v_u_3.of("", nil))
		end
		p22._index = 0
	end
end
function v_u_10.nextChar(p23, p24) -- name: nextChar
	if p23:peek() ~= p24 then
		return false
	end
	p23:next()
	return true
end
function v_u_10.nextString(p25, p26) -- name: nextString
	-- upvalues: (copy) v_u_9
	if p25._index >= p25._lineLength or p25._index + #p26 > p25._lineLength then
		return false
	end
	if v_u_9(p25._line:getContent(), p25._index + 1, p25._index + #p26) ~= p26 then
		return false
	end
	p25._index = p25._index + #p26
	return true
end
function v_u_10.matchMultiple(p27, p28) -- name: matchMultiple
	local v29 = 0
	while p27:peek() == p28 do
		v29 = v29 + 1
		p27:next()
	end
	return v29
end
function v_u_10.match(p30, p31) -- name: match
	local v32 = 0
	while p31:matches(p30:peek()) do
		v32 = v32 + 1
		p30:next()
	end
	return v32
end
function v_u_10.whitespace(p33) -- name: whitespace
	local v34 = 0
	while true do
		local v35 = p33:peek()
		if v35 ~= 32 and (v35 ~= 9 and (v35 ~= 10 and (v35 ~= 11 and (v35 ~= 12 and v35 ~= 13)))) then
			break
		end
		v34 = v34 + 1
		p33:next()
	end
	return v34
end
local v_u_36 = {}
function v_u_10.findChar(p37, p38) -- name: findChar
	-- upvalues: (copy) v_u_8, (copy) v_u_36, (copy) v_u_7
	local v39 = 0
	while true do
		if p37._index < p37._lineLength then
			local v40 = v_u_8
			local v41 = p37._line:getContent()
			local v42 = v_u_36[p38]
			if v42 == nil then
				local v43
				if p38 >= 48 and p38 <= 57 or p38 >= 65 and p38 <= 90 then
					v43 = true
				elseif p38 >= 97 then
					v43 = p38 <= 122
				else
					v43 = false
				end
				v42 = "[\0" .. (v43 and "" or "%") .. v_u_7(p38) .. "]"
				v_u_36[p38] = v42
			end
			local v44 = v40(v41, v42, p37._index + 1)
			local v45
			if v44 == nil then
				v45 = p37._lineLength
			else
				v45 = v44 - 1
			end
			v39 = v39 + (v45 - p37._index)
			p37._index = v45
		end
		local v46 = p37:peek()
		if v46 == 0 then
			return -1
		end
		if v46 == p38 then
			return v39
		end
		v39 = v39 + 1
		p37:next()
	end
end
function v_u_10.findMatcher(p47, p48) -- name: findMatcher
	local v49 = 0
	while true do
		local v50 = p47:peek()
		if v50 == 0 then
			break
		end
		if p48:matches(v50) then
			return v49
		end
		v49 = v49 + 1
		p47:next()
	end
	return -1
end
function v_u_10.position(p51) -- name: position
	-- upvalues: (copy) v_u_2
	return v_u_2.new(p51._lineIndex, p51._index)
end
function v_u_10.setPosition(p52, p53) -- name: setPosition
	p52:checkPosition(p53.lineIndex, p53.index)
	p52._lineIndex = p53.lineIndex
	p52._index = p53.index
	p52:setLine(p52._lines[p52._lineIndex + 1])
end
function v_u_10.getSource(p54, p55, p56) -- name: getSource
	-- upvalues: (copy) v_u_9, (copy) v_u_4, (copy) v_u_3
	if p55.lineIndex ~= p56.lineIndex then
		local v57 = v_u_4.empty()
		local v58 = p54._lines[p55.lineIndex + 1]
		v57:addLine(v58:substring(p55.index, #v58:getContent()))
		for v59 = p55.lineIndex + 1, p56.lineIndex - 1 do
			v57:addLine(p54._lines[v59 + 1])
		end
		v57:addLine(p54._lines[p56.lineIndex + 1]:substring(0, p56.index))
		return v57
	end
	local v60 = p54._lines[p55.lineIndex + 1]
	local v61 = v60:getContent()
	if p55.index < 0 or (p55.index > p56.index or p56.index > #v61) then
		error((("begin %*, end %*, length %*"):format(p55.index, p56.index, #v61)))
	end
	local v62 = v_u_9(v61, p55.index + 1, p56.index)
	local v63 = v60:getSourceSpan()
	local v64
	if v63 == nil then
		v64 = nil
	else
		v64 = v63:subSpan(p55.index, p56.index)
	end
	return v_u_4.of(v_u_3.of(v62, v64))
end
function v_u_10.setLine(p65, p66) -- name: setLine
	p65._line = p66
	p65._lineLength = #p66:getContent()
end
function v_u_10.checkPosition(p67, p68, p69) -- name: checkPosition
	if p68 < 0 or #p67._lines <= p68 then
		error((("Line index %* out of range, number of lines: %*"):format(p68, #p67._lines)))
	end
	local v70 = p67._lines[p68 + 1]
	if p69 < 0 or #v70:getContent() < p69 then
		error((("Index %* out of range, line length: %*"):format(p69, #v70:getContent())))
	end
end
return v_u_10