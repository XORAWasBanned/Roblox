-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.text.Characters
local v1 = script:FindFirstAncestor("CommonMark")
local v_u_2 = require(v1.internal.data.UnicodeLetters)
local v_u_3 = require(v1.internal.data.UnicodePunctuation)
local v_u_4 = require(v1.internal.data.UnicodeSpaceSeparators)
local v_u_5 = require(v1.internal.port.Utf8)
local v_u_6 = string.byte
local v_u_7 = string.char
local v_u_8 = string.find
local v_u_19 = {
	["find"] = function(p9, p10, p11) -- name: find
		-- upvalues: (copy) v_u_8, (copy) v_u_7
		local v12 = v_u_8(p10, v_u_7(p9), p11 + 1, true)
		return not v12 and -1 or v12 - 1
	end,
	["findLineBreak"] = function(p13, p14) -- name: findLineBreak
		-- upvalues: (copy) v_u_8
		local v15 = v_u_8(p13, "[\n\r]", p14 + 1)
		return not v15 and -1 or v15 - 1
	end,
	["isBlank"] = function(p16) -- name: isBlank
		-- upvalues: (copy) v_u_19
		return v_u_19.skipSpaceTab(p16, 0, #p16) == #p16
	end,
	["hasNonSpace"] = function(p17) -- name: hasNonSpace
		-- upvalues: (copy) v_u_19
		local v18 = #p17
		return v_u_19.skip(32, p17, 0, v18) ~= v18
	end
}
local function v_u_25(p20, p21) -- name: isInRanges
	local v22 = #p20 // 2
	local v23 = 1
	while v23 <= v22 do
		local v24 = (v23 + v22) // 2
		if p21 < p20[v24 * 2 - 1] then
			v22 = v24 - 1
		else
			if p20[v24 * 2] >= p21 then
				return true
			end
			v23 = v24 + 1
		end
	end
	return false
end
function v_u_19.isLetter(p26, p27) -- name: isLetter
	-- upvalues: (copy) v_u_5, (copy) v_u_25, (copy) v_u_2
	return v_u_25(v_u_2, (v_u_5.codePointAt(p26, p27)))
end
function v_u_19.isSpaceOrTab(p28, p29) -- name: isSpaceOrTab
	-- upvalues: (copy) v_u_6
	if p29 < #p28 then
		local v30 = v_u_6(p28, p29 + 1)
		if v30 == 32 or v30 == 9 then
			return true
		end
	end
	return false
end
function v_u_19.isPunctuationCodePoint(p31) -- name: isPunctuationCodePoint
	-- upvalues: (copy) v_u_25, (copy) v_u_3
	return v_u_25(v_u_3, p31) and true or ((p31 == 36 or (p31 == 43 or (p31 == 60 or (p31 == 61 or (p31 == 62 or (p31 == 94 or (p31 == 96 or p31 == 124))))))) and true or p31 == 126)
end
function v_u_19.isWhitespaceCodePoint(p32) -- name: isWhitespaceCodePoint
	-- upvalues: (copy) v_u_4
	return (p32 == 32 or (p32 == 9 or (p32 == 10 or (p32 == 12 or p32 == 13)))) and true or v_u_4[p32] == true
end
function v_u_19.skip(p33, p34, p35, p36) -- name: skip
	-- upvalues: (copy) v_u_6
	for v37 = p35, p36 - 1 do
		if v_u_6(p34, v37 + 1) == p33 then
			continue
		end
		return v37
	end
	return p36
end
function v_u_19.skipBackwards(p38, p39, p40, p41) -- name: skipBackwards
	-- upvalues: (copy) v_u_6
	for v42 = p40, p41, -1 do
		if v_u_6(p39, v42 + 1) == p38 then
			continue
		end
		return v42
	end
	return p41 - 1
end
function v_u_19.skipSpaceTab(p43, p44, p45) -- name: skipSpaceTab
	-- upvalues: (copy) v_u_6
	for v46 = p44, p45 - 1 do
		local v47 = v_u_6(p43, v46 + 1)
		if v47 == 32 or v47 == 9 then
			continue
		end
		return v46
	end
	return p45
end
function v_u_19.skipSpaceTabBackwards(p48, p49, p50) -- name: skipSpaceTabBackwards
	-- upvalues: (copy) v_u_6
	for v51 = p49, p50, -1 do
		local v52 = v_u_6(p48, v51 + 1)
		if v52 == 32 or v52 == 9 then
			continue
		end
		return v51
	end
	return p50 - 1
end
return v_u_19