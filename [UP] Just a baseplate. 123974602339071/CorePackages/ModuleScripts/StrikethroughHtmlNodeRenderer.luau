-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.ext.gfm.strikethrough.internal.StrikethroughHtmlNodeRenderer
local v1 = script:FindFirstAncestor("CommonMark")
require(v1.renderer.html.HtmlNodeRendererContext)
require(v1.renderer.html.HtmlWriter)
local v_u_2 = require(v1.internal.port.LinkedHashMap)
require(v1.node.Node)
local v3 = {
	["__index"] = require(v1.ext.gfm.strikethrough.internal.StrikethroughNodeRenderer)
}
local v_u_4 = setmetatable({}, v3)
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
function v_u_4.render(p8, p9) -- name: render
	-- upvalues: (copy) v_u_2
	local v10 = p8._context:extendAttributes(p9, "del", v_u_2.of())
	p8._html:tag("del", v10)
	p8:renderChildren(p9)
	p8._html:tag("/del")
end
function v_u_4.renderChildren(p11, p12) -- name: renderChildren
	local v13 = p12:getFirstChild()
	while v13 ~= nil do
		local v14 = v13:getNext()
		p11._context:render(v13)
		v13 = v14
	end
end
return v_u_4