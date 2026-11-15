-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.node.Text
local v1 = script:FindFirstAncestor("CommonMark")
local v_u_2 = require(v1.node.Node)
function v_u_2.toStringAttributesByKind.Text(p3)
	return "literal=" .. (p3.literal == nil and "null" or p3.literal)
end
return function(p4) -- name: Text
	-- upvalues: (copy) v_u_2
	local v5 = v_u_2.new("Text", false)
	v5.literal = p4
	return v5
end