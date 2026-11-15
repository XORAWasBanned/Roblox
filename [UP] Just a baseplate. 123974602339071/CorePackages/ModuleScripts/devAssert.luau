-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.devAssert
return function(p1, p2) -- name: devAssert
	if _G.__DEV__ == true then
		assert(p1, p2)
	end
end