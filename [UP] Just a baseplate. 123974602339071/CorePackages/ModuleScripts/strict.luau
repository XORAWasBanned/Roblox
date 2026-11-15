-- Path: CorePackages.Packages._Index.Foundation.Foundation.Utility.strict
return function(p1, p2) -- name: strict
	local v_u_3 = p2 or tostring(p1)
	return setmetatable(p1, {
		["__index"] = function(_, p4) -- name: __index
			-- upvalues: (copy) v_u_3
			local v5 = ("%q (%s) is not a valid member of %s"):format(tostring(p4), typeof(p4), v_u_3)
			error(v5, 2)
		end,
		["__newindex"] = function(_, p6) -- name: __newindex
			-- upvalues: (copy) v_u_3
			local v7 = ("%q (%s) is not a valid member of %s"):format(tostring(p6), typeof(p6), v_u_3)
			error(v7, 2)
		end
	})
end