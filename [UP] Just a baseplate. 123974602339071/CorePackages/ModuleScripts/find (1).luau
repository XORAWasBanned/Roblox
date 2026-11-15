-- Path: CorePackages.Packages._Index.Dash.Dash.find
return function(p1, p2) -- name: find
	for v3, v4 in p1 do
		if not p2(v4, v3) then
			continue
		end
		return v4
	end
	return nil
end