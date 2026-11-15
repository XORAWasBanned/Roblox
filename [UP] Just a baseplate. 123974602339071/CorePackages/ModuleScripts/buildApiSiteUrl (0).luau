-- Path: CorePackages.Packages._Index.NetworkingAliases-31ab8d40-1.15.0.NetworkingAliases.buildApiSiteUrl
local v_u_1 = game:GetService("ContentProvider")
local _, _, v_u_9 = (function() -- name: parseBaseUrlInformation
	-- upvalues: (copy) v_u_1
	local v2 = v_u_1.BaseUrl
	if v2:sub(#v2) ~= "/" then
		v2 = v2 .. "/"
	end
	local _, v3 = v2:find("://")
	local v4 = type(v3) == "number"
	assert(v4, "Expected schemeEnd to be a number")
	local v5, v6 = v2:find("%.", v3 + 1)
	local v7 = type(v5) == "number"
	assert(v7, "Expected prefixIndex to be a number")
	local v8 = type(v6) == "number"
	assert(v8, "Expected prefixEnd to be a number")
	return v2, v2:sub(v3 + 1, v5 - 1), v2:sub(v6 + 1)
end)()
return function(p10)
	-- upvalues: (copy) v_u_9
	return string.format("https://%s.%s", p10, v_u_9)
end