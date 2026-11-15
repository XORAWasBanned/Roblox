-- Path: CorePackages.Packages._Index.Dash.Dash.reduce
return function(p1, p2, p3) -- name: reduce
	for v4, v5 in p1 do
		p3 = p2(p3, v5, v4)
	end
	return p3
end