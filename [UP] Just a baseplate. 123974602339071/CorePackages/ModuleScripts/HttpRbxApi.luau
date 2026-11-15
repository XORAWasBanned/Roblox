-- Path: CorePackages.Packages._Index.HttpRequest.HttpRequest.RequestFunctions.HttpRbxApi
local v_u_1 = game:GetService("HttpRbxApiService")
local v_u_2 = game:GetService("HttpService")
local v_u_3 = require(script.Parent.Parent.StatusCode)
local v_u_4 = Enum.ThrottlingPriority.Extreme
local v_u_5 = Enum.HttpContentType.ApplicationJson
local function v_u_13(p_u_6, p_u_7) -- name: doHttpPost
	-- upvalues: (copy) v_u_2, (copy) v_u_1, (copy) v_u_4, (copy) v_u_5
	local v_u_8 = nil
	local v9 = p_u_7.postBody
	assert(v9, "Expected a postBody to be specified with this request")
	local v10 = p_u_7.postBody
	if type(v10) == "table" then
		v_u_8 = v_u_2:JSONEncode(p_u_7.postBody)
	else
		local v11 = p_u_7.postBody
		if type(v11) == "string" then
			v_u_8 = p_u_7.postBody
		else
			error("Expected postBody to be a string or table")
		end
	end
	local function v12()
		-- upvalues: (ref) v_u_1, (copy) p_u_6, (ref) v_u_8, (copy) p_u_7, (ref) v_u_4, (ref) v_u_5
		return v_u_1:PostAsyncFullUrl(p_u_6, v_u_8, p_u_7.throttlingPriority or v_u_4, p_u_7.contentType or v_u_5, p_u_7.httpRequestType or nil)
	end
	return pcall(v12)
end
local function v_u_18(p_u_14) -- name: createResponse
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v15 = v_u_3.OK
	local function v16()
		-- upvalues: (ref) v_u_2, (copy) p_u_14
		return v_u_2:JSONDecode(p_u_14)
	end
	local v17, _ = pcall(v16)
	if not v17 then
		v15 = tonumber(p_u_14:sub(6, 8))
	end
	return {
		["Body"] = p_u_14,
		["StatusCode"] = v15,
		["Headers"] = {}
	}
end
return function(p_u_19, p_u_20, p_u_21)
	-- upvalues: (copy) v_u_1, (copy) v_u_4, (copy) v_u_13, (copy) v_u_18
	return {
		["Start"] = function(_, p22) -- name: Start
			-- upvalues: (copy) p_u_20, (copy) p_u_19, (copy) p_u_21, (ref) v_u_1, (ref) v_u_4, (ref) v_u_13, (ref) v_u_18
			local v23 = nil
			local v24 = nil
			if p_u_20 == "GET" then
				local v_u_25 = p_u_19
				local v_u_26 = p_u_21
				local function v27()
					-- upvalues: (ref) v_u_1, (copy) v_u_25, (copy) v_u_26, (ref) v_u_4
					return v_u_1:GetAsyncFullUrl(v_u_25, v_u_26.throttlingPriority or v_u_4, v_u_26.httpRequestType or nil)
				end
				v23, v24 = pcall(v27)
			elseif p_u_20 == "POST" then
				v23, v24 = v_u_13(p_u_19, p_u_21)
			else
				error("Unsupported method: " .. p_u_20)
			end
			p22(v23, (v_u_18(v24)))
		end,
		["Cancel"] = function() -- name: Cancel end
	}
end