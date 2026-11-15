-- Path: CorePackages.Packages._Index.GraphQL.GraphQL.TestMatchers.toThrow
return function(p1, p2, p3) -- name: toThrow
	local v4, v5 = pcall(p1)
	if v4 then
		return {
			["pass"] = false,
			["message"] = "Expected function to throw"
		}
	end
	if typeof(p2) ~= "string" then
		return {
			["pass"] = true,
			["message"] = "Expected function not to throw"
		}
	end
	local v6 = nil
	if typeof(v5) == "string" then
		v6 = v5
	elseif typeof(v5) == "table" then
		local v7 = v5.message
		if typeof(v7) == "string" then
			v6 = v5.message
		end
	end
	return v6 == nil and {
		["pass"] = false,
		["message"] = nil,
		["message"] = string.format("Matcher Error:\nExpected function to throw a string or an Error object, but it threw an error of type \'%s\'.\nYou may wish to use `pcall` instead and run custom expectations on the returned error", (typeof(v5)))
	} or (v6:find(p2, 1, not p3) == nil and {
		["pass"] = false,
		["message"] = nil,
		["message"] = string.format("Expected function to throw with\n\'%s\'\nbut threw\n\'%s\'\ninstead", p2, v6)
	} or {
		["pass"] = true,
		["message"] = nil,
		["message"] = string.format("Expected function not to throw with \'%s\'", p2)
	})
end