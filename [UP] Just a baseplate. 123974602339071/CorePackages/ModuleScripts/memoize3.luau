-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.jsutils.memoize3
local v1 = script.Parent.Parent.Parent
require(v1.LuauPolyfill)
local v_u_2 = {}
return {
	["memoize3"] = function(p_u_3) -- name: memoize3
		-- upvalues: (copy) v_u_2
		local v_u_4 = nil
		return function(p5, p6, p7)
			-- upvalues: (ref) v_u_2, (ref) v_u_4, (copy) p_u_3
			local v8
			if p5 == nil then
				v8 = v_u_2
			else
				v8 = p5
			end
			local v9
			if p6 == nil then
				v9 = v_u_2
			else
				v9 = p6
			end
			local v10
			if p7 == nil then
				v10 = v_u_2
			else
				v10 = p7
			end
			if not v_u_4 then
				v_u_4 = setmetatable({}, {
					["__mode"] = "kv"
				})
			end
			local v11 = v_u_4[v8]
			local v12 = nil
			if v11 then
				v12 = v11[v9]
				if v12 then
					local v13 = v12[v10]
					if v13 ~= nil then
						if v13 == v_u_2 then
							return nil
						else
							return v13
						end
					end
				end
			else
				v11 = setmetatable({}, {
					["__mode"] = "kv"
				})
				v_u_4[v8] = v11
			end
			if not v12 then
				v12 = setmetatable({}, {
					["__mode"] = "kv"
				})
				v11[v9] = v12
			end
			local v14 = p_u_3(p5, p6, p7)
			local v15
			if v14 == nil then
				v15 = v_u_2
			else
				v15 = v14
			end
			v12[v10] = v15
			return v14
		end
	end
}