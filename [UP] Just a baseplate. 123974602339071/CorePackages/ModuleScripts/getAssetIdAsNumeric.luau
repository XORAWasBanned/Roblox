-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.getAssetIdAsNumeric
return function(p1) -- name: getAssetIdAsNumeric
	return typeof(p1) ~= "number" and (tonumber(p1:match("(%d+)$")) or -1) or p1
end