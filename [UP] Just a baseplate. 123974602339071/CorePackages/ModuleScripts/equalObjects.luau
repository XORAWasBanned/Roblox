-- Path: CorePackages.Packages._Index.Cryo.Cryo.equalObjects
return function(...) -- name: equalObjects
	local v1 = select(1, ...)
	for v2 = 2, select("#", ...) do
		if v1 == select(v2, ...) then
			continue
		end
		return false
	end
	return true
end