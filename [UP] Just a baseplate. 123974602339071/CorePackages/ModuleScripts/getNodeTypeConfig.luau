-- Path: CorePackages.Packages._Index.Markdown.Markdown.Utils.getNodeTypeConfig
local v1 = script:FindFirstAncestor("Utils").Parent
require(v1.Types)
local v_u_2 = require(script.Parent.NodeTypeConfig)
return function(p3) -- name: getNodeTypeConfig
	-- upvalues: (copy) v_u_2
	local v4 = v_u_2[p3.type]
	if v4 then
		return v4
	end
	warn((("No node type config found for node: %* %* of type: %*"):format(p3.name, p3.text, p3.type)))
	return nil
end