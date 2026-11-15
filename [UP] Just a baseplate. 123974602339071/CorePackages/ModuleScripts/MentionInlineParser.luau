-- Path: CorePackages.Packages._Index.Markdown.Markdown.Parsers.RobloxMarkdown.Mention.MentionInlineParser
local v1 = script:FindFirstAncestor("Markdown").Parent
local v_u_2 = require(v1.CommonMark)
local v_u_3 = require(script.Parent.Mention)
local _ = string.byte
local v_u_4 = v_u_2.Text.AsciiMatcher.builder():range(48, 57):build()
local v_u_5 = v_u_2.Text.AsciiMatcher.builder():range(65, 90):range(97, 122):range(48, 57):c(95):build()
local v_u_6 = {}
v_u_6.__index = v_u_6
function v_u_6.new() -- name: new
	-- upvalues: (copy) v_u_6
	local v7 = v_u_6
	return setmetatable({}, v7)
end
function v_u_6.tryParse(_, p8) -- name: tryParse
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_5, (copy) v_u_3
	local v9 = p8:scanner()
	v9:next()
	if v9:nextChar(64) then
		local v10 = v9:position()
		if v9:match(v_u_4) == 0 then
			return v_u_2.Parser.Beta.ParsedInline.none()
		else
			local v11 = v9:getSource(v10, v9:position()):getContent()
			local v12
			if v9:nextChar(58) then
				local v13 = v9:position()
				if v9:match(v_u_5) == 0 then
					return v_u_2.Parser.Beta.ParsedInline.none()
				end
				v12 = v9:getSource(v13, v9:position()):getContent()
			else
				v12 = nil
			end
			if v9:nextChar(62) then
				return v_u_2.Parser.Beta.ParsedInline.of(v_u_3(v11, v12), v9:position())
			else
				return v_u_2.Parser.Beta.ParsedInline.none()
			end
		end
	else
		return v_u_2.Parser.Beta.ParsedInline.none()
	end
end
local v_u_14 = {}
v_u_14.__index = v_u_14
function v_u_14.new() -- name: new
	-- upvalues: (copy) v_u_14
	local v15 = v_u_14
	return setmetatable({}, v15)
end
function v_u_14.getTriggerCharacters(_) -- name: getTriggerCharacters
	return {
		[60] = true
	}
end
function v_u_14.create(_) -- name: create
	-- upvalues: (copy) v_u_6
	return v_u_6.new()
end
v_u_6.Factory = v_u_14
return v_u_6