-- Path: CorePackages.Packages._Index.Dash.Dash.forEachArgs
return function(p1, ...) -- name: forEachArgs
	for v2 = 1, select("#", ...) do
		p1(select(v2, ...), v2)
	end
end