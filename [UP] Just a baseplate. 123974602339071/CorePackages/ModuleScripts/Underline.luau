-- Path: CorePackages.Packages._Index.Markdown.Markdown.Parsers.RobloxMarkdown.Underline.Underline
local v1 = script:FindFirstAncestor("Markdown").Parent
local v_u_2 = require(v1.CommonMark)
return function(p3) -- name: Underline
	-- upvalues: (copy) v_u_2
	local v4 = v_u_2.Node.CustomNode.new("Underline")
	v4.openingDelimiter = p3
	v4.closingDelimiter = p3
	return v4
end