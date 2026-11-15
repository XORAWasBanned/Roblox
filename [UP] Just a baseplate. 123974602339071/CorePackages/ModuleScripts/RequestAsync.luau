-- Path: CorePackages.Packages._Index.HttpRequest.HttpRequest.RequestFunctions.RequestAsync
local v_u_1 = game:GetService("HttpService")
local v_u_2 = require(script.Parent.Util.getHeaders)
local v_u_3 = require(script.Parent.Util.getPostBody)
return function(p_u_4, p_u_5, p_u_6)
	-- upvalues: (copy) v_u_1, (copy) v_u_3, (copy) v_u_2
	return {
		["Start"] = function(_, p7) -- name: Start
			-- upvalues: (ref) v_u_1, (copy) p_u_4, (copy) p_u_5, (ref) v_u_3, (copy) p_u_6, (ref) v_u_2
			local function v8()
				-- upvalues: (ref) v_u_1, (ref) p_u_4, (ref) p_u_5, (ref) v_u_3, (ref) p_u_6, (ref) v_u_2
				return v_u_1:RequestAsync({
					["Url"] = p_u_4,
					["Method"] = p_u_5,
					["Body"] = v_u_3(p_u_6.postBody, p_u_5),
					["Headers"] = v_u_2(p_u_6.headers, p_u_5)
				})
			end
			local v9, v10 = pcall(v8)
			p7(v9, v10)
		end,
		["Cancel"] = function() -- name: Cancel end
	}
end