-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.jsutils.naturalCompare
local v1 = script.Parent.Parent.Parent
local v2 = require(v1.LuauPolyfill)
local v3 = v2.Number
local v_u_4 = v2.String
local v_u_5 = v3.isNaN
local v_u_6 = nil
local v_u_7 = nil
local function v16(p8, p9) -- name: naturalCompare
	-- upvalues: (copy) v_u_4, (ref) v_u_6, (ref) v_u_7
	local v10 = 1
	local v11 = 1
	while v10 <= #p8 and v11 <= #p9 do
		local v12 = v_u_4.charCodeAt(p8, v10)
		local v13 = v_u_4.charCodeAt(p9, v11)
		if v_u_6(v12) and v_u_6(v13) then
			local v14 = 0
			repeat
				v10 = v10 + 1
				v14 = v14 * 10 + v12 - v_u_7
				v12 = v_u_4.charCodeAt(p8, v10)
			until not v_u_6(v12) or v14 <= 0
			local v15 = 0
			repeat
				v11 = v11 + 1
				v15 = v15 * 10 + v13 - v_u_7
				v13 = v_u_4.charCodeAt(p9, v11)
			until not v_u_6(v13) or v15 <= 0
			if v14 < v15 then
				return -1
			end
			if v15 >= v14 then
				break
			end
			return 1
		end
		if v12 < v13 then
			return -1
		end
		if v13 < v12 then
			return 1
		end
		v10 = v10 + 1
		v11 = v11 + 1
	end
	return #p8 - #p9
end
v_u_7 = 48
local v_u_17 = 57
v_u_6 = function(p18)
	-- upvalues: (copy) v_u_5, (ref) v_u_7, (ref) v_u_17
	local v19 = not v_u_5(p18)
	if v19 then
		if v_u_7 <= p18 then
			v19 = p18 <= v_u_17
		else
			v19 = false
		end
	end
	return v19
end
return {
	["naturalCompare"] = v16
}