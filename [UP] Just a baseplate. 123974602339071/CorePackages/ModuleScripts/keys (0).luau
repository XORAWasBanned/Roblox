-- Path: CorePackages.Packages._Index.Cryo.Cryo.Dictionary.keys
return function(p1) -- name: keys
	local v2 = {}
	local v3 = 1
	for v4 in pairs(p1) do
		v2[v3] = v4
		v3 = v3 + 1
	end
	return v2
end