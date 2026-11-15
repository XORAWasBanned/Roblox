-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.node.Code
local v1 = script:FindFirstAncestor("CommonMark")
local v_u_2 = require(v1.node.Node)
return function(p3) -- name: Code
	-- upvalues: (copy) v_u_2
	local v4 = v_u_2.new("Code", false)
	v4.literal = p3
	return v4
end