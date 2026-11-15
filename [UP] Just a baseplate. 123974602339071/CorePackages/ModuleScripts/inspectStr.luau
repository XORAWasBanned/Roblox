-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.__testUtils__.inspectStr
local v_u_1 = game:GetService("HttpService")
return {
	["inspectStr"] = function(p2) -- name: inspectStr
		-- upvalues: (copy) v_u_1
		if p2 == nil then
			return "nil"
		end
		local v3 = v_u_1:JSONEncode(p2)
		local v4 = string.gsub(v3, "\n\"", "\n`")
		if v4.sub(v4, 1, 1) == "\"" then
			v4 = "`" .. string.sub(v4, 2)
		end
		local v5 = string.gsub(v4, "\"\n", "`\n")
		if v5.sub(v5, -1) == "\"" then
			v5 = string.sub(v5, 1, -2) .. "`"
		end
		local v6 = string.gsub(v5, "\\\"", "\"")
		return string.gsub(v6, "\\\\", "\\")
	end
}