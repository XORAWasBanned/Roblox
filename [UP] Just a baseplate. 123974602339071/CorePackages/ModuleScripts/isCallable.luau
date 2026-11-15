-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.luaUtils.isCallable
return function(p1) -- name: isCallable
	if typeof(p1) == "function" then
		return true
	end
	if typeof(p1) == "table" then
		local v2 = getmetatable(p1)
		if v2 and rawget(v2, "__call") then
			return true
		end
		if p1._isMockFunction then
			return true
		end
	end
	return false
end