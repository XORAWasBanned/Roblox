-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.util.Escaping
local v1 = script:FindFirstAncestor("CommonMark")
local v_u_2 = require(v1.internal.data.CaseFolding)
local v_u_3 = require(v1.internal.util.Html5Entities)
local v_u_4 = require(v1.internal.port.Utf8)
local v_u_5 = string.byte
local v_u_6 = string.find
local v_u_7 = string.gsub
local v_u_8 = string.sub
local v9 = {
	["ESCAPABLE"] = "[!\"#$%%&\'()*+,./:;<=>?@%[\\%]^_`{|}~%-]"
}
local v_u_10 = "^\\" .. v9.ESCAPABLE
local function v_u_20(p11, p12) -- name: matchEntity
	-- upvalues: (copy) v_u_6
	local v13 = p12 + 1
	local _, v14 = v_u_6(p11, "^#[Xx][0-9A-Fa-f]*;", v13 + 1)
	if v14 == nil then
		local _, v15 = v_u_6(p11, "^#[0-9]*;", v13 + 1)
		if v15 == nil then
			local _, v16 = v_u_6(p11, "^[A-Za-z][A-Za-z0-9]*;", v13 + 1)
			if v16 == nil then
				return nil
			else
				local v17 = v16 - v13 - 2
				if v17 >= 1 and v17 <= 31 then
					return v16
				else
					return nil
				end
			end
		else
			local v18 = v15 - v13 - 2
			if v18 >= 1 and v18 <= 7 then
				return v15
			else
				return nil
			end
		end
	else
		local v19 = v14 - v13 - 3
		if v19 >= 1 and v19 <= 6 then
			return v14
		else
			return nil
		end
	end
end
local function v_u_28(p21, p22) -- name: findEntityOrEscapedChar
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_10, (copy) v_u_20
	local v23 = v_u_6(p21, "[\\&]", p22 + 1)
	local v24
	if v23 then
		v24 = v23 - 1
	else
		v24 = -1
	end
	while v24 ~= -1 do
		local v25
		if v_u_5(p21, v24 + 1) == 92 then
			local v26
			v26, v25 = v_u_6(p21, v_u_10, v24 + 1)
		else
			v25 = v_u_20(p21, v24)
		end
		if v25 ~= nil then
			return v24, v25
		end
		local v27 = v_u_6(p21, "[\\&]", v24 + 1 + 1)
		v24 = not v27 and -1 or v27 - 1
	end
	return -1, -1
end
local function v_u_35(p29, p30) -- name: findEscapeInUri
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_4
	local v31 = v_u_6(p29, "[^:/?#@!$&\'()*+,;=A-Za-z0-9%-._~]", p30 + 1)
	local v32 = not v31 and -1 or v31 - 1
	if v32 == -1 then
		return -1, -1
	elseif v_u_5(p29, v32 + 1) == 37 then
		local _, v33 = v_u_6(p29, "^[0-9A-Fa-f]?[0-9A-Fa-f]?", v32 + 2)
		return v32, v33
	else
		local v34 = v_u_4.codePointAt(p29, v32)
		return v32, v32 + (v34 < 128 and 1 or (v34 < 2048 and 2 or (v34 < 65536 and 3 or 4)))
	end
end
local v_u_36 = {
	"0",
	"1",
	"2",
	"3",
	"4",
	"5",
	"6",
	"7",
	"8",
	"9",
	"A",
	"B",
	"C",
	"D",
	"E",
	"F"
}
local function v_u_38(p37)
	-- upvalues: (copy) v_u_5, (copy) v_u_8, (copy) v_u_3
	if v_u_5(p37, 1) == 92 then
		return v_u_8(p37, 2, #p37)
	else
		return v_u_3.entityToString(p37)
	end
end
local function v_u_43(p39)
	-- upvalues: (copy) v_u_5, (copy) v_u_8, (copy) v_u_36
	if v_u_5(p39, 1) == 37 then
		if #p39 == 3 then
			return p39
		else
			return "%25" .. v_u_8(p39, 2, #p39)
		end
	else
		local v40 = {}
		for v41 = 1, #p39 do
			local v42 = v_u_5(p39, v41)
			v40[v41] = "%" .. v_u_36[v42 // 16 + 1] .. v_u_36[v42 % 16 + 1]
		end
		return table.concat(v40)
	end
end
local v_u_44 = {
	["&"] = "&amp;",
	["<"] = "&lt;",
	[">"] = "&gt;",
	["\""] = "&quot;"
}
function v9.escapeHtml(p45) -- name: escapeHtml
	-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_44
	if v_u_6(p45, "[&<>\"]") == nil then
		return p45
	else
		return v_u_7(p45, "[&<>\"]", v_u_44)
	end
end
local function v_u_56(p46, p47, p48) -- name: replaceAll
	-- upvalues: (copy) v_u_8
	local v49, v50 = p46(p47, 0)
	if v49 == -1 then
		return p47
	end
	local v51 = 0
	local v52 = 0
	local v53 = {}
	while true do
		local v54 = v51 + 1
		v53[v54] = v_u_8(p47, v52 + 1, v49)
		v51 = v54 + 1
		v53[v51] = p48((v_u_8(p47, v49 + 1, v50)))
		local v55
		v49, v55 = p46(p47, v50)
		if v49 == -1 then
			break
		end
		v52 = v50
		v50 = v55
	end
	if v50 ~= #p47 then
		v53[v51 + 1] = v_u_8(p47, v50 + 1, #p47)
	end
	return table.concat(v53)
end
function v9.unescapeString(p57) -- name: unescapeString
	-- upvalues: (copy) v_u_6, (copy) v_u_56, (copy) v_u_28, (copy) v_u_38
	if v_u_6(p57, "[\\&]") == nil then
		return p57
	else
		return v_u_56(v_u_28, p57, v_u_38)
	end
end
function v9.percentEncodeUrl(p58) -- name: percentEncodeUrl
	-- upvalues: (copy) v_u_56, (copy) v_u_35, (copy) v_u_43
	return v_u_56(v_u_35, p58, v_u_43)
end
local function v_u_62(p59) -- name: trim
	-- upvalues: (copy) v_u_5, (copy) v_u_8
	local v60 = #p59
	local v61 = 0
	while v61 < v60 and v_u_5(p59, v61 + 1) <= 32 do
		v61 = v61 + 1
	end
	while v61 < v60 and v_u_5(p59, v60 - 1 + 1) <= 32 do
		v60 = v60 - 1
	end
	return v_u_8(p59, v61 + 1, v60)
end
local function v_u_74(p63) -- name: caseFold
	-- upvalues: (copy) v_u_6, (copy) v_u_4, (copy) v_u_2, (copy) v_u_8
	local v64 = v_u_6(p63, "[A-Z\128-\255]", 1)
	local v65 = not v64 and -1 or v64 - 1
	if v65 == -1 then
		return p63
	end
	local v66 = 0
	local v67 = 0
	local v68 = {}
	while v65 ~= -1 do
		local v69 = v_u_4.codePointAt(p63, v65)
		local v70 = v69 < 128 and 1 or (v69 < 2048 and 2 or (v69 < 65536 and 3 or 4))
		local v71 = v_u_2[v69]
		if v71 ~= nil then
			local v72 = v66 + 1
			v68[v72] = v_u_8(p63, v67 + 1, v65)
			v66 = v72 + 1
			v68[v66] = v71
			v67 = v65 + v70
		end
		local v73 = v_u_6(p63, "[A-Z\128-\255]", v65 + v70 + 1)
		v65 = not v73 and -1 or v73 - 1
	end
	v68[v66 + 1] = v_u_8(p63, v67 + 1, #p63)
	return table.concat(v68)
end
function v9.normalizeLabelContent(p75) -- name: normalizeLabelContent
	-- upvalues: (copy) v_u_62, (copy) v_u_74, (copy) v_u_7
	return v_u_7(v_u_74((v_u_62(p75))), "[ \t\r\n]+", " ")
end
v9._findEntityOrEscapedChar = v_u_28
v9._findEscapeInUri = v_u_35
return v9