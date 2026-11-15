-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.TestMatchers.toArrayEqual
local v_u_1 = require(script.Parent.Parent.luaUtils.deepEqual)
local v_u_2 = require(script.Parent.Parent.luaUtils.deepContains)
return function(p3, p4, p5) -- name: toArrayEqual
	-- upvalues: (copy) v_u_2, (copy) v_u_1
	if #p3 == #p4 then
		for v6 = 1, #p3 do
			local v7
			if p5 then
				local v8
				v8, v7 = v_u_2(p3[v6], p4[v6])
				if v8 then
					continue
				end
			else
				local v9
				v9, v7 = v_u_1(p3[v6], p4[v6])
				if v9 then
					continue
				end
			end
			return {
				["pass"] = false,
				["message"] = nil,
				["message"] = v7:gsub("{1}", ("{1}[%s]"):format((tostring(v6)))):gsub("{2}", ("{2}[%s]"):format((tostring(v6))))
			}
		end
		return {
			["pass"] = true,
			["message"] = ""
		}
	end
	local v10 = {
		["pass"] = false,
		["message"] = nil
	}
	local v11 = #p3
	local v12 = tostring(v11)
	local v13 = #p4
	v10.message = ("Expected array length %s / got length %s"):format(v12, (tostring(v13)))
	return v10
end