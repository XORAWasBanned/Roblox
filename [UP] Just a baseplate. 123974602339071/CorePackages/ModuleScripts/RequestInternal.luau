-- Path: CorePackages.Packages._Index.HttpRequest.HttpRequest.RequestFunctions.RequestInternal
local v_u_1 = game:GetService("HttpService")
local v_u_2 = require(script.Parent.Util.getHeaders)
local v_u_3 = require(script.Parent.Util.getPostBody)
return function(p4, p5, p6)
	-- upvalues: (copy) v_u_1, (copy) v_u_3, (copy) v_u_2
	return v_u_1:RequestInternal({
		["Url"] = p4,
		["Method"] = p5,
		["Body"] = v_u_3(p6.postBody, p5),
		["Timeout"] = p6.timeout or 15000,
		["CachePolicy"] = p6.cachePolicy or Enum.HttpCachePolicy.None,
		["Priority"] = p6.priority or 0,
		["Headers"] = v_u_2(p6.headers, p5),
		["RequestType"] = p6.requestType or nil,
		["AllowSandboxing"] = p6.allowSandboxing or nil
	})
end