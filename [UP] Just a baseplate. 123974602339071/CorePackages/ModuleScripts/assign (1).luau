-- Path: CorePackages.Packages._Index.Otter-31ab8d40-0.1.4.Otter.assign
return function(p1, ...) -- name: assign
	for v2 = 1, select("#", ...) do
		local v3 = select(v2, ...)
		for v4, v5 in pairs(v3) do
			p1[v4] = v5
		end
	end
	return p1
end