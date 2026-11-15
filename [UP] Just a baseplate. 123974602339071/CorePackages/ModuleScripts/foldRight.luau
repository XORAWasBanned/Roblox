-- Path: CorePackages.Packages._Index.Cryo.Cryo.List.foldRight
return function(p1, p2, p3) -- name: foldRight
	for v4 = #p1, 1, -1 do
		p3 = p2(p3, p1[v4], v4)
	end
	return p3
end