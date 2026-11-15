-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.utilities.common.maybe
return {
	["maybe"] = function(p_u_1) -- name: maybe
		local _, v2, v3 = xpcall(function()
			-- upvalues: (copy) p_u_1
			return p_u_1(), true
		end, function() end)
		if v3 then
			return v2
		else
			return nil
		end
	end
}