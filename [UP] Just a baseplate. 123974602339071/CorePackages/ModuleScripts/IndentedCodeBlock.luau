-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.node.IndentedCodeBlock
local v1 = script:FindFirstAncestor("CommonMark")
local v_u_2 = require(v1.node.Node)
return function() -- name: IndentedCodeBlock
	-- upvalues: (copy) v_u_2
	local v3 = v_u_2.new("IndentedCodeBlock", true)
	v3.literal = nil
	return v3
end