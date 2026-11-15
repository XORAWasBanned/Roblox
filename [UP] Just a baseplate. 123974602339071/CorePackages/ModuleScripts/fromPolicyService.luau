-- Path: CorePackages.Packages._Index.LuaRoactPolicyProvider.LuaRoactPolicyProvider.getPolicyImplementations.fromPolicyService
local v_u_1 = game:GetService("PolicyService")
local v_u_2 = game:GetService("Players")
local v3 = script.Parent.Parent
local v4 = v3.Parent
local v_u_5 = require(v4.Promise)
local v_u_6 = require(v3.Logger)
return function(p7)
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_5, (copy) v_u_6
	local v8 = p7 or {}
	v8.PolicyService = v8.PolicyService or v_u_1
	v8.PlayersService = v8.PlayersService or v_u_2
	local v9 = v8.PolicyService
	assert(v9, "expected dependencies.PolicyService")
	local v10 = v8.PlayersService
	assert(v10, "expected dependencies.PlayersService")
	local v_u_11 = v8.PolicyService
	local v_u_12 = v8.PlayersService
	return function()
		-- upvalues: (ref) v_u_5, (copy) v_u_12, (copy) v_u_11, (ref) v_u_6
		return {
			["read"] = function() -- name: read
				return nil
			end,
			["onPolicyChanged"] = function(p13) -- name: onPolicyChanged
				-- upvalues: (ref) v_u_5, (ref) v_u_12, (ref) v_u_11, (ref) v_u_6
				local v_u_14 = Instance.new("BindableEvent")
				local v15 = v_u_14.Event:Connect(p13)
				v_u_5.new(function(p16, p17)
					-- upvalues: (ref) v_u_12, (ref) v_u_11
					local v_u_18 = v_u_12.LocalPlayer
					if v_u_18 then
						local function v19()
							-- upvalues: (ref) v_u_11, (copy) v_u_18
							return v_u_11:GetPolicyInfoForPlayerAsync(v_u_18)
						end
						local v20, v21 = pcall(v19)
						if v20 then
							if v21 then
								p16(v21)
							else
								p17("GetPolicyInfoForPlayerAsync return nil value")
							end
						else
							p17("GetPolicyInfoForPlayerAsync had an error when calling")
							return
						end
					else
						p17("LocalPlayer not found")
						return
					end
				end):andThen(function(p22)
					-- upvalues: (copy) v_u_14
					v_u_14:Fire(p22)
				end):catch(function(p23)
					-- upvalues: (ref) v_u_6
					v_u_6:warning("Could not fetch from PolicyService due to error: {}", p23)
				end)
				return v15
			end
		}
	end
end