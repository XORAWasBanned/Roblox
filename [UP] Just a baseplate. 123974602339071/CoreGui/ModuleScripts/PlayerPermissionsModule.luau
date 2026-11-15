-- Path: CoreGui.RobloxGui.Modules.PlayerPermissionsModule
local v1 = {}
local v_u_2 = game:GetService("Players")
local v3 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
v3:WaitForChild("Modules")
local v4 = game:GetService("CorePackages")
local v_u_5 = game:GetService("HttpRbxApiService")
local v_u_6 = game:GetService("HttpService")
local _ = UserSettings().GameSettings
local v_u_7 = require(v4.Workspace.Packages.CoreScriptsCommon).Url
local v_u_8 = require(v3.Modules.Common.Flags.FFlagInExperienceUserProfileSettingsEnabled)
local v9 = require(v4.Workspace.Packages.SharedFlags).FFlagBadgeVisibilitySettingEnabled
local v_u_10 = require(v3.Modules.Common.Flags.FFlagInExperienceRequestProfileSettings)
local v_u_11 = require(v4.Workspace.Packages.UserProfiles).Stores.VerifiedBadgeDisplayStore
local v_u_12 = require(v4.Workspace.Packages.SharedFlags).FFlagEnableVerifiedBadgeStore
local v_u_13 = {}
v_u_13.__index = v_u_13
function v_u_13.new(p14) -- name: new
	-- upvalues: (copy) v_u_13
	local v15 = v_u_13
	local v16 = setmetatable({}, v15)
	v16.player = p14
	v16.pendingGroupData = {}
	v16.pendingCanManage = {}
	v16.pendingProfileSettings = {}
	v16.groupData = nil
	v16.canManage = nil
	v16.profileSettings = nil
	return v16
end
function v_u_13.getGroupDataAsync(p17) -- name: getGroupDataAsync
	if p17.groupData then
		return p17.groupData
	end
	local v18 = coroutine.running()
	local v19 = p17.pendingGroupData
	table.insert(v19, v18)
	coroutine.yield()
	return p17.groupData
end
function v_u_13.getCanManageAsync(p20) -- name: getCanManageAsync
	if p20.canManage ~= nil then
		return p20.canManage
	end
	local v21 = coroutine.running()
	local v22 = p20.pendingCanManage
	table.insert(v22, v21)
	coroutine.yield()
	return p20.canManage
end
function v_u_13.getProfileSettingsAsync(p23) -- name: getProfileSettingsAsync
	if p23.profileSettings ~= nil then
		return p23.profileSettings
	end
	local v24 = coroutine.running()
	local v25 = p23.pendingProfileSettings
	table.insert(v25, v24)
	coroutine.yield()
	return p23.profileSettings
end
function v_u_13.setGroupData(p26, p27) -- name: setGroupData
	p26.groupData = p27
	local v28 = p26.pendingGroupData
	p26.pendingGroupData = {}
	for _, v29 in pairs(v28) do
		coroutine.resume(v29)
	end
end
function v_u_13.setCanManage(p30, p31) -- name: setCanManage
	p30.canManage = p31 and true or false
	local v32 = p30.pendingCanManage
	p30.pendingCanManage = {}
	for _, v33 in pairs(v32) do
		coroutine.resume(v33)
	end
end
function v_u_13.setProfileSettings(p34, p35) -- name: setProfileSettings
	p34.profileSettings = p35
	local v36 = p34.pendingProfileSettings
	p34.pendingProfileSettings = {}
	for _, v37 in pairs(v36) do
		coroutine.resume(v37)
	end
end
function v_u_13.destroy(p38) -- name: destroy
	-- upvalues: (copy) v_u_8
	for _, v39 in pairs(p38.pendingGroupData) do
		coroutine.resume(v39)
	end
	for _, v40 in pairs(p38.pendingCanManage) do
		coroutine.resume(v40)
	end
	if v_u_8 then
		for _, v41 in pairs(p38.pendingProfileSettings) do
			coroutine.resume(v41)
		end
	end
end
local v_u_42 = {}
spawn(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_42, (copy) v_u_13
	game:GetService("RobloxReplicatedStorage"):WaitForChild("NewPlayerGroupDetails", (1 / 0)).OnClientEvent:Connect(function(...)
		-- upvalues: (ref) v_u_2, (ref) v_u_42, (ref) v_u_13
		local v43 = { ... }
		if #v43 == 1 then
			local v44 = v43[1]
			for v45, v46 in pairs(v44) do
				local v47 = v_u_2:GetPlayerByUserId((tonumber(v45)))
				if not v47 then
					continue
				end
				local v48 = v_u_42[v47]
				if not v48 and v47.Parent ~= nil then
					v48 = v_u_13.new(v47)
					v_u_42[v47] = v48
				end
				if not v48 then
					continue
				end
				v48:setGroupData(v46)
			end
		else
			local v49 = v43[1]
			local v50 = v43[2]
			local v51 = v_u_2:GetPlayerByUserId((tonumber(v49)))
			if v51 then
				local v52 = v_u_42[v51]
				if not v52 and v51.Parent ~= nil then
					v52 = v_u_13.new(v51)
					v_u_42[v51] = v52
				end
				if v52 then
					v52:setGroupData(v50)
				end
			end
		end
	end)
end)
coroutine.wrap(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_42, (copy) v_u_13
	game:GetService("RobloxReplicatedStorage"):WaitForChild("NewPlayerCanManageDetails", (1 / 0)).OnClientEvent:Connect(function(p53, p54)
		-- upvalues: (ref) v_u_2, (ref) v_u_42, (ref) v_u_13
		local v55 = v_u_2:GetPlayerByUserId((tonumber(p53)))
		if v55 then
			local v56 = v_u_42[v55]
			if not v56 and v55.Parent ~= nil then
				v56 = v_u_13.new(v55)
				v_u_42[v55] = v56
			end
			if v56 then
				v56:setCanManage(p54)
			end
		end
	end)
end)()
if v_u_8 then
	coroutine.wrap(function()
		-- upvalues: (copy) v_u_2, (copy) v_u_42, (copy) v_u_13, (copy) v_u_12, (copy) v_u_11, (copy) v_u_10
		local v57 = game:GetService("RobloxReplicatedStorage")
		v57:WaitForChild("SendPlayerProfileSettings", (1 / 0)).OnClientEvent:Connect(function(p58, p59)
			-- upvalues: (ref) v_u_2, (ref) v_u_42, (ref) v_u_13, (ref) v_u_12, (ref) v_u_11
			local v60 = v_u_2:GetPlayerByUserId((tonumber(p58)))
			if v60 then
				local v61 = v_u_42[v60]
				if not v61 and v60.Parent ~= nil then
					v61 = v_u_13.new(v60)
					v_u_42[v60] = v61
				end
				if v61 then
					v61:setProfileSettings(p59)
				end
				if v_u_12 and p59.isInExperienceNameEnabled ~= nil then
					v_u_11.get().setBadgeVisibility(v60.UserId, not p59.isInExperienceNameEnabled)
				end
			end
		end)
		if v_u_10 then
			v57:WaitForChild("RequestPlayerProfileSettings", (1 / 0)):FireServer()
		end
	end)()
end
v_u_2.PlayerRemoving:Connect(function(p62)
	-- upvalues: (copy) v_u_42
	if v_u_42[p62] then
		local v63 = v_u_42[p62]
		v_u_42[p62] = nil
		v63:destroy()
	end
end)
local v_u_64 = {}
local v_u_65 = "SpanishLocalizationExpert"
local v_u_66 = "BrazilianLocalizationExpert"
local v_u_67 = "FrenchLocalizationExpert"
local v_u_68 = "GermanLocalizationExpert"
__set_list(v_u_64, 1, {function(p69)
	-- upvalues: (copy) v_u_42, (copy) v_u_13, (copy) v_u_65
	local v70 = v_u_42[p69]
	if not v70 and p69.Parent ~= nil then
		v70 = v_u_13.new(p69)
		v_u_42[p69] = v70
	end
	if v70 then
		local v71 = v70:getGroupDataAsync()
		if v71 and v71[v_u_65] then
			return true
		end
	end
	return false
end, function(p72)
	-- upvalues: (copy) v_u_42, (copy) v_u_13, (copy) v_u_66
	local v73 = v_u_42[p72]
	if not v73 and p72.Parent ~= nil then
		v73 = v_u_13.new(p72)
		v_u_42[p72] = v73
	end
	if v73 then
		local v74 = v73:getGroupDataAsync()
		if v74 and v74[v_u_66] then
			return true
		end
	end
	return false
end, function(p75)
	-- upvalues: (copy) v_u_42, (copy) v_u_13, (copy) v_u_67
	local v76 = v_u_42[p75]
	if not v76 and p75.Parent ~= nil then
		v76 = v_u_13.new(p75)
		v_u_42[p75] = v76
	end
	if v76 then
		local v77 = v76:getGroupDataAsync()
		if v77 and v77[v_u_67] then
			return true
		end
	end
	return false
end, function(p78)
	-- upvalues: (copy) v_u_42, (copy) v_u_13, (copy) v_u_68
	local v79 = v_u_42[p78]
	if not v79 and p78.Parent ~= nil then
		v79 = v_u_13.new(p78)
		v_u_42[p78] = v79
	end
	if v79 then
		local v80 = v79:getGroupDataAsync()
		if v80 and v80[v_u_68] then
			return true
		end
	end
	return false
end})
local function v83(p81) -- name: CanPlayerManagePlace
	-- upvalues: (copy) v_u_42, (copy) v_u_13
	local v82 = v_u_42[p81]
	if not v82 and p81.Parent ~= nil then
		v82 = v_u_13.new(p81)
		v_u_42[p81] = v82
	end
	if v82 then
		return v82:getCanManageAsync() or false
	else
		return false
	end
end
local function v87(p84) -- name: IsPlayerInExperienceNameEnabled
	-- upvalues: (copy) v_u_42, (copy) v_u_13
	local v85 = v_u_42[p84]
	if not v85 and p84.Parent ~= nil then
		v85 = v_u_13.new(p84)
		v_u_42[p84] = v85
	end
	local v86 = v85 and v85:getProfileSettingsAsync()
	if v86 then
		return v86.isInExperienceNameEnabled
	else
		return false
	end
end
local function v92(_, p_u_88) -- name: SetPlayerInExperienceNameEnabled
	-- upvalues: (copy) v_u_7, (copy) v_u_6, (copy) v_u_5
	local function v91()
		-- upvalues: (ref) v_u_7, (ref) v_u_6, (copy) p_u_88, (ref) v_u_5
		local v89 = game:GetService("RobloxReplicatedStorage"):WaitForChild("UpdatePlayerProfileSettings", (1 / 0))
		local v90 = {
			["userProfileSettings"] = {
				["isInExperienceNameEnabled"] = p_u_88
			}
		}
		v_u_5:PostAsyncFullUrl(v_u_7.APIS_URL .. "user-profile-api/v1/user/profiles/settings", v_u_6:JSONEncode(v90), Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson, Enum.HttpRequestType.Players)
		v89:FireServer({
			["isInExperienceNameEnabled"] = p_u_88
		})
	end
	pcall(v91)
end
local v_u_93 = "Admin"
function v1.IsPlayerAdminAsync(p94)
	-- upvalues: (copy) v_u_42, (copy) v_u_13, (copy) v_u_93
	local v95 = v_u_42[p94]
	if not v95 and p94.Parent ~= nil then
		v95 = v_u_13.new(p94)
		v_u_42[p94] = v95
	end
	if v95 then
		local v96 = v95:getGroupDataAsync()
		if v96 and v96[v_u_93] then
			return true
		end
	end
	return false
end
local v_u_97 = "Intern"
function v1.IsPlayerInternAsync(p98)
	-- upvalues: (copy) v_u_42, (copy) v_u_13, (copy) v_u_97
	local v99 = v_u_42[p98]
	if not v99 and p98.Parent ~= nil then
		v99 = v_u_13.new(p98)
		v_u_42[p98] = v99
	end
	if v99 then
		local v100 = v99:getGroupDataAsync()
		if v100 and v100[v_u_97] then
			return true
		end
	end
	return false
end
local v_u_101 = "Star"
function v1.IsPlayerStarAsync(p102)
	-- upvalues: (copy) v_u_42, (copy) v_u_13, (copy) v_u_101
	local v103 = v_u_42[p102]
	if not v103 and p102.Parent ~= nil then
		v103 = v_u_13.new(p102)
		v_u_42[p102] = v103
	end
	if v103 then
		local v104 = v103:getGroupDataAsync()
		if v104 and v104[v_u_101] then
			return true
		end
	end
	return false
end
function v1.IsPlayerLocalizationExpertAsync(p105)
	-- upvalues: (copy) v_u_64
	for v106 = 1, #v_u_64 do
		if not v_u_64[v106](p105) then
			continue
		end
		return true
	end
	return false
end
local v107
if game.CreatorType == Enum.CreatorType.Group then
	local v_u_108 = "PlaceCreator"
	v107 = function(p109)
		-- upvalues: (copy) v_u_42, (copy) v_u_13, (copy) v_u_108
		local v110 = v_u_42[p109]
		if not v110 and p109.Parent ~= nil then
			v110 = v_u_13.new(p109)
			v_u_42[p109] = v110
		end
		if v110 then
			local v111 = v110:getGroupDataAsync()
			if v111 and v111[v_u_108] then
				return true
			end
		end
		return false
	end
else
	v107 = function(p112)
		return p112.UserId == game.CreatorId
	end
end
v1.IsPlayerPlaceOwnerAsync = v107
v1.CanPlayerManagePlaceAsync = v83
if v_u_8 then
	v1.IsPlayerInExperienceNameEnabledAsync = v87
end
if v9 then
	v1.SetPlayerInExperienceNameEnabled = v92
end
return v1