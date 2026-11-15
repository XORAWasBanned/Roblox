-- Path: CorePackages.Packages._Index.Markdown.Markdown.Parsers.RobloxMarkdown.Underline.UnderlineHtmlNodeRenderer
local v1 = script:FindFirstAncestor("Markdown").Parent
local v_u_2 = require(v1.CommonMark).Renderer.Html.LinkedHashMap
local v_u_3 = {}
v_u_3.__index = v_u_3
function v_u_3.new(p4) -- name: new
	-- upvalues: (copy) v_u_3
	local v5 = {
		["_context"] = p4,
		["_html"] = p4:getWriter()
	}
	local v6 = v_u_3
	return setmetatable(v5, v6)
end
function v_u_3.getNodeTypes(_) -- name: getNodeTypes
	return { "Underline" }
end
function v_u_3.render(p7, p8) -- name: render
	-- upvalues: (copy) v_u_2
	local v9 = p7._context:extendAttributes(p8, "u", v_u_2.of())
	p7._html:tag("u", v9)
	p7:renderChildren(p8)
	p7._html:tag("/u")
end
function v_u_3.renderChildren(p10, p11) -- name: renderChildren
	local v12 = p11:getFirstChild()
	while v12 ~= nil do
		local v13 = v12:getNext()
		p10._context:render(v12)
		v12 = v13
	end
end
return v_u_3