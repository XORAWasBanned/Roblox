-- Path: CoreGui.RobloxGui.Modules.DevConsole.Action
return function(p_u_1, p_u_2)
	local v3 = type(p_u_1) == "string"
	assert(v3, "A name must be provided to create an Action")
	local v4 = type(p_u_2) == "function"
	assert(v4, "A function must be provided to create an Action")
	return setmetatable({
		["name"] = p_u_1
	}, {
		["__call"] = function(_, ...) -- name: __call
			-- upvalues: (copy) p_u_2, (copy) p_u_1
			local v5 = p_u_2(...)
			local v6 = type(v5) == "table"
			assert(v6, "An action must return a table")
			v5.type = p_u_1
			return v5
		end
	})
end