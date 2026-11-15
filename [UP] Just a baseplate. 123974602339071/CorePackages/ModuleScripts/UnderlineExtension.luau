-- Path: CorePackages.Packages._Index.Markdown.Markdown.Parsers.RobloxMarkdown.Underline.UnderlineExtension
local v1 = script:FindFirstAncestor("Markdown")
local v2 = v1.Parent
require(v1.Adapter.AdapterTypes)
require(v2.CommonMark)
local v_u_3 = require(script.Parent.UnderlineDelimiterProcessor)
return {
	["create"] = function() -- name: create
		-- upvalues: (copy) v_u_3
		return {
			["extendParser"] = function(p4) -- name: extendParser
				-- upvalues: (ref) v_u_3
				p4:customDelimiterProcessor(v_u_3.new())
			end,
			["extendHtmlRenderer"] = function(p5) -- name: extendHtmlRenderer
				local v_u_6 = require(script.Parent.UnderlineHtmlNodeRenderer)
				p5:nodeRendererFactory({
					["create"] = function(_, p7) -- name: create
						-- upvalues: (copy) v_u_6
						return v_u_6.new(p7)
					end
				})
			end,
			["extendAdapter"] = function(p8) -- name: extendAdapter
				p8:inline("Underline", {
					["style"] = "UNDERLINE"
				})
			end
		}
	end
}