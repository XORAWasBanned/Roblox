-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.link.http.createSignalIfSupported
return {
	["createSignalIfSupported"] = function() -- name: createSignalIfSupported
		local v1 = _G.AbortController
		if typeof(v1) == "nil" then
			return {
				["controller"] = false,
				["signal"] = false
			}
		end
		local v2 = v1.new()
		return {
			["controller"] = v2,
			["signal"] = v2.signal
		}
	end
}