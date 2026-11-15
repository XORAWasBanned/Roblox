-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.node.Heading
local v1 = script:FindFirstAncestor("CommonMark")
local v_u_2 = require(v1.node.Node)
return function() -- name: Heading
	-- upvalues: (copy) v_u_2
	local v3 = v_u_2.new("Heading", true)
	v3.level = 0
	return v3
end