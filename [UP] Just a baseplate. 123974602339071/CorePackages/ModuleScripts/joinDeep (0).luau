-- Path: CorePackages.Packages._Index.llama.llama.Dictionary.joinDeep
local v_u_1 = require(script.Parent.Parent.None)
local v_u_2 = require(script.Parent.copyDeep)
local function v_u_9(...) -- name: joinDeep
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_9
	local v3 = {}
	for v4 = 1, select("#", ...) do
		local v5 = select(v4, ...)
		if not v5 then
			continue
		end
		for v6, v7 in pairs(v5) do
			if v7 == v_u_1 then
				v3[v6] = nil
			elseif type(v7) == "table" then
				if v3[v6] == nil then
					v3[v6] = v_u_2(v7)
				else
					local v8 = v3[v6] ~= "table"
					if type(v8) then
						v3[v6] = v_u_2(v7)
					else
						v3[v6] = v_u_9(v3[v6], v7)
					end
				end
			else
				v3[v6] = v7
			end
		end
	end
	return v3
end
return v_u_9