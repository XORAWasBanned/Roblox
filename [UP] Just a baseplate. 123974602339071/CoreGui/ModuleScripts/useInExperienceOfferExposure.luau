-- Path: CoreGui.RobloxGui.Modules.Chrome.Integrations.InExperienceShop.useInExperienceOfferExposure
local v1 = script:FindFirstAncestor("Chrome")
local v2 = game:GetService("CorePackages")
local v_u_3 = require(v2.Packages.React)
local v_u_4 = require(v2.Packages.Signals)
local v5 = require(v2.Workspace.Packages.InExperienceOffers)
local v6 = require(v2.Workspace.Packages.SharedFlags)
local v_u_7 = require(v1.ChromeShared.Service.LocalStore)
local v_u_8 = v6.FFlagOfferNotifyOnGlobalIcon
local v_u_9 = v5.getOffersStore
local v_u_10 = v5.Utils.isNotificationEligible
local v_u_11 = v5.NotificationLocation
local v_u_12 = game:DefineFastString("InExperienceOfferExposureStorageKey", "InExperienceOfferExposure")
local v_u_13 = game:DefineFastInt("InExperienceOfferExposureMaxStoredOffers", 50)
local v_u_14 = {}
local function v_u_21() -- name: loadPersistedTally
	-- upvalues: (copy) v_u_7, (copy) v_u_12
	local v15 = v_u_7.loadForLocalPlayer(v_u_12)
	local v16 = {}
	if type(v15) ~= "table" then
		return v16
	end
	for v17, v18 in v15 do
		if type(v17) ~= "string" or type(v18) ~= "table" then
			continue
		end
		local v19 = v18.exposureCount
		if type(v19) ~= "number" then
			continue
		end
		local v20 = v18.lastExposureUTCTime
		if type(v20) ~= "string" then
			continue
		end
		v16[v17] = {
			["exposureCount"] = v18.exposureCount,
			["lastExposureUTCTime"] = v18.lastExposureUTCTime
		}
	end
	return v16
end
local function v_u_30(p_u_22) -- name: withOldestEvicted
	-- upvalues: (copy) v_u_13
	local v23 = {}
	for v24 in p_u_22 do
		table.insert(v23, v24)
	end
	if #v23 <= v_u_13 then
		return p_u_22
	end
	table.sort(v23, function(p25, p26)
		-- upvalues: (copy) p_u_22
		return p_u_22[p25].lastExposureUTCTime > p_u_22[p26].lastExposureUTCTime
	end)
	local v27 = {}
	for v28 = 1, v_u_13 do
		local v29 = v23[v28]
		v27[v29] = p_u_22[v29]
	end
	return v27
end
local function v_u_42(p31, p32) -- name: tallyExposures
	-- upvalues: (copy) v_u_14, (copy) v_u_10, (copy) v_u_21, (copy) v_u_30, (copy) v_u_7, (copy) v_u_12
	if p31 == nil or p32 == nil then
		return
	else
		local v33 = {}
		for _, v34 in p31 do
			for _, v35 in v34 do
				if v_u_14[v35.offerId] or not v_u_10(v35, p32) then
					continue
				end
				v_u_14[v35.offerId] = true
				local v36 = v35.offerId
				table.insert(v33, v36)
			end
		end
		if #v33 ~= 0 then
			local v37 = v_u_21()
			local v38 = DateTime.now():ToIsoDate()
			for _, v39 in v33 do
				local v40 = v37[v39]
				v37[v39] = {
					["exposureCount"] = v40 == nil and 1 or v40.exposureCount + 1,
					["lastExposureUTCTime"] = v38
				}
			end
			local v41 = v_u_30(v37)
			v_u_7.storeForLocalPlayer(v_u_12, v41)
		end
	end
end
return function() -- name: useInExperienceOfferExposure
	-- upvalues: (copy) v_u_3, (copy) v_u_9, (copy) v_u_21, (copy) v_u_4, (copy) v_u_8, (copy) v_u_11, (copy) v_u_42
	v_u_3.useEffect(function()
		-- upvalues: (ref) v_u_9, (ref) v_u_21, (ref) v_u_4, (ref) v_u_8, (ref) v_u_11, (ref) v_u_42
		local v_u_43 = v_u_9(false)
		v_u_43.hydrateOfferExposureSnapshot((v_u_21()))
		return v_u_4.createEffect(function(p44)
			-- upvalues: (ref) v_u_8, (copy) v_u_43, (ref) v_u_11, (ref) v_u_42
			if v_u_8 then
				if v_u_43.getOfferNotificationShownWithEnum(p44) == v_u_11.None then
					return
				end
			elseif not v_u_43.getIsShopAvailable(p44) then
				return
			end
			v_u_42(v_u_43.getOffers(p44), v_u_43.getOfferExposureSnapshot(p44))
		end)
	end, {})
end