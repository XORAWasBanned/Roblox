-- Path: CorePackages.Packages._Index.HttpRequest.HttpRequest.HttpResponse
local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.__tostring(p2)
	local v3 = {}
	for v4, v5 in pairs(p2) do
		local v6 = string.format
		local v7 = tostring(v4)
		local v8 = tostring(v5)
		table.insert(v3, v6("%s = %s", v7, v8))
	end
	table.sort(v3)
	return "<HttpResponse: " .. table.concat(v3, ", ") .. ">"
end
function v_u_1.success(p9, p10) -- name: success
	-- upvalues: (copy) v_u_1
	local v11 = v_u_1
	return setmetatable({
		["responseCode"] = p9,
		["responseBody"] = p10
	}, v11)
end
function v_u_1.error(p12) -- name: error
	-- upvalues: (copy) v_u_1
	local v13 = v_u_1
	return setmetatable({
		["HttpError"] = p12
	}, v13)
end
return v_u_1