-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.utilities.stripIgnoredCharacters
local v1 = script.Parent.Parent
local v2 = v1.language
local v3 = v1.Parent
local v_u_4 = require(v3.LuauPolyfill).String
local v5 = require(v2.source)
local v_u_6 = v5.Source
local v_u_7 = v5.isSource
local v_u_8 = require(v2.tokenKind).TokenKind
local v9 = require(v2.lexer)
local v_u_10 = v9.Lexer
local v_u_11 = v9.isPunctuatorTokenKind
local v12 = require(v2.blockString)
local v_u_13 = v12.dedentBlockStringValue
local v_u_14 = v12.getBlockStringIndentation
local v_u_15 = nil
local function v25(p16) -- name: stripIgnoredCharacters
	-- upvalues: (copy) v_u_7, (copy) v_u_6, (copy) v_u_10, (copy) v_u_8, (copy) v_u_11, (copy) v_u_4, (ref) v_u_15
	if not v_u_7(p16) then
		p16 = v_u_6.new(p16)
	end
	local v17 = p16.body
	local v18 = v_u_10.new(p16)
	local v19 = ""
	local v20 = false
	while v18:advance().kind ~= v_u_8.EOF do
		local v21 = v18.token
		local v22 = v21.kind
		local v23 = not v_u_11(v21.kind)
		if v20 and (v23 or v21.kind == v_u_8.SPREAD) then
			v19 = v19 .. " "
		end
		local v24 = v_u_4.slice(v17, v21.start, v21._end)
		if v22 == v_u_8.BLOCK_STRING then
			v19 = v19 .. v_u_15(v24)
		else
			v19 = v19 .. v24
		end
		v20 = v23
	end
	return v19
end
v_u_15 = function(p26) -- name: dedentBlockString
	-- upvalues: (copy) v_u_4, (copy) v_u_13, (copy) v_u_14
	local v27 = v_u_13((v_u_4.slice(p26, 4, -3)))
	if v_u_14(v27) > 0 then
		v27 = "\n" .. v27
	end
	local v28 = utf8.len(v27)
	local v29 = v28 ~= nil
	local v30 = "invalid utf8 detected: " .. v27
	assert(v29, v30)
	local v31 = v_u_4.slice(v27, v28)
	local v32
	if v31 == "\"" then
		v32 = v_u_4.slice(v27, -4) ~= "\\\"\"\""
	else
		v32 = false
	end
	if v32 or v31 == "\\" then
		v27 = v27 .. "\n"
	end
	return "\"\"\"" .. v27 .. "\"\"\""
end
return {
	["stripIgnoredCharacters"] = v25
}