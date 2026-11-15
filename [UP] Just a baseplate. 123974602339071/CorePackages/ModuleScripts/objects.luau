-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.utilities.common.objects
return {
	["isNonNullObject"] = function(p1) -- name: isNonNullObject
		local v2
		if p1 == nil then
			v2 = false
		else
			v2 = type(p1) == "table"
		end
		return v2
	end
}