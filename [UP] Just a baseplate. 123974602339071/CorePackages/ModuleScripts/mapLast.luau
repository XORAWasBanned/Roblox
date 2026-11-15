-- Path: CorePackages.Packages._Index.Dash.Dash.mapLast
return function(p1, p2) -- name: mapLast
	for v3 = #p1, 1, -1 do
		local v4 = p2(p1[v3], v3)
		if v4 == nil then
			continue
		end
		return v4
	end
	return nil
end