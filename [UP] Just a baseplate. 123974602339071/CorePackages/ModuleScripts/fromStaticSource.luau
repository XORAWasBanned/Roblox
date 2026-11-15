-- Path: CorePackages.Packages._Index.LuaRoactPolicyProvider.LuaRoactPolicyProvider.getPolicyImplementations.fromStaticSource
local function v_u_1() -- name: noOpt end
return function()
	-- upvalues: (copy) v_u_1
	return function(p_u_2)
		-- upvalues: (ref) v_u_1
		assert(p_u_2, "expected externalPolicy")
		return {
			["read"] = function() -- name: read
				-- upvalues: (copy) p_u_2
				return p_u_2
			end,
			["onPolicyChanged"] = function(p3) -- name: onPolicyChanged
				-- upvalues: (ref) v_u_1
				local v4 = p3 or v_u_1
				return Instance.new("BindableEvent").Event:Connect(v4)
			end
		}
	end
end