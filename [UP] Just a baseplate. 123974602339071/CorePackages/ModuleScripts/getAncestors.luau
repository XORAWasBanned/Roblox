-- Path: CorePackages.Packages._Index.FocusNavigationUtils.FocusNavigationUtils.getAncestors
return function(p1) -- name: getAncestors
	local v2 = { p1 }
	while p1.Parent do
		local v3 = p1.Parent
		table.insert(v2, v3)
		p1 = p1.Parent
	end
	return v2
end