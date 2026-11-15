-- Path: CorePackages.Packages._Index.Markdown.Markdown.Parsers.RobloxMarkdown.Mention.MentionHtmlNodeRenderer
local v1 = script:FindFirstAncestor("Markdown").Parent
local v2 = require(v1.CommonMark)
require(script.Parent.Mention)
local v_u_3 = v2.Renderer.Html.LinkedHashMap
local v_u_4 = {}
v_u_4.__index = v_u_4
function v_u_4.new(p5) -- name: new
	-- upvalues: (copy) v_u_4
	local v6 = {
		["_context"] = p5,
		["_html"] = p5:getWriter()
	}
	local v7 = v_u_4
	return setmetatable(v6, v7)
end
function v_u_4.getNodeTypes(_) -- name: getNodeTypes
	return { "Mention" }
end
function v_u_4.render(p8, p9) -- name: render
	-- upvalues: (copy) v_u_3
	local v10 = v_u_3.new()
	v10:put("id", p9.id)
	if p9.name ~= nil then
		v10:put("name", p9.name)
	end
	p8._html:tag("mention", p8._context:extendAttributes(p9, "mention", v10))
	p8._html:tag("/mention")
end
return v_u_4