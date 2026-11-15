-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Thunks.GetAvatarPreview
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Workspace.Packages.Http).PerformFetch
local v3 = script.Parent.Parent
local v_u_4 = require(v3.Thunk)
local v_u_5 = require(v3.Services.Network)
local v_u_6 = require(v3.Thunks.SendCounter)
local v_u_7 = require(v3.Constants)
local v_u_8 = require(v3.Actions.SetAvatarPreviewDetails)
local v_u_9 = require(v3.Models.AssetInfo)
local v_u_10 = require(v3.Models.BundleInfo)
local v_u_11 = require(v3.Actions.SetAssets)
local v_u_12 = require(v3.Actions.SetBundles)
local v13 = require(v1.Workspace.Packages.AvatarExperienceInspectAndBuy)
local v14 = require(v1.Workspace.Packages.AvatarExperienceFlags)
local v_u_15 = require(v1.Workspace.Packages.AvatarExperienceModel).Enums.ItemTypeEnum
local v_u_16 = require(v3.Thunks.GetItemDetails)
local v_u_17 = v14.FFlagAXEnableBatchItemDetailsFetchV2
local v_u_18 = v13.Constants.BatchItemDetailsPerformFetchKey
local v_u_19 = require(v3.Flags.FFlagAXWrapInspectAndBuyThunksInTasks)
local v_u_20 = { v_u_5 }
return function(p_u_21) -- name: GetAvatarPreview
	-- upvalues: (copy) v_u_4, (copy) v_u_20, (copy) v_u_5, (copy) v_u_2, (copy) v_u_8, (copy) v_u_17, (copy) v_u_19, (copy) v_u_15, (copy) v_u_16, (copy) v_u_18, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11, (copy) v_u_12, (copy) v_u_6, (copy) v_u_7
	return v_u_4.new(script.Name, v_u_20, function(p_u_22, p23)
		-- upvalues: (ref) v_u_5, (copy) p_u_21, (ref) v_u_2, (ref) v_u_8, (ref) v_u_17, (ref) v_u_19, (ref) v_u_15, (ref) v_u_16, (ref) v_u_18, (ref) v_u_9, (ref) v_u_10, (ref) v_u_11, (ref) v_u_12, (ref) v_u_6, (ref) v_u_7
		local v_u_24 = p23[v_u_5]
		local v_u_25 = {}
		if p_u_21 then
			for _, v26 in p_u_21 do
				local v27 = {
					["id"] = v26.assetId,
					["meta"] = v26.meta
				}
				table.insert(v_u_25, v27)
			end
		end
		return v_u_2.Single("PreviewAvatar", function()
			-- upvalues: (copy) v_u_24, (copy) v_u_25, (copy) p_u_22, (ref) v_u_8, (ref) v_u_17, (ref) v_u_19, (ref) v_u_15, (ref) v_u_16, (ref) v_u_2, (ref) v_u_18, (ref) v_u_9, (ref) v_u_10, (ref) v_u_11, (ref) v_u_12, (ref) v_u_6, (ref) v_u_7
			return v_u_24.getPreviewAvatar(v_u_25):andThen(function(p28)
				-- upvalues: (ref) p_u_22, (ref) v_u_8, (ref) v_u_17, (ref) v_u_19, (ref) v_u_15, (ref) v_u_16, (ref) v_u_2, (ref) v_u_18, (ref) v_u_24, (ref) v_u_9, (ref) v_u_10, (ref) v_u_11, (ref) v_u_12, (ref) v_u_6, (ref) v_u_7
				p_u_22:dispatch(v_u_8(p28))
				if not v_u_17 and (p28.look and p28.look.items) then
					for _, v_u_29 in p28.look.items do
						if v_u_19 then
							task.spawn(function()
								-- upvalues: (copy) v_u_29, (ref) v_u_15, (ref) p_u_22, (ref) v_u_16
								if v_u_29.itemType == v_u_15.Asset then
									p_u_22:dispatch(v_u_16(v_u_29.id, Enum.AvatarItemType.Asset))
								elseif v_u_29.itemType == v_u_15.Bundle then
									p_u_22:dispatch(v_u_16(v_u_29.id, Enum.AvatarItemType.Bundle))
								end
							end)
						elseif v_u_29.itemType == v_u_15.Asset then
							p_u_22:dispatch(v_u_16(v_u_29.id, Enum.AvatarItemType.Asset))
						else
							if v_u_29.itemType ~= v_u_15.Bundle then
								continue
							end
							p_u_22:dispatch(v_u_16(v_u_29.id, Enum.AvatarItemType.Bundle))
						end
					end
				end
				if v_u_17 then
					local v_u_30 = {}
					if p28.look and p28.look.items then
						for _, v31 in p28.look.items do
							local v32 = {}
							local v33
							if v31.itemType == v_u_15.Asset then
								v33 = Enum.AvatarItemType.Asset.Value
							else
								v33 = Enum.AvatarItemType.Bundle.Value
							end
							v32.itemType = v33
							local v34 = v31.id
							v32.id = tonumber(v34) or 0
							table.insert(v_u_30, v32)
						end
					end
					v_u_2.Single(v_u_18, function()
						-- upvalues: (ref) v_u_24, (copy) v_u_30, (ref) v_u_19, (ref) v_u_15, (ref) v_u_9, (ref) v_u_10, (ref) p_u_22, (ref) v_u_11, (ref) v_u_12, (ref) v_u_6, (ref) v_u_7
						return v_u_24.getBatchItemDetailsV2(v_u_30):andThen(function(p_u_35)
							-- upvalues: (ref) v_u_19, (ref) v_u_15, (ref) v_u_9, (ref) v_u_10, (ref) p_u_22, (ref) v_u_11, (ref) v_u_12
							if v_u_19 and (p_u_35 and p_u_35.data) then
								task.spawn(function()
									-- upvalues: (copy) p_u_35, (ref) v_u_15, (ref) v_u_9, (ref) v_u_10, (ref) p_u_22, (ref) v_u_11, (ref) v_u_12
									local v36 = {}
									local v37 = {}
									for _, v38 in p_u_35.data do
										if v38.itemType == v_u_15.Asset then
											local v39 = v_u_9.fromGetItemDetailsV2
											table.insert(v36, v39(v38))
										else
											if v38.itemType ~= v_u_15.Bundle then
												continue
											end
											local v40 = v_u_10.fromGetItemDetailsV2
											table.insert(v37, v40(v38))
										end
									end
									p_u_22:dispatch(v_u_11(v36))
									p_u_22:dispatch(v_u_12(v37))
								end)
							elseif p_u_35 and p_u_35.data then
								local v41 = {}
								local v42 = {}
								for _, v43 in p_u_35.data do
									if v43.itemType == v_u_15.Asset then
										local v44 = v_u_9.fromGetItemDetailsV2
										table.insert(v41, v44(v43))
									else
										if v43.itemType ~= v_u_15.Bundle then
											continue
										end
										local v45 = v_u_10.fromGetItemDetailsV2
										table.insert(v42, v45(v43))
									end
								end
								p_u_22:dispatch(v_u_11(v41))
								p_u_22:dispatch(v_u_12(v42))
							end
						end, function(_)
							-- upvalues: (ref) p_u_22, (ref) v_u_6, (ref) v_u_7
							p_u_22:dispatch(v_u_6(v_u_7.Counters.BatchGetItemDetails .. v_u_7.CounterSuffix.RequestRejected))
						end)
					end)(p_u_22)
					p_u_22:dispatch(v_u_6(v_u_7.Counters.BatchGetItemDetails .. v_u_7.CounterSuffix.RequestSucceeded))
				end
			end, function(_)
				-- upvalues: (ref) p_u_22, (ref) v_u_6, (ref) v_u_7
				p_u_22:dispatch(v_u_6(v_u_7.Counters.GetAvatarPreview .. v_u_7.CounterSuffix.RequestRejected))
			end)
		end)(p_u_22):catch(function(_)
			-- upvalues: (copy) p_u_22, (ref) v_u_6, (ref) v_u_7
			p_u_22:dispatch(v_u_6(v_u_7.Counters.GetAvatarPreview .. v_u_7.CounterSuffix.RequestFailed))
		end)
	end)
end