-- Path: CoreGui.RobloxGui.Modules.Common.httpRequest
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("HttpService")
local v_u_3 = require(v1.Packages.Promise)
local v_u_4 = Enum.ThrottlingPriority.Extreme
local v_u_5 = Enum.HttpContentType.ApplicationJson
return function(p_u_6)
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_4, (copy) v_u_3
	local function v_u_13(p_u_7, p_u_8) -- name: doHttpPost
		-- upvalues: (ref) v_u_2, (ref) v_u_5, (ref) v_u_4, (copy) p_u_6
		local v_u_9 = nil
		local v10 = p_u_8.postBody
		assert(v10, "Expected a postBody to be specified with this request")
		local v11 = p_u_8.postBody
		if type(v11) == "table" then
			v_u_9 = v_u_2:JSONEncode(p_u_8.postBody)
		else
			local v12 = p_u_8.postBody
			if type(v12) == "string" then
				v_u_9 = p_u_8.postBody
			else
				error("Expected postBody to be a string or table")
			end
		end
		if not p_u_8.contentType then
			p_u_8.contentType = v_u_5
		end
		if not p_u_8.throttlingPriority then
			p_u_8.throttlingPriority = v_u_4
		end
		return function()
			-- upvalues: (ref) p_u_6, (copy) p_u_7, (ref) v_u_9, (copy) p_u_8
			return p_u_6:PostAsyncFullUrl(p_u_7, v_u_9, p_u_8.throttlingPriority, p_u_8.contentType)
		end
	end
	return function(p_u_14, p15, p16)
		-- upvalues: (copy) v_u_13, (copy) p_u_6, (ref) v_u_4, (ref) v_u_3, (ref) v_u_2
		local v17 = type(p_u_14) == "string"
		assert(v17, "Expected url to be a string")
		local v18 = type(p15) == "string"
		assert(v18, "Expected requestMethod to be a string")
		local v19 = not p16 or type(p16) == "table"
		assert(v19, "Expected options to be a table")
		local v20 = string.upper(p15)
		local v_u_21 = nil
		if v20 == "POST" then
			v_u_21 = v_u_13(p_u_14, p16)
		elseif v20 == "GET" then
			v_u_21 = function()
				-- upvalues: (ref) p_u_6, (copy) p_u_14, (ref) v_u_4
				return p_u_6:GetAsyncFullUrl(p_u_14, v_u_4)
			end
		else
			error(string.format("Unsupported requestMethod : %s", v20 or "nil"))
		end
		return v_u_3.new(function(p_u_22, p_u_23)
			-- upvalues: (ref) v_u_21, (ref) v_u_2
			if v_u_21 then
				spawn(function()
					-- upvalues: (ref) v_u_21, (ref) v_u_2, (copy) p_u_22, (copy) p_u_23
					local v24 = v_u_21
					local v25, v_u_26 = pcall(v24)
					if v25 then
						local function v27()
							-- upvalues: (ref) v_u_2, (copy) v_u_26
							return v_u_2:JSONDecode(v_u_26)
						end
						local v28, v29 = pcall(v27)
						if v28 then
							p_u_22({
								["responseBody"] = v29
							})
						else
							p_u_23(v29)
						end
					else
						p_u_23(v_u_26)
						return
					end
				end)
			else
				p_u_23()
			end
		end)
	end
end