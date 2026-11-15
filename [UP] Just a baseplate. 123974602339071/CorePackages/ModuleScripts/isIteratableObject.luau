-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.jsutils.isIteratableObject
return {
	["isIteratableObject"] = function(p1) -- name: isIteratableObject
		if typeof(p1) == "table" then
			return next(p1) == nil and true or #p1 ~= 0
		else
			return false
		end
	end
}