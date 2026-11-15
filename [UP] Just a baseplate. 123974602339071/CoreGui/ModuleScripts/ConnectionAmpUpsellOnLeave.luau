-- Path: CoreGui.RobloxGui.Modules.ConnectionAmpUpsellOnLeave
local v_u_1 = game:GetService("CoreGui")
local v_u_2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("HttpRbxApiService")
local v_u_4 = game:GetService("HttpService")
local v_u_5 = game:GetService("TelemetryService")
local v6 = require(v_u_2.Workspace.Packages.SharedFlags)
local v_u_7 = v6.FStringLuaAppPlayButtonAgeCheckAmpFeatureName
local v_u_8 = v6.FStringLuaAppPlayButtonAgeCheckAmpNameSpace
local v_u_9 = v6.FFlagConnectionUpsellAnalytics
local v_u_10 = v6.FFlagPioneerLeaveOnInExpFaeDownAge
local v_u_11 = require(v_u_2.Workspace.Packages.CoreScriptsCommon).Url
local v_u_12 = require(v_u_2.Workspace.Packages.PioneerUtils.maybeLeavePioneerOnFaeDownAge)
local v_u_13 = nil
local v_u_14 = nil
local function v15()
	-- upvalues: (ref) v_u_13, (ref) v_u_14
	v_u_13 = Enum.ConnectionError.PlacelaunchAgeVerificationRequired
	v_u_14 = Enum.ConnectionError.PlacelaunchParentalApprovalRequired
end
pcall(v15)
local function v_u_19(p16, p17) -- name: logTelemetry
	-- upvalues: (copy) v_u_5
	local v18 = {
		["customFields"] = {
			["selectedItem"] = p17
		}
	}
	v_u_5:LogCounter(p16, v18, 1)
end
local function v_u_31(p20) -- name: fetchUniverseIdFromPlaceIdYielding
	-- upvalues: (copy) v_u_11, (copy) v_u_3, (copy) v_u_4
	local v21 = string.format("%suniverses/v1/places/%d/universe", v_u_11.APIS_URL, p20)
	local v22 = v_u_3.GetAsyncFullUrl
	local v23 = v_u_3
	local v24, v25 = pcall(v22, v23, v21)
	if v24 and type(v25) == "string" then
		local v26 = v_u_4.JSONDecode
		local v27 = v_u_4
		local v28, v29 = pcall(v26, v27, v25)
		if v28 and type(v29) == "table" then
			local v30 = v29.universeId
			if type(v30) == "number" and v30 > 0 then
				return v30
			else
				return nil
			end
		else
			return nil
		end
	else
		return nil
	end
end
local v_u_32 = v_u_9 and {
	["eventName"] = "unlockPlayIntent",
	["backends"] = nil,
	["throttlingPercentage"] = nil,
	["lastUpdated"] = nil,
	["description"] = "Fired when a user clicks Continue on an AMP age check / parental approval upsell from a game-join flow.",
	["backends"] = { "EventIngest" },
	["throttlingPercentage"] = game:DefineFastInt("ConnectionAmpUnlockPlayIntentThrottleHundredthsPercent", 10000),
	["lastUpdated"] = { 2026, 5, 11 }
} or nil
local v_u_33 = v_u_9 and {
	["eventName"] = "gameJoinUpsellImpression",
	["backends"] = nil,
	["throttlingPercentage"] = nil,
	["lastUpdated"] = nil,
	["description"] = "Fired when an AMP age check / parental approval upsell is shown during a game-join flow.",
	["backends"] = { "EventIngest" },
	["throttlingPercentage"] = game:DefineFastInt("ConnectionAmpGameJoinUpsellImpressionThrottleHundredthsPercent", 10000),
	["lastUpdated"] = { 2026, 5, 11 }
} or nil
local v_u_34 = v_u_9 and { "addSessionInfo", "addSessionId", "addOSInfo" } or nil
local v_u_35 = v_u_9 and {
	["upsellName"] = "AgeCheckRequired",
	["playabilityStatus"] = "ContextualPlayabilityAgeCheckRequired",
	["missingPlaceIdItem"] = "AmpAgeCheckMissingPlaceId",
	["universeIdLookupFailedItem"] = "AgeCheckImpressionUniverseIdLookupFailed"
} or nil
local v_u_36 = v_u_9 and {
	["upsellName"] = "ParentApprovalRequired",
	["playabilityStatus"] = "ContextualPlayabilityRequireParentApproval",
	["missingPlaceIdItem"] = "AmpParentApprovalMissingPlaceId",
	["universeIdLookupFailedItem"] = "ParentApprovalImpressionUniverseIdLookupFailed"
} or nil
local v_u_37 = v_u_9 and {} or nil
local v_u_44 = v_u_9 and function(p38, p39, p40, p41)
	-- upvalues: (copy) v_u_5, (copy) v_u_34
	local v42 = v_u_5
	local v43 = {
		["eventContext"] = p39,
		["standardizedFields"] = v_u_34,
		["customFields"] = {
			["universeId"] = p41,
			["upsellName"] = p38.upsellName,
			["playabilityStatus"] = p38.playabilityStatus
		}
	}
	v42:LogEvent(p40, v43)
end or nil
local v_u_49 = v_u_9 and function(p45, p46, p47)
	-- upvalues: (copy) v_u_37, (copy) v_u_44, (copy) v_u_32
	local v48 = (p47 == "" or not p47) and (v_u_37[p46] or "") or p47
	if p47 and p47 ~= "" then
		v_u_37[p46] = p47
	end
	v_u_44(p45, "GameJoin", v_u_32, v48)
end or nil
local v_u_56 = v_u_9 and function(p_u_50, p_u_51, p_u_52)
	-- upvalues: (copy) v_u_19, (copy) v_u_37, (copy) v_u_44, (copy) v_u_33, (copy) v_u_31
	if p_u_52 and p_u_52 ~= 0 then
		local v53 = v_u_37[p_u_52]
		if v53 then
			v_u_44(p_u_51, p_u_51.upsellName, v_u_33, v53)
		else
			task.spawn(function()
				-- upvalues: (ref) v_u_31, (copy) p_u_52, (ref) v_u_37, (ref) v_u_19, (copy) p_u_50, (copy) p_u_51, (ref) v_u_44, (ref) v_u_33
				local v54 = v_u_31(p_u_52)
				local v55 = not v54 and "" or tostring(v54)
				if v54 then
					v_u_37[p_u_52] = v55
				else
					v_u_19(p_u_50, p_u_51.universeIdLookupFailedItem)
				end
				v_u_44(p_u_51, p_u_51.upsellName, v_u_33, v55)
			end)
		end
	else
		v_u_19(p_u_50, p_u_51.missingPlaceIdItem)
		return
	end
end or nil
local function v_u_80(p_u_57, p_u_58, p_u_59, p_u_60, p_u_61, p_u_62, p_u_63, p_u_64, p65) -- name: openWizardThenReconnect
	-- upvalues: (copy) v_u_19, (copy) v_u_2, (copy) v_u_1, (copy) v_u_10, (copy) v_u_12
	v_u_19(p_u_57, p65)
	local v66 = require
	local v67 = v_u_2.Workspace.Packages.AmpUpsell
	local v68, v_u_69 = pcall(v66, v67)
	if not v68 then
		v_u_69 = nil
	end
	if v_u_69 then
		local v70 = require
		local v71 = v_u_1.RobloxGui.Modules.ApolloClient
		local v72, v_u_73 = pcall(v70, v71)
		if not v72 then
			v_u_73 = nil
		end
		if v_u_73 then
			local function v79()
				-- upvalues: (copy) v_u_69, (copy) p_u_60, (ref) v_u_19, (copy) p_u_57, (ref) v_u_10, (copy) p_u_58, (ref) v_u_12, (copy) p_u_63, (copy) p_u_62, (copy) p_u_64, (copy) p_u_61, (copy) v_u_73, (copy) p_u_59
				v_u_69.InExpAmpWizardController.OpenAmpWizardContainerInExp(p_u_60, function(p74, p75)
					-- upvalues: (ref) v_u_69, (ref) v_u_19, (ref) p_u_57, (ref) v_u_10, (ref) p_u_58, (ref) v_u_12
					local v_u_76 = p74 == v_u_69.AmpEnums.AccessResponseEnum.Granted
					if v_u_76 then
						v_u_19(p_u_57, "AmpWizardGrantedReconnect")
						if not v_u_10 then
							p_u_58()
						end
					else
						v_u_19(p_u_57, "AmpWizardNotGranted")
					end
					if v_u_10 then
						local v77 = v_u_69.AmpEnums
						local v78
						if p75 == nil then
							v78 = false
						else
							v78 = p75[v77.ActionTypeEnum.AgeEstimation] == v77.ActionStatusEnum.Success
						end
						v_u_12(v78, function()
							-- upvalues: (copy) v_u_76, (ref) p_u_58
							if v_u_76 then
								p_u_58()
							end
						end)
					end
				end, p_u_63, p_u_62, p_u_64, p_u_61, v_u_73, p_u_59, true)
			end
			if not pcall(v79) then
				v_u_19(p_u_57, "AmpWizardOpenError")
			end
		else
			v_u_19(p_u_57, "AmpWizardApolloLoadFailed")
		end
	else
		v_u_19(p_u_57, "AmpWizardLoadFailed")
		return
	end
end
return {
	["PrimaryButtonText"] = "Continue",
	["PrimaryButtonLocalizationKey"] = "InGame.ConnectionError.Action.Continue",
	["AgeVerificationRequiredEnum"] = nil,
	["ParentalApprovalRequiredEnum"] = nil,
	["createAgeCheckCallback"] = nil,
	["createParentalApprovalCallback"] = nil,
	["fireImpressionAgeCheck"] = nil,
	["fireImpressionParentalApproval"] = nil,
	["AgeVerificationRequiredEnum"] = v_u_13,
	["ParentalApprovalRequiredEnum"] = v_u_14,
	["createAgeCheckCallback"] = function(p_u_81, p_u_82, p83) -- name: createAgeCheckCallback
		-- upvalues: (copy) v_u_9, (copy) v_u_49, (copy) v_u_35, (copy) v_u_80, (copy) v_u_7, (copy) v_u_8
		local v_u_84 = p83 + 1
		return function()
			-- upvalues: (ref) v_u_9, (ref) v_u_49, (ref) v_u_35, (ref) v_u_80, (copy) p_u_81, (copy) p_u_82, (copy) v_u_84, (ref) v_u_7, (ref) v_u_8
			if v_u_9 then
				v_u_49(v_u_35, game.PlaceId, "")
			end
			v_u_80(p_u_81, p_u_82, v_u_84, v_u_7, v_u_8, "gameJoinAgeCheckRequired", nil, nil, "AmpAgeCheckOpened")
		end
	end,
	["createParentalApprovalCallback"] = function(p_u_85, p_u_86, p87) -- name: createParentalApprovalCallback
		-- upvalues: (copy) v_u_19, (copy) v_u_31, (copy) v_u_9, (copy) v_u_49, (copy) v_u_36, (copy) v_u_80
		local v_u_88 = p87 + 1
		return function()
			-- upvalues: (ref) v_u_19, (copy) p_u_85, (ref) v_u_31, (ref) v_u_9, (ref) v_u_49, (ref) v_u_36, (ref) v_u_80, (copy) p_u_86, (copy) v_u_88
			local v_u_89 = game.PlaceId
			if v_u_89 and v_u_89 ~= 0 then
				task.spawn(function()
					-- upvalues: (ref) v_u_31, (copy) v_u_89, (ref) v_u_9, (ref) v_u_49, (ref) v_u_36, (ref) v_u_19, (ref) p_u_85, (ref) v_u_80, (ref) p_u_86, (ref) v_u_88
					local v90 = v_u_31(v_u_89)
					if v_u_9 then
						v_u_49(v_u_36, v_u_89, not v90 and "" or tostring(v90))
					end
					if v90 then
						v_u_80(p_u_85, p_u_86, v_u_88, "CanApproveExperience", nil, "gameJoinContentMaturityLock", {
							["universeId"] = nil,
							["experienceManagementAction"] = "Approve",
							["universeId"] = tostring(v90)
						}, nil, "AmpParentApprovalOpened")
					else
						v_u_19(p_u_85, "AmpParentApprovalUniverseIdLookupFailed")
					end
				end)
			else
				v_u_19(p_u_85, "AmpParentApprovalMissingPlaceId")
			end
		end
	end,
	["fireImpressionAgeCheck"] = v_u_9 and function(p91, p92)
		-- upvalues: (copy) v_u_56, (copy) v_u_35
		v_u_56(p91, v_u_35, p92)
	end or nil,
	["fireImpressionParentalApproval"] = v_u_9 and function(p93, p94)
		-- upvalues: (copy) v_u_56, (copy) v_u_36
		v_u_56(p93, v_u_36, p94)
	end or nil
}