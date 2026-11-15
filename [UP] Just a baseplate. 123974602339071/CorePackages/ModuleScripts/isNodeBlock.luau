-- Path: CorePackages.Packages._Index.Markdown.Markdown.Parsers.isNodeBlock
local v1 = script:FindFirstAncestor("Markdown")
local v_u_2 = require(v1.Enums.NodeType)
require(v1.Types)
return function(p3) -- name: isNodeBlock
	-- upvalues: (copy) v_u_2
	local v4
	if p3.name == "TAG" then
		v4 = false
	else
		v4 = p3.type == v_u_2.Block and true or p3.type == v_u_2.TextBlock
	end
	return v4
end