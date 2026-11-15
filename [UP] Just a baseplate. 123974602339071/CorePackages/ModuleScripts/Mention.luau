-- Path: CorePackages.Packages._Index.Markdown.Markdown.Parsers.RobloxMarkdown.Mention.Mention
local v1 = script:FindFirstAncestor("Markdown").Parent
local v_u_2 = require(v1.CommonMark)
return function(p3, p4) -- name: Mention
	-- upvalues: (copy) v_u_2
	local v5 = v_u_2.Node.CustomNode.new("Mention")
	v5.id = p3
	v5.name = p4
	return v5
end