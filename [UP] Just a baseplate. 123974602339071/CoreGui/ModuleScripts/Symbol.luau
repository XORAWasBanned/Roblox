-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Symbol
return {
	["named"] = function(p1) -- name: named
		local v2 = type(p1) == "string"
		assert(v2, "Symbols must be created using a string name!")
		local v3 = newproxy(true)
		local v_u_4 = ("Symbol(%s)"):format(p1)
		getmetatable(v3).__tostring = function()
			-- upvalues: (copy) v_u_4
			return v_u_4
		end
		return v3
	end
}