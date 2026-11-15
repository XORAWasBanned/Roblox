-- Path: CorePackages.Packages._Index.Dash.Dash.formatValue
local v_u_1 = script.Parent
return function(p2, p3) -- name: formatValue
	-- upvalues: (copy) v_u_1
	local v4 = p3 or ""
	local v5, v6 = v4:find("[A-Za-z#?]+")
	if v5 then
		local v7 = v4:sub(v5, v6)
		local v8 = "%" .. v4:sub(1, v5 - 1) .. v4:sub(v6 + 1) .. "s"
		local v9 = require(v_u_1.pretty)
		if v7 == "#?" then
			return v8:format(v9(p2, {
				["multiline"] = true
			}))
		elseif v7 == "?" then
			return v8:format(v9(p2))
		else
			return ("%" .. v4):format(p2)
		end
	else
		local v10
		if type(p2) == "number" then
			local _, v11 = math.modf(p2)
			v10 = v11 == 0 and "d" or "f"
		else
			v10 = "s"
		end
		return ("%" .. v4 .. v10):format((tostring(p2)))
	end
end