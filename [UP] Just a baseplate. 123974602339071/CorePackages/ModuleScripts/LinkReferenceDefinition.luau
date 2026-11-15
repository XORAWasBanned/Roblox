-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.node.LinkReferenceDefinition
local v1 = script:FindFirstAncestor("CommonMark")
local v_u_2 = require(v1.node.Node)
return function(p3, p4, p5) -- name: LinkReferenceDefinition
	-- upvalues: (copy) v_u_2
	local v6 = v_u_2.new("LinkReferenceDefinition", true)
	v6.label = p3
	v6.destination = p4
	v6.title = p5
	return v6
end