-- Path: CoreGui.RobloxGui.Modules.Settings.SettingsUIDelegate
local v_u_1 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_2 = game:GetService("CorePackages")
local v_u_3 = require(v_u_2.Workspace.Packages.Observable)
local v4 = require(v_u_2.Workspace.Packages.VrSpatialUi)
local v_u_5 = v4.Constants.PanelType
local v_u_6 = v4.UIManager
local v_u_7 = require(script.Parent.Theme)
local v_u_8 = require(v_u_2.Workspace.Packages.AppCommonLib).Create
require(v_u_2.Packages.UIBlox)
local v_u_9 = require(v_u_1.Modules.Chrome.ChromeShared.Utility.GetStyleTokens)
local v_u_10 = require(v_u_1.Modules.ChatSelector)
local v_u_11 = game:GetEngineFeature("CoreScriptVersionEnabled")
local v_u_12 = game:DefineFastInt("SpatialUIDarkenBackgroundTransparency", 0)
local v_u_13 = game:DefineFastInt("SpatialUIVersionTextSizeScaled", 1400)
local v_u_14 = require(v_u_2.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP
local v_u_15 = require(v_u_1.Modules.Settings.Flags.FFlagSpatialUIFixMenuPanelChatExclusive)
local v_u_16 = game:DefineFastFlag("SpatialUIFixGameInviteChatExclusive", false)
local v_u_17 = nil
local v_u_18 = {}
v_u_18.__index = v_u_18
function v_u_18.new(p19) -- name: new
	-- upvalues: (copy) v_u_18
	local v20 = {
		["_settingsHub"] = nil,
		["_originalShieldConfig"] = nil,
		["_backgroundUICorner"] = nil,
		["_vrEnabled"] = false,
		["_surfaceGuiEnabledConnection"] = nil,
		["_topBarConnection"] = nil,
		["_userGui"] = nil,
		["_windowsVisibilityValues"] = nil,
		["_windowsDisconnectCallbacks"] = nil,
		["_openVRMenuHandler"] = nil,
		["_originalVersionTextSizes"] = nil,
		["_settingsHub"] = p19,
		["_windowsVisibilityValues"] = {},
		["_windowsDisconnectCallbacks"] = {},
		["_originalVersionTextSizes"] = {}
	}
	local v21 = v_u_18
	setmetatable(v20, v21)
	return v20
end
function v_u_18.enableVR(p22) -- name: enableVR
	-- upvalues: (copy) v_u_5, (copy) v_u_6, (copy) v_u_3, (copy) v_u_8, (copy) v_u_7, (copy) v_u_2, (copy) v_u_1
	local v23 = {
		["panelType"] = v_u_5.MoreMenu,
		["screenGuiProps"] = {
			["Name"] = "MoreMenu",
			["ResetOnSpawn"] = false,
			["DisplayOrder"] = -1,
			["ZIndexBehavior"] = nil,
			["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
		}
	}
	local v24 = v_u_6.getInstance():createUI(v23)
	if v24 ~= nil then
		local v_u_25 = v24.panelObject
		local v_u_26 = v_u_3.ObservableValue.new(p22._settingsHub.Visible)
		p22._surfaceGuiEnabledConnection = v_u_26:connect(function()
			-- upvalues: (copy) v_u_25, (copy) v_u_26
			v_u_25.Enabled = v_u_26:get()
		end)
		p22:connectWindowsVisibility(v_u_26)
		v_u_6.getInstance():connectPanelVisibility(v_u_5.MoreMenu, v_u_26)
		p22._originalShieldConfig = {}
		local v27 = p22._settingsHub.ClippingShield
		local v28 = p22._originalShieldConfig
		if v28 ~= nil then
			v28.Parent = v27.Parent
			v27.Parent = v_u_25
		end
		local v29 = p22._settingsHub.ClippingShield
		local v30 = p22._originalShieldConfig
		local v31 = UDim2.new(1, 0, 1, 0)
		if v30 ~= nil then
			v30.Size = v29.Size
			v29.Size = v31
		end
		local v32 = p22._settingsHub.ClippingShield
		local v33 = p22._originalShieldConfig
		local v34 = UDim2.new(0, 0, 0, 0)
		if v33 ~= nil then
			v33.Position = v32.Position
			v32.Position = v34
		end
		if p22._settingsHub.DarkenBackground then
			p22._backgroundUICorner = v_u_8("UICorner")({
				["CornerRadius"] = v_u_7.MenuContainerCornerRadius,
				["Parent"] = p22._settingsHub.DarkenBackground
			})
		end
		p22._vrEnabled = true
		if p22._topBarConnection == nil then
			local v_u_35 = require(v_u_2.Workspace.Packages.VrCommon).VRHub
			local v_u_36 = v_u_3.ObservableValue.new(v_u_35.ShowTopBar)
			p22._topBarConnection = v_u_35.ShowTopBarChanged.Event:connect(function()
				-- upvalues: (copy) v_u_36, (copy) v_u_35
				v_u_36:set(v_u_35.ShowTopBar)
			end)
			v_u_6.getInstance():connectTopBarVisibility(v_u_36)
			local v37 = v_u_1.Modules.Chrome
			local v38 = require(v37.ChromeShared.Service)
			v38:onTriggerVRToggleButton():connect(function(p39)
				-- upvalues: (copy) v_u_35
				v_u_35:SetShowTopBar(p39)
			end)
			v38:connectTopBarVisibility(v_u_36)
		end
		p22:setVersionTextSize()
	end
end
function v_u_18.isInputEventNeededBySettings(p40, p41, p42, p43) -- name: isInputEventNeededBySettings
	-- upvalues: (copy) v_u_1
	if p40._vrEnabled then
		if p40._userGui == nil then
			p40._userGui = require(v_u_1.Modules.VR.UserGui)
		end
		if p40._userGui:isInputNeededForOpenVRMenu(p43) then
			if p40._openVRMenuHandler == nil then
				p40._openVRMenuHandler = p40._userGui:getOpenVRMenuHandler()
			end
			p40._openVRMenuHandler(p41, p42, p43)
			return false
		end
		if p43.KeyCode == Enum.KeyCode.Thumbstick2 then
			return true
		end
	end
	return false
end
function v_u_18.disableVR(p44) -- name: disableVR
	-- upvalues: (copy) v_u_6, (copy) v_u_5
	if p44._vrEnabled then
		local v45 = p44._settingsHub.ClippingShield
		local v46 = p44._originalShieldConfig
		if v46 ~= nil then
			v45.Parent = v46.Parent
		end
		local v47 = p44._settingsHub.ClippingShield
		local v48 = p44._originalShieldConfig
		if v48 ~= nil then
			v47.Size = v48.Size
		end
		local v49 = p44._settingsHub.ClippingShield
		local v50 = p44._originalShieldConfig
		if v50 ~= nil then
			v49.Position = v50.Position
		end
		p44._originalShieldConfig = nil
		if p44._backgroundUICorner then
			p44._backgroundUICorner.Parent = nil
			p44._backgroundUICorner = nil
		end
		if p44._surfaceGuiEnabledConnection ~= nil then
			p44._surfaceGuiEnabledConnection:disconnect()
		end
		p44._openVRMenuHandler = nil
		p44:disconnectWindowsVisibility()
		v_u_6.getInstance():disconnectPanelVisibility(v_u_5.MoreMenu)
		p44:restoreVersionTextSize()
		p44._vrEnabled = false
	end
end
function v_u_18.getAspectRatio(p51) -- name: getAspectRatio
	-- upvalues: (copy) v_u_6, (copy) v_u_5
	if not p51._vrEnabled then
		return 1.3333333333333333
	end
	local v52 = v_u_6.getInstance():getPanelSizeInPixel(v_u_5.MoreMenu)
	return v52.X / v52.Y
end
function v_u_18.getHubBarSize(p53) -- name: getHubBarSize
	-- upvalues: (copy) v_u_7, (copy) v_u_6, (copy) v_u_5
	if not p53._vrEnabled then
		return 800
	end
	local v54 = v_u_7.HubPadding()
	local v55 = 0
	if v54 and v54.PaddingLeft then
		v55 = v55 + v54.PaddingLeft.Offset
	end
	if v54 and v54.PaddingRight then
		v55 = v55 + v54.PaddingRight.Offset
	end
	return v_u_6.getInstance():getPanelSizeInPixel(v_u_5.MoreMenu).X - v55
end
function v_u_18.getMenuContainerPositionOverride(p56) -- name: getMenuContainerPositionOverride
	return p56._vrEnabled and {
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["Size"] = UDim2.new(0, 0, 1, 0),
		["AutomaticSize"] = Enum.AutomaticSize.X
	} or nil
end
function v_u_18.getFullScreenSize(p57) -- name: getFullScreenSize
	-- upvalues: (copy) v_u_6, (copy) v_u_5, (copy) v_u_1
	if p57._vrEnabled then
		return v_u_6.getInstance():getPanelSizeInPixel(v_u_5.MoreMenu).Y
	else
		return v_u_1.AbsoluteSize.y
	end
end
function v_u_18.getDarkBackgroundTheme(p58) -- name: getDarkBackgroundTheme
	-- upvalues: (ref) v_u_17, (copy) v_u_9, (copy) v_u_12, (copy) v_u_7
	if not p58._vrEnabled then
		return {
			["Color"] = v_u_7.color("DarkenBackground"),
			["Transparency"] = v_u_7.transparency("DarkenBackground")
		}
	end
	if v_u_17 == nil then
		v_u_17 = v_u_9()
	end
	local v59 = {
		["Color"] = v_u_17.Color.OverMedia.OverMedia_100.Color3
	}
	local v60 = v_u_12
	local v61 = math.max(v60, 0)
	v59.Transparency = math.min(v61, 100) / 100
	return v59
end
function v_u_18.getBottomButtonSize(p62, p63) -- name: getBottomButtonSize
	if p62._vrEnabled then
		return math.min(p63, 233)
	else
		return p63
	end
end
function v_u_18.updatePanelVisibility(p64, p65) -- name: updatePanelVisibility
	-- upvalues: (copy) v_u_14, (copy) v_u_15, (copy) v_u_10, (copy) v_u_5
	for _, v66 in p64._windowsVisibilityValues do
		if not v66 then
			continue
		end
		if v_u_14:isMovePanelToCenter() and v_u_15 then
			v_u_10:HideTemp(v_u_5.MoreMenu, true)
		end
		p65:set(true)
		return
	end
	if v_u_14:isMovePanelToCenter() and v_u_15 then
		v_u_10:HideTemp(v_u_5.MoreMenu, false)
	end
	p65:set(false)
end
local function v_u_70(p_u_67)
	-- upvalues: (copy) v_u_2, (copy) v_u_14, (copy) v_u_16, (copy) v_u_10
	local v_u_69 = require(v_u_2.Workspace.Packages.GameInvite).GameInviteModalManager.ToggleGameInviteModalEvent.Event:Connect(function(p68)
		-- upvalues: (copy) p_u_67, (ref) v_u_14, (ref) v_u_16, (ref) v_u_10
		p_u_67("GameInvite", p68)
		if v_u_14:isMovePanelToCenter() and v_u_16 then
			if p68 then
				v_u_10:HideTemp("SettingsMenu", true)
				return
			end
			v_u_10:HideTemp("SettingsMenu", false)
		end
	end)
	return function()
		-- upvalues: (ref) v_u_69
		if v_u_69 then
			v_u_69:Disconnect()
			v_u_69 = nil
		end
	end
end
local function v_u_77(p_u_71)
	local v72 = game:GetService("GuiService")
	local v_u_73 = v72.InspectPlayerFromUserIdWithCtxRequest:Connect(function()
		-- upvalues: (copy) p_u_71
		p_u_71("InspectAndBuy", true)
	end)
	local v_u_74 = v72.CloseInspectMenuRequest:Connect(function()
		-- upvalues: (copy) p_u_71
		p_u_71("InspectAndBuy", false)
	end)
	local v_u_76 = v72.InspectMenuEnabledChangedSignal:Connect(function(p75)
		-- upvalues: (copy) p_u_71
		if not p75 then
			p_u_71("InspectAndBuy", false)
		end
	end)
	return function()
		-- upvalues: (ref) v_u_73, (ref) v_u_74, (ref) v_u_76
		if v_u_73 then
			v_u_73:Disconnect()
			v_u_73 = nil
		end
		if v_u_74 then
			v_u_74:Disconnect()
			v_u_74 = nil
		end
		if v_u_76 then
			v_u_76:Disconnect()
			v_u_76 = nil
		end
	end
end
function v_u_18.connectWindowsVisibility(p_u_78, p_u_79) -- name: connectWindowsVisibility
	-- upvalues: (copy) v_u_70, (copy) v_u_77
	local function v82(p80, p81)
		-- upvalues: (copy) p_u_78, (copy) p_u_79
		p_u_78._windowsVisibilityValues[p80] = p81
		p_u_78:updatePanelVisibility(p_u_79)
	end
	for _, v86 in { function(p_u_83)
			-- upvalues: (copy) p_u_78
			local v_u_85 = p_u_78._settingsHub.SettingsShowSignal:connect(function(p84)
				-- upvalues: (copy) p_u_83
				p_u_83("SettingsHub", p84)
			end)
			return function()
				-- upvalues: (ref) v_u_85
				if v_u_85 then
					v_u_85:Disconnect()
					v_u_85 = nil
				end
			end
		end, v_u_70, v_u_77 } do
		local v87 = v86(v82)
		local v88 = p_u_78._windowsDisconnectCallbacks
		table.insert(v88, v87)
	end
end
function v_u_18.disconnectWindowsVisibility(p89) -- name: disconnectWindowsVisibility
	for _, v90 in p89._windowsDisconnectCallbacks do
		v90()
	end
	p89._windowsDisconnectCallbacks = {}
	p89._windowsVisibilityValues = {}
end
function v_u_18.isOpenCloseAnimationAllowed(p91) -- name: isOpenCloseAnimationAllowed
	return not p91._vrEnabled
end
function v_u_18.getMenuContainerExtraSpace(p92) -- name: getMenuContainerExtraSpace
	if not p92._vrEnabled then
		return 0
	end
	local v93 = p92._settingsHub.MenuContainerPadding
	return v93.PaddingTop.Offset + v93.PaddingBottom.Offset
end
function v_u_18.setVersionTextSize(p94) -- name: setVersionTextSize
	-- upvalues: (copy) v_u_7, (copy) v_u_13, (copy) v_u_11
	for _, v95 in p94._settingsHub.VersionContainer:GetChildren() do
		if not v95:IsA("TextLabel") then
			continue
		end
		p94._originalVersionTextSizes[v95] = v95.TextSize
		v95.TextSize = v_u_7.textSize(v_u_13 / 100)
		local v96 = UDim2.new(0.2, -6, 1, 0)
		if v_u_11 then
			v96 = UDim2.new(0, v95.TextBounds.X + 6, 1, 0)
		end
		v95.Size = v96
	end
end
function v_u_18.restoreVersionTextSize(p97) -- name: restoreVersionTextSize
	-- upvalues: (copy) v_u_11
	for _, v98 in p97._settingsHub.VersionContainer:GetChildren() do
		if not (v98:IsA("TextLabel") and p97._originalVersionTextSizes[v98]) then
			continue
		end
		v98.TextSize = p97._originalVersionTextSizes[v98]
		local v99 = UDim2.new(0.2, -6, 1, 0)
		if v_u_11 then
			v99 = UDim2.new(0, v98.TextBounds.X + 6, 1, 0)
		end
		v98.Size = v99
		p97._originalVersionTextSizes[v98] = nil
	end
	p97._originalVersionTextSizes = {}
end
return v_u_18