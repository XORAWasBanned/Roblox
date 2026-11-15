-- Path: CorePackages.Packages._Index.Markdown.Markdown.Parsers.getNodeType
local v1 = script:FindFirstAncestor("Markdown")
require(v1.Types)
local v_u_2 = require(v1.Enums.NodeType)
return function(p3, p4) -- name: getNodeType
	-- upvalues: (copy) v_u_2
	local v5 = p4.nodeConfiguration[p3]
	if v5 then
		return v5.type
	end
	warn((("No node configuration found for %*"):format(p3)))
	return v_u_2.Block
end