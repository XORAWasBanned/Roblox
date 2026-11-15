-- Path: CorePackages.Packages._Index.HttpRequest.HttpRequest.RequestFunctions.Util.getPostBody
local v_u_1 = game:GetService("HttpService")
return function(p2, p3)
	-- upvalues: (copy) v_u_1
	if p3 == "POST" or p3 == "PATCH" then
		if type(p2) == "table" then
			return v_u_1:JSONEncode(p2)
		end
		if type(p2) == "string" then
			return p2
		end
		error("Expected postBody to be a string or table")
	end
	return nil
end