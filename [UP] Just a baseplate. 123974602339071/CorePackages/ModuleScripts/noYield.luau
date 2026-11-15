-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.noYield
return function(p1)
	local v2 = coroutine.create(p1)
	return (function(p3, p4, ...)
		if p4 then
			if coroutine.status(p3) == "dead" then
				return ...
			else
				return nil
			end
		else
			return nil
		end
	end)(v2, coroutine.resume(v2))
end