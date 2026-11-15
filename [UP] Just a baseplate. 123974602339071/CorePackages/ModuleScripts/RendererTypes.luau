-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.port.RendererTypes
local v1 = script:FindFirstAncestor("CommonMark")
require(v1.renderer.html.AttributeProvider)
require(v1.renderer.html.AttributeProviderContext)
require(v1.renderer.html.AttributeProviderFactory)
require(v1.renderer.html.DefaultUrlSanitizer)
require(v1.renderer.html.HtmlNodeRendererContext)
require(v1.renderer.html.HtmlNodeRendererFactory)
require(v1.renderer.html.HtmlWriter)
require(v1.renderer.NodeRenderer)
require(v1.renderer.html.UrlSanitizer)
return {
	["AttributeProvider"] = nil,
	["AttributeProviderContext"] = nil,
	["AttributeProviderFactory"] = nil,
	["DefaultUrlSanitizer"] = nil,
	["HtmlNodeRendererContext"] = nil,
	["HtmlNodeRendererFactory"] = nil,
	["HtmlWriter"] = nil,
	["NodeRenderer"] = nil,
	["UrlSanitizer"] = nil
}