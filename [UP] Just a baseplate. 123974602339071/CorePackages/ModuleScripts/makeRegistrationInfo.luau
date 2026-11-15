-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Utils.makeRegistrationInfo
local v1 = script:FindFirstAncestor("MomentsCreationFlow").Parent
local v2 = require(v1.MomentsCommon)
local v_u_3 = v2.Enums.AttributeType
local v_u_4 = v2.Utils.getTagsForMoment
return function(p5, p6) -- name: makeRegistrationInfo
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	local v7 = p6.edits
	local v8 = {}
	local v9
	if v7 and v7.trim then
		local v10 = {
			["AssetId"] = 0,
			["Description"] = nil,
			["TrimStartTime"] = nil,
			["Description"] = v_u_3.PrimaryAsset,
			["TrimStartTime"] = v7.trim.startTime
		}
		table.insert(v8, v10)
		v9 = v7.trim.endTime - v7.trim.startTime
	else
		local v11 = {
			["AssetId"] = 0,
			["Description"] = nil,
			["TrimStartTime"] = 0,
			["Description"] = v_u_3.PrimaryAsset
		}
		table.insert(v8, v11)
		v9 = p6.assetTotalDuration
	end
	if v7 and v7.music then
		local v12 = {
			["AssetId"] = v7.music.assetId,
			["Description"] = v_u_3.Music,
			["TrimStartTime"] = v7.music.startTime
		}
		table.insert(v8, v12)
	end
	local v13 = {
		["attributes"] = v8
	}
	local v14
	if p5.CaptureType == Enum.CaptureType.Screenshot then
		v14 = Enum.RecommendationItemContentType.Static
	else
		v14 = Enum.RecommendationItemContentType.Dynamic
	end
	v13.contentType = v14
	v13.customTags = v_u_4(p6)
	v13.duration = v9
	return v13
end