-- Path: CoreGui.RobloxGui.Modules.VR.VRBottomBar.VRBottomBar
local v_u_1 = game:GetService("RbxAnalyticsService")
game:GetService("TelemetryService")
local v2 = game:GetService("CorePackages")
local v3 = game:GetService("CoreGui")
local v_u_4 = game:GetService("GuiService")
local v_u_5 = game:GetService("Players")
local v_u_6 = game:GetService("RunService")
local v_u_7 = game:GetService("StarterGui")
local v_u_8 = game:GetService("VRService")
local v_u_9 = require(v2.Packages.Cryo)
local v_u_10 = require(v2.Packages.Otter)
local v_u_11 = require(v2.Packages.React)
local v_u_12 = require(v2.Packages.Roact)
local v13 = require(v2.Packages.RoactRodux)
local v14 = require(v2.Packages.UIBlox)
local v_u_15 = v14.App.Menu.BaseMenu
local v_u_16 = v14.App.Navigation.SystemBar
local v_u_17 = v14.App.Navigation.Enum.Placement
local v_u_18 = v14.Core.VR.Panel3D
local v_u_19 = v14.Core.VR.Constants
local v_u_20 = v14.Core.ImageSet.ImageSetLabel
local v_u_21 = v14.Core.Style.withStyle
local v22 = v14.App.ImageSet.Images
local v_u_23 = v3:WaitForChild("RobloxGui")
local v24 = require(v2.Workspace.Packages.RobloxTranslator)
local v_u_25 = require(v2.Workspace.Packages.VrCommon).VRHub
local v_u_26 = require(v2.Workspace.Packages.VrCommon).VRUtil
local v_u_27 = require(v_u_23.Modules.VoiceChat.VoiceChatServiceManager).default
local v_u_28 = require(v_u_23.Modules.VoiceChat.Constants)
local v_u_29 = require(v2.Workspace.Packages.RoactUtils).ExternalEventConnection
local v_u_30, v_u_31, v_u_32, v_u_33
if require(v2.Workspace.Packages.SharedFlags).FFlagEnableUIManagerPackgify then
	local v34 = require(v2.Workspace.Packages.VrSpatialUi)
	v_u_30 = v34.Constants
	v_u_31 = v_u_30.PanelType
	v_u_32 = v34.registerRoactPanel
	v_u_33 = v34.UIManager
else
	local v35 = v_u_23:WaitForChild("Modules"):WaitForChild("UIManager")
	v_u_31 = require(v35.Constants).PanelType
	v_u_32 = require(v35.registerRoactPanel)
	v_u_33 = require(v35.UIManager)
	v_u_30 = require(v35.Constants)
end
local v_u_36 = require(v_u_23.Modules.InGameMenuConstants)
local v_u_37 = UserSettings().GameSettings
local v_u_38 = require(v_u_23.Modules.InGameMenuInit)
local v_u_39 = require(v_u_23.Modules.ChatSelector)
local v40 = v_u_12.PureComponent:extend("TopBarApp")
local v41 = require(script.Parent.VRBarSeparator)
local v_u_42 = require(script.Parent.VRBarVoiceIcon)
local v_u_43 = require(script.Parent.VRBottomBarAnalytics)
local v_u_44 = require(script.Parent.VRBottomBarType)
local v_u_45 = require(v_u_23.Modules.EmotesMenu.EmotesMenuMaster)
local v_u_46 = require(v2.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local v_u_47
if v_u_46 then
	v_u_47 = require(v2.Workspace.Packages.System).Features
else
	v_u_47 = nil
end
local v_u_48
if v_u_46 then
	v_u_48 = require(v2.Workspace.Packages.Backpack)
else
	v_u_48 = require(v_u_23.Modules.BackpackScript)
end
local v_u_49 = require(v_u_23.Modules.PlayerList.PlayerListManager)
local v_u_50 = game:GetService("StarterPlayer")
local v_u_51 = game:GetEngineFeature("EnableVRBottomBarWorksBehindObjects")
local v_u_52 = require(v_u_23.Modules.Flags.FFlagVRBottomBarDebugPositionConfig)
local v53 = require(v_u_23.Modules.Flags.FIntVRBottomBarPositionOffsetVerticalNumber)
local v54 = require(v_u_23.Modules.Flags.FIntVRBottomBarPositionOffsetDepthNumber)
local v_u_55 = require(v_u_23.Modules.VR.IsSpatialRobloxGuiEnabled)
local v_u_56 = require(v2.Workspace.Packages.SplashScreenManager).SplashScreenManager
local v_u_57 = (require(v_u_23.Modules.Flags.GetFIntVRScaleGuiDistance) or 100)() * 0.01
local v_u_58 = game:DefineFastFlag("FixVRBottomBarAnalytics", false)
local v_u_59 = {
	["Y"] = v53 / 100,
	["Z"] = v54 / 100
}
local _ = 0.2 + v_u_59.Z / 10
local v_u_60 = {
	["Default"] = {
		["dampingRatio"] = 1,
		["frequency"] = 4.5
	},
	["Slower"] = {
		["dampingRatio"] = 1,
		["frequency"] = 0.66
	}
}
local v_u_62 = {
	["iconOn"] = "rbxasset://textures/ui/MenuBar/icon_menu.png",
	["iconOff"] = "rbxasset://textures/ui/MenuBar/icon_menu.png",
	["onActivated"] = nil,
	["onActivated"] = function() -- name: onActivated
		-- upvalues: (copy) v_u_25, (copy) v_u_38, (copy) v_u_36, (copy) v_u_58, (copy) v_u_43, (copy) v_u_44, (copy) v_u_1
		v_u_25:SetShowTopBar(true)
		if v_u_38.getOpen() then
			v_u_38.closeInGameMenu()
		else
			v_u_38.openInGameMenu(v_u_36.MainPagePageKey)
			v_u_25:SetShowMoreMenu(false)
		end
		if v_u_58 then
			local v61 = v_u_38.getOpen()
			v_u_43.sendEventToTelemetryV2({
				["integrationId"] = v_u_44.ButtomName.MainMenu,
				["isToggleOn"] = v61,
				["source"] = v_u_44.Source.VRBottomBar
			})
		end
		v_u_1:ReportCounter("VR-BottomBar-MainMenu")
	end
}
local v_u_64 = {
	["iconOn"] = "rbxasset://textures/ui/MenuBar/icon_maximize.png",
	["iconOff"] = "rbxasset://textures/ui/MenuBar/icon_minimize.png",
	["onActivated"] = nil,
	["onActivated"] = function() -- name: onActivated
		-- upvalues: (copy) v_u_25, (copy) v_u_38, (copy) v_u_58, (copy) v_u_43, (copy) v_u_44, (copy) v_u_1
		if v_u_25.ShowTopBar then
			v_u_25:SetShowTopBar(false)
			v_u_38.closeInGameMenu()
		else
			v_u_25:SetShowTopBar(false)
			v_u_25:SetShowTopBar(true)
		end
		if v_u_58 then
			local v63 = v_u_25.ShowTopBar
			v_u_43.sendEventToTelemetryV2({
				["integrationId"] = v_u_44.ButtomName.ToggleGui,
				["isToggleOn"] = v63,
				["source"] = v_u_44.Source.VRBottomBar
			})
		end
		v_u_1:ReportCounter("VR-BottomBar-ToggleGui")
	end
}
local v_u_66 = {
	["iconOn"] = "rbxasset://textures/ui/MenuBar/icon__backpack.png",
	["iconOff"] = "rbxasset://textures/ui/MenuBar/icon__backpack.png",
	["onActivated"] = nil,
	["onActivated"] = function() -- name: onActivated
		-- upvalues: (copy) v_u_46, (copy) v_u_25, (copy) v_u_47, (copy) v_u_58, (copy) v_u_43, (copy) v_u_44, (copy) v_u_48, (copy) v_u_1
		if v_u_46 then
			if v_u_25.ShowTopBar then
				v_u_47.toggleVisibility(v_u_47.FeatureName.Backpack)
			else
				v_u_25:SetShowTopBar(true)
				v_u_47.setVisibility(v_u_47.FeatureName.Backpack, true)
			end
			if v_u_58 then
				v_u_43.sendEventToTelemetryV2({
					["integrationId"] = v_u_44.ButtomName.Inventory,
					["isToggleOn"] = v_u_47.getVisibility(v_u_47.FeatureName.Backpack),
					["source"] = v_u_44.Source.MoreSubMenu
				})
			end
		else
			if v_u_25.ShowTopBar then
				v_u_48.OpenClose()
			else
				v_u_25:SetShowTopBar(true)
				if not v_u_48.IsOpen then
					v_u_48.OpenClose()
				end
			end
			if v_u_58 then
				local v65 = v_u_48.IsOpen
				v_u_43.sendEventToTelemetryV2({
					["integrationId"] = v_u_44.ButtomName.Inventory,
					["isToggleOn"] = v65,
					["source"] = v_u_44.Source.MoreSubMenu
				})
			end
		end
		v_u_1:ReportCounter("VR-BottomBar-Backpack")
	end
}
local v_u_68 = {
	["iconOn"] = "rbxasset://textures/ui/MenuBar/icon_leaderboard.png",
	["iconOff"] = "rbxasset://textures/ui/MenuBar/icon_leaderboard.png",
	["onActivated"] = nil,
	["onActivated"] = function() -- name: onActivated
		-- upvalues: (copy) v_u_25, (copy) v_u_49, (copy) v_u_58, (copy) v_u_43, (copy) v_u_44, (copy) v_u_1
		if v_u_25.ShowTopBar then
			v_u_49:SetVisibility(not v_u_49:GetSetVisible())
		else
			v_u_25:SetShowTopBar(true)
			if not v_u_49:GetSetVisible() then
				v_u_49:SetVisibility(true)
			end
		end
		if v_u_58 then
			local v67 = v_u_49:GetSetVisible()
			v_u_43.sendEventToTelemetryV2({
				["integrationId"] = v_u_44.ButtomName.Leaderboard,
				["isToggleOn"] = v67,
				["source"] = v_u_44.Source.MoreSubMenu
			})
		end
		v_u_1:ReportCounter("VR-BottomBar-PlayerList")
	end
}
local v_u_70 = {
	["iconOn"] = "rbxasset://textures/ui/MenuBar/icon_emote.png",
	["iconOff"] = "rbxasset://textures/ui/MenuBar/icon_emote.png",
	["onActivated"] = nil,
	["onActivated"] = function() -- name: onActivated
		-- upvalues: (copy) v_u_25, (copy) v_u_45, (copy) v_u_58, (copy) v_u_43, (copy) v_u_44, (copy) v_u_1
		if v_u_25.ShowTopBar then
			if v_u_45:isOpen() then
				v_u_45:close()
			else
				v_u_45:open()
			end
		else
			v_u_25:SetShowTopBar(true)
			if not v_u_45:isOpen() then
				v_u_45:open()
			end
		end
		if v_u_58 then
			local v69 = v_u_45:isOpen()
			v_u_43.sendEventToTelemetryV2({
				["integrationId"] = v_u_44.ButtomName.Emotes,
				["isToggleOn"] = v69,
				["source"] = v_u_44.Source.MoreSubMenu
			})
		end
		v_u_1:ReportCounter("VR-BottomBar-Emotes")
	end
}
local v_u_72 = {
	["iconOn"] = "rbxasset://textures/ui/MenuBar/icon_chat.png",
	["iconOff"] = "rbxasset://textures/ui/MenuBar/icon_chat.png",
	["onActivated"] = nil,
	["onActivated"] = function() -- name: onActivated
		-- upvalues: (copy) v_u_25, (copy) v_u_39, (copy) v_u_37, (copy) v_u_58, (copy) v_u_43, (copy) v_u_44, (copy) v_u_1
		if v_u_25.ShowTopBar then
			v_u_39:ToggleVisibility()
			v_u_37.ChatVisible = v_u_39:GetVisibility()
		else
			v_u_25:SetShowTopBar(true)
			if not v_u_39:GetVisibility() then
				v_u_39:ToggleVisibility()
				v_u_37.ChatVisible = v_u_39:GetVisibility()
			end
		end
		if v_u_58 then
			local v71 = v_u_37.ChatVisible
			v_u_43.sendEventToTelemetryV2({
				["integrationId"] = v_u_44.ButtomName.Chat,
				["isToggleOn"] = v71,
				["source"] = v_u_44.Source.VRBottomBar
			})
		end
		v_u_1:ReportCounter("VR-BottomBar-Chat")
	end
}
local v_u_74 = {
	["iconOn"] = "rbxasset://textures/ui/MenuBar/icon_safety_on.png",
	["iconOff"] = "rbxasset://textures/ui/MenuBar/icon_safety_on.png",
	["onActivated"] = nil,
	["onActivated"] = function() -- name: onActivated
		-- upvalues: (copy) v_u_25, (copy) v_u_58, (copy) v_u_43, (copy) v_u_44, (copy) v_u_1
		v_u_25:ToggleSafetyBubble()
		if v_u_58 then
			local v73 = v_u_25.SafetyBubble.enabled
			v_u_43.sendEventToTelemetryV2({
				["integrationId"] = v_u_44.ButtomName.Safety,
				["isToggleOn"] = v73,
				["source"] = v_u_44.Source.VRBottomBar
			})
		end
		v_u_1:ReportCounter("VR-BottomBar-Safety")
	end
}
local v_u_76 = {
	["iconOn"] = "rbxasset://textures/ui/MenuBar/icon_safety_off.png",
	["iconOff"] = "rbxasset://textures/ui/MenuBar/icon_safety_off.png",
	["onActivated"] = nil,
	["onActivated"] = function() -- name: onActivated
		-- upvalues: (copy) v_u_25, (copy) v_u_58, (copy) v_u_43, (copy) v_u_44, (copy) v_u_1
		v_u_25:ToggleSafetyBubble()
		if v_u_58 then
			local v75 = v_u_25.SafetyBubble.enabled
			v_u_43.sendEventToTelemetryV2({
				["integrationId"] = v_u_44.ButtomName.Safety,
				["isToggleOn"] = v75,
				["source"] = v_u_44.Source.VRBottomBar
			})
		end
		v_u_1:ReportCounter("VR-BottomBar-Safety")
	end
}
local v_u_78 = {
	["iconOn"] = "rbxasset://textures/ui/MenuBar/icon_leave.png",
	["iconOff"] = "rbxasset://textures/ui/MenuBar/icon_leave.png",
	["onActivated"] = nil,
	["onActivated"] = function() -- name: onActivated
		-- upvalues: (copy) v_u_25, (copy) v_u_38, (copy) v_u_36, (copy) v_u_58, (copy) v_u_43, (copy) v_u_44, (copy) v_u_1
		v_u_25:SetShowTopBar(true)
		v_u_25:SetShowMoreMenu(false)
		if v_u_38 then
			if not v_u_38.getOpen() then
				v_u_38.openInGameMenu(v_u_36.MainPagePageKey)
			end
			v_u_38.openGameLeavePage()
		end
		if v_u_58 then
			local v77 = v_u_38.getOpen()
			v_u_43.sendEventToTelemetryV2({
				["integrationId"] = v_u_44.ButtomName.Leave,
				["isToggleOn"] = v77,
				["source"] = v_u_44.Source.VRBottomBar
			})
		end
		v_u_1:ReportCounter("VR-BottomBar-LeaveGame")
	end
}
local v_u_79 = {
	["iconOn"] = "rbxasset://textures/ui/MenuBar/icon_leave_highlighted.png",
	["iconOff"] = "rbxasset://textures/ui/MenuBar/icon_leave_highlighted.png",
	["onActivated"] = nil,
	["onActivated"] = v_u_78.onActivated
}
local v_u_81 = {
	["iconOn"] = "rbxasset://textures/ui/MenuBar/icon_more.png",
	["iconOff"] = "rbxasset://textures/ui/MenuBar/icon_more.png",
	["onActivated"] = nil,
	["onActivated"] = function() -- name: onActivated
		-- upvalues: (copy) v_u_25, (copy) v_u_58, (copy) v_u_43, (copy) v_u_44, (copy) v_u_1
		v_u_25:SetShowTopBar(true)
		v_u_25:SetShowMoreMenu(not v_u_25.ShowMoreMenu)
		if v_u_58 then
			local v80 = v_u_25.ShowMoreMenu
			v_u_43.sendEventToTelemetryV2({
				["integrationId"] = v_u_44.ButtomName.MoreSubMenu,
				["isToggleOn"] = v80,
				["source"] = v_u_44.Source.VRBottomBar
			})
		end
		v_u_1:ReportCounter("VR-BottomBar-More")
	end
}
local v_u_82 = {
	["iconComponent"] = v41,
	["itemSize"] = UDim2.new(0, 28, 0, 44)
}
local v_u_83 = {
	["icon"] = "rbxasset://textures/ui/MenuBar/icon_emote.png",
	["text"] = nil,
	["onActivated"] = nil,
	["text"] = v24:FormatByKey("CoreScripts.TopBar.Emotes"),
	["onActivated"] = function() -- name: onActivated
		-- upvalues: (copy) v_u_70, (copy) v_u_1
		v_u_70.onActivated()
		v_u_1:ReportCounter("VR-BottomBar-MoreMenu-Emotes")
	end
}
local v_u_84 = {
	["icon"] = "rbxasset://textures/ui/MenuBar/icon_leaderboard.png",
	["text"] = nil,
	["onActivated"] = nil,
	["text"] = v24:FormatByKey("CoreScripts.TopBar.Leaderboard"),
	["onActivated"] = function() -- name: onActivated
		-- upvalues: (copy) v_u_68, (copy) v_u_1
		v_u_68.onActivated()
		v_u_1:ReportCounter("VR-BottomBar-MoreMenu-PlayerList")
	end
}
local v_u_85 = {
	["icon"] = "rbxasset://textures/ui/MenuBar/icon__backpack.png",
	["text"] = nil,
	["onActivated"] = nil,
	["text"] = v24:FormatByKey("CoreScripts.TopBar.Inventory"),
	["onActivated"] = function() -- name: onActivated
		-- upvalues: (copy) v_u_66, (copy) v_u_1
		v_u_66.onActivated()
		v_u_1:ReportCounter("VR-BottomBar-MoreMenu-Backpack")
	end
}
local v_u_87 = {
	["iconOn"] = nil,
	["iconOff"] = nil,
	["text"] = "Join Voice",
	["onActivated"] = nil,
	["iconOn"] = v22["icons/controls/publicAudioJoin"],
	["iconOff"] = v22["icons/controls/publicAudioJoin"],
	["onActivated"] = function() -- name: onActivated
		-- upvalues: (copy) v_u_27, (copy) v_u_28, (copy) v_u_43, (copy) v_u_44
		v_u_27.pendingConnectionSource = v_u_28.VOICE_CONNECTION_SOURCE.IN_EXPERIENCE
		v_u_27:JoinVoice()
		local v86 = v_u_27:ShouldShowJoinVoice()
		v_u_43.sendEventToTelemetryV2({
			["integrationId"] = v_u_44.ButtomName.JoinVoice,
			["isToggleOn"] = v86,
			["source"] = v_u_44.Source.VRBottomBar
		})
	end
}
function v40.init(p_u_88) -- name: init
	-- upvalues: (copy) v_u_59, (copy) v_u_57, (copy) v_u_8, (copy) v_u_23, (copy) v_u_12, (copy) v_u_56, (copy) v_u_11, (copy) v_u_42, (copy) v_u_9, (copy) v_u_5, (copy) v_u_58, (copy) v_u_43, (copy) v_u_44, (copy) v_u_1, (copy) v_u_62, (copy) v_u_82, (copy) v_u_64, (copy) v_u_78, (copy) v_u_55, (copy) v_u_25, (copy) v_u_26, (copy) v_u_10, (copy) v_u_60, (copy) v_u_52
	local v89 = {
		["yOffset"] = nil,
		["zOffset"] = nil,
		["moreMenuOpen"] = false,
		["vrMenuOpen"] = true,
		["lookAway"] = false,
		["userGui"] = nil,
		["hidden"] = nil,
		["yOffset"] = v_u_59.Y * v_u_57,
		["zOffset"] = v_u_59.Z * v_u_57
	}
	local v90
	if v_u_8.VREnabled then
		local v91 = v_u_23.Modules.VR.UserGui
		local v92 = require
		local v93
		v93, v90 = pcall(v92, v91)
		if not v93 then
			warn("Failure to Start CoreScript module " .. v91.Name .. ".\n" .. v90)
			v90 = nil
		end
		if not v90 then
			v90 = v_u_12.None
		end
	else
		v90 = v_u_12.None
	end
	v89.userGui = v90
	v89.hidden = not v_u_56.isFPSAtTarget()
	p_u_88:setState(v89)
	p_u_88.backpackHasItems = false
	p_u_88.emotesLoaded = false
	function p_u_88.onTargetFPSSTateChange(p94)
		-- upvalues: (copy) p_u_88
		p_u_88:setState({
			["hidden"] = not p94
		})
	end
	v_u_56.addStatusChangeListener(p_u_88.onTargetFPSSTateChange)
	function p_u_88.getVoiceIcon()
		-- upvalues: (ref) v_u_11, (ref) v_u_42, (ref) v_u_9, (ref) v_u_5, (copy) p_u_88, (ref) v_u_58, (ref) v_u_43, (ref) v_u_44, (ref) v_u_1
		return {
			["iconImageComponent"] = function(p95) -- name: iconImageComponent
				-- upvalues: (ref) v_u_11, (ref) v_u_42, (ref) v_u_9, (ref) v_u_5
				local v96 = v_u_11.createElement
				local v97 = v_u_42
				local v98 = v_u_9.Dictionary.join
				local v99 = {
					["userId"] = nil,
					["iconStyle"] = "MicLight"
				}
				local v100 = v_u_5.LocalPlayer.UserId
				v99.userId = tostring(v100)
				return v96(v97, v98(p95, v99))
			end,
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (ref) p_u_88, (ref) v_u_58, (ref) v_u_43, (ref) v_u_44, (ref) v_u_1
				if p_u_88.props.voiceState == Enum.VoiceChatState.Failed then
					p_u_88.props.voiceChatServiceManager:RejoinPreviousChannel()
				else
					p_u_88.props.voiceChatServiceManager:ToggleMic("VRBottomBar")
				end
				if v_u_58 then
					local v101 = p_u_88.props.voiceState == Enum.VoiceChatState.Joined
					v_u_43.sendEventToTelemetryV2({
						["integrationId"] = v_u_44.ButtomName.Voice,
						["isToggleOn"] = v101,
						["source"] = v_u_44.Source.VRBottomBar
					})
				end
				v_u_1:ReportCounter("VR-BottomBar-Voice")
			end
		}
	end
	function p_u_88.getDebugYOffsetUp()
		-- upvalues: (copy) p_u_88
		return {
			["iconOn"] = "rbxasset://textures/ui/MenuBar/arrow_up.png",
			["iconOff"] = "rbxasset://textures/ui/MenuBar/arrow_up.png",
			["onActivated"] = nil,
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (ref) p_u_88
				p_u_88:setState({
					["yOffset"] = p_u_88.state.yOffset + 0.1
				})
			end
		}
	end
	function p_u_88.getDebugYOffsetDown()
		-- upvalues: (copy) p_u_88
		return {
			["iconOn"] = "rbxasset://textures/ui/MenuBar/arrow_down.png",
			["iconOff"] = "rbxasset://textures/ui/MenuBar/arrow_down.png",
			["onActivated"] = nil,
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (ref) p_u_88
				p_u_88:setState({
					["yOffset"] = p_u_88.state.yOffset - 0.1
				})
			end
		}
	end
	function p_u_88.getDebugZOffsetUp()
		-- upvalues: (copy) p_u_88
		return {
			["iconOn"] = "rbxasset://textures/ui/MenuBar/arrow_left.png",
			["iconOff"] = "rbxasset://textures/ui/MenuBar/arrow_left.png",
			["onActivated"] = nil,
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (ref) p_u_88
				p_u_88:setState({
					["zOffset"] = p_u_88.state.zOffset + 0.1
				})
			end
		}
	end
	function p_u_88.getDebugZOffsetDown()
		-- upvalues: (copy) p_u_88
		return {
			["iconOn"] = "rbxasset://textures/ui/MenuBar/arrow_right.png",
			["iconOff"] = "rbxasset://textures/ui/MenuBar/arrow_right.png",
			["onActivated"] = nil,
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (ref) p_u_88
				p_u_88:setState({
					["zOffset"] = p_u_88.state.zOffset - 0.1
				})
			end
		}
	end
	function p_u_88.getDebugTextLabel()
		-- upvalues: (copy) p_u_88, (ref) v_u_12
		return {
			["iconComponent"] = function(p102) -- name: iconComponent
				-- upvalues: (ref) p_u_88, (ref) v_u_12
				local v103 = p_u_88.state.yOffset
				local v104, v105, v106
				if v103 >= 0 then
					local v107 = v103 * 10 + 0.5
					v104 = math.floor(v107) / 10
					if v104 then
						v105 = p_u_88.state.zOffset
						if v105 < 0 then
							v110 = v105 * 10 - 0.5
							v109 = math.ceil(v110) / 10
							v111 = "Y " .. v104 .. ", Z " .. v109
							return v_u_12.createElement("TextLabel", {
								["BackgroundTransparency"] = 1,
								["Text"] = v111,
								["TextColor3"] = Color3.new(1, 1, 1),
								["TextWrapped"] = true,
								["TextScaled"] = true,
								["Size"] = UDim2.fromScale(1, 1),
								[v_u_12.Children] = p102[v_u_12.Children]
							})
						end
					else
						v106 = v103 * 10 - 0.5
						v104 = math.ceil(v106) / 10
						v105 = p_u_88.state.zOffset
						if v105 < 0 then
							v110 = v105 * 10 - 0.5
							v109 = math.ceil(v110) / 10
							v111 = "Y " .. v104 .. ", Z " .. v109
							return v_u_12.createElement("TextLabel", {
								["BackgroundTransparency"] = 1,
								["Text"] = v111,
								["TextColor3"] = Color3.new(1, 1, 1),
								["TextWrapped"] = true,
								["TextScaled"] = true,
								["Size"] = UDim2.fromScale(1, 1),
								[v_u_12.Children] = p102[v_u_12.Children]
							})
						end
					end
				else
					v106 = v103 * 10 - 0.5
					v104 = math.ceil(v106) / 10
					v105 = p_u_88.state.zOffset
					if v105 < 0 then
						v110 = v105 * 10 - 0.5
						v109 = math.ceil(v110) / 10
						v111 = "Y " .. v104 .. ", Z " .. v109
						return v_u_12.createElement("TextLabel", {
							["BackgroundTransparency"] = 1,
							["Text"] = v111,
							["TextColor3"] = Color3.new(1, 1, 1),
							["TextWrapped"] = true,
							["TextScaled"] = true,
							["Size"] = UDim2.fromScale(1, 1),
							[v_u_12.Children] = p102[v_u_12.Children]
						})
					end
				end
				local v108 = v105 * 10 + 0.5
				local v109 = math.floor(v108) / 10
				if v109 then
					v111 = "Y " .. v104 .. ", Z " .. v109
					return v_u_12.createElement("TextLabel", {
						["BackgroundTransparency"] = 1,
						["Text"] = v111,
						["TextColor3"] = Color3.new(1, 1, 1),
						["TextWrapped"] = true,
						["TextScaled"] = true,
						["Size"] = UDim2.fromScale(1, 1),
						[v_u_12.Children] = p102[v_u_12.Children]
					})
				end
				local v110 = v105 * 10 - 0.5
				v109 = math.ceil(v110) / 10
				local v111 = "Y " .. v104 .. ", Z " .. v109
				return v_u_12.createElement("TextLabel", {
					["BackgroundTransparency"] = 1,
					["Text"] = v111,
					["TextColor3"] = Color3.new(1, 1, 1),
					["TextWrapped"] = true,
					["TextScaled"] = true,
					["Size"] = UDim2.fromScale(1, 1),
					[v_u_12.Children] = p102[v_u_12.Children]
				})
			end,
			["itemSize"] = UDim2.new(0, 44, 0, 44)
		}
	end
	p_u_88:setState({
		["itemList"] = {
			v_u_62,
			v_u_82,
			v_u_64,
			v_u_82,
			v_u_78
		},
		["moreItemList"] = {}
	})
	function p_u_88.onShowTopBarChanged()
		-- upvalues: (ref) v_u_55, (ref) v_u_25, (copy) p_u_88
		if not v_u_55 then
			if not v_u_25.ShowTopBar then
				v_u_25:SetShowMoreMenu(false)
			end
			p_u_88:setState({
				["vrMenuOpen"] = v_u_25.ShowTopBar
			})
		end
	end
	function p_u_88.onShowMoreMenuChanged()
		-- upvalues: (copy) p_u_88, (ref) v_u_25
		p_u_88:setState({
			["moreMenuOpen"] = v_u_25.ShowMoreMenu
		})
	end
	function p_u_88.updateItemListState()
		-- upvalues: (copy) p_u_88
		local v112, v113 = p_u_88:updateItems()
		p_u_88:setState({
			["itemList"] = v112,
			["moreItemList"] = v113
		})
	end
	function p_u_88.onBackpackItemAdded()
		-- upvalues: (copy) p_u_88
		if not p_u_88.backpackHasItems then
			p_u_88.backpackHasItems = true
			p_u_88.updateItemListState()
		end
	end
	function p_u_88.onBackpackEmpty()
		-- upvalues: (copy) p_u_88
		if p_u_88.backpackHasItems then
			p_u_88.backpackHasItems = false
			p_u_88.updateItemListState()
		end
	end
	function p_u_88.onEmotesLoaded(p114)
		-- upvalues: (copy) p_u_88
		if p114 ~= p_u_88.emotesLoaded then
			p_u_88.emotesLoaded = p114
			p_u_88.updateItemListState()
		end
	end
	function p_u_88.onVREnabledChanged()
		-- upvalues: (copy) p_u_88, (ref) v_u_8, (ref) v_u_23, (ref) v_u_12
		local v115 = p_u_88
		local v116 = {}
		local v117
		if v_u_8.VREnabled then
			local v118 = v_u_23.Modules.VR.UserGui
			local v119 = require
			local v120
			v120, v117 = pcall(v119, v118)
			if not v120 then
				warn("Failure to Start CoreScript module " .. v118.Name .. ".\n" .. v117)
				v117 = nil
			end
			if v117 then
				v116.userGui = v117
				v115:setState(v116)
			else
				v117 = v_u_12.None
				v116.userGui = v117
				v115:setState(v116)
			end
		else
			v117 = v_u_12.None
			v116.userGui = v117
			v115:setState(v116)
			return
		end
	end
	function p_u_88.onRenderStepped()
		-- upvalues: (ref) v_u_26, (copy) p_u_88
		local v121 = v_u_26.GetUserCFrameWorldSpace(Enum.UserCFrame.Head).LookVector.Y > -0.2
		if p_u_88.state.lookAway ~= v121 then
			p_u_88:setState({
				["lookAway"] = v121
			})
		end
	end
	local v122, v123 = v_u_12.createBinding(0)
	p_u_88.fadeTransparency = v122
	p_u_88.setFadeTransparency = v123
	p_u_88.fadeTransparencyMotor = v_u_10.createSingleMotor(p_u_88.fadeTransparency:getValue())
	p_u_88.fadeTransparencyMotor:onStep(p_u_88.setFadeTransparency)
	p_u_88.fadeTransparencyMotor:setGoal(v_u_10.spring(0, v_u_60.Default))
	function p_u_88.getAlignedPanelPart()
		-- upvalues: (copy) p_u_88
		local v124
		if p_u_88.state.userGui then
			v124 = p_u_88.state.userGui:getPanel()
		else
			v124 = nil
		end
		local v125
		if v124 then
			v125 = v124:GetPart()
		else
			v125 = v124
		end
		local v126 = v125 and (v124:IsPositionLockedType() or v124:IsUIManagerManagedType())
		if v126 then
			v126 = v124:IsVisible() or v124.alwaysUpdatePosition
		end
		if v126 then
			return v125
		end
	end
	function p_u_88.bottomBarPanelOffsetCallback(p127)
		-- upvalues: (copy) p_u_88, (ref) v_u_26
		local v128 = p127.finalPosition
		local v129 = p127.cameraHeadScale
		local v130 = p_u_88.getAlignedPanelPart()
		if v130 then
			local v131 = p_u_88.state.yOffset
			local v132 = p_u_88.state.zOffset
			local v133 = v_u_26.GetUserCFrameWorldSpace(Enum.UserCFrame.Head)
			local v134 = CFrame.new(0, 0, v132 * v129 - v130.Size.Z * 0.5)
			local v135 = v130.CFrame:ToWorldSpace(v134)
			local v136 = v135.Position.X
			local v137 = v133.Position.Y + v131 * v129
			local v138 = v135.Position.Z
			v128 = Vector3.new(v136, v137, v138)
		end
		return v128
	end
	function p_u_88.moreMenuPanelOffsetCallback(p139)
		-- upvalues: (copy) p_u_88, (ref) v_u_26, (ref) v_u_57, (ref) v_u_52
		local v140 = p139.finalPosition
		local v141 = p139.cameraHeadScale
		local v142 = p_u_88.getAlignedPanelPart()
		if v142 then
			local v143 = p_u_88.bottomBarPanelOffsetCallback(p139)
			local v144 = v_u_26.GetUserCFrameWorldSpace(Enum.UserCFrame.Head)
			local v145 = CFrame.new(v143, v144.Position)
			local v146 = (0.2 + p_u_88.state.zOffset / 10) * v_u_57
			local v147 = v_u_52 and (#p_u_88.state.itemList - 3) / 2 * v146 or (#p_u_88.state.itemList - 2.5) / 2 * v146
			local v148 = v145:ToWorldSpace((CFrame.new(-v147 * v141, v146 / 2 * v141, -0.025)))
			v140 = (CFrame.new(v148.Position) * v142.CFrame.Rotation):ToWorldSpace((CFrame.new(0, #p_u_88.state.moreItemList * v146 / 2 * v141, 0.025))).Position
		end
		return v140
	end
	function p_u_88.moreMenuPanelTiltCallback(p149)
		-- upvalues: (copy) p_u_88
		local v150 = p149.panelCFrame
		local v151 = p_u_88.getAlignedPanelPart()
		if v151 then
			v150 = CFrame.new(v150.Position) * v151.CFrame.Rotation
		end
		return v150
	end
end
function v40.didMount(p152) -- name: didMount
	-- upvalues: (copy) v_u_45, (copy) v_u_48
	p152.emotesLoaded = v_u_45:isEmotesLoaded()
	p152.backpackHasItems = v_u_48.IsInventoryEmpty()
	p152.updateItemListState()
end
function v40.updateItems(p153) -- name: updateItems
	-- upvalues: (copy) v_u_7, (copy) v_u_55, (copy) v_u_62, (copy) v_u_82, (copy) v_u_52, (copy) v_u_64, (copy) v_u_50, (copy) v_u_72, (copy) v_u_27, (copy) v_u_87, (copy) v_u_25, (copy) v_u_74, (copy) v_u_76, (copy) v_u_79, (copy) v_u_78, (copy) v_u_83, (copy) v_u_84, (copy) v_u_85, (copy) v_u_81
	local v154 = v_u_7:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack)
	local v155 = v_u_7:GetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu)
	local v156 = v_u_7:GetCoreGuiEnabled(Enum.CoreGuiType.Chat)
	local v157 = v_u_7:GetCoreGuiEnabled(Enum.CoreGuiType.PlayerList)
	local v158
	if v_u_55 then
		local v159 = { v_u_62, v_u_82 }
		v158 = v_u_52 and {
			p153.getDebugYOffsetUp(),
			p153.getDebugYOffsetDown(),
			p153.getDebugZOffsetUp(),
			p153.getDebugZOffsetDown(),
			p153.getDebugTextLabel(),
			v_u_82,
			v_u_62,
			v_u_82
		} or v159
	else
		local v160 = { v_u_62, v_u_82, v_u_64 }
		v158 = v_u_52 and {
			p153.getDebugYOffsetUp(),
			p153.getDebugYOffsetDown(),
			p153.getDebugZOffsetUp(),
			p153.getDebugZOffsetDown(),
			p153.getDebugTextLabel(),
			v_u_82,
			v_u_62,
			v_u_82,
			v_u_64
		} or v160
	end
	if v155 then
		local v161 = v_u_50.UserEmotesEnabled
		if v161 then
			v161 = p153.emotesLoaded == false
		end
		v155 = not v161
	end
	if v154 then
		v154 = p153.backpackHasItems
	end
	if v156 then
		local v162 = v_u_72
		table.insert(v158, v162)
	end
	if v_u_27:ShouldShowJoinVoiceOnDisconnect() then
		local v163 = v_u_87
		table.insert(v158, v163)
	elseif v_u_27:ShouldShowJoinVoice() then
		local v164 = v_u_87
		table.insert(v158, v164)
	end
	if p153.props.voiceEnabled then
		local v165 = p153.getVoiceIcon
		table.insert(v158, v165())
	end
	local v166 = v_u_82
	table.insert(v158, v166)
	if v_u_25.SafetyBubble and v_u_25.SafetyBubble.enabled then
		local v167 = v_u_74
		table.insert(v158, v167)
	else
		local v168 = v_u_76
		table.insert(v158, v168)
	end
	if v_u_25.ShowHighlightedLeaveGameIcon then
		local v169 = v_u_79
		table.insert(v158, v169)
	else
		local v170 = v_u_78
		table.insert(v158, v170)
	end
	local v171 = {}
	if v155 then
		local v172 = v_u_83
		table.insert(v171, v172)
	end
	if v157 then
		local v173 = v_u_84
		table.insert(v171, v173)
	end
	if v154 then
		local v174 = v_u_85
		table.insert(v171, v174)
	end
	if #v171 > 0 then
		local v175 = v_u_81
		table.insert(v158, v175)
	end
	return v158, v171
end
function v40.renderWithStyle(p176, p177) -- name: renderWithStyle
	-- upvalues: (copy) v_u_57, (copy) v_u_52, (copy) v_u_12, (copy) v_u_18, (copy) v_u_55, (ref) v_u_30, (copy) v_u_19, (copy) v_u_51, (copy) v_u_4, (ref) v_u_32, (ref) v_u_31, (ref) v_u_33, (copy) v_u_16, (copy) v_u_17, (copy) v_u_15, (copy) v_u_20, (copy) v_u_29, (copy) v_u_25, (copy) v_u_7, (copy) v_u_48, (copy) v_u_45, (copy) v_u_6, (copy) v_u_8
	local v178 = (0.2 + p176.state.zOffset / 10) * v_u_57
	local v179 = p176.state.itemList
	local v180 = p176.state.moreItemList
	local v181 = v_u_52 and 7 or 1
	local v182
	if p176.state.vrMenuOpen then
		v182 = p176.state.moreMenuOpen and #v180 > 0 and #v179 or v181
	else
		v182 = v_u_52 and 9 or 3
	end
	local v183 = v_u_12.createFragment
	local v184 = {}
	local v185 = v_u_12.createElement
	local v186 = v_u_18
	local v187 = {
		["panelName"] = "BottomBar",
		["partSize"] = nil,
		["virtualScreenSize"] = nil,
		["offset"] = nil,
		["offsetCallback"] = nil,
		["lerp"] = true,
		["tilt"] = 0,
		["anchoring"] = nil,
		["faceCamera"] = true,
		["curvature"] = 0,
		["alwaysOnTop"] = nil,
		["parent"] = nil,
		["zOffset"] = 1,
		["connectPanelManagerFunction"] = nil
	}
	local v188
	if v_u_55 then
		v188 = Vector2.new((#v179 - 1) * v_u_30.BOTTOM_BAR_BASE_PART_SIZE * workspace.CurrentCamera.HeadScale, v_u_30.BOTTOM_BAR_BASE_PART_SIZE * workspace.CurrentCamera.HeadScale)
	else
		v188 = Vector2.new((#v179 - 1) * v178, v178)
	end
	v187.partSize = v188
	v187.virtualScreenSize = Vector2.new((#v179 - 1) * 50, 50)
	v187.offset = p176.state.vrMenuOpen and CFrame.new(0, 0, 0) or CFrame.new(0, -0.5, 0)
	v187.offsetCallback = p176.bottomBarPanelOffsetCallback
	local v189
	if v_u_55 then
		v189 = v_u_19.AnchoringTypes.PanelManaged
	else
		v189 = v_u_19.AnchoringTypes.Head
	end
	v187.anchoring = v189
	v187.alwaysOnTop = v_u_51 and true or nil
	v187.parent = v_u_51 and v_u_4.CoreGuiFolder or nil
	v187.connectPanelManagerFunction = v_u_55 and function(p190)
		-- upvalues: (ref) v_u_32, (ref) v_u_31, (ref) v_u_33
		if p190 then
			v_u_32(p190, v_u_31.BottomBar)
		else
			v_u_33.getInstance():removeRoactPanel(v_u_31.BottomBar)
		end
	end or nil
	v184.BottomBarPanel3D = v185(v186, v187, {
		["CanvasGroup"] = v_u_12.createElement("CanvasGroup", {
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["GroupTransparency"] = nil,
			["Size"] = nil,
			["GroupTransparency"] = p176.fadeTransparency,
			["Size"] = UDim2.new(1, 0, 1, 0)
		}, {
			["SystemBar"] = v_u_12.createElement(v_u_16, {
				["itemList"] = nil,
				["selection"] = nil,
				["placement"] = nil,
				["hidden"] = nil,
				["onSafeAreaChanged"] = nil,
				["size"] = nil,
				["position"] = nil,
				["layoutOrder"] = 1,
				["roundCorners"] = true,
				["buttonStroke"] = true,
				["bgTransparency"] = 0,
				["sortOrder"] = nil,
				["itemList"] = v179,
				["selection"] = v182,
				["placement"] = v_u_17.Bottom,
				["hidden"] = p176.state.hidden,
				["onSafeAreaChanged"] = function() -- name: onSafeAreaChanged end,
				["size"] = UDim2.new(1, 0, 1, 0),
				["position"] = UDim2.new(),
				["sortOrder"] = Enum.SortOrder.LayoutOrder
			})
		})
	})
	local v191 = p176.state.moreMenuOpen
	if v191 then
		local v192 = v_u_12.createElement
		local v193 = v_u_18
		local v194 = {
			["panelName"] = "MoreMenu",
			["partSize"] = nil,
			["virtualScreenSize"] = nil,
			["offset"] = nil,
			["offsetCallback"] = nil,
			["lerp"] = true,
			["tilt"] = 0,
			["tiltCallback"] = nil,
			["anchoring"] = nil,
			["faceCamera"] = true,
			["alwaysOnTop"] = nil,
			["parent"] = nil,
			["connectPanelManagerFunction"] = nil,
			["zOffset"] = 2
		}
		local v195
		if v_u_55 then
			v195 = Vector2.new(5 * v_u_30.BOTTOM_BAR_BASE_PART_SIZE * workspace.CurrentCamera.HeadScale, #v180 * v_u_30.BOTTOM_BAR_BASE_PART_SIZE * workspace.CurrentCamera.HeadScale)
		else
			v195 = Vector2.new(5 * v178, #v180 * v178)
		end
		v194.partSize = v195
		v194.virtualScreenSize = Vector2.new(250, #v180 * 56 + 8)
		v194.offset = p176.state.vrMenuOpen and CFrame.new(0, 0, 0) or CFrame.new(0, -0.5, 0)
		v194.offsetCallback = p176.moreMenuPanelOffsetCallback
		v194.tiltCallback = p176.moreMenuPanelTiltCallback
		local v196
		if v_u_55 then
			v196 = v_u_19.AnchoringTypes.PanelManaged
		else
			v196 = v_u_19.AnchoringTypes.Head
		end
		v194.anchoring = v196
		v194.alwaysOnTop = v_u_51 and true or nil
		v194.parent = v_u_51 and v_u_4.CoreGuiFolder or nil
		v194.connectPanelManagerFunction = v_u_55 and function(p197)
			-- upvalues: (ref) v_u_32, (ref) v_u_31, (ref) v_u_33
			if p197 then
				v_u_32(p197, v_u_31.MoreMenu)
			else
				v_u_33.getInstance():removeRoactPanel(v_u_31.MoreMenu)
			end
		end or nil
		v191 = v192(v193, v194, {
			["Content"] = v_u_12.createElement("Frame", {
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["Size"] = UDim2.new(1, 0, 1, 0)
			}, {
				["MoreMenu"] = v_u_12.createElement(v_u_15, {
					["anchorPoint"] = Vector2.new(0.5, 1),
					["buttonProps"] = v180,
					["position"] = UDim2.new(0.5, 0, 1, -8),
					["background"] = p177.Theme.BackgroundContrast
				}),
				["Caret"] = v_u_12.createElement(v_u_20, {
					["AnchorPoint"] = nil,
					["BackgroundTransparency"] = 1,
					["Image"] = "rbxasset://textures/ui/MenuBar/dropdown-arrow.png",
					["ImageColor3"] = nil,
					["Position"] = nil,
					["Size"] = nil,
					["AnchorPoint"] = Vector2.new(0.5, 1),
					["ImageColor3"] = Color3.fromRGB(25, 27, 29),
					["Position"] = UDim2.new(0.5, 0, 1, 0),
					["Size"] = UDim2.new(0, 24, 0, 10)
				})
			})
		})
	end
	v184.MoreMenuPanel3D = v191
	v184.ShowHighlightedLeaveGameIconToggled = v_u_12.createElement(v_u_29, {
		["event"] = v_u_25.ShowHighlightedLeaveGameIconToggled.Event,
		["callback"] = p176.updateItemListState
	})
	v184.ShowTopBarChanged = v_u_12.createElement(v_u_29, {
		["event"] = v_u_25.ShowTopBarChanged.Event,
		["callback"] = p176.onShowTopBarChanged
	})
	v184.ShowMoreMenuChanged = v_u_12.createElement(v_u_29, {
		["event"] = v_u_25.ShowMoreMenuChanged.Event,
		["callback"] = p176.onShowMoreMenuChanged
	})
	v184.CoreGuiChanged = v_u_12.createElement(v_u_29, {
		["event"] = v_u_7.CoreGuiChangedSignal,
		["callback"] = p176.updateItemListState
	})
	local v198 = v_u_25.SafetyBubble
	if v198 then
		v198 = v_u_12.createElement(v_u_29, {
			["event"] = v_u_25.SafetyBubble.Toggled.Event,
			["callback"] = p176.updateItemListState
		})
	end
	v184.SafetyBubbleToggled = v198
	v184.BackpackItemAdded = v_u_12.createElement(v_u_29, {
		["event"] = v_u_48.BackpackItemAdded.Event,
		["callback"] = p176.onBackpackItemAdded
	})
	v184.BackpackEmpty = v_u_12.createElement(v_u_29, {
		["event"] = v_u_48.BackpackEmpty.Event,
		["callback"] = p176.onBackpackEmpty
	})
	v184.EmotesLoaded = v_u_12.createElement(v_u_29, {
		["event"] = v_u_45.EmotesLoaded.Event,
		["callback"] = p176.onEmotesLoaded
	})
	v184.RenderStepped = v_u_12.createElement(v_u_29, {
		["event"] = v_u_6.RenderStepped,
		["callback"] = p176.onRenderStepped
	})
	v184.VREnabled = v_u_12.createElement(v_u_29, {
		["event"] = v_u_8:GetPropertyChangedSignal("VREnabled"),
		["callback"] = p176.onVREnabledChanged
	})
	return v183(v184)
end
function v40.render(p_u_199) -- name: render
	-- upvalues: (copy) v_u_21
	return v_u_21(function(p200)
		-- upvalues: (copy) p_u_199
		return p_u_199:renderWithStyle(p200)
	end)
end
function v40.didUpdate(p201, p202, p203) -- name: didUpdate
	-- upvalues: (copy) v_u_10, (copy) v_u_60, (copy) v_u_25
	if p203.lookAway ~= p201.state.lookAway or p203.vrMenuOpen ~= p201.state.vrMenuOpen then
		local v204 = not p201.state.vrMenuOpen
		if v204 then
			v204 = p201.state.lookAway
		end
		if v204 then
			p201.fadeTransparencyMotor:setGoal(v_u_10.spring(1, v_u_60.Slower))
		else
			p201.fadeTransparencyMotor:setGoal(v_u_10.spring(0, v_u_60.Default))
		end
	end
	if p201.state.moreMenuOpen and #p201.state.moreItemList == 0 then
		v_u_25:SetShowMoreMenu(false)
	end
	if p202.voiceEnabled == p201.props.voiceEnabled then
		if p203.yOffset ~= p201.state.yOffset or p203.zOffset ~= p201.state.zOffset then
			p201.updateItemListState()
		end
	else
		p201.updateItemListState()
	end
end
function v40.willUnmount(p205) -- name: willUnmount
	p205.fadeTransparencyMotor:stop()
end
return v13.UNSTABLE_connect2(nil, nil)(v40)