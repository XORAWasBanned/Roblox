-- Path: CorePackages.Packages._Index.Cryo.Cryo.List.foldLeft
return function(p1, p2, p3) -- name: foldLeft
	for v4 = 1, #p1 do
		p3 = p2(p3, p1[v4], v4)
	end
	return p3
end