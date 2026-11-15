-- Path: CorePackages.Packages._Index.Dash.Dash.last
return function(p1, p2) -- name: last
	for v3 = #p1, 1, -1 do
		local v4 = p1[v3]
		if not p2 then
			return v4
		end
		if not (p2 and p2(v4, v3)) then
			continue
		end
		return v4
	end
	return nil
end