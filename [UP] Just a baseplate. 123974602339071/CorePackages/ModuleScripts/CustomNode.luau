-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.node.CustomNode
local v1 = script:FindFirstAncestor("CommonMark")
local v_u_2 = require(v1.node.Node)
return {
	["new"] = function(p3) -- name: new
		-- upvalues: (copy) v_u_2
		return v_u_2.new(p3, false)
	end
}