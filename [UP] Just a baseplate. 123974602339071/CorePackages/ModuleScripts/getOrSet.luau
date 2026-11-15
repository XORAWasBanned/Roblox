-- Path: CorePackages.Packages._Index.Dash.Dash.getOrSet
return function(p1, p2, p3) -- name: getOrSet
	if p1[p2] == nil then
		p1[p2] = p3(p1, p2)
	end
	return p1[p2]
end