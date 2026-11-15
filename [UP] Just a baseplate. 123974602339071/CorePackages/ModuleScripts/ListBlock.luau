-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.node.ListBlock
local v1 = script:FindFirstAncestor("CommonMark")
local v_u_2 = require(v1.node.Node)
return {
	["new"] = function(p3) -- name: new
		-- upvalues: (copy) v_u_2
		local v4 = v_u_2.new(p3, true)
		v4.tight = false
		return v4
	end
}