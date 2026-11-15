-- Path: CorePackages.Packages._Index.Dash.Dash.some
return function(p1, p2) -- name: some
	for v3, v4 in p1 do
		if not p2(v4, v3) then
			continue
		end
		return true
	end
	return false
end