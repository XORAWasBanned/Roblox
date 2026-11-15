-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.scaleValue
return function(p1, p2) -- name: scaleValue
	if p2 == nil then
		return p1
	elseif typeof(p1) == "number" then
		return p1 * p2
	elseif typeof(p1) == "UDim" then
		return UDim.new(p1.Scale, p1.Offset * p2)
	elseif typeof(p1) == "UDim2" then
		return UDim2.new(p1.X.Scale, p1.X.Offset * p2, p1.Y.Scale, p1.Y.Offset * p2)
	else
		return p1
	end
end