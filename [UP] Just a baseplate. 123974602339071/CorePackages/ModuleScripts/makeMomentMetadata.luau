-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Utils.makeMomentMetadata
local v1 = script:FindFirstAncestor("MomentsCreationFlow").Parent
local v_u_2 = require(v1.MomentsCommon)
return function(p3, p4, p5) -- name: makeMomentMetadata
	-- upvalues: (copy) v_u_2
	local v6 = {}
	local v7
	if p3.CaptureType == Enum.CaptureType.Screenshot then
		v7 = v_u_2.Constants.ScreenshotMusicDuration
	else
		v7 = p3.TimeLength
	end
	v6.assetTotalDuration = v7
	v6.captureType = p3.CaptureType
	v6.description = p4
	v6.universeId = p3.SourceUniverseId
	v6.placeId = p3.SourcePlaceId
	v6.edits = p5
	return v6
end