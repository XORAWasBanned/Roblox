-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Network.Url
local v_u_1 = game:GetService("ContentProvider")
local v6, v7, v8 = (function() -- name: parseBaseUrlInformation
	-- upvalues: (copy) v_u_1
	local v2 = v_u_1.BaseUrl
	if v2:sub(#v2) ~= "/" then
		v2 = v2 .. "/"
	end
	local _, v3 = v2:find("://")
	local v4, v5 = v2:find("%.", v3 + 1)
	return v2, v2:sub(v3 + 1, v4 - 1), v2:sub(v5 + 1)
end)()
local v9 = string.format("https://api.%s", v8)
local v10 = string.format("https://apis.%s", v8)
local v11 = string.format("https://auth.%s", v8)
local v12 = string.format("https://accountsettings.%s", v8)
local v13 = string.format("https://avatar.%s", v8)
local v14 = string.format("https://catalog.%s", v8)
local v15 = string.format("https://chat.%sv2", v8)
local v16 = string.format("https://create.%s", v8)
local v17 = string.format("https://friends.%sv1", v8)
local v18 = string.format("https://assetgame.%s", v8)
local v19 = string.format("https://games.%s", v8)
local v20 = string.format("https://notifications.%s", v8)
local v21 = string.format("https://presence.%sv1", v8)
local v22 = string.format("https://realtime.%s", v8)
local v23 = string.format("https://web.%s", v8)
local v24 = string.format("https://www.%s", v8)
local v25 = string.format("https://ads.%s", v8)
local v26 = string.format("https://followings.%s", v8)
local v27 = string.format("https://economy.%s", v8)
local v28 = string.format("https://thumbnails.%s", v8)
local v29 = string.format("https://accountsettings.%s", v8)
local v30 = string.format("https://premiumfeatures.%s", v8)
local v31 = string.format("https://locale.%s", v8)
local v32 = string.format("https://badges.%s", v8)
local v33 = string.format("https://metrics.%sv1", v8)
local v34 = string.format("https://apis.rcs.%s", v8)
local v35 = string.format("https://discussions.%s", v8)
local v54 = {
	["__index"] = nil,
	["__newindex"] = nil,
	["__metatable"] = false,
	["__index"] = {
		["DOMAIN"] = v8,
		["PREFIX"] = v7,
		["BASE_URL"] = v6,
		["BASE_URL_SECURE"] = string.gsub(v6, "http://", "https://"),
		["API_URL"] = v9,
		["APIS_URL"] = v10,
		["AUTH_URL"] = v11,
		["ACCOUNT_SETTINGS_URL"] = v12,
		["AVATAR_URL"] = v13,
		["CATALOG_URL"] = v14,
		["CREATOR_HUB_URL"] = v16,
		["GAME_URL"] = v19,
		["GAME_ASSET_URL"] = v18,
		["CHAT_URL"] = v15,
		["FRIEND_URL"] = v17,
		["PRESENCE_URL"] = v21,
		["NOTIFICATION_URL"] = v20,
		["REALTIME_URL"] = v22,
		["WEB_URL"] = v23,
		["WWW_URL"] = v24,
		["ADS_URL"] = v25,
		["FOLLOWINGS_URL"] = v26,
		["ECONOMY_URL"] = v27,
		["THUMBNAILS_URL"] = v28,
		["BADGES_URL"] = v32,
		["ACCOUNT_SETTINGS"] = v29,
		["PREMIUM_FEATURES"] = v30,
		["LOCALE"] = v31,
		["METRICS_URL"] = v33,
		["APIS_RCS_URL"] = v34,
		["DISCUSSIONS_URL"] = v35,
		["BLOG_URL"] = "https://blog.roblox.com/",
		["CORP_URL"] = "https://corp.roblox.com/",
		["GAME_I18N_URL"] = string.format("https://gameinternationalization.%s", v8),
		["getUserProfileUrl"] = function(p36, p37) -- name: getUserProfileUrl
			return string.format("%susers/%s/profile", p36.BASE_URL, p37)
		end,
		["getUserFriendsUrl"] = function(p38, p39) -- name: getUserFriendsUrl
			return string.format("%susers/%s/friends", p38.BASE_URL, p39)
		end,
		["getUserInventoryUrl"] = function(p40, p41) -- name: getUserInventoryUrl
			return string.format("%susers/%s/inventory", p40.BASE_URL, p41)
		end,
		["getPlaceDefaultThumbnailUrl"] = function(p42, p43, p44, p45) -- name: getPlaceDefaultThumbnailUrl
			return string.format("%sThumbs/Asset.ashx?width=%d&height=%d&assetId=%s&ignorePlaceMediaItems=true", p42.BASE_URL, p44, p45, (tostring(p43)))
		end,
		["isVanitySite"] = function(p46) -- name: isVanitySite
			return p46.PREFIX ~= "www"
		end,
		["makeQueryString"] = function(_, p47) -- name: makeQueryString
			local v48 = {}
			for v49, v50 in pairs(p47) do
				if v50 == nil then
					continue
				end
				if type(v50) == "table" then
					for v51 = 1, #v50 do
						local v52 = v49 .. "=" .. v50[v51]
						table.insert(v48, v52)
					end
				else
					local v53 = v49 .. "=" .. tostring(v50)
					table.insert(v48, v53)
				end
			end
			return table.concat(v48, "&")
		end
	},
	["__newindex"] = function(_, _, _) -- name: preventTableModification
		error("Attempt to modify read-only table")
	end
}
return setmetatable({}, v54)