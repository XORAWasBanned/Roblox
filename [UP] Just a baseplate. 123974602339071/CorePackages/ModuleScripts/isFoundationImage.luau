-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Image.ImageSet.isFoundationImage
return function(p1) -- name: isFoundationImage
	local v2
	if p1 == nil or p1 == "" then
		v2 = false
	else
		v2 = p1:match("^%w+://.*$") == nil
	end
	return v2
end