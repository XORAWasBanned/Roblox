-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Style.useTagsState
local v1 = script:FindFirstAncestor("Foundation").Parent
local v_u_2 = require(v1.React)
return function() -- name: useTagsState
	-- upvalues: (copy) v_u_2
	local v3, v_u_4 = v_u_2.useState({})
	return v3, v_u_2.useCallback(function(...)
		-- upvalues: (copy) v_u_4
		local v_u_5 = {}
		for _, v6 in { ... } do
			for _, v7 in string.split(v6, " ") do
				table.insert(v_u_5, v7)
			end
		end
		v_u_4(function(p8)
			-- upvalues: (copy) v_u_5
			local v9 = false
			for _, v10 in v_u_5 do
				if p8[v10] == true then
					continue
				end
				v9 = true
			end
			if not v9 then
				return p8
			end
			local v11 = table.clone(p8)
			for _, v12 in v_u_5 do
				v11[v12] = true
			end
			return v11
		end)
	end, { v_u_4 })
end