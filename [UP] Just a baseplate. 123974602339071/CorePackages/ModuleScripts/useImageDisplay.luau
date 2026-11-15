-- Path: CorePackages.Packages._Index.MomentsCommon.MomentsCommon.Hooks.useImageDisplay
local v1 = script:FindFirstAncestor("MomentsCommon")
local v2 = v1.Parent
local v_u_3 = game:GetService("ContentProvider")
local v4 = require(v2.React)
local v_u_5 = require(v1.Utils.Signal)
local v_u_6 = v4.useCallback
local v_u_7 = v4.useEffect
local v_u_8 = v4.useRef
local v_u_9 = require(v1.Hooks.useToggleState)
return function(_, p_u_10) -- name: useImageDisplay
	-- upvalues: (copy) v_u_8, (copy) v_u_5, (copy) v_u_9, (copy) v_u_7, (copy) v_u_3, (copy) v_u_6
	local v_u_11 = v_u_8(nil)
	local v_u_12 = v_u_8(nil)
	local v_u_13 = v_u_8(false)
	local v_u_14 = v_u_8(v_u_5.new())
	local v_u_15 = v_u_9(false)
	v_u_7(function()
		-- upvalues: (copy) v_u_11, (copy) p_u_10, (copy) v_u_13, (copy) v_u_12, (ref) v_u_3, (copy) v_u_14
		local v16 = v_u_11.current
		if v16 then
			if p_u_10 then
				v_u_13.current = false
				if p_u_10.SourceType == Enum.ContentSourceType.Uri then
					v_u_12.current = p_u_10.Uri
					task.spawn(function()
						-- upvalues: (ref) v_u_3, (ref) p_u_10, (ref) v_u_12, (ref) v_u_13, (ref) v_u_14
						v_u_3:PreloadAsync({ p_u_10.Uri }, function(_, p17)
							-- upvalues: (ref) v_u_12, (ref) p_u_10, (ref) v_u_13, (ref) v_u_14
							if v_u_12.current == p_u_10.Uri then
								if p17 == Enum.AssetFetchStatus.Success then
									v_u_13.current = true
									v_u_14.current:fire()
								end
							end
						end)
					end)
				end
				if p_u_10.SourceType == Enum.ContentSourceType.Object then
					v_u_13.current = true
					v_u_14.current:fire()
				end
				v16.ImageContent = p_u_10
			end
		end
	end, { v_u_15.enabled, p_u_10 })
	return {
		["isLoadedRef"] = v_u_13,
		["onImageLoadedSignalRef"] = v_u_14,
		["ref"] = v_u_11,
		["updateRef"] = v_u_6(function(p18)
			-- upvalues: (copy) v_u_15, (copy) v_u_11
			v_u_15.toggle()
			v_u_11.current = p18
		end, { v_u_15.toggle })
	}
end