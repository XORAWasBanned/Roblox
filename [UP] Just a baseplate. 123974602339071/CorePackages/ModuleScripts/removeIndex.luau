-- Path: CorePackages.Packages._Index.Cryo.Cryo.List.removeIndex
return function(p1, p2) -- name: removeIndex
	local v3 = 0
	local v4 = {}
	for v5 = 1, #p1 do
		if v5 == p2 then
			v3 = 1
		else
			v4[v5 - v3] = p1[v5]
		end
	end
	return v4
end