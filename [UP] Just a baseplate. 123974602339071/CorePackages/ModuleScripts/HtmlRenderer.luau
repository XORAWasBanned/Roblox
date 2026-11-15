-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.renderer.html.HtmlRenderer
local v1 = script:FindFirstAncestor("CommonMark")
require(v1.renderer.html.AttributeProvider)
require(v1.renderer.html.AttributeProviderContext)
require(v1.renderer.html.AttributeProviderFactory)
local v_u_2 = require(v1.renderer.html.CoreHtmlNodeRenderer)
local v_u_3 = require(v1.renderer.html.DefaultUrlSanitizer)
local v_u_4 = require(v1.internal.util.Escaping)
require(v1.Extension)
require(v1.renderer.html.HtmlNodeRendererContext)
require(v1.renderer.html.HtmlNodeRendererFactory)
local v_u_5 = require(v1.renderer.html.HtmlWriter)
local v_u_6 = require(v1.internal.port.LinkedHashMap)
require(v1.node.Node)
require(v1.renderer.NodeRenderer)
local v_u_7 = require(v1.internal.renderer.NodeRendererMap)
require(v1.renderer.html.UrlSanitizer)
local v_u_8 = {}
v_u_8.__index = v_u_8
local v_u_9 = {}
v_u_9.__index = v_u_9
function v_u_9.new(p10, p11) -- name: new
	-- upvalues: (copy) v_u_7, (copy) v_u_9
	local v12 = {
		["_renderer"] = p10,
		["_htmlWriter"] = p11,
		["_attributeProviders"] = {},
		["_nodeRendererMap"] = v_u_7.new()
	}
	local v13 = v_u_9
	local v14 = setmetatable(v12, v13)
	for _, v15 in ipairs(p10._attributeProviderFactories) do
		local v16 = v14._attributeProviders
		table.insert(v16, v15:create(v14))
	end
	for _, v17 in ipairs(p10._nodeRendererFactories) do
		local v18 = v17:create(v14)
		v14._nodeRendererMap:add(v18)
	end
	return v14
end
function v_u_9.shouldEscapeHtml(p19) -- name: shouldEscapeHtml
	return p19._renderer._escapeHtml
end
function v_u_9.shouldOmitSingleParagraphP(p20) -- name: shouldOmitSingleParagraphP
	return p20._renderer._omitSingleParagraphP
end
function v_u_9.shouldSanitizeUrls(p21) -- name: shouldSanitizeUrls
	return p21._renderer._sanitizeUrls
end
function v_u_9.urlSanitizer(p22) -- name: urlSanitizer
	return p22._renderer._urlSanitizer
end
function v_u_9.encodeUrl(p23, p24) -- name: encodeUrl
	-- upvalues: (copy) v_u_4
	if p23._renderer._percentEncodeUrls then
		return v_u_4.percentEncodeUrl(p24)
	else
		return p24
	end
end
function v_u_9.extendAttributes(p25, p26, p27, p28) -- name: extendAttributes
	-- upvalues: (copy) v_u_6
	local v29 = v_u_6.newMap(p28)
	p25:setCustomAttributes(p26, p27, v29)
	return v29
end
function v_u_9.getWriter(p30) -- name: getWriter
	return p30._htmlWriter
end
function v_u_9.getSoftbreak(p31) -- name: getSoftbreak
	return p31._renderer._softbreak
end
function v_u_9.render(p32, p33) -- name: render
	p32._nodeRendererMap:render(p33)
end
function v_u_9.beforeRoot(p34, p35) -- name: beforeRoot
	p34._nodeRendererMap:beforeRoot(p35)
end
function v_u_9.afterRoot(p36, p37) -- name: afterRoot
	p36._nodeRendererMap:afterRoot(p37)
end
function v_u_9.setCustomAttributes(p38, p39, p40, p41) -- name: setCustomAttributes
	for _, v42 in ipairs(p38._attributeProviders) do
		v42:setAttributes(p39, p40, p41)
	end
end
local v_u_44 = {
	["create"] = function(_, p43) -- name: create
		-- upvalues: (copy) v_u_2
		return v_u_2.new(p43)
	end
}
function v_u_8.new(p45) -- name: new
	-- upvalues: (copy) v_u_44, (copy) v_u_8
	local v46 = table.clone(p45._nodeRendererFactories)
	local v47 = v_u_44
	table.insert(v46, v47)
	local v48 = {
		["_softbreak"] = p45._softbreak,
		["_escapeHtml"] = p45._escapeHtml,
		["_percentEncodeUrls"] = p45._percentEncodeUrls,
		["_omitSingleParagraphP"] = p45._omitSingleParagraphP,
		["_sanitizeUrls"] = p45._sanitizeUrls,
		["_urlSanitizer"] = p45._urlSanitizer,
		["_attributeProviderFactories"] = table.clone(p45._attributeProviderFactories),
		["_nodeRendererFactories"] = v46
	}
	local v49 = v_u_8
	return setmetatable(v48, v49)
end
local v_u_50 = {}
v_u_50.__index = v_u_50
function v_u_8.builder() -- name: builder
	-- upvalues: (copy) v_u_50
	return v_u_50.new()
end
function v_u_8.renderAppendable(p51, p52, p53) -- name: renderAppendable
	-- upvalues: (copy) v_u_9, (copy) v_u_5
	local v54 = v_u_9.new(p51, v_u_5.new(p53))
	v54:beforeRoot(p52)
	v54:render(p52)
	v54:afterRoot(p52)
end
function v_u_8.render(p55, p56) -- name: render
	local v57 = {}
	p55:renderAppendable(p56, v57)
	return table.concat(v57)
end
function v_u_50.new() -- name: new
	-- upvalues: (copy) v_u_3, (copy) v_u_50
	local v58 = {
		["_softbreak"] = "\n",
		["_escapeHtml"] = false,
		["_sanitizeUrls"] = false,
		["_urlSanitizer"] = nil,
		["_percentEncodeUrls"] = false,
		["_omitSingleParagraphP"] = false,
		["_attributeProviderFactories"] = nil,
		["_nodeRendererFactories"] = nil,
		["_urlSanitizer"] = v_u_3.new(),
		["_attributeProviderFactories"] = {},
		["_nodeRendererFactories"] = {}
	}
	local v59 = v_u_50
	return setmetatable(v58, v59)
end
function v_u_50.build(p60) -- name: build
	-- upvalues: (copy) v_u_8
	return v_u_8.new(p60)
end
function v_u_50.softbreak(p61, p62) -- name: softbreak
	p61._softbreak = p62
	return p61
end
function v_u_50.escapeHtml(p63, p64) -- name: escapeHtml
	p63._escapeHtml = p64
	return p63
end
function v_u_50.sanitizeUrls(p65, p66) -- name: sanitizeUrls
	p65._sanitizeUrls = p66
	return p65
end
function v_u_50.urlSanitizer(p67, p68) -- name: urlSanitizer
	p67._urlSanitizer = p68
	return p67
end
function v_u_50.percentEncodeUrls(p69, p70) -- name: percentEncodeUrls
	p69._percentEncodeUrls = p70
	return p69
end
function v_u_50.omitSingleParagraphP(p71, p72) -- name: omitSingleParagraphP
	p71._omitSingleParagraphP = p72
	return p71
end
function v_u_50.attributeProviderFactory(p73, p74) -- name: attributeProviderFactory
	local v75 = p73._attributeProviderFactories
	table.insert(v75, p74)
	return p73
end
function v_u_50.nodeRendererFactory(p76, p77) -- name: nodeRendererFactory
	local v78 = p76._nodeRendererFactories
	table.insert(v78, p77)
	return p76
end
function v_u_50.extensions(p79, p80) -- name: extensions
	for _, v81 in ipairs(p80) do
		local v82 = v81.extendHtmlRenderer
		if v82 == nil then
			continue
		end
		v82(p79)
	end
	return p79
end
v_u_8.Builder = v_u_50
return v_u_8