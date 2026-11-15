-- Path: CorePackages.Packages._Index.HttpRequest.HttpRequest.RequestFunctions.MockRequest
local v1 = script:FindFirstAncestor("HttpRequest").Parent
local v_u_2 = require(v1.Cryo)
return function(p_u_3, p_u_4, p_u_5)
	-- upvalues: (copy) v_u_2
	return {
		["Start"] = function(_, p6) -- name: Start
			-- upvalues: (copy) p_u_5, (ref) v_u_2, (copy) p_u_3, (copy) p_u_4
			local v7 = {}
			local v8 = p_u_5.mockResponse
			if type(v8) == "function" then
				v7 = p_u_5.mockResponse()
			elseif p_u_5.mockResponse then
				v7 = p_u_5.mockResponse
			end
			local v9 = {
				["Url"] = p_u_3,
				["Method"] = p_u_4
			}
			local v10 = v_u_2.Dictionary.join(v9, v7)
			p6(p_u_5.success, v10)
		end,
		["Cancel"] = function() -- name: Cancel
			-- upvalues: (copy) p_u_5
			if p_u_5.cancel then
				p_u_5.cancel()
			end
		end
	}
end