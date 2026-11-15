-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.node.BulletList
local v1 = script:FindFirstAncestor("CommonMark")
local v_u_2 = require(v1.node.ListBlock)
return function() -- name: BulletList
	-- upvalues: (copy) v_u_2
	local v3 = v_u_2.new("BulletList")
	v3.marker = nil
	return v3
end