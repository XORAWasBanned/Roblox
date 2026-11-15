-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Network.httpRequest
local v_u_1 = game:GetService("HttpService")
local v_u_2 = require(script.Parent.Parent.Utility.Promise)
local v_u_3 = Enum.ThrottlingPriority.Extreme
local v_u_4 = Enum.HttpContentType.ApplicationJson
return function(p_u_5)
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_2, (copy) v_u_1
	return function(p_u_6, p7, p_u_8)
		-- upvalues: (ref) v_u_4, (ref) v_u_3, (copy) p_u_5, (ref) v_u_2, (ref) v_u_1
		local v9 = type(p_u_6) == "string"
		assert(v9, "Expected url to be a string")
		local v10 = type(p7) == "string"
		assert(v10, "Expected requestMethod to be a string")
		local v11 = not p_u_8 or type(p_u_8) == "table"
		assert(v11, "Expected options to be a table")
		local v12 = string.upper(p7)
		local v_u_13 = nil
		if v12 == "POST" then
			local v14 = p_u_8.postBody
			assert(v14, "Expected a postBody to be specified with this request")
			local v15 = p_u_8.postBody
			local v16 = type(v15) == "string"
			assert(v16, "Expected postBody to be a string")
			if not p_u_8.contentType then
				p_u_8.contentType = v_u_4
			end
			if not p_u_8.throttlingPriority then
				p_u_8.throttlingPriority = v_u_3
			end
			v_u_13 = function()
				-- upvalues: (ref) p_u_5, (copy) p_u_6, (copy) p_u_8
				return p_u_5:PostAsyncFullUrl(p_u_6, p_u_8.postBody, p_u_8.throttlingPriority, p_u_8.contentType)
			end
		elseif v12 == "GET" then
			v_u_13 = function()
				-- upvalues: (ref) p_u_5, (copy) p_u_6, (ref) v_u_3
				return p_u_5:GetAsyncFullUrl(p_u_6, v_u_3)
			end
		else
			error(string.format("Unsupported requestMethod : %s", v12 or "nil"))
		end
		return v_u_2.new(function(p_u_17, p_u_18)
			-- upvalues: (ref) v_u_13, (ref) v_u_1
			if v_u_13 then
				coroutine.wrap(function()
					-- upvalues: (ref) v_u_13, (ref) v_u_1, (copy) p_u_17, (copy) p_u_18
					local v19 = v_u_13
					local v20, v_u_21 = pcall(v19)
					if v20 then
						local function v22()
							-- upvalues: (ref) v_u_1, (copy) v_u_21
							return v_u_1:JSONDecode(v_u_21)
						end
						local v23, v24 = pcall(v22)
						if v23 then
							p_u_17({
								["responseBody"] = v24
							})
						else
							p_u_18(v24)
						end
					else
						p_u_18(v_u_21)
						return
					end
				end)()
			else
				p_u_18()
			end
		end)
	end
end