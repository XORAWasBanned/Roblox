-- Path: CorePackages.Packages._Index.Cryo.Cryo.Dictionary.omit
return function(p1, ...) -- name: omit
	local v2 = table.clone(p1)
	for _, v3 in { ... } do
		v2[v3] = nil
	end
	return v2
end