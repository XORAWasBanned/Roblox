-- Path: CorePackages.Packages._Index.LuaRoactPolicyProvider.LuaRoactPolicyProvider.getPolicyImplementations.fromMemStorageService
local v_u_1 = game:GetService("HttpService")
local v_u_2 = game:GetService("MemStorageService")
local v_u_3 = game:GetService("Players")
local v_u_4 = game:DefineFastFlag("FFlagLogFirstGuacRead", false)
local v_u_5 = game:DefineFastFlag("FFlagLogAllGuacRead", false)
local v_u_6 = game:DefineFastFlag("CacheReadParsePolicy", false)
local v_u_7 = game:DefineFastFlag("FixPolicyStalePlayerUpdates", false)
local v_u_8 = game:DefineFastFlag("ClearPolicyOnLogout", false)
local v_u_9
if v_u_4 then
	local v10 = game:GetService("CorePackages")
	v_u_9 = require(v10.Workspace.Packages.LoggingProtocol).default
else
	v_u_9 = nil
end
return function(p11)
	-- upvalues: (copy) v_u_1, (copy) v_u_2, (copy) v_u_3, (copy) v_u_6, (copy) v_u_8, (copy) v_u_7, (copy) v_u_5, (ref) v_u_9, (copy) v_u_4
	local v12 = p11 or {}
	v12.HttpService = v12.HttpService or v_u_1
	v12.MemStorageService = v12.MemStorageService or v_u_2
	v12.PlayersService = v12.PlayersService or v_u_3
	local v13 = v12.HttpService
	assert(v13, "expected dependencies.HttpService")
	local v14 = v12.MemStorageService
	assert(v14, "expected dependencies.MemStorageService")
	local v15 = v12.PlayersService
	assert(v15, "expected dependencies.PlayersService")
	local v_u_16 = v12.HttpService
	local v_u_17 = v12.MemStorageService
	local v_u_18 = v12.PlayersService
	local v_u_19 = false
	return function(p_u_20)
		-- upvalues: (copy) v_u_18, (copy) v_u_16, (ref) v_u_6, (ref) v_u_8, (copy) v_u_17, (ref) v_u_7, (ref) v_u_5, (ref) v_u_9, (ref) v_u_4, (ref) v_u_19
		assert(p_u_20, "expected behavior")
		local v_u_21 = "GUAC:" .. -1 .. ":" .. p_u_20
		local v_u_22 = nil
		local v_u_23 = nil
		local v_u_24 = nil
		local v_u_25 = nil
		local v_u_26 = Instance.new("BindableEvent")
		local function v_u_31(p_u_27) -- name: onPolicyUpdated
			-- upvalues: (ref) v_u_24, (ref) v_u_16, (ref) v_u_25, (copy) v_u_26
			if p_u_27 ~= v_u_24 and (p_u_27 and #p_u_27 > 0) then
				local function v28()
					-- upvalues: (ref) v_u_16, (copy) p_u_27
					return v_u_16:JSONDecode(p_u_27)
				end
				local v29, v30 = pcall(v28)
				if v29 then
					v_u_24 = p_u_27
					v_u_25 = v30
					v_u_26:Fire(v30)
				end
			end
		end
		if v_u_6 then
			local v_u_32 = nil
			local function v_u_36() -- name: invalidateForKeyChange
				-- upvalues: (ref) v_u_8, (ref) v_u_22, (ref) v_u_25, (ref) v_u_24, (ref) v_u_23, (ref) v_u_18, (copy) p_u_20, (copy) v_u_21, (ref) v_u_17, (copy) v_u_31
				local v33
				if v_u_8 then
					v33 = v_u_22
				else
					v33 = nil
				end
				v_u_25 = nil
				v_u_24 = nil
				if v_u_23 then
					v_u_23:Disconnect()
					v_u_23 = nil
					local v34 = v_u_18.LocalPlayer
					local v35 = "GUAC:" .. ((not v34 or v34.UserId <= 0) and -1 or v34.UserId) .. ":" .. p_u_20
					if v_u_8 and (v33 and (v33 ~= v35 and v35 == v_u_21)) then
						v_u_17:RemoveItem(v35)
					end
					v_u_22 = v35
					v_u_23 = v_u_17:BindAndFire(v35, v_u_31)
				else
					v_u_22 = nil
				end
			end
			local function v37() -- name: localPlayerChanged
				-- upvalues: (ref) v_u_32, (ref) v_u_18, (ref) v_u_7, (copy) v_u_36, (ref) v_u_25
				if v_u_32 then
					v_u_32:Disconnect()
					v_u_32 = nil
				end
				if v_u_18.LocalPlayer then
					v_u_32 = v_u_18.LocalPlayer:GetPropertyChangedSignal("UserId"):Connect(function()
						-- upvalues: (ref) v_u_7, (ref) v_u_36, (ref) v_u_25
						if v_u_7 then
							v_u_36()
						else
							v_u_25 = nil
						end
					end)
				end
				if v_u_7 then
					v_u_36()
				else
					v_u_25 = nil
				end
			end
			v_u_18:GetPropertyChangedSignal("LocalPlayer"):Connect(v37)
			v37()
		end
		return {
			["read"] = function() -- name: read
				-- upvalues: (ref) v_u_6, (ref) v_u_25, (ref) v_u_18, (copy) p_u_20, (ref) v_u_17, (ref) v_u_16, (ref) v_u_5, (ref) v_u_9, (ref) v_u_4, (ref) v_u_19, (ref) v_u_24
				if v_u_6 and v_u_25 then
					return v_u_25
				end
				local v38 = v_u_18.LocalPlayer
				local v_u_39 = v_u_17:GetItem("GUAC:" .. ((not v38 or v38.UserId <= 0) and -1 or v38.UserId) .. ":" .. p_u_20)
				if v_u_39 and #v_u_39 > 0 then
					local function v40()
						-- upvalues: (ref) v_u_16, (copy) v_u_39
						return v_u_16:JSONDecode(v_u_39)
					end
					local v41, v42 = pcall(v40)
					if v41 then
						if v_u_5 then
							v_u_9:logEvent("lua_policy_read_success")
						elseif v_u_4 and not v_u_19 then
							v_u_9:logEvent("lua_policy_read_success")
							v_u_19 = true
						end
						v_u_25 = v42
						v_u_24 = v_u_39
						return v42
					end
				end
				return nil
			end,
			["onPolicyChanged"] = function(p43) -- name: onPolicyChanged
				-- upvalues: (ref) v_u_18, (copy) p_u_20, (copy) v_u_26, (ref) v_u_23, (ref) v_u_22, (ref) v_u_25, (ref) v_u_17, (copy) v_u_31
				local v44 = v_u_18.LocalPlayer
				local v45 = "GUAC:" .. ((not v44 or v44.UserId <= 0) and -1 or v44.UserId) .. ":" .. p_u_20
				local v46 = v_u_26.Event:Connect(p43)
				if v_u_23 and v_u_22 == v45 then
					if v_u_25 then
						p43(v_u_25)
						return v46
					end
				else
					if v_u_23 then
						v_u_23:Disconnect()
					end
					v_u_22 = v45
					v_u_23 = v_u_17:BindAndFire(v45, v_u_31)
				end
				return v46
			end
		}
	end
end