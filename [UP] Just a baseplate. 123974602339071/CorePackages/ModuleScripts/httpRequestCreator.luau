-- Path: CorePackages.Packages._Index.HttpRequest.HttpRequest.httpRequestCreator
local v1 = script:FindFirstAncestor("HttpRequest").Parent
local v_u_2 = require(v1.Promise)
local v_u_3 = require(script.Parent.HttpRequest)
return function(p_u_4)
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v5 = p_u_4.requestFunction
	local v6 = type(v5) == "function"
	assert(v6, "Expected requestFunction to be a function")
	return function(p7, p8, p9)
		-- upvalues: (ref) v_u_3, (copy) p_u_4, (ref) v_u_2
		local v10 = type(p7) == "string"
		assert(v10, "Expected url to be a string")
		local v11 = type(p8) == "string"
		assert(v11, "Expected requestMethod to be a string")
		local v12 = not p9 or type(p9) == "table"
		assert(v12, "Expected options to be a table")
		local v13 = string.upper(p8)
		local v_u_14 = v_u_3.new(p_u_4, p7, v13, p9)
		return v_u_2.new(function(p_u_15, p_u_16)
			-- upvalues: (copy) v_u_14
			coroutine.wrap(function()
				-- upvalues: (ref) v_u_14, (copy) p_u_15, (copy) p_u_16
				v_u_14:start(p_u_15, p_u_16)
			end)()
		end), function() -- name: cancel
			-- upvalues: (copy) v_u_14
			v_u_14:cancel()
		end
	end
end