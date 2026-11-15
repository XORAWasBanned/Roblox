-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.node.ListItem
local v1 = script:FindFirstAncestor("CommonMark")
local v_u_2 = require(v1.node.Node)
return function() -- name: ListItem
	-- upvalues: (copy) v_u_2
	local v3 = v_u_2.new("ListItem", true)
	v3.markerIndent = nil
	v3.contentIndent = nil
	return v3
end