-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Image.useOnLoaded
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v2.ReactIs)
local v_u_5 = require(v1.Utility.Wrappers).Services.ContentProvider
require(v1.Components.Types)
local function v_u_10(p6, p_u_7) -- name: attachOnLoaded
	-- upvalues: (copy) v_u_5
	if p6 ~= nil then
		local v8 = v_u_5:GetAssetFetchStatus(p6)
		if v8 ~= Enum.AssetFetchStatus.Success and v8 ~= Enum.AssetFetchStatus.Failure and v8 ~= Enum.AssetFetchStatus.TimedOut then
			return v_u_5:GetAssetFetchStatusChangedSignal(p6):Connect(function(p9)
				-- upvalues: (copy) p_u_7
				if (p9 == Enum.AssetFetchStatus.Success or p9 == Enum.AssetFetchStatus.Failure) and true or p9 == Enum.AssetFetchStatus.TimedOut then
					p_u_7(p9)
				end
			end)
		end
		p_u_7(v8)
	end
end
return function(p_u_11, p_u_12) -- name: useOnLoaded
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_10
	v_u_3.useEffect(function()
		-- upvalues: (copy) p_u_12, (ref) v_u_4, (copy) p_u_11, (ref) v_u_10, (ref) v_u_3
		if p_u_12 then
			local v_u_13 = nil
			local function v_u_15(p14) -- name: handleFinalStatus
				-- upvalues: (ref) v_u_13, (ref) p_u_12
				if v_u_13 then
					v_u_13:Disconnect()
					v_u_13 = nil
				end
				p_u_12(p14)
			end
			if not v_u_4.isBinding(p_u_11) then
				v_u_13 = v_u_10(p_u_11, v_u_15)
				return function()
					-- upvalues: (ref) v_u_13
					if v_u_13 then
						v_u_13:Disconnect()
						v_u_13 = nil
					end
				end
			end
			local v16 = p_u_11
			v_u_13 = v_u_10(v16:getValue(), v_u_15)
			local v_u_18 = v_u_3.__subscribeToBinding(v16, function(p17)
				-- upvalues: (ref) v_u_13, (ref) v_u_10, (copy) v_u_15
				if v_u_13 then
					v_u_13:Disconnect()
					v_u_13 = nil
				end
				v_u_13 = v_u_10(p17, v_u_15)
			end)
			return function()
				-- upvalues: (copy) v_u_18, (ref) v_u_13
				v_u_18()
				if v_u_13 then
					v_u_13:Disconnect()
					v_u_13 = nil
				end
			end
		end
	end, { p_u_11, p_u_12 })
end