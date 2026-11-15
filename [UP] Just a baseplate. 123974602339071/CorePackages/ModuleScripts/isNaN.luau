-- Path: CorePackages.Packages._Index.Number.Number.isNaN
return function(p1)
	local v2
	if type(p1) == "number" then
		v2 = p1 ~= p1
	else
		v2 = false
	end
	return v2
end