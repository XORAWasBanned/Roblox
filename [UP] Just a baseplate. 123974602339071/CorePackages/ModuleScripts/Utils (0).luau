-- Path: CorePackages.Packages._Index.Markdown.Markdown.Parsers.CommonMarkComplianceParser.Utils
local v1 = script:FindFirstAncestor("Markdown")
local v_u_2 = require(v1.Parsers.Constants)
require(v1.Types)
local v_u_3 = {
	["BOLD"] = {
		["char"] = "*",
		["length"] = 1
	},
	["BOLD_2"] = {
		["char"] = "*",
		["length"] = 2
	},
	["ITALIC"] = {
		["char"] = "_",
		["length"] = 1
	},
	["ITALIC_2"] = {
		["char"] = "_",
		["length"] = 2
	},
	["STRIKE"] = {
		["char"] = "~",
		["length"] = 1
	},
	["INLINE_CODE"] = {
		["char"] = "`",
		["length"] = 1
	}
}
local v_u_50 = {
	["getDelimiterInfo"] = function(p4) -- name: getDelimiterInfo
		-- upvalues: (copy) v_u_3
		return v_u_3[p4]
	end,
	["causesLineBreak"] = function(p5) -- name: causesLineBreak
		return p5.name ~= "TEXT" and true or string.find(p5.text, "\n", 0, true) ~= nil
	end,
	["getTokenNameFromCharAndLength"] = function(p6, p7) -- name: getTokenNameFromCharAndLength
		return p6 == "`" and "INLINE_CODE" or (p6 == "~" and "STRIKE" or (p7 == 2 and (p6 == "*" and "BOLD_2" or "ITALIC_2") or (p6 == "*" and "BOLD" or "ITALIC")))
	end,
	["canDelimitersMatch"] = function(p8, p9) -- name: canDelimitersMatch
		if p8.runLength == 0 or p9.runLength == 0 then
			return false
		end
		local v10 = not (p8.canOpen and p8.canClose) and p9.canOpen
		if v10 then
			v10 = p9.canClose
		end
		return not v10 and true or (p8.runLength % 3 == 0 and p9.runLength % 3 == 0 and true or (p8.runLength + p9.runLength) % 3 ~= 0)
	end,
	["addDelimiterMatch"] = function(p11, p12) -- name: addDelimiterMatch
		local v13 = p11.matches or {}
		p11.matches = v13
		local v14 = #v13
		local v15 = v14 + 1
		local v16 = p12.with.startIdx
		local v17 = 1
		while v17 <= v14 do
			local v18 = (v17 + v14) / 2
			local v19 = math.floor(v18)
			if v16 < v13[v19].with.startIdx then
				v14 = v19 - 1
			else
				v17 = v19 + 1
				v19 = v15
			end
			v15 = v19
		end
		table.insert(v13, v15, p12)
	end,
	["isWhitespace"] = function(p20) -- name: isWhitespace
		-- upvalues: (copy) v_u_2
		return (not p20 or #p20 == 0) and true or (p20:match(v_u_2.ASCII.WHITESPACE_PATTERN) ~= nil and true or (v_u_2.UNICODE.WHITESPACE[utf8.codepoint(p20)] and true or false))
	end,
	["isPunctuation"] = function(p21) -- name: isPunctuation
		-- upvalues: (copy) v_u_2
		if not p21 or #p21 == 0 then
			return false
		end
		if p21:match(v_u_2.ASCII.PUNCTUATION_PATTERN) then
			return true
		end
		local v22 = utf8.codepoint(p21)
		return v_u_2.UNICODE.PUNCTUATION[v22] and true or false
	end,
	["isLeftFlanking"] = function(p23, p24) -- name: isLeftFlanking
		-- upvalues: (copy) v_u_50
		if v_u_50.isWhitespace(p24) then
			return false
		else
			return not v_u_50.isPunctuation(p24) and true or (v_u_50.isWhitespace(p23) or v_u_50.isPunctuation(p23))
		end
	end,
	["isRightFlanking"] = function(p25, p26) -- name: isRightFlanking
		-- upvalues: (copy) v_u_50
		if v_u_50.isWhitespace(p25) then
			return false
		else
			return not v_u_50.isPunctuation(p25) and true or (v_u_50.isWhitespace(p26) or v_u_50.isPunctuation(p26))
		end
	end,
	["canOpenEmphasis"] = function(p27) -- name: canOpenEmphasis
		-- upvalues: (copy) v_u_50
		if p27.char == "`" then
			return true
		elseif v_u_50.isLeftFlanking(p27.prevChar, p27.nextChar) then
			return p27.char ~= "_" and true or (not v_u_50.isRightFlanking(p27.prevChar, p27.nextChar) or v_u_50.isPunctuation(p27.prevChar))
		else
			return false
		end
	end,
	["canCloseEmphasis"] = function(p28) -- name: canCloseEmphasis
		-- upvalues: (copy) v_u_50
		if p28.char == "`" then
			return true
		elseif v_u_50.isRightFlanking(p28.prevChar, p28.nextChar) then
			return p28.char ~= "_" and true or (not v_u_50.isLeftFlanking(p28.prevChar, p28.nextChar) or v_u_50.isPunctuation(p28.nextChar))
		else
			return false
		end
	end,
	["getCharacterContext"] = function(p29, p30, p31) -- name: getCharacterContext
		if #p29 == 0 then
			return {}
		end
		local v32 = nil
		local v33 = nil
		if p30 > 1 then
			local v34 = utf8.offset(p29, -1, p30)
			if v34 then
				v32 = utf8.char(utf8.codepoint(p29, v34))
			end
		end
		local v35 = p30 + p31
		if v35 <= #p29 then
			local v36 = utf8.offset(p29, 1, v35)
			if v36 then
				v33 = utf8.char(utf8.codepoint(p29, v36))
			end
		end
		return {
			["prevChar"] = v32,
			["nextChar"] = v33
		}
	end,
	["isInsideInlineCode"] = function(p37, p38, p39) -- name: isInsideInlineCode
		local v40 = {}
		local v41 = nil
		local v42, v43
		for v44 = p39 or #p37, 1, -1 do
			local v45 = p37[v44]
			if v45.offset <= p38 then
				v47 = 1
				v48 = false
				while v47 <= #v40 do
					v42 = v40[v47].length
					v43 = nil
					for v49 = v47 + 1, #v40 do
						if v40[v49].length ~= v42 then
							continue
						end
						v43 = v49
					end
					if not v43 then
						return true
					end
					v47 = v43 + 1
				end
				return v48
			end
			if v45.name ~= "INLINE_CODE" then
				continue
			end
			if v41 and v41.offset - 1 == v45.offset then
				v41.length = v41.length + 1
				v41.offset = v41.offset - 1
			else
				v41 = {
					["offset"] = v45.offset,
					["length"] = #v45.text
				}
				table.insert(v40, 1, v41)
			end
		end
		local v47 = 1
		local v48 = false
		while v47 <= #v40 do
			v42 = v40[v47].length
			v43 = nil
			for v49 = v47 + 1, #v40 do
				if v40[v49].length ~= v42 then
					continue
				end
				v43 = v49
			end
			if not v43 then
				return true
			end
			v47 = v43 + 1
		end
		return v48
	end
}
return v_u_50