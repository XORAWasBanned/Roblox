-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Thunks.SearchMusic
local v1 = script:FindFirstAncestor("MomentsCreationFlow")
local v2 = v1.Parent
local v_u_3 = game:GetService("AssetService")
local v_u_4 = require(v2.Dash)
require(v2.MomentsCommon)
local v_u_5 = require(v1.Actions.CreationFlowMusicInfoRetrieved)
local v_u_6 = require(v1.Actions.MusicSearchRetrieved)
local v_u_7 = require(v1.Constants)
local function v_u_9(p8) -- name: filterCreator
	-- upvalues: (copy) v_u_4, (copy) v_u_7
	return not v_u_4.includes(v_u_7.SearchMusicCreatorFilter, p8.Creator.Id)
end
local function v_u_11(p10) -- name: filterRecordingCode
	return p10.RecordingCode ~= nil
end
local function v_u_15(p12) -- name: formatMusic
	local v13 = {}
	for _, v14 in ipairs(p12) do
		if v14.Id == nil then
			continue
		end
		v13[v14.Id] = {
			["Artist"] = v14.Artist,
			["AssetId"] = v14.Id,
			["AudioType"] = v14.AudioType,
			["Duration"] = v14.Duration,
			["RecordingCode"] = v14.RecordingCode,
			["Title"] = v14.Title
		}
	end
	return v13
end
return function(p_u_16, p_u_17) -- name: SearchMusic
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_9, (copy) v_u_11, (copy) v_u_5, (copy) v_u_15, (copy) v_u_6
	return function(p_u_18)
		-- upvalues: (copy) p_u_16, (copy) p_u_17, (ref) v_u_3, (ref) v_u_4, (ref) v_u_9, (ref) v_u_11, (ref) v_u_5, (ref) v_u_15, (ref) v_u_6
		local v_u_19 = Instance.new("AudioSearchParams")
		v_u_19.SearchKeyword = p_u_16
		v_u_19.AudioSubType = Enum.AudioSubType.Music
		v_u_19.MinDuration = p_u_17 or 30
		task.spawn(function()
			-- upvalues: (ref) v_u_3, (copy) v_u_19, (ref) v_u_4, (ref) v_u_9, (ref) v_u_11, (copy) p_u_18, (ref) v_u_5, (ref) v_u_15, (ref) v_u_6
			local function v20()
				-- upvalues: (ref) v_u_3, (ref) v_u_19
				return v_u_3:SearchAudio(v_u_19)
			end
			local v21, v22 = pcall(v20)
			if v21 then
				local v23 = v22:GetCurrentPage()
				local v24 = v_u_4.filter(v23, v_u_9)
				local v26 = v_u_3:GetAudioMetadataAsync((v_u_4.map(v24, function(p25)
					return p25.Id
				end)))
				local v27 = v_u_4.filter(v26, v_u_11)
				p_u_18:dispatch(v_u_5((v_u_15(v27))))
				p_u_18:dispatch(v_u_6(v_u_4.map(v27, function(p28)
					local v29 = p28.AssetId
					return tonumber(v29)
				end)))
			else
				warn("Failed to retrieve musics: " .. v22)
			end
		end)
	end
end