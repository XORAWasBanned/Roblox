-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.language.lexer
local v1 = script.Parent
local v2 = v1.Parent
local v3 = v2.Parent
local v4 = require(v3.LuauPolyfill)
local v5 = v4.Number
local v_u_6 = v4.String
local v_u_7 = v5.isNaN
local v_u_8 = game:GetService("HttpService")
local v_u_9 = require(v2.error.syntaxError).syntaxError
require(script.Parent.source)
local v10 = require(v1.tokenKind)
local v_u_11 = require(v1.ast).Token
local v_u_12 = v10.TokenKind
local v_u_13 = require(v2.luaUtils.toUnicodeString)
local v_u_14 = require(v1.blockString).dedentBlockStringValue
local v_u_15 = nil
local v_u_16 = nil
local v_u_17 = nil
local function v_u_29(p18, p19, p20, p21) -- name: uniCharCode
	-- upvalues: (ref) v_u_17
	local v22 = v_u_17(p18)
	local v23 = v_u_17(p19)
	local v24 = v_u_17(p20)
	local v25 = v_u_17(p21)
	if v22 < 0 or (v23 < 0 or (v24 < 0 or v25 < 0)) then
		return -1
	end
	local v26 = bit32.lshift(v22, 12)
	local v27 = bit32.lshift(v23, 8)
	local v28 = bit32.lshift(v24, 4)
	return bit32.bor(v26, v27, v28, v25)
end
v_u_17 = function(p30) -- name: char2hex
	if p30 >= 48 and p30 <= 57 then
		return p30 - 48
	elseif p30 >= 65 and p30 <= 70 then
		return p30 - 55
	else
		return (p30 < 97 or p30 > 102) and -1 or p30 - 87
	end
end
local function v_u_41(p31, p32, p33, p34, p35) -- name: readName
	-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_11, (copy) v_u_12
	local v36 = p31.body
	local v37 = string.len(v36)
	local v38 = p32 + 1
	local v39 = 0
	while v38 ~= v37 + 1 do
		v39 = v_u_6.charCodeAt(v36, v38)
		if v_u_7(v39) then
			break
		end
		local v40 = v39 == 95
		if not v40 then
			if v39 >= 48 then
				v40 = v39 <= 57
			else
				v40 = false
			end
			if not v40 then
				if v39 >= 65 then
					v40 = v39 <= 90
				else
					v40 = false
				end
				if not v40 then
					if v39 >= 97 then
						v40 = v39 <= 122
					else
						v40 = false
					end
				end
			end
		end
		if not v40 then
			break
		end
		v38 = v38 + 1
	end
	return v_u_11.new(v_u_12.NAME, p32, v38, p33, p34, p35, v_u_6.slice(v36, p32, v38))
end
local function v_u_50(p42, p43, p44, p45, p46) -- name: readComment
	-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_11, (copy) v_u_12
	local v47 = p42.body
	local v48 = p43
	repeat
		p43 = p43 + 1
		local v49 = v_u_6.charCodeAt(v47, p43)
	until v_u_7(v49) or v49 <= 31 and v49 ~= 9
	return v_u_11.new(v_u_12.COMMENT, v48, p43, p44, p45, p46, v_u_6.slice(v47, v48 + 1, p43))
end
function printCharCode(p51) -- name: printCharCode
	-- upvalues: (copy) v_u_7, (copy) v_u_12, (copy) v_u_8, (copy) v_u_13
	if v_u_7(p51) then
		return v_u_12.EOF
	elseif p51 < 127 then
		return v_u_8:JSONEncode((string.char(p51)))
	else
		return v_u_13(p51)
	end
end
function readDigits(p52, p53, p54) -- name: readDigits
	-- upvalues: (copy) v_u_6, (copy) v_u_9
	local v55 = p52.body
	if p54 >= 48 and p54 <= 57 then
		repeat
			p53 = p53 + 1
			local v56 = v_u_6.charCodeAt(v55, p53)
		until v56 < 48 or v56 > 57
		return p53
	end
	error(v_u_9(p52, p53, "Invalid number, expected digit but got: " .. printCharCode(p54) .. "."))
end
function unexpectedCharacterMessage(p57) -- name: unexpectedCharacterMessage
	if p57 < 32 and (p57 ~= 9 and (p57 ~= 10 and p57 ~= 13)) then
		return "Cannot contain the invalid character " .. printCharCode(p57) .. "."
	else
		return p57 == 39 and "Unexpected single quote character (\'), did you mean to use a double quote (\")?" or "Cannot parse the unexpected character " .. printCharCode(p57) .. "."
	end
end
function isNameStart(p58) -- name: isNameStart
	local v59 = p58 == 95
	local v60
	if p58 >= 65 then
		v60 = p58 <= 90
	else
		v60 = false
	end
	local v61
	if p58 >= 97 then
		v61 = p58 <= 122
	else
		v61 = false
	end
	return v59 or (v60 or v61)
end
function readNumber(p62, p63, p64, p65, p66, p67) -- name: readNumber
	-- upvalues: (copy) v_u_6, (copy) v_u_9, (copy) v_u_11, (copy) v_u_12
	local v68 = p62.body
	local v69 = false
	local v70
	if p64 == 45 then
		v70 = p63 + 1
		p64 = v_u_6.charCodeAt(v68, v70)
	else
		v70 = p63
	end
	local v71, v72
	if p64 == 48 then
		v71 = v70 + 1
		v72 = v_u_6.charCodeAt(v68, v71)
		if v72 >= 48 and v72 <= 57 then
			error(v_u_9(p62, v71, "Invalid number, unexpected digit after 0: " .. printCharCode(v72) .. "."))
		end
	else
		v71 = readDigits(p62, v70, p64)
		v72 = v_u_6.charCodeAt(v68, v71)
	end
	if v72 == 46 then
		local v73 = v71 + 1
		local v74 = v_u_6.charCodeAt(v68, v73)
		v71 = readDigits(p62, v73, v74)
		v72 = v_u_6.charCodeAt(v68, v71)
		v69 = true
	end
	if v72 == 69 or v72 == 101 then
		v69 = true
		local v75 = v71 + 1
		local v76 = v_u_6.charCodeAt(v68, v75)
		if v76 == 43 or v76 == 45 then
			v75 = v75 + 1
			v76 = v_u_6.charCodeAt(v68, v75)
		end
		v71 = readDigits(p62, v75, v76)
		v72 = v_u_6.charCodeAt(v68, v71)
	end
	if v72 == 46 or isNameStart(v72) then
		error(v_u_9(p62, v71, "Invalid number, expected digit but got: " .. printCharCode(v72) .. "."))
	end
	return v_u_11.new(v69 and v_u_12.FLOAT or v_u_12.INT, p63, v71, p65, p66, p67, v_u_6.slice(v68, p63, v71))
end
local function v_u_89(p77, p78) -- name: readToken
	-- upvalues: (copy) v_u_6, (copy) v_u_11, (copy) v_u_12, (copy) v_u_50, (ref) v_u_15, (ref) v_u_16, (copy) v_u_41, (copy) v_u_9
	local v79 = p77.source
	local v80 = v79.body
	local v81 = utf8.len(v80)
	local v82 = v81 ~= nil
	assert(v82, "invalid utf8 supplied for token")
	local v83 = p78._end
	while v83 <= v81 do
		local v84 = v_u_6.charCodeAt(v80, v83)
		local v85 = p77.line
		local v86 = v83 - p77.lineStart
		if v84 == 65279 or (v84 == 9 or (v84 == 32 or v84 == 44)) then
			v83 = v83 + 1
		elseif v84 == 10 then
			v83 = v83 + 1
			p77.line = p77.line + 1
			p77.lineStart = v83 - 1
		elseif v84 == 13 then
			if v_u_6.charCodeAt(v80, v83 + 1) == 10 then
				v83 = v83 + 2
			else
				v83 = v83 + 1
			end
			p77.line = p77.line + 1
			p77.lineStart = v83 - 1
		else
			if v84 == 33 then
				return v_u_11.new(v_u_12.BANG, v83, v83 + 1, v85, v86, p78)
			end
			if v84 == 35 then
				return v_u_50(v79, v83, v85, v86, p78)
			end
			if v84 == 36 then
				return v_u_11.new(v_u_12.DOLLAR, v83, v83 + 1, v85, v86, p78)
			end
			if v84 == 38 then
				return v_u_11.new(v_u_12.AMP, v83, v83 + 1, v85, v86, p78)
			end
			if v84 == 40 then
				return v_u_11.new(v_u_12.PAREN_L, v83, v83 + 1, v85, v86, p78)
			end
			if v84 == 41 then
				return v_u_11.new(v_u_12.PAREN_R, v83, v83 + 1, v85, v86, p78)
			end
			if v84 == 46 then
				if v_u_6.charCodeAt(v80, v83 + 1) == 46 and v_u_6.charCodeAt(v80, v83 + 2) == 46 then
					return v_u_11.new(v_u_12.SPREAD, v83, v83 + 3, v85, v86, p78)
				end
			else
				if v84 == 58 then
					return v_u_11.new(v_u_12.COLON, v83, v83 + 1, v85, v86, p78)
				end
				if v84 == 61 then
					return v_u_11.new(v_u_12.EQUALS, v83, v83 + 1, v85, v86, p78)
				end
				if v84 == 64 then
					return v_u_11.new(v_u_12.AT, v83, v83 + 1, v85, v86, p78)
				end
				if v84 == 91 then
					return v_u_11.new(v_u_12.BRACKET_L, v83, v83 + 1, v85, v86, p78)
				end
				if v84 == 93 then
					return v_u_11.new(v_u_12.BRACKET_R, v83, v83 + 1, v85, v86, p78)
				end
				if v84 == 123 then
					return v_u_11.new(v_u_12.BRACE_L, v83, v83 + 1, v85, v86, p78)
				end
				if v84 == 124 then
					return v_u_11.new(v_u_12.PIPE, v83, v83 + 1, v85, v86, p78)
				end
				if v84 == 125 then
					return v_u_11.new(v_u_12.BRACE_R, v83, v83 + 1, v85, v86, p78)
				end
				if v84 == 34 then
					if v_u_6.charCodeAt(v80, v83 + 1) == 34 and v_u_6.charCodeAt(v80, v83 + 2) == 34 then
						return v_u_15(v79, v83, v85, v86, p78, p77)
					else
						return v_u_16(v79, v83, v85, v86, p78)
					end
				end
				if v84 == 45 or (v84 == 48 or (v84 == 49 or (v84 == 50 or (v84 == 51 or (v84 == 52 or (v84 == 53 or (v84 == 54 or (v84 == 55 or (v84 == 56 or v84 == 57))))))))) then
					return readNumber(v79, v83, v84, v85, v86, p78)
				end
				if v84 == 65 or (v84 == 66 or (v84 == 67 or (v84 == 68 or (v84 == 69 or (v84 == 70 or (v84 == 71 or (v84 == 72 or (v84 == 73 or (v84 == 74 or (v84 == 75 or (v84 == 76 or (v84 == 77 or (v84 == 78 or (v84 == 79 or (v84 == 80 or (v84 == 81 or (v84 == 82 or (v84 == 83 or (v84 == 84 or (v84 == 85 or (v84 == 86 or (v84 == 87 or (v84 == 88 or (v84 == 89 or (v84 == 90 or (v84 == 95 or (v84 == 97 or (v84 == 98 or (v84 == 99 or (v84 == 100 or (v84 == 101 or (v84 == 102 or (v84 == 103 or (v84 == 104 or (v84 == 105 or (v84 == 106 or (v84 == 107 or (v84 == 108 or (v84 == 109 or (v84 == 110 or (v84 == 111 or (v84 == 112 or (v84 == 113 or (v84 == 114 or (v84 == 115 or (v84 == 116 or (v84 == 117 or (v84 == 118 or (v84 == 119 or (v84 == 120 or (v84 == 121 or v84 == 122))))))))))))))))))))))))))))))))))))))))))))))))))) then
					return v_u_41(v79, v83, v85, v86, p78)
				end
			end
			error(v_u_9(v79, v83, unexpectedCharacterMessage(v84)))
		end
	end
	local v87 = p77.line
	local v88 = v83 - p77.lineStart
	return v_u_11.new(v_u_12.EOF, v81 + 1, v81 + 1, v87, v88, p78)
end
local v_u_90 = {}
v_u_90.__index = v_u_90
function v_u_90.new(p91) -- name: new
	-- upvalues: (copy) v_u_11, (copy) v_u_12, (copy) v_u_90
	local v92 = v_u_11.new(v_u_12.SOF, 1, 1, 0, 0, nil)
	local v93 = v_u_90
	return setmetatable({
		["source"] = p91,
		["lastToken"] = v92,
		["token"] = v92,
		["line"] = 1,
		["lineStart"] = 0
	}, v93)
end
function v_u_90.advance(p94) -- name: advance
	p94.lastToken = p94.token
	p94.token = p94:lookahead()
	return p94.token
end
function v_u_90.lookahead(p95) -- name: lookahead
	-- upvalues: (copy) v_u_12, (copy) v_u_89
	local v96 = p95.token
	if v96.kind ~= v_u_12.EOF then
		if v96.next then
			v96 = v96.next
		else
			v96 = v_u_89(p95, v96)
			v96.next = v96
			v96.prev = v96
		end
		if v96.kind == v_u_12.COMMENT then
			continue
		end
	end
	return v96
end
v_u_15 = function(p97, p98, p99, p100, p101, p102) -- name: readBlockString
	-- upvalues: (copy) v_u_7, (copy) v_u_6, (copy) v_u_11, (copy) v_u_12, (copy) v_u_14, (copy) v_u_9
	local v103 = p97.body
	local v104 = p98 + 3
	local v105 = v104
	local v106 = ""
	while v104 <= string.len(v103) and not v_u_7(v_u_6.charCodeAt(v103, v104)) do
		local v107 = v_u_6.charCodeAt(v103, v104)
		if v107 == 34 and (v_u_6.charCodeAt(v103, v104 + 1) == 34 and v_u_6.charCodeAt(v103, v104 + 2) == 34) then
			local v108 = v106 .. v_u_6.slice(v103, v105, v104)
			return v_u_11.new(v_u_12.BLOCK_STRING, p98, v104 + 3, p99, p100, p101, v_u_14(v108))
		end
		if v107 < 32 and (v107 ~= 9 and (v107 ~= 10 and v107 ~= 13)) then
			error(v_u_9(p97, v104, "Invalid character within String: " .. printCharCode(v107) .. "."))
		end
		if v107 == 10 then
			v104 = v104 + 1
			p102.line = p102.line + 1
			p102.lineStart = v104 - 1
		elseif v107 == 13 then
			if v_u_6.charCodeAt(v103, v104 + 1) == 10 then
				v104 = v104 + 2
			else
				v104 = v104 + 1
			end
			p102.line = p102.line + 1
			p102.lineStart = v104 - 1
		elseif v107 == 92 and (v_u_6.charCodeAt(v103, v104 + 1) == 34 and (v_u_6.charCodeAt(v103, v104 + 2) == 34 and v_u_6.charCodeAt(v103, v104 + 3) == 34)) then
			v106 = v106 .. v_u_6.slice(v103, v105, v104) .. "\"\"\""
			v104 = v104 + 4
			v105 = v104
		else
			v104 = v104 + 1
		end
	end
	error(v_u_9(p97, v104, "Unterminated string."))
end
v_u_16 = function(p109, p110, p111, p112, p113) -- name: readString
	-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_11, (copy) v_u_12, (copy) v_u_9, (ref) v_u_29
	local v114 = p109.body
	local v115 = utf8.len(v114)
	local v116 = v115 ~= nil
	assert(v116, "invalid utf8 sequence detected")
	local v117 = p110 + 1
	local v118 = v117
	local v119 = ""
	while v117 <= v115 do
		local v120 = v_u_6.charCodeAt(v114, v117)
		if v_u_7(v120) then
			break
		end
		if v120 == 34 then
			local v121 = v119 .. v_u_6.slice(v114, v118, v117)
			return v_u_11.new(v_u_12.STRING, p110, v117 + 1, p111, p112, p113, v121)
		end
		if v120 == 10 or v120 == 13 then
			break
		end
		if v120 < 32 and v120 ~= 9 then
			error(v_u_9(p109, v117, "Invalid character within String: " .. printCharCode(v120) .. "."))
		end
		v117 = v117 + 1
		if v120 ~= 92 then
			continue
		end
		v119 = v119 .. v_u_6.slice(v114, v118, v117 - 1)
		local v122 = v_u_6.charCodeAt(v114, v117)
		if v122 == 34 then
			v119 = v119 .. "\""
		elseif v122 == 47 then
			v119 = v119 .. "/"
		elseif v122 == 92 then
			v119 = v119 .. "\\"
		elseif v122 == 98 then
			v119 = v119 .. "\8"
		elseif v122 == 102 then
			v119 = v119 .. "\f"
		elseif v122 == 110 then
			v119 = v119 .. "\n"
		elseif v122 == 114 then
			v119 = v119 .. "\r"
		elseif v122 == 116 then
			v119 = v119 .. "\t"
		elseif v122 == 117 then
			local v123 = v_u_29(v_u_6.charCodeAt(v114, v117 + 1), v_u_6.charCodeAt(v114, v117 + 2), v_u_6.charCodeAt(v114, v117 + 3), v_u_6.charCodeAt(v114, v117 + 4))
			if v123 < 0 then
				local v124 = v_u_6.slice(v114, v117 + 1, v117 + 5)
				error(v_u_9(p109, v117, "Invalid character escape sequence: \\u" .. v124 .. "."))
			end
			v119 = v119 .. utf8.char(v123)
			v117 = v117 + 4
		else
			error(v_u_9(p109, v117, "Invalid character escape sequence: \\" .. utf8.char(v122) .. "."))
		end
		v117 = v117 + 1
		v118 = v117
	end
	error(v_u_9(p109, v117, "Unterminated string."))
end
return {
	["Lexer"] = v_u_90,
	["isPunctuatorTokenKind"] = function(p125) -- name: isPunctuatorTokenKind
		-- upvalues: (copy) v_u_12
		return (p125 == v_u_12.BANG or (p125 == v_u_12.DOLLAR or (p125 == v_u_12.AMP or (p125 == v_u_12.PAREN_L or (p125 == v_u_12.PAREN_R or (p125 == v_u_12.SPREAD or (p125 == v_u_12.COLON or (p125 == v_u_12.EQUALS or (p125 == v_u_12.AT or (p125 == v_u_12.BRACKET_L or (p125 == v_u_12.BRACKET_R or (p125 == v_u_12.BRACE_L or p125 == v_u_12.PIPE)))))))))))) and true or p125 == v_u_12.BRACE_R
	end
}