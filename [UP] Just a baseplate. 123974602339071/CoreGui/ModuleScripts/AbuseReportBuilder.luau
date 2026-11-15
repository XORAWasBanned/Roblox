-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.ReportAnything.Utility.AbuseReportBuilder
local v1 = script:FindFirstAncestor("AbuseReportMenu")
local v2 = game:GetService("CorePackages")
local v3 = require(v2.Workspace.Packages.TnSAvatarIdentification)
local v4 = require(v2.Workspace.Packages.TnSAdIdentification)
local v_u_5 = game:GetService("HttpService")
local v_u_6 = v3.AvatarIdentification.getAvatarsForPoint
local v_u_7 = v3.AvatarIdentification.getAvatarsForRegion
local v_u_8 = v4.AdIdentification.getAdsForPoint
local v_u_9 = require(v2.Workspace.Packages.SharedFlags).GetFFlagReportAnythingEnableAdReport
local v_u_10 = require(v2.Workspace.Packages.SharedFlags).GetFFlagGetHumanoidDescription
local v_u_11 = require(v2.Workspace.Packages.SharedFlags).GetFFlagRAEnableCircleRegion
local v_u_12 = require(v2.Workspace.Packages.SharedFlags).GetFFlagGetHumanoidDescriptionUpdatesV2E
local v_u_13 = require(v1.ReportAnything.Utility.GetHumanoidDescription).getHumanoidDescription
require(v1.Components.Types)
require(v1.ReportAnything.Utility.ReportAnythingAnalytics)
local v_u_14 = {
	["Variant"] = {
		["CS"] = "ra/cs",
		["Sampling"] = "ra/sampling",
		["E1"] = "ra/e1",
		["E2"] = "ra/e2",
		["E3"] = "ra/e3",
		["NM"] = "ra/nm",
		["Unknown"] = "ra/unknown"
	}
}
local function v_u_18(p15)
	local v16 = {}
	for _, v17 in ipairs(p15) do
		v16[#v16 + 1] = { v17.X, v17.Y }
	end
	return v16
end
local function v_u_24(p19)
	local v20 = {}
	for _, v21 in pairs(p19) do
		local v22 = #v20 + 1
		local v23 = {
			["assetId"] = v21.assetId,
			["distance"] = v21.distance,
			["boundingBox"] = {
				["minX"] = v21.boundingBox.min.X,
				["minY"] = v21.boundingBox.min.Y,
				["maxX"] = v21.boundingBox.max.X,
				["maxY"] = v21.boundingBox.max.Y
			},
			["adUnitName"] = v21.adUnitName,
			["encryptedAdTrackingData"] = v21.encryptedAdTrackingData,
			["encryptionMetadata"] = v21.encryptionMetadata
		}
		v20[v22] = v23
	end
	return v20
end
local function v_u_29(p25)
	-- upvalues: (copy) v_u_18
	local v26 = {}
	for v27, v28 in pairs(p25) do
		v26[#v26 + 1] = {
			["userId"] = tostring(v27),
			["distance"] = v28.distance,
			["boundingBox"] = {
				["minX"] = v28.boundingBox.min.X,
				["minY"] = v28.boundingBox.min.Y,
				["maxX"] = v28.boundingBox.max.X,
				["maxY"] = v28.boundingBox.max.Y
			},
			["hitRate"] = v28.hitRate,
			["convexHull"] = v_u_18(v28.convexHull)
		}
		if v28.pointProcessingStats == nil then
			continue
		end
		v26[#v26].pointProcessingStats = {
			v28.pointProcessingStats.wasSkipped and 1 or 0,
			v28.pointProcessingStats.total,
			v28.pointProcessingStats.offScreenDiscardCount,
			v28.pointProcessingStats.tooCloseDiscardCount
		}
	end
	return v26
end
local function v_u_46(p30)
	-- upvalues: (copy) v_u_11, (copy) v_u_7, (copy) v_u_6, (copy) v_u_9, (copy) v_u_8
	local v31 = {}
	local v32 = {}
	local v33 = {}
	local v34 = {}
	for _, v35 in ipairs(p30.annotationPoints) do
		local v36 = (1 / 0)
		local v37 = nil
		local v38
		if v_u_11() then
			v38 = v_u_7(p30.identificationResults.identifiedAvatars, v35, p30.annotationCircleRadius, p30.annotationAreaWidth, p30.annotationAreaHeight)
		else
			v38 = v_u_6(p30.identificationResults.identifiedAvatars, v35)
		end
		for v39, _ in pairs(v38) do
			local v40 = p30.identificationResults.identifiedAvatars[v39].distance
			if v40 >= v36 then
				continue
			end
			v37 = v39
			v36 = v40
		end
		local v41 = nil
		if v_u_9() then
			local v42 = v_u_8(p30.identificationResults.identifiedAds, v35)
			local v43 = (1 / 0)
			for v44, _ in pairs(v42) do
				local v45 = p30.identificationResults.identifiedAds[v44].distance
				if v45 >= v43 then
					continue
				end
				v41 = v44
				v43 = v45
			end
		end
		if v37 == nil or v34[v37] then
			if not v_u_9() or (v41 == nil or v32[v41]) then
				break
			end
			v32[v41] = true
			v33[#v33 + 1] = p30.identificationResults.identifiedAds[v41]
		else
			v34[v37] = true
			v31[#v31 + 1] = p30.identificationResults.identifiedAvatars[v37].player
		end
	end
	return v31, v33
end
local function v_u_61(p47, _, p48)
	-- upvalues: (copy) v_u_9, (copy) v_u_5, (copy) v_u_29, (copy) v_u_24, (copy) v_u_18
	local v49 = false
	for _, _ in pairs(p47.identificationResults.identifiedAvatars) do
		v49 = true
	end
	local v50 = false
	if v_u_9() then
		for _, _ in pairs(p47.identificationResults.identifiedAds) do
			v50 = true
		end
	end
	if v49 then
		p48.tags.IDENTIFIED_AVATARS = {
			["valueList"] = {
				{
					["data"] = v_u_5:JSONEncode((v_u_29(p47.identificationResults.identifiedAvatars)))
				}
			}
		}
	end
	if p47.identificationResults.avatarIDStats then
		p48.tags.AVATAR_ID_STATS = {
			["valueList"] = {
				{
					["data"] = v_u_5:JSONEncode(p47.identificationResults.avatarIDStats)
				}
			}
		}
	end
	if v50 and v_u_9() then
		p48.tags.IDENTIFIED_ADS = {
			["valueList"] = {
				{
					["data"] = v_u_5:JSONEncode((v_u_24(p47.identificationResults.identifiedAds)))
				}
			}
		}
	end
	if p47.identificationResults.adIDStats and v_u_9() then
		p48.tags.AD_ID_STATS = {
			["valueList"] = {
				{
					["data"] = v_u_5:JSONEncode(p47.identificationResults.adIDStats)
				}
			}
		}
	end
	if #p47.screenshotId > 0 then
		p48.tags.SCREENSHOT_ID = {
			["valueList"] = {
				{
					["data"] = p47.screenshotId
				}
			}
		}
	end
	if #p47.annotationPoints > 0 then
		p48.tags.RA_ANNOTATION_POINTS = {
			["valueList"] = {
				{
					["data"] = v_u_5:JSONEncode((v_u_18(p47.annotationPoints)))
				}
			}
		}
	end
	local v51 = p48.tags
	local v52 = {}
	local v53 = {}
	local v54 = {}
	local v55 = p47.annotationOptionSeen
	v54.data = tostring(v55)
	__set_list(v53, 1, {v54})
	v52.valueList = v53
	v51.RA_ANNOTATION_OPTION_SEEN = v52
	local v56 = p48.tags
	local v57 = {}
	local v58 = {}
	local v59 = {}
	local v60 = p47.annotationPageSeen
	v59.data = tostring(v60)
	__set_list(v58, 1, {v59})
	v57.valueList = v58
	v56.RA_ANNOTATION_PAGE_SEEN = v57
end
return {
	["buildExperienceReportRequest"] = function(p62, p63, p64)
		-- upvalues: (copy) v_u_14, (copy) v_u_46, (copy) v_u_61, (copy) v_u_9, (copy) v_u_5, (copy) v_u_24
		local v65 = {}
		local v66 = {
			["ENTRY_POINT"] = {
				["valueList"] = {
					{
						["data"] = "in-experience"
					}
				}
			}
		}
		local v67 = {}
		local v68 = {}
		local v69 = {}
		local v70 = p62.localUserId
		v69.data = tostring(v70)
		__set_list(v68, 1, {v69})
		v67.valueList = v68
		v66.SUBMITTER_USER_ID = v67
		v66.REPORTED_ABUSE_CATEGORY = {
			["valueList"] = {
				{
					["data"] = p62.abuseReason
				}
			}
		}
		local v71 = {}
		local v72 = {}
		local v73 = {}
		local v74 = p62.placeId
		v73.data = tostring(v74)
		__set_list(v72, 1, {v73})
		v71.valueList = v72
		v66.PLACE_ID = v71
		v66.REPORTER_COMMENT = {
			["valueList"] = {
				{
					["data"] = p62.abuseComment
				}
			}
		}
		v66.REPORTED_ABUSE_VECTOR = {
			["valueList"] = {
				{
					["data"] = "place"
				}
			}
		}
		v66.IN_EXP_MENU_ENTRY_POINT = {
			["valueList"] = {
				{
					["data"] = p62.menuEntryPoint
				}
			}
		}
		local v75 = {
			["valueList"] = {
				{
					["data"] = p62.variant or v_u_14.Variant.CS
				}
			}
		}
		v66.VARIANT = v75
		v65.tags = v66
		local _, v76 = v_u_46(p63)
		v_u_61(p63, p64, v65)
		if #v76 > 0 and v_u_9() then
			v65.tags.REPORT_TARGET_ADS = {
				["valueList"] = {
					{
						["data"] = v_u_5:JSONEncode((v_u_24(v76)))
					}
				}
			}
		end
		return v_u_5:JSONEncode(v65)
	end,
	["buildOtherReportRequest"] = function(p77, p78, p79)
		-- upvalues: (copy) v_u_14, (copy) v_u_46, (copy) v_u_61, (copy) v_u_10, (copy) v_u_12, (copy) v_u_13, (copy) v_u_5
		local v80 = {}
		local v81 = {
			["ENTRY_POINT"] = {
				["valueList"] = {
					{
						["data"] = "in-experience"
					}
				}
			}
		}
		local v82 = {}
		local v83 = {}
		local v84 = {}
		local v85 = p77.localUserId
		v84.data = tostring(v85)
		__set_list(v83, 1, {v84})
		v82.valueList = v83
		v81.SUBMITTER_USER_ID = v82
		v81.REPORTED_ABUSE_CATEGORY = {
			["valueList"] = {
				{
					["data"] = p77.abuseReason
				}
			}
		}
		v81.REPORTER_COMMENT = {
			["valueList"] = {
				{
					["data"] = p77.abuseComment
				}
			}
		}
		v81.REPORTED_ABUSE_VECTOR = {
			["valueList"] = {
				{
					["data"] = "avatar"
				}
			}
		}
		v81.IN_EXP_MENU_ENTRY_POINT = {
			["valueList"] = {
				{
					["data"] = p77.menuEntryPoint
				}
			}
		}
		local v86 = {
			["valueList"] = {
				{
					["data"] = p77.variant or v_u_14.Variant.Unknown
				}
			}
		}
		v81.VARIANT = v86
		v80.tags = v81
		local v87, _ = v_u_46(p78)
		v_u_61(p78, p79, v80)
		if #v87 > 0 then
			local v88 = v87[1].UserId
			local v89 = tostring(v88)
			local v90 = {}
			for _, v91 in ipairs(v87) do
				local v92 = #v90 + 1
				local v93 = v91.UserId
				v90[v92] = tostring(v93)
			end
			if v_u_10() then
				local v94 = v87[1].UserId
				local v95, v96
				if v_u_12() then
					local v97 = p78.identificationResults.identifiedAvatars[v94]
					if v97 and (v97.humanoidDescription and v97.humanoidDescriptionStatus == "OK") then
						v95 = v97.humanoidDescription
						v96 = v97.humanoidDescriptionStatus
					else
						v95, v96 = v_u_13(v94)
					end
				else
					v95, v96 = v_u_13(v94)
				end
				v80.tags.REPORT_TARGET_HUMANOID_DESCRIPTION = {
					["valueList"] = {
						{
							["data"] = v_u_5:JSONEncode(v95)
						}
					}
				}
				v80.tags.REPORT_TARGET_HUMANOID_DESCRIPTION_STATUS = {
					["valueList"] = {
						{
							["data"] = v96
						}
					}
				}
				local v98 = {}
				for _, v99 in ipairs(v87) do
					local v100 = v99.UserId
					local v101, v102
					if v_u_12() then
						local v103 = p78.identificationResults.identifiedAvatars[v100]
						if v103 and (v103.humanoidDescription and v103.humanoidDescriptionStatus == "OK") then
							v101 = v103.humanoidDescription
							v102 = v103.humanoidDescriptionStatus
						else
							v101, v102 = v_u_13(v100)
						end
					else
						v101, v102 = v_u_13(v100)
					end
					v98[#v98 + 1] = {
						["humanoidDescription"] = v101,
						["outputMessage"] = v102
					}
				end
				v80.tags.RA_ALL_ANNOTATED_HUMANOID_DESCRIPTIONS = {
					["valueList"] = {
						{
							["data"] = v_u_5:JSONEncode(v98)
						}
					}
				}
			end
			v80.tags.REPORT_TARGET_USER_ID = {
				["valueList"] = {
					{
						["data"] = tostring(v89)
					}
				}
			}
			v80.tags.RA_ALL_ANNOTATED_USER_IDS = {
				["valueList"] = {
					{
						["data"] = v_u_5:JSONEncode(v90)
					}
				}
			}
		elseif p77.formSelectedAbuserUserId then
			if v_u_10() then
				local v104 = p77.formSelectedAbuserUserId
				local v105, v106
				if v_u_12() then
					local v107 = p78.identificationResults.identifiedAvatars[v104]
					if v107 and (v107.humanoidDescription and v107.humanoidDescriptionStatus == "OK") then
						v105 = v107.humanoidDescription
						v106 = v107.humanoidDescriptionStatus
					else
						v105, v106 = v_u_13(v104)
					end
				else
					v105, v106 = v_u_13(v104)
				end
				v80.tags.REPORT_TARGET_HUMANOID_DESCRIPTION = {
					["valueList"] = {
						{
							["data"] = v_u_5:JSONEncode(v105)
						}
					}
				}
				v80.tags.REPORT_TARGET_HUMANOID_DESCRIPTION_STATUS = {
					["valueList"] = {
						{
							["data"] = v106
						}
					}
				}
			end
			local v108 = v80.tags
			local v109 = {}
			local v110 = {}
			local v111 = {}
			local v112 = p77.formSelectedAbuserUserId
			v111.data = tostring(v112)
			__set_list(v110, 1, {v111})
			v109.valueList = v110
			v108.REPORT_TARGET_USER_ID = v109
		end
		if game:GetEngineFeature("WHAM2165") then
			return v80
		else
			return v_u_5:JSONEncode(v80)
		end
	end,
	["interpretAnnotations"] = v_u_46,
	["Constants"] = v_u_14
}