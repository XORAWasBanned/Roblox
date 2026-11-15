-- Path: CorePackages.Packages._Index.NetworkingGames.NetworkingGames.buildApiSiteUrl
local v_u_1 = game:GetService("ContentProvider")
local _, _, v_u_6 = (function() -- name: parseBaseUrlInformation
	-- upvalues: (copy) v_u_1
	local v2 = v_u_1.BaseUrl
	if v2:sub(#v2) ~= "/" then
		v2 = v2 .. "/"
	end
	local _, v3 = v2:find("://")
	local v4, v5 = v2:find("%.", v3 + 1)
	return v2, v2:sub(v3 + 1, v4 - 1), v2:sub(v5 + 1)
end)()
return function(p7)
	-- upvalues: (copy) v_u_6
	return string.format("https://%s.%s", p7, v_u_6)
end