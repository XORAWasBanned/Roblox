-- Path: CorePackages.Packages._Index.Dash.Dash.findIndex
return function(p1, p2) -- name: findIndex
	for v3, v4 in ipairs(p1) do
		if not p2(v4, v3) then
			continue
		end
		return v3
	end
	return nil
end