-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Services.Analytics
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("RbxAnalyticsService")
local v_u_4 = require(v1.Packages.Cryo)
local v_u_5 = game:GetService("UserInputService")
local v_u_6 = game:GetService("RunService")
local v_u_7 = game:GetService("HttpService")
local v_u_8 = require(v1.Workspace.Packages.LoggingProtocol).default
local v_u_9 = require(v1.Workspace.Packages.TelemetryService).EventStreamReporter
local v_u_10 = require(script.Parent.Parent.Flags.FFlagAXEnableInspectAndBuyVersionAnalytics)
local v_u_11 = require(v1.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums
local v_u_12 = require(v1.Workspace.Packages.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local v_u_13 = require(v1.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants
local v_u_14 = require(v1.Workspace.Packages.AvatarExperienceModel).Enums.ItemTypeEnum
local v_u_15 = require(v1.Workspace.Packages.AvatarExperienceAnalytics).Constants.TIMED_OPTION_BY_DAYS
local v_u_16 = require(v1.Workspace.Packages.AvatarExperienceAnalytics).AXUnifiedEventFilter
local v_u_17 = require(v1.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventCounterAggregator
local v_u_18 = require(v1.Workspace.Packages.AvatarExperienceFlags).FFlagAXUnifiedEventCounters
local v_u_19 = require(v1.Workspace.Packages.AvatarExperienceFlags).FFlagAXUnifiedEventStrictPayloads
local v_u_20 = require(v1.Workspace.Packages.AvatarExperienceAnalytics).Utils.getMarketplaceUnifiedItemType
local v_u_21 = require(v1.Workspace.Packages.AvatarExperienceAnalytics).Utils.getMarketplaceUnifiedAssetType
local v_u_22 = require(v1.Workspace.Packages.AvatarExperienceAnalytics).Utils.getMarketplaceUnifiedBundleType
local v_u_23 = {}
v_u_23.__index = v_u_23
function v_u_23.__tostring()
	return "Service(Analytics)"
end
function v_u_23.new(p24, p25, p26) -- name: new
	-- upvalues: (copy) v_u_23, (copy) v_u_9, (copy) v_u_8, (copy) v_u_2, (copy) v_u_10, (copy) v_u_11, (copy) v_u_19, (copy) v_u_20, (copy) v_u_15, (copy) v_u_14, (copy) v_u_21, (copy) v_u_22, (copy) v_u_5, (copy) v_u_7, (copy) v_u_6, (copy) v_u_3
	local v_u_27 = {}
	local v28 = v_u_23
	setmetatable(v_u_27, v28)
	v_u_27.eventStream = v_u_9.new(v_u_8)
	local v29 = game.PlaceId
	v_u_27.pid = tostring(v29)
	local v30 = v_u_2.LocalPlayer.UserId
	v_u_27.uid = tostring(v30)
	v_u_27.feature = "inspectAndBuy"
	v_u_27.inspecteeUid = p24
	v_u_27.ctx = p25
	if not v_u_10 then
		p26 = nil
	end
	v_u_27.version = p26
	function v_u_27.reportOpenInspectMenu() -- name: reportOpenInspectMenu
		-- upvalues: (copy) v_u_27
		v_u_27:report("inspectUser", {})
	end
	function v_u_27.reportTryOnButtonClicked(p31, p32) -- name: reportTryOnButtonClicked
		-- upvalues: (copy) v_u_27
		v_u_27:report("tryItem", {
			["itemType"] = p31,
			["itemID"] = p32
		})
	end
	function v_u_27.reportFavoriteItem(p33, p34, p35, p36, p37, p38) -- name: reportFavoriteItem
		-- upvalues: (copy) v_u_27
		v_u_27:report("favoriteItem", {
			["itemType"] = p33,
			["itemID"] = p34,
			["favorite"] = p35,
			["success"] = p36,
			["failureReason"] = p37,
			["favoriteCount"] = p38
		})
	end
	function v_u_27.reportPurchaseAttempt(p39, p40) -- name: reportPurchaseAttempt
		-- upvalues: (copy) v_u_27
		v_u_27:report("purchaseAttemptItem", {
			["itemType"] = p39,
			["itemID"] = p40
		})
	end
	function v_u_27.reportPurchaseAttemptUnifiedEvent(p41, p42, p43) -- name: reportPurchaseAttemptUnifiedEvent
		-- upvalues: (copy) v_u_27, (ref) v_u_11, (ref) v_u_19, (ref) v_u_20, (ref) v_u_15, (ref) v_u_14, (ref) v_u_21, (ref) v_u_22
		local v44 = v_u_27
		local v45 = {
			["action"] = v_u_11.MarketplaceUnifiedAction.PURCHASE_ATTEMPT
		}
		local v46
		if v_u_19 and p42 ~= nil then
			v46 = tostring(p42)
		else
			v46 = p42
		end
		v45.itemId = v46
		local v47
		if v_u_19 then
			v47 = v_u_20(p41)
		else
			v47 = p41
		end
		v45.itemType = v47
		local v48
		if p43.timedOptionDays == nil then
			v48 = nil
		else
			v48 = v_u_15[p43.timedOptionDays]
		end
		v45.organicTimedOption = v48
		local v49
		if p41 == v_u_14.Asset then
			if v_u_19 then
				v49 = v_u_21(p43.itemSubType)
			else
				v49 = p43.itemSubType
			end
		else
			v49 = nil
		end
		v45.assetType = v49
		local v50
		if p41 == v_u_14.Bundle then
			if v_u_19 then
				v50 = v_u_22(p43.itemSubType)
			else
				v50 = p43.itemSubType
			end
		else
			v50 = nil
		end
		v45.bundleType = v50
		v45.organicItemPrice = p43.price or 0
		v44:reportUnifiedEvent(v45)
		v_u_27:report("purchaseAttemptItem", {
			["itemType"] = p41,
			["itemID"] = p42
		})
	end
	function v_u_27.reportPurchaseSuccessUnifiedEvent(p51, p52, p53) -- name: reportPurchaseSuccessUnifiedEvent
		-- upvalues: (copy) v_u_27, (ref) v_u_11, (ref) v_u_19, (ref) v_u_20, (ref) v_u_15, (ref) v_u_14, (ref) v_u_21, (ref) v_u_22
		local v54 = v_u_27
		local v55 = {
			["action"] = v_u_11.MarketplaceUnifiedAction.PURCHASE_SUCCESS
		}
		local v56
		if v_u_19 and p52 ~= nil then
			v56 = tostring(p52)
		else
			v56 = p52
		end
		v55.itemId = v56
		local v57
		if v_u_19 then
			v57 = v_u_20(p51)
		else
			v57 = p51
		end
		v55.itemType = v57
		local v58
		if p53.timedOptionDays == nil then
			v58 = nil
		else
			v58 = v_u_15[p53.timedOptionDays]
		end
		v55.organicTimedOption = v58
		local v59
		if p51 == v_u_14.Asset then
			if v_u_19 then
				v59 = v_u_21(p53.itemSubType)
			else
				v59 = p53.itemSubType
			end
		else
			v59 = nil
		end
		v55.assetType = v59
		local v60
		if p51 == v_u_14.Bundle then
			if v_u_19 then
				v60 = v_u_22(p53.itemSubType)
			else
				v60 = p53.itemSubType
			end
		else
			v60 = nil
		end
		v55.bundleType = v60
		v55.organicItemPrice = p53.price or 0
		v54:reportUnifiedEvent(v55)
		v_u_27:report("purchaseSuccessItem", {
			["itemType"] = p51,
			["itemID"] = p52
		})
	end
	function v_u_27.reportPurchaseSuccess(p61, p62) -- name: reportPurchaseSuccess
		-- upvalues: (copy) v_u_27
		v_u_27:report("purchaseSuccessItem", {
			["itemType"] = p61,
			["itemID"] = p62
		})
	end
	function v_u_27.reportItemDetailPageOpened(p63, p64) -- name: reportItemDetailPageOpened
		-- upvalues: (copy) v_u_27
		v_u_27:report("itemDetailView", {
			["itemType"] = p63,
			["itemID"] = p64
		})
	end
	v_u_27.platformStr = (function() -- name: getPlatformString
		-- upvalues: (ref) v_u_5, (ref) v_u_7
		local v65 = v_u_5:GetPlatform()
		local v66 = "Unknown"
		if v65 == Enum.Platform.Windows then
			return "Windows"
		end
		if v65 == Enum.Platform.OSX then
			return "OSX"
		end
		if v65 == Enum.Platform.IOS then
			return "IOS"
		end
		local v67
		if v65 == Enum.Platform.Android then
			local v68 = v_u_7:GetUserAgent()
			v67 = string.find(v68, "AmazonAppStore") and "Amazon" or "Android"
			if string.find(v68, "OculusQuest3Store") then
				return "Quest"
			end
		else
			if v65 == Enum.Platform.XBoxOne or v65 == Enum.Platform.XBox360 then
				return "XBox"
			end
			if v65 == Enum.Platform.UWP then
				return "UWP"
			end
			v67 = (v65 == Enum.Platform.PS4 or (v65 == Enum.Platform.PS3 or v65 == Enum.Platform.PS5)) and "PlayStation" or v66
		end
		return v67
	end)()
	function v_u_27.sendCounter(p69) -- name: sendCounter
		-- upvalues: (ref) v_u_6, (copy) v_u_27, (ref) v_u_3
		if not v_u_6:IsStudio() then
			v_u_3:ReportCounter("inspectAndBuy" .. "_" .. v_u_27.platformStr .. "_" .. p69)
		end
	end
	return v_u_27
end
function v_u_23.report(p70, p71, p72) -- name: report
	-- upvalues: (copy) v_u_10, (copy) v_u_4
	local v73 = {
		["pid"] = nil,
		["uid"] = nil,
		["inspecteeUid"] = nil,
		["feature"] = "inspectAndBuy",
		["event_sender_api"] = 2,
		["inspectAndBuyVersion"] = nil,
		["pid"] = p70.pid,
		["uid"] = p70.uid,
		["inspecteeUid"] = p70.inspecteeUid
	}
	local v74
	if v_u_10 then
		v74 = p70.version
	else
		v74 = nil
	end
	v73.inspectAndBuyVersion = v74
	local v75 = v_u_4.Dictionary.join(v73, p72)
	p70.eventStream:sendTelemetryEvent(p70.ctx, p71, v75)
end
function v_u_23.reportUnifiedEvent(p76, p77) -- name: reportUnifiedEvent
	-- upvalues: (copy) v_u_12, (copy) v_u_4, (copy) v_u_18, (copy) v_u_17, (copy) v_u_16, (copy) v_u_13
	local v78 = {
		["surface"] = v_u_12.IN_EXPERIENCE_INSPECT_BUY
	}
	local v79 = v_u_4.Dictionary.join(v78, p77)
	if v_u_18 then
		v_u_17.record(v79, v_u_16.filter(v79, {
			["skipReporting"] = true
		}))
	end
	p76.eventStream:sendTelemetryEvent(p76.ctx, v_u_13.EVENT_NAME, v79)
end
return v_u_23