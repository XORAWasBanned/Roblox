-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Hooks.useMusicInfo
local v1 = script:FindFirstAncestor("MomentsCreationFlow")
local v2 = v1.Parent
local v_u_3 = game:GetService("AssetService")
local v4 = require(v2.MomentsCommon)
local v_u_5 = require(v2.React)
local v_u_6 = require(v1.Actions.CreationFlowMusicInfoRetrieved)
local v_u_7 = v4.Hooks.useDispatch
local v_u_8 = v4.Hooks.useSelector
local v_u_9 = require(v1.Constants)
return function(p_u_10)
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_5, (copy) v_u_3, (copy) v_u_6
	local v_u_11 = v_u_7()
	local v_u_13 = v_u_8(function(p12)
		-- upvalues: (ref) v_u_9, (copy) p_u_10
		return p12[v_u_9.RoduxKey].Music[p_u_10]
	end)
	v_u_5.useEffect(function()
		-- upvalues: (copy) v_u_13, (copy) p_u_10, (ref) v_u_3, (copy) v_u_11, (ref) v_u_6
		if not v_u_13 and p_u_10 then
			task.spawn(function()
				-- upvalues: (ref) v_u_3, (ref) p_u_10, (ref) v_u_11, (ref) v_u_6
				v_u_11(v_u_6({
					[p_u_10] = v_u_3:GetAudioMetadataAsync({ p_u_10 })[1]
				}))
			end)
		end
	end, { p_u_10, v_u_13, v_u_11 })
	return v_u_13
end