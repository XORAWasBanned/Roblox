-- Path: CorePackages.Packages._Index.CollisionMatchers2D.CollisionMatchers2D.returnValue
return function(p1, p2, p3)
	return {
		["pass"] = p1,
		["message"] = p1 and p2 and p2 or (p3 or p2)
	}
end