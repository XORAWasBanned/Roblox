-- Path: CorePackages.Packages._Index.MomentsCommon.MomentsCommon.Utils.getTagsForMoment
local v1 = script:FindFirstAncestor("MomentsCommon")
require(v1.Types)
local v_u_2 = require(v1.Constants)
return function(p3) -- name: getTagsForMoment
	-- upvalues: (copy) v_u_2
	local v4 = {}
	if p3.captureType == Enum.CaptureType.Screenshot then
		table.insert(v4, "screenshot")
	elseif p3.captureType == Enum.CaptureType.Video then
		table.insert(v4, "video")
	end
	if p3.universeId then
		local v5 = v_u_2.TagPrefix.Universe
		local v6 = p3.universeId
		local v7 = v5 .. tostring(v6)
		table.insert(v4, v7)
	end
	if p3.edits then
		if p3.edits.trim then
			table.insert(v4, "trim")
		end
		if p3.edits.music then
			table.insert(v4, "music")
			if p3.edits.music.assetId then
				local v8 = v_u_2.TagPrefix.Music
				local v9 = p3.edits.music.assetId
				local v10 = v8 .. tostring(v9)
				table.insert(v4, v10)
			end
		end
		if p3.edits.textOverlays then
			table.insert(v4, "text_overlay")
		end
	end
	return v4
end