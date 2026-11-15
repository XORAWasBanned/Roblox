-- Path: CorePackages.Packages._Index.Dash.Dash.mapFirst
return function(p1, p2) -- name: mapFirst
	for v3, v4 in ipairs(p1) do
		local v5 = p2(v4, v3)
		if v5 == nil then
			continue
		end
		return v5
	end
	return nil
end