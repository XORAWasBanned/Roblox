-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Components.PublishAvatarAssetPrompt.PublishAvatarAssetPrompt
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("Players")
local v_u_3 = require(v1.Packages.React)
local v_u_4 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_5 = require(v1.Workspace.Packages.Loggers).mutedError
local v6 = script.Parent.Parent
local v_u_7 = require(v6.BasePublishPrompt)
local v_u_8 = require(v6.Common.ObjectViewport)
local v_u_9 = require(v6.Common.LabeledTextBox)
local v_u_10 = require(v6.Common.PublishInfoList)
local v_u_11 = require(v1.Workspace.Packages.PurchasePrompt)
local v_u_12 = v_u_11.PublishAssetAnalytics
local v13 = v6.Parent
local v14 = v13.Actions
local v_u_15 = require(v14.SetPromptVisibility)
local v16 = require(v1.Workspace.Packages.RoactUtils)
local v_u_17 = v16.Hooks.RoactRodux.useDispatch
local v_u_18 = v16.Hooks.RoactRodux.useSelector
local v_u_19 = require(v13.Constants)
local v_u_20 = require(v13.MakeupPreviewUtils)
local v_u_21 = require(v6.Common.MakeupPartGrid)
local v_u_22 = require(v13.Flags.GetFFlagSingleUploadMakeupSupport)
local v_u_23 = UDim.new(0, 20)
return function(p_u_24) -- name: PublishAvatarAssetPrompt
	-- upvalues: (copy) v_u_2, (copy) v_u_18, (copy) v_u_17, (copy) v_u_19, (copy) v_u_3, (copy) v_u_22, (copy) v_u_20, (copy) v_u_12, (copy) v_u_11, (copy) v_u_5, (copy) v_u_15, (copy) v_u_4, (copy) v_u_23, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_21, (copy) v_u_7
	local v25 = v_u_2.LocalPlayer
	assert(v25, "LocalPlayer must not be nil")
	local v_u_27 = v_u_18(function(p26)
		return p26.promptRequest.promptInfo
	end)
	local v_u_28 = v_u_17()
	local v29 = v_u_19.AvatarAssetTypeDefaultName[v_u_27.accessoryType]
	local v30 = v25.Name .. "\'s " .. v29
	local v31, v_u_32 = v_u_3.useState(false)
	local v_u_33, v_u_34 = v_u_3.useState(v30)
	local v_u_35, v_u_36 = v_u_3.useState(true)
	local v_u_37, v_u_38 = v_u_3.useState(v30)
	local v_u_39, v_u_40 = v_u_3.useState(true)
	local v41, v_u_42 = v_u_3.useState(false)
	local v_u_43, v_u_44 = v_u_3.useState(true)
	local v_u_45
	if v_u_22() then
		v_u_45 = v_u_20.isMakeupAssetType(v_u_27.accessoryType)
	else
		v_u_45 = false
	end
	local v_u_46, v_u_47 = v_u_3.useState(nil)
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_45, (copy) v_u_27, (ref) v_u_20, (copy) v_u_47
		if not (v_u_45 and v_u_27.accessoryInstance) then
			return function() end
		end
		local v_u_48 = v_u_20.createMakeupHeadPreview(v_u_27.accessoryInstance, v_u_27.accessoryType)
		v_u_47(v_u_48)
		return function()
			-- upvalues: (copy) v_u_48
			if v_u_48 then
				v_u_48:Destroy()
			end
		end
	end, { v_u_27.accessoryInstance, v_u_45, v_u_27.accessoryType })
	if not v_u_45 then
		v_u_46 = v_u_27.accessoryInstance
	end
	local v_u_49 = v_u_3.useRef(false)
	local v_u_50 = v_u_3.useRef(false)
	local v_u_51 = v_u_3.useRef(nil)
	local v_u_52 = v_u_3.useRef(nil)
	local v_u_53 = v_u_3.useCallback(function()
		-- upvalues: (ref) v_u_12, (copy) v_u_32
		v_u_12.sendButtonClicked(v_u_12.Section.BuyCreationPage, v_u_12.Element.Expand)
		v_u_32(true)
	end, {})
	local v54 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_32
		v_u_32(false)
	end, {})
	local v56 = v_u_3.useCallback(function()
		-- upvalues: (copy) v_u_35, (copy) v_u_39, (copy) v_u_27, (copy) v_u_43
		local v55 = v_u_35 and v_u_39
		if v55 then
			if v_u_27.accessoryInstance == nil then
				v55 = false
			else
				v55 = v_u_43
			end
		end
		return v55
	end, {
		v_u_35,
		v_u_39,
		v_u_27.accessoryInstance,
		v_u_43
	})
	local v58 = v_u_3.useCallback(function()
		-- upvalues: (ref) v_u_12, (copy) v_u_33, (copy) v_u_37, (ref) v_u_11, (copy) v_u_27, (copy) v_u_46, (ref) v_u_5
		v_u_12.sendButtonClicked(v_u_12.Section.BuyCreationPage, v_u_12.Element.Buy)
		local v57 = {
			["name"] = v_u_33,
			["description"] = v_u_37
		}
		if v_u_11.initiateAvatarCreationFeePurchase then
			v_u_11.initiateAvatarCreationFeePurchase(v57, v_u_27.guid, v_u_46, v_u_27.priceInRobux)
		else
			v_u_5("PurchasePrompt.initiateAvatarCreationFeePurchase is not available")
		end
	end, {
		v_u_33,
		v_u_37,
		v_u_27.guid,
		v_u_27.accessoryInstance,
		v_u_27.priceInRobux,
		v_u_46
	})
	local v61 = v_u_3.useCallback(function(p59, p60)
		-- upvalues: (copy) v_u_34, (copy) v_u_36, (copy) v_u_49, (ref) v_u_12
		v_u_34(p59)
		v_u_36(p60)
		if not v_u_49.current then
			v_u_49.current = true
			v_u_12.sendFieldTouched(v_u_12.Section.BuyCreationPage, v_u_12.Element.Name)
		end
	end, {})
	local v_u_64 = v_u_3.useCallback(function(p62, p63)
		-- upvalues: (copy) v_u_38, (copy) v_u_40, (copy) v_u_50, (ref) v_u_12
		v_u_38(p62)
		v_u_40(p63)
		if not v_u_50.current then
			v_u_50.current = true
			v_u_12.sendFieldTouched(v_u_12.Section.BuyCreationPage, v_u_12.Element.Description)
		end
	end, {})
	local function v_u_68(p65)
		-- upvalues: (copy) v_u_28, (ref) v_u_15, (copy) v_u_42, (copy) v_u_44
		local v66 = p65.hasCompletedPurchase
		local v67 = p65.isShown
		if v66 and not v67 then
			v_u_28(v_u_15(false))
		else
			v_u_42(v67)
			if v67 then
				v_u_44(false)
			end
		end
	end
	local function v_u_69()
		-- upvalues: (copy) v_u_44
		v_u_44(true)
	end
	v_u_3.useEffect(function()
		-- upvalues: (ref) v_u_11, (copy) v_u_51, (copy) v_u_68, (copy) v_u_52, (copy) v_u_69, (ref) v_u_5, (ref) v_u_12
		local v70 = v_u_11.windowStateChangedEvent
		local v71 = v_u_11.promptStateSetToNoneEvent
		if v70 and v71 then
			v_u_51.current = v70:Connect(v_u_68)
			v_u_52.current = v71:Connect(v_u_69)
		else
			v_u_5("PurchasePrompt.windowStateChangedEvent or PurchasePrompt.promptStateSetToNoneEvent is not available")
		end
		v_u_12.sendPageLoad(v_u_12.Section.BuyCreationPage)
		return function()
			-- upvalues: (ref) v_u_51, (ref) v_u_5, (ref) v_u_52
			if v_u_51.current then
				v_u_51.current:Disconnect()
				v_u_51.current = nil
			else
				v_u_5("windowStateChangedConnection was not established")
			end
			if v_u_52.current then
				v_u_52.current:Disconnect()
				v_u_52.current = nil
			else
				v_u_5("promptStateSetToNoneConnection was not established")
			end
		end
	end, {})
	local v72
	if v_u_45 then
		v72 = v_u_4:FormatByKey("Feature.Catalog.Label.Makeup")
	else
		v72 = v_u_4:FormatByKey("Feature.Avatar.Label.Accessory")
	end
	local v_u_73 = v72 .. " | " .. v_u_4:FormatByKey(v_u_19.AvatarAssetTypeLocalized[v_u_27.accessoryType])
	local v74 = v_u_3.useCallback
	local function v83()
		-- upvalues: (copy) v_u_46, (ref) v_u_3, (ref) v_u_23, (ref) v_u_8, (copy) v_u_53, (ref) v_u_22, (copy) v_u_45, (ref) v_u_9, (ref) v_u_4, (copy) v_u_37, (copy) v_u_64, (ref) v_u_10, (copy) v_u_73, (ref) v_u_21, (copy) v_u_27, (copy) v_u_33, (copy) p_u_24
		local v75 = v_u_46 == nil
		local v76 = v_u_3.createElement
		local v77 = v_u_3.Fragment
		local v78 = nil
		local v79 = {
			["UIListLayout"] = v_u_3.createElement("UIListLayout", {
				["Padding"] = v_u_23,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["FillDirection"] = Enum.FillDirection.Vertical
			})
		}
		local v80 = {
			["PaddingBottom"] = v_u_23,
			["PaddingTop"] = v_u_23
		}
		v79.UIPadding = v_u_3.createElement("UIPadding", v80)
		v79.EmbeddedPreview = v_u_3.createElement(v_u_8, {
			["openPreviewView"] = nil,
			["model"] = nil,
			["isLoading"] = nil,
			["useFullBodyCameraSettings"] = nil,
			["fieldOfView"] = 30,
			["LayoutOrder"] = 1,
			["isMakeupPreview"] = nil,
			["openPreviewView"] = v_u_53,
			["model"] = v_u_46,
			["isLoading"] = v75,
			["useFullBodyCameraSettings"] = not v_u_22() and true or not v_u_45,
			["isMakeupPreview"] = v_u_45
		})
		v79.DescriptionInput = v_u_3.createElement(v_u_9, {
			["LayoutOrder"] = 2,
			["labelText"] = nil,
			["centerText"] = false,
			["defaultText"] = nil,
			["maxLength"] = 1000,
			["onTextUpdated"] = nil,
			["textBoxHeight"] = 104,
			["invalidInputText"] = nil,
			["labelText"] = v_u_4:FormatByKey("CoreScripts.PublishAssetPrompt.Description"),
			["defaultText"] = v_u_37,
			["onTextUpdated"] = v_u_64,
			["invalidInputText"] = v_u_4:FormatByKey("CoreScripts.PublishAssetPrompt.InvalidDescription")
		})
		local v81 = {
			["typeName"] = nil,
			["LayoutOrder"] = 3,
			["typeName"] = v_u_73
		}
		v79.InfoList = v_u_3.createElement(v_u_10, v81)
		local v82
		if v_u_45 then
			v82 = v_u_3.createElement(v_u_21, {
				["singleDecal"] = nil,
				["singleAssetType"] = nil,
				["makeupEntries"] = nil,
				["showAssetTypeInLabel"] = false,
				["name"] = nil,
				["LayoutOrder"] = 4,
				["screenSize"] = nil,
				["singleDecal"] = v_u_27.accessoryInstance,
				["singleAssetType"] = v_u_27.accessoryType,
				["makeupEntries"] = {
					{
						["assetType"] = nil,
						["sortOrder"] = 1,
						["assetType"] = v_u_27.accessoryType
					}
				},
				["name"] = v_u_33,
				["screenSize"] = p_u_24.screenSize
			}) or nil
		else
			v82 = nil
		end
		v79.MakeupGrid = v82
		return v76(v77, v78, v79)
	end
	local v84 = {}
	local v85 = v_u_27.accessoryType
	local v86
	if v_u_45 then
		v86 = v_u_33
	else
		v86 = nil
	end
	__set_list(v84, 1, {v_u_46, v85, v_u_37, v86, v_u_45, v_u_73})
	local v87 = v74(v83, v84)
	return v_u_3.createElement(v_u_7, {
		["promptBody"] = nil,
		["screenSize"] = nil,
		["showingPreviewView"] = nil,
		["closePreviewView"] = nil,
		["isMakeupPreview"] = nil,
		["asset"] = nil,
		["nameLabel"] = nil,
		["defaultName"] = nil,
		["titleText"] = nil,
		["onNameUpdated"] = nil,
		["canSubmit"] = nil,
		["onSubmit"] = nil,
		["delayInputSeconds"] = 3,
		["priceInRobux"] = nil,
		["showTopScrim"] = nil,
		["promptBody"] = v87(),
		["screenSize"] = p_u_24.screenSize,
		["showingPreviewView"] = v31,
		["closePreviewView"] = v54,
		["isMakeupPreview"] = v_u_45,
		["asset"] = v_u_46,
		["nameLabel"] = v_u_4:FormatByKey("CoreScripts.PublishAssetPrompt.Name"),
		["defaultName"] = v_u_33,
		["titleText"] = v_u_4:FormatByKey("CoreScripts.PublishAvatarPrompt.BuyCreation"),
		["onNameUpdated"] = v61,
		["canSubmit"] = v56,
		["onSubmit"] = v58,
		["priceInRobux"] = v_u_27.priceInRobux,
		["showTopScrim"] = v41
	})
end