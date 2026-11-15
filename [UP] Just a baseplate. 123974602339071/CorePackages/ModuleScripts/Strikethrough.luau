-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.ext.gfm.strikethrough.Strikethrough
local v1 = script:FindFirstAncestor("CommonMark")
local v_u_2 = require(v1.node.CustomNode)
require(v1.node.Delimited)
return function(p3) -- name: Strikethrough
	-- upvalues: (copy) v_u_2
	local v4 = v_u_2.new("Strikethrough")
	v4.openingDelimiter = p3
	v4.closingDelimiter = p3
	return v4
end