-- Path: CorePackages.Packages._Index.Number.Number.isInteger
return function(p1)
	local v2
	if type(p1) == "number" and p1 ~= (1 / 0) then
		v2 = p1 == math.floor(p1)
	else
		v2 = false
	end
	return v2
end