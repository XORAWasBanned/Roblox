-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.luaUtils.json
local v_u_1 = {}
local function v_u_4(p2) -- name: kind_of
	if type(p2) ~= "table" then
		return type(p2)
	end
	local v3 = 1
	for _ in pairs(p2) do
		if p2[v3] == nil then
			return "table"
		end
		v3 = v3 + 1
	end
	return v3 == 1 and "table" or "array"
end
local function v_u_9(p5) -- name: escape_str
	local v6 = {
		"\\",
		"\"",
		"/",
		"b",
		"f",
		"n",
		"r",
		"t"
	}
	for v7, v8 in ipairs({
		"\\",
		"\"",
		"/",
		"\8",
		"\f",
		"\n",
		"\r",
		"\t"
	}) do
		p5 = p5:gsub(v8, "\\" .. v6[v7])
	end
	return p5
end
function v_u_1.stringify(p10, p11) -- name: stringify
	-- upvalues: (copy) v_u_4, (copy) v_u_1, (copy) v_u_9
	local v12 = {}
	local v13 = v_u_4(p10)
	if v13 == "array" then
		if p11 then
			error("Can\'t encode array as key.")
		end
		v12[#v12 + 1] = "["
		for v14, v15 in ipairs(p10) do
			if v14 > 1 then
				v12[#v12 + 1] = ", "
			end
			v12[#v12 + 1] = v_u_1.stringify(v15)
		end
		v12[#v12 + 1] = "]"
	elseif v13 == "table" then
		if p11 then
			error("Can\'t encode table as key.")
		end
		v12[#v12 + 1] = "{"
		for v16, v17 in pairs(p10) do
			if #v12 > 1 then
				v12[#v12 + 1] = ", "
			end
			v12[#v12 + 1] = v_u_1.stringify(v16, true)
			v12[#v12 + 1] = ":"
			v12[#v12 + 1] = v_u_1.stringify(v17)
		end
		v12[#v12 + 1] = "}"
	else
		if v13 == "string" then
			return "\"" .. v_u_9(p10) .. "\""
		end
		if v13 == "number" then
			if p11 then
				return "\"" .. tostring(p10) .. "\""
			else
				return tostring(p10)
			end
		end
		if v13 == "boolean" then
			return tostring(p10)
		end
		if v13 == "nil" then
			return "null"
		end
		error("Unjsonifiable type: " .. v13 .. ".")
	end
	return table.concat(v12)
end
return v_u_1