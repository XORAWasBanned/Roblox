-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.node.Link
local v1 = script:FindFirstAncestor("CommonMark")
local v_u_2 = require(v1.node.Node)
function v_u_2.toStringAttributesByKind.Link(p3)
	return "destination=" .. (p3.destination == nil and "null" or p3.destination) .. ", title=" .. (p3.title == nil and "null" or p3.title)
end
return function(p4, p5) -- name: Link
	-- upvalues: (copy) v_u_2
	local v6 = v_u_2.new("Link", false)
	v6.destination = p4
	v6.title = p5
	return v6
end