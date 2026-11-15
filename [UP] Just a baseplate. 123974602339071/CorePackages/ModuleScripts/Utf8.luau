-- Path: CorePackages.Packages._Index.CommonMark.CommonMark.internal.port.Utf8
local v_u_1 = string.byte
local v2 = {
	["INVALID"] = -1
}
local function v_u_12(p3, p4) -- name: decode
	-- upvalues: (copy) v_u_1
	local v5 = v_u_1(p3, p4 + 1)
	if v5 < 128 then
		return v5, 1
	else
		local v6, v7, v8
		if v5 >= 194 and v5 <= 223 then
			v6 = v5 - 192
			v7 = 2
			v8 = 128
		elseif v5 >= 224 and v5 <= 239 then
			v6 = v5 - 224
			v7 = 3
			v8 = 2048
		else
			if v5 < 240 or v5 > 244 then
				return -1, 1
			end
			v6 = v5 - 240
			v7 = 4
			v8 = 65536
		end
		for v9 = 1, v7 - 1 do
			local v10 = v_u_1(p3, p4 + 1 + v9)
			local v11
			if v10 == nil or v10 < 128 then
				v11 = false
			else
				v11 = v10 <= 191
			end
			if not v11 then
				return -1, 1
			end
			v6 = v6 * 64 + (v10 - 128)
		end
		if v6 < v8 or (v6 > 1114111 or v6 >= 55296 and v6 <= 57343) then
			return -1, 1
		else
			return v6, v7
		end
	end
end
function v2.codePointAt(p13, p14) -- name: codePointAt
	-- upvalues: (copy) v_u_12
	return v_u_12(p13, p14)
end
function v2.codePointBefore(p15, p16) -- name: codePointBefore
	-- upvalues: (copy) v_u_1, (copy) v_u_12
	local v17 = p16 - 1
	while v17 > 0 and p16 - 4 < v17 do
		local v18 = v_u_1(p15, v17 + 1)
		local v19
		if v18 == nil or v18 < 128 then
			v19 = false
		else
			v19 = v18 <= 191
		end
		if not v19 then
			break
		end
		v17 = v17 - 1
	end
	local v20, v21 = v_u_12(p15, v17)
	return v17 + v21 ~= p16 and -1 or v20
end
return v2