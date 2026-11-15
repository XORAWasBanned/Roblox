-- Path: CorePackages.Packages._Index.Dash.Dash.mapOne
return function(p1, p2) -- name: mapOne
	for v3, v5 in p1 do
		if p2 then
			local v5 = p2(v5, v3)
		end
		if v5 == nil then
			continue
		end
		return v5
	end
	return nil
end