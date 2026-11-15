-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.node.OrderedList
local v1 = script:FindFirstAncestor("CommonMark")
local v_u_2 = require(v1.node.ListBlock)
return function() -- name: OrderedList
	-- upvalues: (copy) v_u_2
	local v3 = v_u_2.new("OrderedList")
	v3.markerDelimiter = nil
	v3.markerStartNumber = nil
	return v3
end