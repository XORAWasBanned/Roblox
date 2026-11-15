-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.renderer.html.CoreHtmlNodeRenderer
local v1 = script:FindFirstAncestor("CommonMark")
local v2 = require(v1.node.AbstractVisitor)
require(v1.renderer.html.HtmlNodeRendererContext)
require(v1.renderer.html.HtmlWriter)
local v_u_3 = require(v1.internal.port.LinkedHashMap)
require(v1.node.Nodes)
local v_u_4 = string.find
local v_u_5 = string.sub
local v_u_6 = setmetatable({}, {
	["__index"] = v2
})
v_u_6.__index = v_u_6
function v_u_6.new() -- name: new
	-- upvalues: (copy) v_u_6
	local v7 = v_u_6
	return setmetatable({
		["_sb"] = nil,
		["_n"] = 0,
		["_sb"] = {}
	}, v7)
end
function v_u_6.getAltText(p8) -- name: getAltText
	return table.concat(p8._sb)
end
function v_u_6.visitText(p9, p10) -- name: visitText
	p9._n = p9._n + 1
	local v11 = p9._sb
	local v12 = p9._n
	local v13 = p10.literal
	v11[v12] = v13 == nil and "null" or v13
end
function v_u_6.visitCode(p14, p15) -- name: visitCode
	p14._n = p14._n + 1
	local v16 = p14._sb
	local v17 = p14._n
	local v18 = p15.literal
	v16[v17] = v18 == nil and "null" or v18
end
function v_u_6.visitSoftLineBreak(p19, _) -- name: visitSoftLineBreak
	p19._n = p19._n + 1
	p19._sb[p19._n] = "\n"
end
function v_u_6.visitHardLineBreak(p20, _) -- name: visitHardLineBreak
	p20._n = p20._n + 1
	p20._sb[p20._n] = "\n"
end
local v_u_21 = setmetatable({}, {
	["__index"] = v2
})
v_u_21.__index = v_u_21
function v_u_21.new(p22) -- name: new
	-- upvalues: (copy) v_u_21
	local v23 = {
		["context"] = p22,
		["_html"] = p22:getWriter()
	}
	local v24 = v_u_21
	return setmetatable(v23, v24)
end
local v_u_25 = table.freeze({
	"Document",
	"Heading",
	"Paragraph",
	"BlockQuote",
	"BulletList",
	"FencedCodeBlock",
	"HtmlBlock",
	"ThematicBreak",
	"IndentedCodeBlock",
	"Link",
	"ListItem",
	"OrderedList",
	"Image",
	"Emphasis",
	"StrongEmphasis",
	"Text",
	"Code",
	"HtmlInline",
	"SoftLineBreak",
	"HardLineBreak"
})
function v_u_21.getNodeTypes(_) -- name: getNodeTypes
	-- upvalues: (copy) v_u_25
	return v_u_25
end
function v_u_21.render(p26, p27) -- name: render
	p27:accept(p26)
end
function v_u_21.visitDocument(p28, p29) -- name: visitDocument
	p28:visitChildren(p29)
end
function v_u_21.visitHeading(p30, p31) -- name: visitHeading
	local v32 = ("h%*"):format(p31.level)
	p30._html:line()
	p30._html:tag(v32, p30:getAttrs(p31, v32))
	p30:visitChildren(p31)
	p30._html:tag("/" .. v32)
	p30._html:line()
end
function v_u_21.visitParagraph(p33, p34) -- name: visitParagraph
	local v35 = p34:getParent()
	local v36 = not p33:isInTightList(p34) and p33.context:shouldOmitSingleParagraphP()
	if v36 then
		if v35 == nil or (v35.kind ~= "Document" or p34:getPrevious() ~= nil) then
			v36 = false
		else
			v36 = p34:getNext() == nil
		end
	end
	if not v36 then
		p33._html:line()
		p33._html:tag("p", p33:getAttrs(p34, "p"))
	end
	p33:visitChildren(p34)
	if not v36 then
		p33._html:tag("/p")
		p33._html:line()
	end
end
function v_u_21.visitBlockQuote(p37, p38) -- name: visitBlockQuote
	p37._html:line()
	p37._html:tag("blockquote", p37:getAttrs(p38, "blockquote"))
	p37._html:line()
	p37:visitChildren(p38)
	p37._html:line()
	p37._html:tag("/blockquote")
	p37._html:line()
end
function v_u_21.visitBulletList(p39, p40) -- name: visitBulletList
	p39:renderListBlock(p40, "ul", p39:getAttrs(p40, "ul"))
end
function v_u_21.visitFencedCodeBlock(p41, p42) -- name: visitFencedCodeBlock
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
	local v43 = p42.literal
	local v44 = v_u_3.new()
	local v45 = p42.info
	if v45 ~= nil and v45 ~= "" then
		local v46 = (v_u_4(v45, " ", 1, true) or 0) - 1
		if v46 ~= -1 then
			v45 = v_u_5(v45, 1, v46)
		end
		v44:put("class", "language-" .. v45)
	end
	p41:renderCodeBlock(v43, p42, v44)
end
function v_u_21.visitHtmlBlock(p47, p48) -- name: visitHtmlBlock
	p47._html:line()
	if p47.context:shouldEscapeHtml() then
		p47._html:tag("p", p47:getAttrs(p48, "p"))
		p47._html:text(p48.literal)
		p47._html:tag("/p")
	else
		p47._html:raw(p48.literal)
	end
	p47._html:line()
end
function v_u_21.visitThematicBreak(p49, p50) -- name: visitThematicBreak
	p49._html:line()
	p49._html:tag("hr", p49:getAttrs(p50, "hr"), true)
	p49._html:line()
end
function v_u_21.visitIndentedCodeBlock(p51, p52) -- name: visitIndentedCodeBlock
	-- upvalues: (copy) v_u_3
	p51:renderCodeBlock(p52.literal, p52, v_u_3.of())
end
function v_u_21.visitLink(p53, p54) -- name: visitLink
	-- upvalues: (copy) v_u_3
	local v55 = v_u_3.new()
	local v56 = p54.destination
	if p53.context:shouldSanitizeUrls() then
		v56 = p53.context:urlSanitizer():sanitizeLinkUrl(v56)
		v55:put("rel", "nofollow")
	end
	v55:put("href", (p53.context:encodeUrl(v56)))
	if p54.title ~= nil then
		v55:put("title", p54.title)
	end
	p53._html:tag("a", p53:getAttrs(p54, "a", v55))
	p53:visitChildren(p54)
	p53._html:tag("/a")
end
function v_u_21.visitListItem(p57, p58) -- name: visitListItem
	p57._html:tag("li", p57:getAttrs(p58, "li"))
	p57:visitChildren(p58)
	p57._html:tag("/li")
	p57._html:line()
end
function v_u_21.visitOrderedList(p59, p60) -- name: visitOrderedList
	-- upvalues: (copy) v_u_3
	local v61 = p60.markerStartNumber == nil and 1 or p60.markerStartNumber
	local v62 = v_u_3.new()
	if v61 ~= 1 then
		v62:put("start", (tostring(v61)))
	end
	p59:renderListBlock(p60, "ol", p59:getAttrs(p60, "ol", v62))
end
function v_u_21.visitImage(p63, p64) -- name: visitImage
	-- upvalues: (copy) v_u_6, (copy) v_u_3
	local v65 = p64.destination
	local v66 = v_u_6.new()
	p64:accept(v66)
	local v67 = v66:getAltText()
	local v68 = v_u_3.new()
	if p63.context:shouldSanitizeUrls() then
		v65 = p63.context:urlSanitizer():sanitizeImageUrl(v65)
	end
	v68:put("src", p63.context:encodeUrl(v65))
	v68:put("alt", v67)
	if p64.title ~= nil then
		v68:put("title", p64.title)
	end
	p63._html:tag("img", p63:getAttrs(p64, "img", v68), true)
end
function v_u_21.visitEmphasis(p69, p70) -- name: visitEmphasis
	p69._html:tag("em", p69:getAttrs(p70, "em"))
	p69:visitChildren(p70)
	p69._html:tag("/em")
end
function v_u_21.visitStrongEmphasis(p71, p72) -- name: visitStrongEmphasis
	p71._html:tag("strong", p71:getAttrs(p72, "strong"))
	p71:visitChildren(p72)
	p71._html:tag("/strong")
end
function v_u_21.visitText(p73, p74) -- name: visitText
	p73._html:text(p74.literal)
end
function v_u_21.visitCode(p75, p76) -- name: visitCode
	p75._html:tag("code", p75:getAttrs(p76, "code"))
	p75._html:text(p76.literal)
	p75._html:tag("/code")
end
function v_u_21.visitHtmlInline(p77, p78) -- name: visitHtmlInline
	if p77.context:shouldEscapeHtml() then
		p77._html:text(p78.literal)
	else
		p77._html:raw(p78.literal)
	end
end
function v_u_21.visitSoftLineBreak(p79, _) -- name: visitSoftLineBreak
	p79._html:raw(p79.context:getSoftbreak())
end
function v_u_21.visitHardLineBreak(p80, p81) -- name: visitHardLineBreak
	p80._html:tag("br", p80:getAttrs(p81, "br"), true)
	p80._html:line()
end
function v_u_21.visitChildren(p82, p83) -- name: visitChildren
	local v84 = p83:getFirstChild()
	while v84 ~= nil do
		local v85 = v84:getNext()
		p82.context:render(v84)
		v84 = v85
	end
end
function v_u_21.renderCodeBlock(p86, p87, p88, p89) -- name: renderCodeBlock
	p86._html:line()
	p86._html:tag("pre", p86:getAttrs(p88, "pre"))
	p86._html:tag("code", p86:getAttrs(p88, "code", p89))
	p86._html:text(p87)
	p86._html:tag("/code")
	p86._html:tag("/pre")
	p86._html:line()
end
function v_u_21.renderListBlock(p90, p91, p92, p93) -- name: renderListBlock
	p90._html:line()
	p90._html:tag(p92, p93)
	p90._html:line()
	p90:visitChildren(p91)
	p90._html:line()
	p90._html:tag("/" .. p92)
	p90._html:line()
end
function v_u_21.isInTightList(_, p94) -- name: isInTightList
	local v95 = p94:getParent()
	if v95 ~= nil then
		local v96 = v95:getParent()
		if v96 ~= nil and (v96.kind == "BulletList" or v96.kind == "OrderedList") then
			return v96.tight
		end
	end
	return false
end
function v_u_21.getAttrs(p97, p98, p99, p100) -- name: getAttrs
	-- upvalues: (copy) v_u_3
	local v101 = p97.context
	if p100 == nil then
		p100 = v_u_3.of()
	end
	return v101:extendAttributes(p98, p99, p100)
end
return v_u_21