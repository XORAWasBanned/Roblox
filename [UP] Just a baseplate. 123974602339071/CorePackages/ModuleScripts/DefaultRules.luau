-- Path: CorePackages.Packages._Index.Markdown.Markdown.Adapter.DefaultRules
local v1 = script:FindFirstAncestor("Markdown").Parent
require(script.Parent.AdapterTypes)
require(v1.CommonMark)
local v_u_2 = require(script.Parent.Rules)
local function v_u_4(p3) -- name: literalOf
	return p3.literal or ""
end
local function v_u_5(_) -- name: softLineBreak
	return "\n"
end
return {
	["register"] = function(p6) -- name: register
		-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_5
		p6:block("Paragraph", {
			["as"] = "PARAGRAPH"
		})
		p6:block("Heading", {
			["as"] = "HEADING",
			["attributes"] = nil,
			["attributes"] = function(p7) -- name: attributes
				return {
					["depth"] = p7.level
				}
			end
		})
		p6:block("ThematicBreak", v_u_2.divider())
		p6:block("FencedCodeBlock", v_u_2.codeBlock())
		p6:block("IndentedCodeBlock", v_u_2.codeBlock())
		p6:block("HtmlBlock", v_u_2.htmlBlock())
		local v8 = v_u_2.list()
		p6:block("BulletList", v8)
		p6:block("OrderedList", v8)
		p6:block("BlockQuote", v_u_2.quote())
		p6:block("LinkReferenceDefinition", "drop")
		p6:inline("Text", {
			["text"] = v_u_4
		})
		p6:inline("HtmlInline", {
			["text"] = v_u_4
		})
		p6:inline("SoftLineBreak", {
			["text"] = v_u_5
		})
		p6:inline("HardLineBreak", v_u_2.hardLineBreak())
		p6:inline("Code", v_u_2.code())
		p6:inline("Link", v_u_2.link())
		p6:inline("Image", v_u_2.image())
		p6:inline("Emphasis", {
			["style"] = "ITALIC"
		})
		p6:inline("StrongEmphasis", {
			["style"] = "BOLD_2"
		})
		p6:inline("Strikethrough", {
			["style"] = "STRIKE"
		})
	end
}