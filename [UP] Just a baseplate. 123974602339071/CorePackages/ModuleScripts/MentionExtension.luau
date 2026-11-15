-- Path: CorePackages.Packages._Index.Markdown.Markdown.Parsers.RobloxMarkdown.Mention.MentionExtension
local v1 = script:FindFirstAncestor("Markdown")
local v2 = v1.Parent
require(v1.Adapter.AdapterTypes)
require(v2.CommonMark)
require(script.Parent.Mention)
local v_u_3 = require(script.Parent.MentionInlineParser)
local v4 = {}
local function v_u_6(p5) -- name: mentionText
	return ("@%*"):format(p5.name or p5.id)
end
function v4.create() -- name: create
	-- upvalues: (copy) v_u_3, (copy) v_u_6
	return {
		["extendParser"] = function(p7) -- name: extendParser
			-- upvalues: (ref) v_u_3
			p7:customInlineContentParserFactory(v_u_3.Factory.new())
		end,
		["extendHtmlRenderer"] = function(p8) -- name: extendHtmlRenderer
			local v_u_9 = require(script.Parent.MentionHtmlNodeRenderer)
			p8:nodeRendererFactory({
				["create"] = function(_, p10) -- name: create
					-- upvalues: (copy) v_u_9
					return v_u_9.new(p10)
				end
			})
		end,
		["extendAdapter"] = function(p11) -- name: extendAdapter
			-- upvalues: (ref) v_u_6
			p11:inline("Mention", {
				["text"] = v_u_6
			})
		end
	}
end
return v4