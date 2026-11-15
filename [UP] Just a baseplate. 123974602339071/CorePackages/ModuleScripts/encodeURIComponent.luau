-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.luaUtils.encodeURIComponent
local v_u_1 = game:GetService("HttpService")
return function(p2) -- name: encodeURIComponent
	-- upvalues: (copy) v_u_1
	return v_u_1:UrlEncode(p2):gsub("%%2D", "-"):gsub("%%5F", "_"):gsub("%%2E", "."):gsub("%%21", "!"):gsub("%%7E", "~"):gsub("%%2A", "*"):gsub("%%27", "\'"):gsub("%%28", "("):gsub("%%29", ")")
end