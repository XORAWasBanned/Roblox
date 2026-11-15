-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.node.StrongEmphasis
local v1 = script:FindFirstAncestor("CommonMark")
require(v1.node.Delimited)
local v_u_2 = require(v1.node.Node)
return function(p3) -- name: StrongEmphasis
	-- upvalues: (copy) v_u_2
	local v4 = v_u_2.new("StrongEmphasis", false)
	v4.openingDelimiter = p3
	v4.closingDelimiter = p3
	return v4
end