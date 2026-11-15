-- Path: CorePackages.Packages._Index.Markdown.Markdown.lazyMembers
return function(p_u_1, p_u_2) -- name: lazyMembers
	setmetatable(p_u_1, {
		["__index"] = function(_, p3) -- name: __index
			-- upvalues: (copy) p_u_2, (copy) p_u_1
			if p_u_2[p3] == nil then
				return nil
			end
			local v4 = p_u_2[p3]()
			local v5 = p_u_1
			rawset(v5, p3, v4)
			return v4
		end,
		["__iter"] = function(p6) -- name: __iter
			-- upvalues: (copy) p_u_2, (copy) p_u_1
			for v7 in p_u_2 do
				if rawget(p6, v7) ~= nil then
					continue
				end
				local v8 = p_u_2[v7]()
				local v9 = p_u_1
				rawset(v9, v7, v8)
			end
			return next, p6
		end
	})
end