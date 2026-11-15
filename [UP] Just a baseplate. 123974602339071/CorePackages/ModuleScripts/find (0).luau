-- Path: CorePackages.Packages._Index.Cryo.Cryo.List.find
return function(p1, p2) -- name: find
	for v3 = 1, #p1 do
		if p1[v3] ~= p2 then
			continue
		end
		return v3
	end
	return nil
end