-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.inline.AutolinkInlineParser
local v1 = script:FindFirstAncestor("CommonMark")
local v2 = require(v1.text.AsciiMatcher)
require(v1.text.CharMatcher)
require(v1.parser.beta.InlineContentParser)
require(v1.parser.beta.InlineContentParserFactory)
require(v1.parser.beta.InlineParserState)
local v_u_3 = require(v1.node.Nodes)
local v_u_4 = require(v1.parser.beta.ParsedInline)
local _ = string.byte
local v_u_5 = string.find
local v_u_6 = string.sub
local v_u_7 = {}
v_u_7.__index = v_u_7
local v_u_8 = v2.builder():c(60):c(62):build()
local function v_u_16(p9) -- name: isEmail
	-- upvalues: (copy) v_u_5, (copy) v_u_6
	local _, v10 = v_u_5(p9, "^[A-Za-z0-9.!#$%%&\'*+/=?^_`{|}~%-]+@")
	if v10 == nil then
		return false
	end
	local v11 = v10 + 1
	while true do
		local v12 = v_u_5(p9, ".", v11, true)
		local v13
		if v12 == nil then
			v13 = #p9
		else
			v13 = v12 - 1
		end
		local v14 = v_u_6(p9, v11, v13)
		local v15
		if #v14 > 63 then
			v15 = false
		else
			v15 = v_u_5(v14, "^[A-Za-z0-9]$") ~= nil and true or v_u_5(v14, "^[A-Za-z0-9][A-Za-z0-9%-]*[A-Za-z0-9]$") ~= nil
		end
		if not v15 then
			return false
		end
		if v12 == nil then
			return true
		end
		v11 = v12 + 1
	end
end
function v_u_7.new() -- name: new
	-- upvalues: (copy) v_u_7
	local v17 = v_u_7
	return setmetatable({}, v17)
end
function v_u_7.tryParse(_, p18) -- name: tryParse
	-- upvalues: (copy) v_u_8, (copy) v_u_4, (copy) v_u_5, (copy) v_u_16, (copy) v_u_3
	local v19 = p18:scanner()
	v19:next()
	local v20 = v19:position()
	if v19:findMatcher(v_u_8) > 0 then
		if v19:peek() ~= 62 then
			return v_u_4.none()
		end
		local v21 = v19:getSource(v20, v19:position())
		local v22 = v21:getContent()
		v19:next()
		local v23 = nil
		local _, v24 = v_u_5(v22, "^[A-Za-z][A-Za-z0-9.+%-]*:")
		local v25
		if v24 == nil then
			v25 = false
		else
			local v26 = v24 - 1
			if v26 < 2 or v26 > 32 then
				v25 = false
			else
				v25 = v_u_5(v22, "[%z\1- <>]", v24 + 1) == nil
			end
		end
		if v25 then
			v23 = v22
		elseif v_u_16(v22) then
			v23 = "mailto:" .. v22
		end
		if v23 ~= nil then
			local v27 = v_u_3.Link(v23, nil)
			local v28 = v_u_3.Text(v22)
			v28:setSourceSpans(v21:getSourceSpans())
			v27:appendChild(v28)
			return v_u_4.of(v27, v19:position())
		end
	end
	return v_u_4.none()
end
local v_u_29 = {}
v_u_29.__index = v_u_29
function v_u_29.new() -- name: new
	-- upvalues: (copy) v_u_29
	local v30 = v_u_29
	return setmetatable({}, v30)
end
function v_u_29.getTriggerCharacters(_) -- name: getTriggerCharacters
	return {
		[60] = true
	}
end
function v_u_29.create(_) -- name: create
	-- upvalues: (copy) v_u_7
	return v_u_7.new()
end
v_u_7.Factory = v_u_29
function v_u_7._isUri(p31) -- name: isUri
	-- upvalues: (copy) v_u_5
	local _, v32 = v_u_5(p31, "^[A-Za-z][A-Za-z0-9.+%-]*:")
	if v32 == nil then
		return false
	else
		local v33 = v32 - 1
		if v33 < 2 or v33 > 32 then
			return false
		else
			return v_u_5(p31, "[%z\1- <>]", v32 + 1) == nil
		end
	end
end
v_u_7._isEmail = v_u_16
return v_u_7