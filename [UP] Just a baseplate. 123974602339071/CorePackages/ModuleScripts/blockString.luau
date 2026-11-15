-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.language.blockString
local v1 = script.Parent.Parent.Parent
local v2 = require(v1.LuauPolyfill)
local v_u_3 = v2.Array
local v_u_4 = v2.String
local v_u_5 = nil
local function v12(p6) -- name: dedentBlockStringValue
	-- upvalues: (copy) v_u_4, (ref) v_u_5, (copy) v_u_3
	local v7 = v_u_4.split(p6, { "\r\n", "\n", "\r" })
	local v8 = v_u_5(p6)
	if v8 ~= 0 then
		for v9 = 2, #v7 do
			v7[v9] = v_u_4.slice(v7[v9], v8 + 1)
		end
	end
	local v10 = 0
	while v10 < #v7 and isBlank(v7[v10 + 1]) do
		v10 = v10 + 1
	end
	local v11 = #v7
	while v10 < v11 and isBlank(v7[v11 - 1 + 1]) do
		v11 = v11 - 1
	end
	return v_u_3.join(v_u_3.slice(v7, v10 + 1, v11 + 1), "\n")
end
function isBlank(p13) -- name: isBlank
	for v14 = 1, #p13 do
		local v15 = string.sub(p13, v14, v14)
		if v15 == " " or v15 == "\t" then
			continue
		end
		return false
	end
	return true
end
v_u_5 = function(p16) -- name: getBlockStringIndentation
	-- upvalues: (copy) v_u_4
	local v17 = string.len(p16)
	local v18 = 1
	local v19 = 0
	local v20 = true
	local v21 = true
	local v22 = nil
	while v18 <= v17 do
		local v23 = v_u_4.charCodeAt(p16, v18)
		if v23 == 13 and v_u_4.charCodeAt(p16, v18 + 1) == 10 then
			v18 = v18 + 1
		end
		if v23 == 10 then
			v19 = 0
			v20 = true
			v21 = false
		elseif v23 == 9 or v23 == 32 then
			v19 = v19 + 1
		else
			if v20 and (v21 ~= true and (v22 == nil or v19 < v22)) then
				v22 = v19
			end
			v20 = false
		end
		v18 = v18 + 1
	end
	return v22 or 0
end
return {
	["getBlockStringIndentation"] = v_u_5,
	["dedentBlockStringValue"] = v12,
	["printBlockString"] = function(p24, p25, p26) -- name: printBlockString
		local v27 = p25 or ""
		if p26 == nil then
			p26 = false
		end
		local v28 = string.find(p24, "\n") == nil
		local v29 = string.sub(p24, 1, 1) == " " and true or string.sub(p24, 1, 1) == "\t"
		local v30 = #p24
		local v31 = #p24
		local v32 = string.sub(p24, v30, v31) == "\""
		local v33 = #p24
		local v34 = #p24
		local v35 = string.sub(p24, v33, v34) == "\\"
		local v36 = v28 ~= true and true or (v32 or (v35 or p26))
		local v37 = ""
		if v36 and (v28 and v29) ~= true then
			v37 = v37 .. "\n" .. v27
		end
		if v27 ~= "" then
			p24 = string.gsub(p24, "\n", "\n" .. v27) or p24
		end
		local v38 = v37 .. p24
		if v36 then
			v38 = v38 .. "\n"
		end
		return "\"\"\"" .. string.gsub(v38, "\"\"\"", "\\\"\"\"") .. "\"\"\""
	end
}