-- Path: CoreGui.RobloxGui.Modules.Shell.EventHub
local v_u_1 = {}
return {
	["addEventListener"] = function(_, p2, p3, p4) -- name: addEventListener
		-- upvalues: (copy) v_u_1
		if v_u_1[p2] == nil then
			v_u_1[p2] = {}
		end
		local v5 = v_u_1[p2]
		table.insert(v5, {
			["id"] = p3,
			["callback"] = p4
		})
	end,
	["removeEventListener"] = function(_, p6, p7) -- name: removeEventListener
		-- upvalues: (copy) v_u_1
		if v_u_1[p6] ~= nil then
			for v8, v9 in ipairs(v_u_1[p6]) do
				if v9 == nil or v9.id ~= p7 then
					continue
				end
				table.remove(v_u_1[p6], v8)
			end
		end
	end,
	["removeCallbackFromEvent"] = function(_, p10, p11, p12) -- name: removeCallbackFromEvent
		-- upvalues: (copy) v_u_1
		if v_u_1[p10] ~= nil then
			for v13, v14 in ipairs(v_u_1[p10]) do
				if v14 == nil or (v14.id ~= p11 or v14.callback ~= p12) then
					continue
				end
				table.remove(v_u_1[p10], v13)
				return
			end
		end
	end,
	["dispatchEvent"] = function(_, p15, ...) -- name: dispatchEvent
		-- upvalues: (copy) v_u_1
		if v_u_1[p15] ~= nil then
			for _, v16 in ipairs(v_u_1[p15]) do
				v16.callback(...)
			end
		end
	end,
	["Notifications"] = {
		["AuthenticationSuccess"] = "rbxNotificationAuthenticationSuccess",
		["GameJoin"] = "rbxNotificationGameJoin",
		["OpenGames"] = "rbxNotificationOpenGames",
		["OpenGameDetail"] = "rbxNotificationOpenGameDetail",
		["OpenGameGenre"] = "rbxNotificationOpenGameGenre",
		["OpenBadgeScreen"] = "rbxNotificationOpenBadgeScreen",
		["OpenSettingsScreen"] = "rbxNotificationOpenSettingsScreen",
		["OpenSearchScreen"] = "rbxNotificationOpenSearchScreen",
		["OpenStoreScreen"] = "rbxNotificationOpenStoreScreen",
		["OpenAvatarEditorScreen"] = "rbxNotificationOpenAvatarEditorScreen",
		["OpenAccountSettingsScreen"] = "rbxNotificationOpenAccountSettingsScreen",
		["NavigateToEquippedAvatar"] = "rbxNotificationNavigateToEquippedAvatar",
		["NavigateToRobuxScreen"] = "rbxNotificationNavigateToRobuxScreen",
		["RobuxCatalogPurchaseInitiated"] = "rbxRobuxCatalogPurchaseInitiated",
		["DonnedDifferentPackage"] = "rbxDonnedDifferentPackage",
		["VotedOnPlace"] = "rbxVotedOnPlace",
		["AvatarEquipBegin"] = "rbxAvatarEquipBegin",
		["DonnedDifferentOutfit"] = "rbxDonnedDifferentOutfit",
		["AvatarEquipSuccess"] = "rbxAvatarEquipSuccess",
		["AvatarPurchaseBegin"] = "rbxAvatarPurchaseBegin",
		["AvatarPurchaseSuccess"] = "rbxAvatarPurchaseSuccess",
		["FavoriteToggle"] = "rbxFavoriteToggle",
		["PlayedGamesChanged"] = "rbxPlayedGamesChanged",
		["UnlockedUGC"] = "rbxNotificationUnlockedUGC",
		["SetGamesHints"] = "rbxNotificationSetGamesHints",
		["CharacterEquipped"] = "CharacterEquipped",
		["CharacterUpdated"] = "CharacterUpdated",
		["HardwareBundleGranted"] = "HardwareBundleGranted"
	}
}