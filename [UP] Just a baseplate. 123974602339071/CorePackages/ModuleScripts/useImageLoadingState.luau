-- Path: CorePackages.Packages._Index.MomentsCommon.MomentsCommon.Hooks.useImageLoadingState
local v_u_1 = game:GetService("ContentProvider")
local v2 = script:FindFirstAncestor("MomentsCommon").Parent
local v_u_3 = require(v2.React)
return function(p_u_4)
	-- upvalues: (copy) v_u_3, (copy) v_u_1
	local v5, v_u_6 = v_u_3.useState(false)
	v_u_3.useEffect(function()
		-- upvalues: (copy) p_u_4, (copy) v_u_6, (ref) v_u_1
		if p_u_4 and p_u_4 ~= "" then
			if v_u_1:GetAssetFetchStatus(p_u_4) ~= Enum.AssetFetchStatus.Success then
				v_u_6(false)
				local v_u_7 = true
				task.spawn(function()
					-- upvalues: (ref) v_u_1, (ref) p_u_4, (ref) v_u_7, (ref) v_u_6
					v_u_1:PreloadAsync({ p_u_4 }, function(p8, p9)
						-- upvalues: (ref) v_u_7, (ref) p_u_4, (ref) v_u_6
						if v_u_7 and (p8 == p_u_4 and p9 == Enum.AssetFetchStatus.Success) then
							v_u_6(true)
						end
					end)
				end)
				return function()
					-- upvalues: (ref) v_u_7
					v_u_7 = false
				end
			end
			v_u_6(true)
		else
			v_u_6(false)
		end
	end, { p_u_4 })
	return v5
end