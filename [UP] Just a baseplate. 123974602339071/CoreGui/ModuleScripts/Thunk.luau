-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Thunk
local v1 = {}
local v_u_2 = require(script.Parent.Symbol).named("ThunkTag")
function v1.middleware(p3) -- name: middleware
	-- upvalues: (copy) v_u_2
	local v_u_4 = p3 or {}
	return function(p_u_5, p_u_6)
		-- upvalues: (ref) v_u_2, (ref) v_u_4
		return function(p7)
			-- upvalues: (ref) v_u_2, (ref) v_u_4, (copy) p_u_6, (copy) p_u_5
			if p7[v_u_2] ~= true then
				return p_u_5(p7)
			end
			local v8 = {}
			for _, v9 in pairs(p7.requiredServices) do
				local v10 = v_u_4[v9]
				if v10 == nil then
					error(("Service with key %s is a dependency but was not provided"):format(v9))
				end
				v8[v9] = v10
			end
			return p7(p_u_6, v8)
		end
	end
end
function v1.new(p11, p12, p_u_13) -- name: new
	-- upvalues: (copy) v_u_2
	local v14 = typeof(p11) == "string"
	assert(v14, "Bad arg #1: name must be a string")
	local v15 = p12 == nil and true or typeof(p12) == "table"
	assert(v15, "Bad arg #2: requiredServices must be a table or nil")
	local v16 = typeof(p_u_13) == "function"
	assert(v16, "Bad arg #3: onInvoke must be a function")
	local v17 = {
		[v_u_2] = true,
		["type"] = p11,
		["requiredServices"] = p12 or {}
	}
	return setmetatable(v17, {
		["__call"] = function(_, ...) -- name: __call
			-- upvalues: (copy) p_u_13
			p_u_13(...)
		end
	})
end
function v1.test(p18, p19, p20) -- name: test
	-- upvalues: (copy) v_u_2
	local v21
	if typeof(p18) == "table" then
		v21 = p18[v_u_2] == true
	else
		v21 = false
	end
	assert(v21, "Test Error - Bad arg #1: Must provide a valid thunk")
	if #p18.requiredServices > 0 then
		for _, v22 in ipairs(p18.requiredServices) do
			local v23 = p20[v22] ~= nil
			local v24 = "Test Error - Bad arg #3: Missing required service " .. tostring(v22)
			assert(v23, v24)
		end
	end
	return p18(p19, p20)
end
return v1