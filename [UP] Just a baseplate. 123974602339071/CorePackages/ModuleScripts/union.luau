-- Path: CorePackages.Packages._Index.Cryo.Cryo.Dictionary.union
return function(p1, p2) -- name: union
	local v3 = table.clone(p1)
	for v4, v5 in p2 do
		v3[v4] = v5
	end
	return v3
end