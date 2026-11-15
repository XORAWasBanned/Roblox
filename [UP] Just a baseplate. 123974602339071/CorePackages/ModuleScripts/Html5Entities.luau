-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.util.Html5Entities
local v1 = script:FindFirstAncestor("CommonMark")
local v_u_2 = require(v1.internal.data.HtmlEntities)
local v_u_3 = string.byte
local v_u_4 = string.find
local v_u_5 = string.sub
local function v_u_13(p6, p7) -- name: parseInt
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4
	local v8 = v_u_3(p6, 1)
	local v9 = v8 == 45
	if v9 or v8 == 43 then
		p6 = v_u_5(p6, 2)
	end
	if v_u_4(p6, p7 == 16 and "^[0-9A-Fa-f]+$" or "^[0-9]+$") == nil then
		return nil
	else
		local v10 = v_u_4(p6, "[^0]")
		local v11 = not v10 and "" or v_u_5(p6, v10)
		if #v11 > 10 then
			return nil
		else
			local v12 = tonumber(v11, p7) or 0
			if v9 then
				v12 = -v12
			end
			if v12 < -2147483648 or v12 > 2147483647 then
				return nil
			else
				return v12
			end
		end
	end
end
return {
	["entityToString"] = function(p14) -- name: entityToString
		-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_13, (copy) v_u_2
		if v_u_3(p14, 1) == 38 and v_u_3(p14, #p14) == 59 then
			local v15 = v_u_5(p14, 2, #p14 - 1)
			if v_u_3(v15, 1) == 35 then
				local v16 = v_u_5(v15, 2)
				local v17 = v_u_3(v16, 1)
				local v18
				if v17 == 120 or v17 == 88 then
					v16 = v_u_5(v16, 2)
					v18 = 16
				else
					v18 = 10
				end
				local v19 = v_u_13(v16, v18)
				return v19 == 0 and "\239\191\189" or ((v19 == nil or (v19 < 0 or (v19 > 1114111 or v19 >= 55296 and v19 <= 57343))) and "\239\191\189" or utf8.char(v19))
			else
				local v20 = v_u_2[v15]
				if v20 == nil then
					return p14
				else
					return v20
				end
			end
		else
			return p14
		end
	end
}