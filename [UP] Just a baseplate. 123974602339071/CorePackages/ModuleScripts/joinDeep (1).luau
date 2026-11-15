-- Path: CorePackages.Packages._Index.llama.llama.List.joinDeep
local v_u_1 = require(script.Parent.Parent.None)
local v_u_2 = require(script.Parent.copyDeep)
local function v_u_10(...) -- name: joinDeep
	-- upvalues: (copy) v_u_2, (copy) v_u_10, (copy) v_u_1
	local v3 = {}
	local v4 = 1
	for v5 = 1, select("#", ...) do
		local v6 = select(v5, ...)
		if not v6 then
			continue
		end
		for v7 = 1, #v6 do
			local v8 = v6[v7]
			if type(v8) == "table" then
				if v3[v4] == nil then
					v3[v4] = v_u_2(v6[v7])
					v4 = v4 + 1
				else
					local v9 = v3[v4] ~= "table"
					if type(v9) then
						v3[v4] = v_u_2(v6[v7])
						v4 = v4 + 1
					else
						v3[v4] = v_u_10(v3[v4], v6[v7])
						v4 = v4 + 1
					end
				end
			else
				if v6[v7] ~= v_u_1 then
					v3[v4] = v6[v7]
				end
				v4 = v4 + 1
			end
		end
	end
	return v3
end
return v_u_10