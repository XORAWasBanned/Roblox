-- Path: CorePackages.Packages._Index.Cryo.Cryo.List.findWhere
return function(p1, p2) -- name: findWhere
	for v3 = 1, #p1 do
		if not p2(p1[v3], v3) then
			continue
		end
		return v3
	end
	return nil
end