-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.blendTransparencies
return function(p1, p2) -- name: blendTransparencies
	return p1 == nil and (p2 or 0) or (p2 == nil and (p1 or 0) or 1 - (1 - p1) * (1 - p2))
end