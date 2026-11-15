-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.luaUtils.stringIndexOf
return {
	["stringIndexOf"] = function(p1, p2) -- name: stringIndexOf
		local v3, _ = string.find(p1, p2)
		return v3 == nil and -1 or v3
	end
}