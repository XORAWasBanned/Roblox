-- Path: CorePackages.Packages._Index.Markdown.Markdown.Components.NodeRenderers.renderInline
local v1 = script:FindFirstAncestor("Markdown")
local v2 = v1.Parent
require(v1.Types)
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.Dash)
local v5 = require(v2.InlineLayout)
local v_u_6 = require(v2.MarkdownCore).Flags
local v_u_7 = v5.Components.InlineLayout
local v_u_8 = require(v1.Utils.mergeContexts)
local v_u_9 = v5.Utils.isInlineElement
return function(p10, p11, p12) -- name: renderInline
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_6, (copy) v_u_4, (copy) v_u_8, (copy) v_u_9
	local v13 = v_u_3.createElement
	local v14 = v_u_7
	local v15 = {}
	if not v_u_6.FFlagMarkdownTables then
		p12 = nil
	end
	v15.HorizontalAlignment = p12
	v15.VerticalPadding = UDim.new(0, 0)
	v15.Elements = v_u_4.filter(p11.processChildren(p10, v_u_8(p11, {
		["isInline"] = true
	})), v_u_9)
	return v13(v14, v15)
end