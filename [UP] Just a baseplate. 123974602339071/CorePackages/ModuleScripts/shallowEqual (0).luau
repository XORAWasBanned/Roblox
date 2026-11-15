-- Path: CorePackages.Packages._Index.FocusNavigationUtils.FocusNavigationUtils.shallowEqual
return function(p1, p2) -- name: shallowEqual
	for v3, v4 in p1 do
		if p2[v3] == v4 then
			continue
		end
		return false
	end
	for v5, v6 in p2 do
		if p1[v5] == v6 then
			continue
		end
		return false
	end
	return true
end