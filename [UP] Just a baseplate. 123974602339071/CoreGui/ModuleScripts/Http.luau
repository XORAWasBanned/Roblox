-- Path: CoreGui.RobloxGui.Modules.Shell.Http
local v_u_1 = game:GetService("HttpService")
local v_u_2 = game:GetService("HttpRbxApiService")
local v3 = game:GetService("CorePackages")
local v4 = game:GetService("CoreGui").RobloxGui.Modules
local v_u_5 = require(v4.Shell.Utility)
local v_u_6 = require(v3.Workspace.Packages.Http).Url
local v7 = {}
local v8 = game:GetService("ContentProvider").BaseUrl:lower()
local v9 = string.gsub(v8, "/m.", "/www.")
local v_u_10 = string.gsub(v9, "http://", "https://")
local v11 = string.gsub(v_u_10, "https://www.", "https://assetgame.")
string.gsub(v_u_10, "https://www.", "https://accountsettings.")
v7.BaseUrl = v_u_10
v7.AssetGameBaseUrl = v11
local v_u_12 = require(v4.Shell.Flags.GetFStringAppLocationForAppPresence)
local function v_u_14(p13) -- name: buildServiceUrl
	-- upvalues: (ref) v_u_10
	return string.gsub(v_u_10, "https://www.", "https://" .. p13 .. ".")
end
function v7.GetCuratedSortAsync(p15, p16) -- name: GetCuratedSortAsync
	-- upvalues: (ref) v_u_10, (copy) v_u_1
	local v_u_17 = string.format("%sgames/set?GameSetTargetId=%d&MaxRows=%d", v_u_10, p15, p16)
	local v18, v_u_19 = pcall(function()
		-- upvalues: (copy) v_u_17
		return game:HttpGetAsync(v_u_17)
	end)
	if v18 then
		if v_u_19 == nil or #v_u_19 == 0 then
			return nil
		else
			local function v20()
				-- upvalues: (ref) v_u_1, (copy) v_u_19
				return v_u_1:JSONDecode(v_u_19)
			end
			local v21, v22 = pcall(v20)
			if v21 then
				return v22
			else
				return nil
			end
		end
	else
		return nil
	end
end
function v7.GetCuratedSortByUrlAsync(p_u_23) -- name: GetCuratedSortByUrlAsync
	-- upvalues: (copy) v_u_1
	local v24, v_u_25 = pcall(function()
		-- upvalues: (copy) p_u_23
		return game:HttpGetAsync(p_u_23)
	end)
	if v24 then
		if v_u_25 == nil or #v_u_25 == 0 then
			return nil
		else
			local function v26()
				-- upvalues: (ref) v_u_1, (copy) v_u_25
				return v_u_1:JSONDecode(v_u_25)
			end
			local v27, v28 = pcall(v26)
			if v27 then
				return v28
			else
				return nil
			end
		end
	else
		return nil
	end
end
function v7.GetUserPlacesAsync(p29, p30, p31) -- name: GetUserPlacesAsync
	-- upvalues: (ref) v_u_10, (copy) v_u_1
	local v_u_32 = string.format("%sgames/list-users-games-json?userid=%d&startIndex=%d&pageSize=%d", v_u_10, p31, p29, p30)
	local v33, v_u_34 = pcall(function()
		-- upvalues: (copy) v_u_32
		return game:HttpGetAsync(v_u_32)
	end)
	if v33 then
		if v_u_34 == nil or #v_u_34 == 0 then
			return nil
		else
			local function v35()
				-- upvalues: (ref) v_u_1, (copy) v_u_34
				return v_u_1:JSONDecode(v_u_34)
			end
			local v36, v37 = pcall(v35)
			if v36 then
				return v37
			else
				return nil
			end
		end
	else
		return nil
	end
end
function v7.SearchGamesAsync(p38, p39, p40) -- name: SearchGamesAsync
	-- upvalues: (ref) v_u_10, (copy) v_u_1
	local v_u_41 = string.format("%sgames/list-json?keyword=%s&StartRows=%d&MaxRows=%d&filterByDeviceType=true", v_u_10, v_u_1:UrlEncode(p40), p38, p39)
	local v42, v_u_43 = pcall(function()
		-- upvalues: (copy) v_u_41
		return game:HttpGetAsync(v_u_41)
	end)
	if v42 then
		if v_u_43 == nil or #v_u_43 == 0 then
			return nil
		else
			local function v44()
				-- upvalues: (ref) v_u_1, (copy) v_u_43
				return v_u_1:JSONDecode(v_u_43)
			end
			local v45, v46 = pcall(v44)
			if v45 then
				return v46
			else
				return nil
			end
		end
	else
		return nil
	end
end
function v7.GetGamesAsync(p47) -- name: GetGamesAsync
	-- upvalues: (ref) v_u_10, (copy) v_u_1
	local v_u_48 = string.gsub(v_u_10, "https://www.", "https://games.") .. "v1/games?universeIds=" .. table.concat(p47, ",")
	local v49, v_u_50 = pcall(function()
		-- upvalues: (copy) v_u_48
		return game:HttpGetAsync(v_u_48)
	end)
	if v49 then
		if v_u_50 == nil or #v_u_50 == 0 then
			return nil
		else
			local function v51()
				-- upvalues: (ref) v_u_1, (copy) v_u_50
				return v_u_1:JSONDecode(v_u_50)
			end
			local v52, v53 = pcall(v51)
			if v52 then
				return v53
			else
				return nil
			end
		end
	else
		return nil
	end
end
function v7.PostExperienceGuidelines(p54) -- name: PostExperienceGuidelines
	-- upvalues: (copy) v_u_14, (copy) v_u_1, (copy) v_u_5
	local v55 = {
		["Url"] = nil,
		["Method"] = "POST",
		["Body"] = nil,
		["Headers"] = nil,
		["Url"] = string.format("%sexperience-guidelines-api/experience-guidelines/get-age-recommendation", v_u_14("apis")),
		["Body"] = v_u_1:JSONEncode({
			["universeId"] = p54
		}),
		["Headers"] = {
			["Content-Type"] = "application/json",
			["Accept"] = "application/json"
		}
	}
	local v_u_56 = nil
	local v_u_57 = v_u_5.Signal()
	v_u_1:RequestInternal(v55):Start(function(p58, p59)
		-- upvalues: (ref) v_u_56, (ref) v_u_1, (copy) v_u_57
		if p58 and (p59.StatusCode ~= 401 and (p59.StatusCode >= 200 and p59.StatusCode < 400)) then
			local v_u_60 = p59.Body
			local v61
			if v_u_60 == nil or #v_u_60 == 0 then
				v61 = nil
			else
				local function v62()
					-- upvalues: (ref) v_u_1, (copy) v_u_60
					return v_u_1:JSONDecode(v_u_60)
				end
				local v63
				v63, v61 = pcall(v62)
				if not v63 then
					v61 = nil
				end
			end
			v_u_56 = v61
		end
		v_u_57:fire()
	end)
	v_u_57:wait()
	return v_u_56
end
function v7.GetGameIconIdAsync(p64) -- name: GetGameIconIdAsync
	-- upvalues: (ref) v_u_10, (copy) v_u_1
	local v_u_65 = v_u_10 .. "places/icons/json?placeId=" .. tostring(p64)
	local v66, v_u_67 = pcall(function()
		-- upvalues: (copy) v_u_65
		return game:HttpGetAsync(v_u_65)
	end)
	if v66 then
		if v_u_67 == nil or #v_u_67 == 0 then
			return nil
		else
			local function v68()
				-- upvalues: (ref) v_u_1, (copy) v_u_67
				return v_u_1:JSONDecode(v_u_67)
			end
			local v69, v70 = pcall(v68)
			if v69 then
				return v70
			else
				return nil
			end
		end
	else
		return nil
	end
end
function v7.GetGameVotesAsync(p71) -- name: GetGameVotesAsync
	-- upvalues: (ref) v_u_10, (copy) v_u_1
	local v_u_72 = v_u_10 .. "PlaceItem/GameDetailsVotingPanelJson?placeId=" .. tostring(p71)
	local v73, v_u_74 = pcall(function()
		-- upvalues: (copy) v_u_72
		return game:HttpGetAsync(v_u_72)
	end)
	if v73 then
		if v_u_74 == nil or #v_u_74 == 0 then
			return nil
		else
			local function v75()
				-- upvalues: (ref) v_u_1, (copy) v_u_74
				return v_u_1:JSONDecode(v_u_74)
			end
			local v76, v77 = pcall(v75)
			if v76 then
				return v77
			else
				return nil
			end
		end
	else
		return nil
	end
end
function v7.GetRecommendedGamesAsync(p78) -- name: GetRecommendedGamesAsync
	-- upvalues: (ref) v_u_10, (copy) v_u_1
	local v_u_79 = v_u_10 .. "Games/GetRecommendedGamesJson?currentPlaceId=" .. tostring(p78)
	local v80, v_u_81 = pcall(function()
		-- upvalues: (copy) v_u_79
		return game:HttpGetAsync(v_u_79)
	end)
	if v80 then
		if v_u_81 == nil or #v_u_81 == 0 then
			return nil
		else
			local function v82()
				-- upvalues: (ref) v_u_1, (copy) v_u_81
				return v_u_1:JSONDecode(v_u_81)
			end
			local v83, v84 = pcall(v82)
			if v83 then
				return v84
			else
				return nil
			end
		end
	else
		return nil
	end
end
function v7.GetGameThumbnailsAsync(p85) -- name: GetGameThumbnailsAsync
	-- upvalues: (ref) v_u_10, (copy) v_u_1
	local v_u_86 = v_u_10 .. "thumbnail/place-thumbnails?placeId=" .. tostring(p85)
	local v87, v_u_88 = pcall(function()
		-- upvalues: (copy) v_u_86
		return game:HttpGetAsync(v_u_86)
	end)
	if v87 then
		if v_u_88 == nil or #v_u_88 == 0 then
			return nil
		else
			local function v89()
				-- upvalues: (ref) v_u_1, (copy) v_u_88
				return v_u_1:JSONDecode(v_u_88)
			end
			local v90, v91 = pcall(v89)
			if v90 then
				return v91
			else
				return nil
			end
		end
	else
		return nil
	end
end
function v7.GetBadgesForUniverseAsync(p92, p93) -- name: GetBadgesForUniverseAsync
	-- upvalues: (ref) v_u_10, (copy) v_u_1
	local v_u_94 = string.format("%sv1/universes/%d/badges?sortOrder=Asc&limit=100", string.gsub(v_u_10, "https://www.", "https://badges."), p92)
	if p93 then
		v_u_94 = string.format(v_u_94 .. "&cursor=%s", p93)
	end
	local v95, v_u_96 = pcall(function()
		-- upvalues: (copy) v_u_94
		return game:HttpGetAsync(v_u_94)
	end)
	if v95 then
		if v_u_96 == nil or #v_u_96 == 0 then
			return nil
		else
			local function v97()
				-- upvalues: (ref) v_u_1, (copy) v_u_96
				return v_u_1:JSONDecode(v_u_96)
			end
			local v98, v99 = pcall(v97)
			if v98 then
				return v99
			else
				return nil
			end
		end
	else
		return nil
	end
end
function v7.GetUserAwardedBadgesAsync(p100, p101) -- name: GetUserAwardedBadgesAsync
	-- upvalues: (ref) v_u_10, (copy) v_u_1
	local v102 = table.concat(p101, ",")
	local v_u_103 = string.format("%sv1/users/%d/badges/awarded-dates?badgeIds=%s", string.gsub(v_u_10, "https://www.", "https://badges."), p100, v102)
	local v104, v_u_105 = pcall(function()
		-- upvalues: (copy) v_u_103
		return game:HttpGetAsync(v_u_103)
	end)
	if v104 then
		if v_u_105 == nil or #v_u_105 == 0 then
			return nil
		else
			local function v106()
				-- upvalues: (ref) v_u_1, (copy) v_u_105
				return v_u_1:JSONDecode(v_u_105)
			end
			local v107, v108 = pcall(v106)
			if v107 then
				return v108
			else
				return nil
			end
		end
	else
		return nil
	end
end
function v7.PostFavoriteToggleAsync(p109) -- name: PostFavoriteToggleAsync
	-- upvalues: (ref) v_u_10, (copy) v_u_1
	local v_u_110 = v_u_10 .. "favorite/toggle?assetID=" .. tostring(p109)
	local v_u_111 = "favoriteToggle"
	local v_u_112 = nil
	local v113, v_u_114 = pcall(function()
		-- upvalues: (copy) v_u_110, (copy) v_u_111, (copy) v_u_112
		return game:HttpPostAsync(v_u_110, v_u_111, v_u_112)
	end)
	if v113 then
		if v_u_114 == nil or #v_u_114 == 0 then
			return nil
		else
			local function v115()
				-- upvalues: (ref) v_u_1, (copy) v_u_114
				return v_u_1:JSONDecode(v_u_114)
			end
			local v116, v117 = pcall(v115)
			if v116 then
				return v117
			else
				return nil
			end
		end
	else
		return nil
	end
end
function v7.PostGameVoteAsync(p118, p119) -- name: PostGameVoteAsync
	-- upvalues: (ref) v_u_10, (copy) v_u_1
	local v_u_120 = v_u_10 .. "voting/vote?assetId=" .. tostring(p118) .. "&vote=" .. tostring(p119)
	local v_u_121 = "vote"
	local v_u_122 = nil
	local v123, v_u_124 = pcall(function()
		-- upvalues: (copy) v_u_120, (copy) v_u_121, (copy) v_u_122
		return game:HttpPostAsync(v_u_120, v_u_121, v_u_122)
	end)
	if v123 then
		if v_u_124 == nil or #v_u_124 == 0 then
			return nil
		else
			local function v125()
				-- upvalues: (ref) v_u_1, (copy) v_u_124
				return v_u_1:JSONDecode(v_u_124)
			end
			local v126, v127 = pcall(v125)
			if v126 then
				return v127
			else
				return nil
			end
		end
	else
		return nil
	end
end
function v7.RegisterAppPresence() -- name: RegisterAppPresence
	-- upvalues: (copy) v_u_14, (copy) v_u_12, (copy) v_u_1
	local v_u_128 = string.format("%s/v1/presence/register-app-presence", v_u_14("presence"))
	local v_u_129 = v_u_1:JSONEncode({
		["location"] = v_u_12()
	})
	local v_u_130 = nil
	local v131, v_u_132 = pcall(function()
		-- upvalues: (copy) v_u_128, (copy) v_u_129, (copy) v_u_130
		return game:HttpPostAsync(v_u_128, v_u_129, v_u_130)
	end)
	if v131 then
		if v_u_132 == nil or #v_u_132 == 0 then
			return nil
		else
			local function v133()
				-- upvalues: (ref) v_u_1, (copy) v_u_132
				return v_u_1:JSONDecode(v_u_132)
			end
			local v134, v135 = pcall(v133)
			if v134 then
				return v135
			else
				return nil
			end
		end
	else
		return nil
	end
end
function v7.GetCrossplayEnabledStatusAsync() -- name: GetCrossplayEnabledStatusAsync
	-- upvalues: (copy) v_u_14, (copy) v_u_5, (copy) v_u_1
	local v136 = {
		["Url"] = nil,
		["Method"] = "GET",
		["Url"] = string.format("%suser-settings-api/v1/user-settings?requestedUserSettings=xboxCrossPlayStatusIsEnabled", v_u_14("apis"))
	}
	local v_u_137 = nil
	local v_u_138 = v_u_5.Signal()
	v_u_1:RequestInternal(v136):Start(function(p139, p140)
		-- upvalues: (ref) v_u_137, (ref) v_u_1, (copy) v_u_138
		if p139 and (p140.StatusCode ~= 401 and (p140.StatusCode >= 200 and p140.StatusCode < 400)) then
			local v_u_141 = p140.Body
			local v142
			if v_u_141 == nil or #v_u_141 == 0 then
				v142 = nil
			else
				local function v143()
					-- upvalues: (ref) v_u_1, (copy) v_u_141
					return v_u_1:JSONDecode(v_u_141)
				end
				local v144
				v144, v142 = pcall(v143)
				if not v144 then
					v142 = nil
				end
			end
			v_u_137 = v142
		end
		v_u_138:fire()
	end)
	v_u_138:wait()
	return v_u_137
end
function v7.PostCrossplayStatusAsync(p145) -- name: PostCrossplayStatusAsync
	-- upvalues: (copy) v_u_14, (copy) v_u_1, (copy) v_u_5
	local v146 = {
		["Url"] = nil,
		["Method"] = "POST",
		["Body"] = nil,
		["Headers"] = nil,
		["Url"] = string.format("%suser-settings-api/v1/user-settings", v_u_14("apis")),
		["Body"] = v_u_1:JSONEncode({
			["xboxCrossPlayStatusIsEnabled"] = p145
		}),
		["Headers"] = {
			["Content-Type"] = "application/json",
			["Accept"] = "application/json"
		}
	}
	local v_u_147 = nil
	local v_u_148 = v_u_5.Signal()
	v_u_1:RequestInternal(v146):Start(function(p149, p150)
		-- upvalues: (ref) v_u_147, (ref) v_u_1, (copy) v_u_148
		if p149 and (p150.StatusCode ~= 401 and (p150.StatusCode >= 200 and p150.StatusCode < 400)) then
			local v_u_151 = p150.Body
			local v152
			if v_u_151 == nil or #v_u_151 == 0 then
				v152 = nil
			else
				local function v153()
					-- upvalues: (ref) v_u_1, (copy) v_u_151
					return v_u_1:JSONDecode(v_u_151)
				end
				local v154
				v154, v152 = pcall(v153)
				if not v154 then
					v152 = nil
				end
			end
			v_u_147 = v152
		end
		v_u_148:fire()
	end)
	v_u_148:wait()
	return v_u_147
end
function v7.GetRecommendedUsersndsAsync() -- name: GetRecommendedUsersndsAsync
	-- upvalues: (copy) v_u_14, (copy) v_u_1
	local v_u_155 = string.format("%s/v1/recommended-users", v_u_14("friends"))
	local v156, v_u_157 = pcall(function()
		-- upvalues: (copy) v_u_155
		return game:HttpGetAsync(v_u_155)
	end)
	if v156 then
		if v_u_157 == nil or #v_u_157 == 0 then
			return nil
		else
			local function v158()
				-- upvalues: (ref) v_u_1, (copy) v_u_157
				return v_u_1:JSONDecode(v_u_157)
			end
			local v159, v160 = pcall(v158)
			if v159 then
				return v160
			else
				return nil
			end
		end
	else
		return nil
	end
end
function v7.GetUsersPresenceAsync(p161) -- name: GetUsersPresenceAsync
	-- upvalues: (copy) v_u_1, (copy) v_u_14
	local v_u_162 = v_u_1:JSONEncode({
		["userIds"] = p161
	})
	local v_u_163 = string.format("%s/v1/presence/users", v_u_14("presence"))
	local v_u_164 = nil
	local v165, v_u_166 = pcall(function()
		-- upvalues: (copy) v_u_163, (copy) v_u_162, (copy) v_u_164
		return game:HttpPostAsync(v_u_163, v_u_162, v_u_164)
	end)
	if v165 then
		if v_u_166 == nil or #v_u_166 == 0 then
			return nil
		else
			local function v167()
				-- upvalues: (ref) v_u_1, (copy) v_u_166
				return v_u_1:JSONDecode(v_u_166)
			end
			local v168, v169 = pcall(v167)
			if v168 then
				return v169
			else
				return nil
			end
		end
	else
		return nil
	end
end
function v7.GetPlatformUserBalanceAsync() -- name: GetPlatformUserBalanceAsync
	-- upvalues: (copy) v_u_14, (copy) v_u_1
	local v_u_170 = string.format("%sv1/user/currency", v_u_14("economy"))
	local v171, v_u_172 = pcall(function()
		-- upvalues: (copy) v_u_170
		return game:HttpGetAsync(v_u_170)
	end)
	if v171 then
		if v_u_172 == nil or #v_u_172 == 0 then
			return nil
		else
			local function v173()
				-- upvalues: (ref) v_u_1, (copy) v_u_172
				return v_u_1:JSONDecode(v_u_172)
			end
			local v174, v175 = pcall(v173)
			if v174 then
				return v175
			else
				return nil
			end
		end
	else
		return nil
	end
end
function v7.GetTotalUserBalanceAsync() -- name: GetTotalUserBalanceAsync
	-- upvalues: (copy) v_u_14, (copy) v_u_1
	local v_u_176 = string.format("%sv1/user/currency", v_u_14("economy"))
	local v177, v_u_178 = pcall(function()
		-- upvalues: (copy) v_u_176
		return game:HttpGetAsync(v_u_176)
	end)
	if v177 then
		if v_u_178 == nil or #v_u_178 == 0 then
			return nil
		else
			local function v179()
				-- upvalues: (ref) v_u_1, (copy) v_u_178
				return v_u_1:JSONDecode(v_u_178)
			end
			local v180, v181 = pcall(v179)
			if v180 then
				return v181
			else
				return nil
			end
		end
	else
		return nil
	end
end
function v7.GetUserOwnedPackagesAsync(p182, p183) -- name: GetUserOwnedPackagesAsync
	-- upvalues: (ref) v_u_10, (copy) v_u_1
	local v_u_184 = v_u_10 .. "users/inventory/list-json?userId=" .. tostring(p182) .. "&assetTypeId=" .. tostring(32) .. "&pageNumber=" .. tostring(p183 or 1)
	local v185, v_u_186 = pcall(function()
		-- upvalues: (copy) v_u_184
		return game:HttpGetAsync(v_u_184)
	end)
	if v185 then
		if v_u_186 == nil or #v_u_186 == 0 then
			return nil
		else
			local function v187()
				-- upvalues: (ref) v_u_1, (copy) v_u_186
				return v_u_1:JSONDecode(v_u_186)
			end
			local v188, v189 = pcall(v187)
			if v188 then
				return v189
			else
				return nil
			end
		end
	else
		return nil
	end
end
function v7.GetCurrentlyWearingAsync(p190) -- name: GetCurrentlyWearingAsync
	-- upvalues: (ref) v_u_10, (copy) v_u_1
	local v_u_191 = string.format("%s/v1/users/%d/currently-wearing", string.gsub(v_u_10, "https://www.", "https://avatar."), p190)
	local v192, v_u_193 = pcall(function()
		-- upvalues: (copy) v_u_191
		return game:HttpGetAsync(v_u_191)
	end)
	if v192 then
		if v_u_193 == nil or #v_u_193 == 0 then
			return nil
		else
			local function v194()
				-- upvalues: (ref) v_u_1, (copy) v_u_193
				return v_u_1:JSONDecode(v_u_193)
			end
			local v195, v196 = pcall(v194)
			if v195 then
				return v196
			else
				return nil
			end
		end
	else
		return nil
	end
end
function v7.SetWearingAssetsAsync(p197) -- name: SetWearingAssetsAsync
	-- upvalues: (copy) v_u_1, (copy) v_u_14, (copy) v_u_5
	local v198 = v_u_1:JSONEncode({
		["assetIds"] = p197
	})
	local v199 = {
		["Url"] = nil,
		["Method"] = "POST",
		["Body"] = nil,
		["Headers"] = nil,
		["Url"] = string.format("%s/v1/avatar/set-wearing-assets", v_u_14("avatar")),
		["Body"] = v198,
		["Headers"] = {
			["Content-Type"] = "application/json"
		}
	}
	local v_u_200 = nil
	local v_u_201 = v_u_5.Signal()
	v_u_1:RequestInternal(v199):Start(function(p202, p203)
		-- upvalues: (ref) v_u_200, (ref) v_u_1, (copy) v_u_201
		if p202 and (p203.StatusCode ~= 401 and (p203.StatusCode >= 200 and p203.StatusCode < 400)) then
			local v_u_204 = p203.Body
			local v205
			if v_u_204 == nil or #v_u_204 == 0 then
				v205 = nil
			else
				local function v206()
					-- upvalues: (ref) v_u_1, (copy) v_u_204
					return v_u_1:JSONDecode(v_u_204)
				end
				local v207
				v207, v205 = pcall(v206)
				if not v207 then
					v205 = nil
				end
			end
			v_u_200 = v205
		end
		v_u_201:fire()
	end)
	v_u_201:wait()
	return v_u_200
end
function v7.PurchaseProductAsync(p208, p209, p210, p211) -- name: PurchaseProductAsync
	-- upvalues: (ref) v_u_10, (copy) v_u_1
	local v_u_212 = string.format("%s/v1/purchases/products/%d", string.gsub(v_u_10, "https://www.", "https://economy."), p208)
	local v_u_213 = v_u_1:JSONEncode({
		["expectedCurrency"] = p211,
		["expectedPrice"] = p209,
		["expectedSellerId"] = p210
	})
	local v_u_214 = nil
	local v215, v_u_216 = pcall(function()
		-- upvalues: (copy) v_u_212, (copy) v_u_213, (copy) v_u_214
		return game:HttpPostAsync(v_u_212, v_u_213, v_u_214)
	end)
	if v215 then
		if v_u_216 == nil or #v_u_216 == 0 then
			return nil
		else
			local function v217()
				-- upvalues: (ref) v_u_1, (copy) v_u_216
				return v_u_1:JSONDecode(v_u_216)
			end
			local v218, v219 = pcall(v217)
			if v218 then
				return v219
			else
				return nil
			end
		end
	else
		return nil
	end
end
function v7.MultiGetBundleDetailsAsync(p220) -- name: MultiGetBundleDetailsAsync
	-- upvalues: (ref) v_u_10, (copy) v_u_1
	local v221 = table.concat(p220, ",")
	local v_u_222 = string.format("%sv1/bundles/details?bundleIds=%s", string.gsub(v_u_10, "https://www.", "https://catalog."), v221)
	local v223, v_u_224 = pcall(function()
		-- upvalues: (copy) v_u_222
		return game:HttpGetAsync(v_u_222)
	end)
	if v223 then
		if v_u_224 == nil or #v_u_224 == 0 then
			return nil
		else
			local function v225()
				-- upvalues: (ref) v_u_1, (copy) v_u_224
				return v_u_1:JSONDecode(v_u_224)
			end
			local v226, v227 = pcall(v225)
			if v226 then
				return v227
			else
				return nil
			end
		end
	else
		return nil
	end
end
function v7.GetUserOwnedBundlesAsync(p228, p229) -- name: GetUserOwnedBundlesAsync
	-- upvalues: (ref) v_u_10, (copy) v_u_1
	local v_u_230 = string.format("%sv1/users/%s/bundles?sortOrder=Asc&limit=100", string.gsub(v_u_10, "https://www.", "https://catalog."), (tostring(p228)))
	if p229 then
		v_u_230 = string.format(v_u_230 .. "&cursor=%s", p229)
	end
	local v231, v_u_232 = pcall(function()
		-- upvalues: (copy) v_u_230
		return game:HttpGetAsync(v_u_230)
	end)
	if v231 then
		if v_u_232 == nil or #v_u_232 == 0 then
			return nil
		else
			local function v233()
				-- upvalues: (ref) v_u_1, (copy) v_u_232
				return v_u_1:JSONDecode(v_u_232)
			end
			local v234, v235 = pcall(v233)
			if v234 then
				return v235
			else
				return nil
			end
		end
	else
		return nil
	end
end
function v7.GetAssetThumbnailBatchAsync(p236, p237, p238) -- name: GetAssetThumbnailBatchAsync
	-- upvalues: (ref) v_u_10, (copy) v_u_1
	local v239 = string.gsub(v_u_10, "https://www.", "https://games.") .. "v1/games/game-thumbnails?%s&height=" .. tostring(p238) .. "&width=" .. tostring(p237)
	local v240 = "imageTokens=" .. table.concat(p236, "&imageTokens=")
	local v_u_241 = string.format(v239, v240)
	local v242, v_u_243 = pcall(function()
		-- upvalues: (copy) v_u_241
		return game:HttpGetAsync(v_u_241)
	end)
	if v242 then
		if v_u_243 == nil or #v_u_243 == 0 then
			return nil
		else
			local function v244()
				-- upvalues: (ref) v_u_1, (copy) v_u_243
				return v_u_1:JSONDecode(v_u_243)
			end
			local v245, v246 = pcall(v244)
			if v245 then
				return v246
			else
				return nil
			end
		end
	else
		return nil
	end
end
function v7.ReportAbuseAsyncV2(p247, p248, p249, p250, p251, p252, p253, p254, p255) -- name: ReportAbuseAsyncV2
	-- upvalues: (copy) v_u_1, (copy) v_u_6, (copy) v_u_2
	local v256 = {}
	local v257 = {}
	local v258 = {
		["valueList"] = {
			{
				["data"] = p252
			}
		}
	}
	v257.ENTRY_POINT = v258
	local v259 = {
		["valueList"] = {
			{
				["data"] = p247
			}
		}
	}
	v257.SUBMITTER_USER_ID = v259
	local v260 = {
		["valueList"] = {
			{
				["data"] = p249
			}
		}
	}
	v257.REPORT_TARGET_USER_ID = v260
	local v261 = {
		["valueList"] = {
			{
				["data"] = p254
			}
		}
	}
	v257.REPORTED_ABUSE_CATEGORY = v261
	local v262 = {
		["valueList"] = {
			{
				["data"] = p253
			}
		}
	}
	v257.REPORTED_ABUSE_VECTOR = v262
	local v263 = {
		["valueList"] = {
			{
				["data"] = p255
			}
		}
	}
	v257.REPORTER_COMMENT = v263
	local v264 = {
		["valueList"] = {
			{
				["data"] = p248
			}
		}
	}
	v257.REPORT_TARGET_ASSET_ID = v264
	local v265 = {
		["valueList"] = {
			{
				["data"] = p250
			}
		}
	}
	v257.REPORT_TARGET_ASSET_NAME = v265
	local v266 = {
		["valueList"] = {
			{
				["data"] = p251
			}
		}
	}
	v257.REPORT_TARGET_ASSET_DESCRIPTION = v266
	v256.tags = v257
	local v_u_267 = v_u_1:JSONEncode(v256)
	local v_u_268 = v_u_6.APIS_URL .. "abuse-reporting/v2/abuse-report"
	if v_u_267 then
		local v_u_269 = Enum.ThrottlingPriority.Default
		local v_u_270 = Enum.HttpContentType.ApplicationJson
		local function v271()
			-- upvalues: (ref) v_u_2, (copy) v_u_268, (copy) v_u_267, (copy) v_u_269, (copy) v_u_270
			return v_u_2:PostAsyncFullUrl(v_u_268, v_u_267, v_u_269, v_u_270)
		end
		local v272, v_u_273 = pcall(v271)
		if v272 then
			if v_u_273 == nil or #v_u_273 == 0 then
				return nil
			else
				local function v274()
					-- upvalues: (ref) v_u_1, (copy) v_u_273
					return v_u_1:JSONDecode(v_u_273)
				end
				local v275, v276 = pcall(v274)
				if v275 then
					return v276
				else
					return nil
				end
			end
		else
			return nil
		end
	else
		return nil
	end
end
function v7.GetConsecutiveDaysLoggedInAsync() -- name: GetConsecutiveDaysLoggedInAsync
	-- upvalues: (copy) v_u_14, (copy) v_u_5, (copy) v_u_1
	local v277 = {
		["Url"] = nil,
		["Method"] = "GET",
		["Url"] = string.format("%sv1/xbox/get-login-consecutive-days", v_u_14("auth"))
	}
	local v_u_278 = nil
	local v_u_279 = v_u_5.Signal()
	v_u_1:RequestInternal(v277):Start(function(p280, p281)
		-- upvalues: (ref) v_u_278, (ref) v_u_1, (copy) v_u_279
		if p280 and (p281.StatusCode ~= 401 and (p281.StatusCode >= 200 and p281.StatusCode < 400)) then
			local v_u_282 = p281.Body
			local v283
			if v_u_282 == nil or #v_u_282 == 0 then
				v283 = nil
			else
				local function v284()
					-- upvalues: (ref) v_u_1, (copy) v_u_282
					return v_u_1:JSONDecode(v_u_282)
				end
				local v285
				v285, v283 = pcall(v284)
				if not v285 then
					v283 = nil
				end
			end
			v_u_278 = v283
		end
		v_u_279:fire()
	end)
	v_u_279:wait()
	return v_u_278
end
function v7.IsValidUsername(p286, p287) -- name: IsValidUsername
	-- upvalues: (ref) v_u_10, (copy) v_u_1, (copy) v_u_5
	if p286 ~= nil and #p286 ~= 0 and (p287 ~= nil and #p287 ~= 0) then
		local v288 = {
			["Url"] = nil,
			["Method"] = "GET",
			["Url"] = string.format("%sv2/usernames/validate?request.username=%s&request.birthday=%s", string.gsub(v_u_10, "https://www.", "https://auth."), v_u_1:UrlEncode(p286), p287)
		}
		local v_u_289 = nil
		local v_u_290 = v_u_5.Signal()
		v_u_1:RequestInternal(v288):Start(function(p291, p292)
			-- upvalues: (ref) v_u_289, (ref) v_u_1, (copy) v_u_290
			if p291 and (p292.StatusCode ~= 401 and (p292.StatusCode >= 200 and p292.StatusCode < 400)) then
				local v_u_293 = p292.Body
				local v294
				if v_u_293 == nil or #v_u_293 == 0 then
					v294 = nil
				else
					local function v295()
						-- upvalues: (ref) v_u_1, (copy) v_u_293
						return v_u_1:JSONDecode(v_u_293)
					end
					local v296
					v296, v294 = pcall(v295)
					if not v296 then
						v294 = nil
					end
				end
				v_u_289 = v294
			end
			v_u_290:fire()
		end)
		v_u_290:wait()
		return v_u_289
	end
end
function v7.IsValidPassword(p297, p298) -- name: IsValidPassword
	-- upvalues: (ref) v_u_10, (copy) v_u_1, (copy) v_u_5
	if p297 ~= nil and #p297 ~= 0 and (p298 ~= nil and #p298 ~= 0) then
		local v299 = {
			["Url"] = nil,
			["Method"] = "GET",
			["Url"] = string.format("%sv2/passwords/validate?request.username=%s&request.password=%s", string.gsub(v_u_10, "https://www.", "https://auth."), v_u_1:UrlEncode(p297), v_u_1:UrlEncode(p298))
		}
		local v_u_300 = nil
		local v_u_301 = v_u_5.Signal()
		v_u_1:RequestInternal(v299):Start(function(p302, p303)
			-- upvalues: (ref) v_u_300, (ref) v_u_1, (copy) v_u_301
			if p302 and (p303.StatusCode ~= 401 and (p303.StatusCode >= 200 and p303.StatusCode < 400)) then
				local v_u_304 = p303.Body
				local v305
				if v_u_304 == nil or #v_u_304 == 0 then
					v305 = nil
				else
					local function v306()
						-- upvalues: (ref) v_u_1, (copy) v_u_304
						return v_u_1:JSONDecode(v_u_304)
					end
					local v307
					v307, v305 = pcall(v306)
					if not v307 then
						v305 = nil
					end
				end
				v_u_300 = v305
			end
			v_u_301:fire()
		end)
		v_u_301:wait()
		return v_u_300
	end
end
function v7.PostSponsoredGameClickAsync(p308) -- name: PostSponsoredGameClickAsync
	-- upvalues: (copy) v_u_14, (copy) v_u_1
	local v_u_309 = string.format("%sv1/sponsored-games/click", v_u_14("ads"))
	local v_u_310, v_u_311 = string.format("\"%s\"", p308)
	local v312, v_u_313 = pcall(function()
		-- upvalues: (copy) v_u_309, (copy) v_u_310, (copy) v_u_311
		return game:HttpPostAsync(v_u_309, v_u_310, v_u_311)
	end)
	if v312 then
		if v_u_313 == nil or #v_u_313 == 0 then
			return nil
		else
			local function v314()
				-- upvalues: (ref) v_u_1, (copy) v_u_313
				return v_u_1:JSONDecode(v_u_313)
			end
			local v315, v316 = pcall(v314)
			if v315 then
				return v316
			else
				return nil
			end
		end
	else
		return nil
	end
end
function v7.GetUserVoteCountFromVotingApiAsync() -- name: GetUserVoteCountFromVotingApiAsync
	-- upvalues: (copy) v_u_14, (copy) v_u_5, (copy) v_u_1
	local v317 = {
		["Url"] = nil,
		["Method"] = "GET",
		["Url"] = string.format("%svoting-api/user/get-vote-count?targetType=Place", v_u_14("apis"))
	}
	local v_u_318 = nil
	local v_u_319 = v_u_5.Signal()
	v_u_1:RequestInternal(v317):Start(function(p320, p321)
		-- upvalues: (ref) v_u_318, (ref) v_u_1, (copy) v_u_319
		if p320 and (p321.StatusCode ~= 401 and (p321.StatusCode >= 200 and p321.StatusCode < 400)) then
			local v_u_322 = p321.Body
			local v323
			if v_u_322 == nil or #v_u_322 == 0 then
				v323 = nil
			else
				local function v324()
					-- upvalues: (ref) v_u_1, (copy) v_u_322
					return v_u_1:JSONDecode(v_u_322)
				end
				local v325
				v325, v323 = pcall(v324)
				if not v325 then
					v323 = nil
				end
			end
			v_u_318 = v323
		end
		v_u_319:fire()
	end)
	v_u_319:wait()
	return v_u_318
end
function v7.CreateCrossDeviceLoginCode() -- name: CreateCrossDeviceLoginCode
	-- upvalues: (copy) v_u_14, (copy) v_u_1
	local v_u_326 = string.format("%sauth-token-service/v1/login/create", v_u_14("apis"))
	local v_u_327 = ""
	local v_u_328 = nil
	local v329, v_u_330 = pcall(function()
		-- upvalues: (copy) v_u_326, (copy) v_u_327, (copy) v_u_328
		return game:HttpPostAsync(v_u_326, v_u_327, v_u_328)
	end)
	if v329 then
		if v_u_330 == nil or #v_u_330 == 0 then
			return nil
		else
			local function v331()
				-- upvalues: (ref) v_u_1, (copy) v_u_330
				return v_u_1:JSONDecode(v_u_330)
			end
			local v332, v333 = pcall(v331)
			if v332 then
				return v333
			else
				return nil
			end
		end
	else
		return nil
	end
end
function v7.CheckCrossDeviceLoginStatus(p334, p335) -- name: CheckCrossDeviceLoginStatus
	-- upvalues: (copy) v_u_14, (copy) v_u_1, (copy) v_u_5
	local v336 = {
		["Url"] = nil,
		["Method"] = "POST",
		["Body"] = nil,
		["Headers"] = nil,
		["Url"] = string.format("%sauth-token-service/v1/login/status", v_u_14("apis")),
		["Body"] = v_u_1:JSONEncode({
			["code"] = p334,
			["privateKey"] = p335
		}),
		["Headers"] = {
			["Content-Type"] = "application/json",
			["Accept"] = "application/json"
		}
	}
	local v_u_337 = nil
	local v_u_338 = v_u_5.Signal()
	v_u_1:RequestInternal(v336):Start(function(p339, p340)
		-- upvalues: (ref) v_u_337, (ref) v_u_1, (copy) v_u_338
		if p339 and (p340.StatusCode ~= 401 and (p340.StatusCode >= 200 and p340.StatusCode < 400)) then
			local v_u_341 = p340.Body
			local v342
			if v_u_341 == nil or #v_u_341 == 0 then
				v342 = nil
			else
				local function v343()
					-- upvalues: (ref) v_u_1, (copy) v_u_341
					return v_u_1:JSONDecode(v_u_341)
				end
				local v344
				v344, v342 = pcall(v343)
				if not v344 then
					v342 = nil
				end
			end
			v_u_337 = v342
		end
		v_u_338:fire()
	end)
	v_u_338:wait()
	return v_u_337
end
function v7.CancelCrossDeviceLogin(p345) -- name: CancelCrossDeviceLogin
	-- upvalues: (copy) v_u_14, (copy) v_u_1, (copy) v_u_5
	local v346 = {
		["Url"] = nil,
		["Method"] = "POST",
		["Body"] = nil,
		["Headers"] = nil,
		["Url"] = string.format("%sauth-token-service/v1/login/cancel", v_u_14("apis")),
		["Body"] = v_u_1:JSONEncode({
			["code"] = p345
		}),
		["Headers"] = {
			["Content-Type"] = "application/json",
			["Accept"] = "application/json"
		}
	}
	local v_u_347 = nil
	local v_u_348 = v_u_5.Signal()
	v_u_1:RequestInternal(v346):Start(function(p349, p350)
		-- upvalues: (ref) v_u_347, (ref) v_u_1, (copy) v_u_348
		if p349 and (p350.StatusCode ~= 401 and (p350.StatusCode >= 200 and p350.StatusCode < 400)) then
			local v_u_351 = p350.Body
			local v352
			if v_u_351 == nil or #v_u_351 == 0 then
				v352 = nil
			else
				local function v353()
					-- upvalues: (ref) v_u_1, (copy) v_u_351
					return v_u_1:JSONDecode(v_u_351)
				end
				local v354
				v354, v352 = pcall(v353)
				if not v354 then
					v352 = nil
				end
			end
			v_u_347 = v352
		end
		v_u_348:fire()
	end)
	v_u_348:wait()
	return v_u_347
end
return v7