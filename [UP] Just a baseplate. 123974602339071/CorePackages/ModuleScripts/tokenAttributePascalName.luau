-- Path: CorePackages.Packages._Index.Foundation.Foundation.StyleSheet.tokenAttributePascalName
local v_u_1 = require(script.Parent.colorScopeKeepPrefix)
local function v_u_5(p2) -- name: kebabToPascal
	return p2:gsub("^%-?(.)", function(p3)
		return p3:upper()
	end):gsub("%-(.)", function(p4)
		return p4:upper()
	end)
end
return function(p6, p7) -- name: tokenAttributePascalName
	-- upvalues: (copy) v_u_5, (copy) v_u_1
	local v8 = v_u_5(p7)
	if v_u_1[p6] then
		local v9 = #p6
		if string.sub(v8, 1, v9) == p6 then
			local v10 = #p6 + 1
			return string.sub(v8, v10)
		end
	end
	return v8
end