-- Path: CorePackages.Packages._Index.llama.llama.equalObjects
return function(...) -- name: equalObjects
	for v1 = 1, select("#", ...) - 1 do
		local v2 = select(v1, ...)
		local v3 = v1 + 1
		if v2 == select(v3, ...) then
			continue
		end
		return false
	end
	return true
end