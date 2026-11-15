-- Path: CoreGui.RobloxGui.Modules.InGameMenu
local v_u_1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("LocalizationService")
local v_u_4 = game:GetService("GuiService")
local v5 = v_u_1:WaitForChild("RobloxGui")
local v6 = require(v2.Packages.InGameMenuDependencies)
local v_u_7 = v6.Roact
local v_u_8 = v6.RoactRodux
local v9 = v6.UIBlox
local v_u_10 = require(v2.Workspace.Packages.InteractionFeedback).FeedbackManagerInjectionContextProvider
local v_u_11 = require(v2.Workspace.Packages.RobloxAppInteractionFeedbackConfig).AppInteractionFeedbackProvider
local v_u_12 = require(v2.Workspace.Packages.InExperienceLocales).Localization
local v_u_13 = require(v2.Workspace.Packages.Localization).LocalizationProvider
local v_u_14 = v9.App.SelectionImage.SelectionCursorProvider
local v_u_15 = require(v5.Modules.Common.renderWithCoreScriptsStyleProvider)
local v_u_16 = require(script.SetupFunctions.bindMenuActions)
local v_u_17 = require(script.SetupFunctions.registerSetCores)
local v_u_18 = require(script.SetupFunctions.requestGameNameAndDescription)
local v19 = require(script.createStore)
local v_u_20 = require(script.Components.App)
local v_u_21 = require(script.Components.Connection.FocusHandlerUtils.FocusHandlerContextProvider)
local v_u_22 = require(v5.Modules.VoiceChat.initVoiceChatStore)
local v_u_23 = require(v5.Modules.TrustAndSafety)
local v_u_24 = require(script.Actions.SetLocaleId)
local v_u_25 = require(script.Actions.SetInspectMenuEnabled)
local v_u_26 = require(script.Actions.SetCurrentPage)
local v_u_27 = require(script.Actions.SetScreenSize)
local v_u_28 = require(script.Actions.SetMenuIconTooltipOpen)
local v_u_29 = require(script.Actions.SetRespawning)
local v_u_30 = require(script.Thunks.OpenMenu)
local v_u_31 = require(script.Thunks.CloseMenu)
local v_u_32 = require(script.InGameMenuPolicy)
local v_u_33 = require(script.GlobalConfig)
local v_u_34 = require(script.Resources.Constants)
local v_u_35 = require(script.Flags.GetFFlagIGMGamepadSelectionHistory)
local v_u_36 = Instance.new("BindableEvent")
local v_u_37 = Instance.new("BindableEvent")
local v_u_38 = v19()
return {
	["mountInGameMenu"] = function() -- name: mountInGameMenu
		-- upvalues: (copy) v_u_17, (copy) v_u_38, (copy) v_u_16, (copy) v_u_18, (copy) v_u_33, (copy) v_u_7, (copy) v_u_36, (copy) v_u_37, (copy) v_u_12, (copy) v_u_3, (copy) v_u_24, (copy) v_u_25, (copy) v_u_4, (copy) v_u_22, (copy) v_u_15, (copy) v_u_13, (copy) v_u_14, (copy) v_u_35, (copy) v_u_21, (copy) v_u_20, (copy) v_u_11, (copy) v_u_10, (copy) v_u_34, (copy) v_u_27, (copy) v_u_8, (copy) v_u_32, (copy) v_u_1
		v_u_17(v_u_38)
		v_u_16(v_u_38)
		v_u_18(v_u_38)
		if v_u_33.propValidation then
			v_u_7.setGlobalConfig({
				["propValidation"] = true
			})
		end
		if v_u_33.elementTracing then
			v_u_7.setGlobalConfig({
				["elementTracing"] = true
			})
		end
		v_u_38.changed:connect(function(p39, p40)
			-- upvalues: (ref) v_u_36, (ref) v_u_37
			if p39.isMenuOpen ~= p40.isMenuOpen then
				v_u_36:Fire(p39.isMenuOpen)
			end
			local v41 = p39.respawn.enabled
			local v42 = p40.respawn.enabled
			local v43 = p39.respawn.customCallback
			local v44 = p40.respawn.customCallback
			if v41 ~= v42 and v43 ~= v44 then
				v_u_37:Fire(v41, v43)
			end
		end)
		local v_u_45 = v_u_12.new(v_u_3.RobloxLocaleId)
		v_u_38:dispatch(v_u_24(v_u_3.RobloxLocaleId))
		v_u_3:GetPropertyChangedSignal("RobloxLocaleId"):Connect(function()
			-- upvalues: (copy) v_u_45, (ref) v_u_3, (ref) v_u_38, (ref) v_u_24
			v_u_45:SetLocale(v_u_3.RobloxLocaleId)
			v_u_38:dispatch(v_u_24(v_u_3.RobloxLocaleId))
		end)
		v_u_38:dispatch(v_u_25(v_u_4:GetInspectMenuEnabled()))
		v_u_4.InspectMenuEnabledChangedSignal:Connect(function(p46)
			-- upvalues: (ref) v_u_38, (ref) v_u_25
			v_u_38:dispatch(v_u_25(p46))
		end)
		v_u_22(v_u_38)
		local v47 = v_u_15
		local v48 = {}
		local v49 = v_u_7.createElement
		local v50 = v_u_13
		local v51 = {
			["localization"] = v_u_45
		}
		local v52 = {}
		local v53 = v_u_7.createElement
		local v54 = v_u_14
		local v55 = {}
		local v56 = {}
		local v57
		if v_u_35() then
			v57 = v_u_7.createElement(v_u_21, {}, {
				["InGameMenu"] = v_u_7.createElement(v_u_20)
			}) or nil
		else
			v57 = nil
		end
		v56.FocusHandlerContextProvider = v57
		local v58
		if v_u_35() then
			v58 = nil
		else
			v58 = v_u_7.createElement(v_u_20) or nil
		end
		v56.InGameMenu = v58
		v52.CursorProvider = v53(v54, v55, v56)
		v48.LocalizationProvider = v49(v50, v51, v52)
		local v59 = v47(v48)
		local v60 = v_u_7.createElement(v_u_11, {}, {
			["tree"] = v_u_7.createElement(v_u_10, nil, {
				["tree"] = v59
			})
		})
		local v62 = v_u_7.createElement("ScreenGui", {
			["ResetOnSpawn"] = false,
			["IgnoreGuiInset"] = true,
			["DisplayOrder"] = v_u_34.DisplayOrder.RootMenu,
			["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling,
			["AutoLocalize"] = false,
			[v_u_7.Change.AbsoluteSize] = function(p61)
				-- upvalues: (ref) v_u_38, (ref) v_u_27
				v_u_38:dispatch(v_u_27(p61.AbsoluteSize))
			end
		}, {
			["StoreProvider"] = v_u_7.createElement(v_u_8.StoreProvider, {
				["store"] = v_u_38
			}, {
				["PolicyProvider"] = v_u_7.createElement(v_u_32.Provider, {
					["policy"] = { v_u_32.Mapper }
				}, {
					["ThemeProvider"] = v60
				})
			})
		})
		v_u_7.mount(v62, v_u_1, "InGameMenu")
	end,
	["openInGameMenu"] = function(p63) -- name: openInGameMenu
		-- upvalues: (copy) v_u_38, (copy) v_u_30, (copy) v_u_34
		v_u_38:dispatch(v_u_30(v_u_34.AnalyticsMenuOpenTypes.TopbarButton, p63))
	end,
	["closeInGameMenu"] = function() -- name: closeInGameMenu
		-- upvalues: (copy) v_u_31, (copy) v_u_38
		v_u_31(v_u_38)
	end,
	["openReportDialog"] = function(p64, p65) -- name: openReportDialog
		-- upvalues: (copy) v_u_38, (copy) v_u_30, (copy) v_u_34, (copy) v_u_23
		v_u_38:dispatch(v_u_30(v_u_34.AnalyticsMenuOpenTypes.ReportAbuseTriggered, v_u_34.ReportDialogKey))
		if p65 == nil then
			p65 = v_u_34.AnalyticsInGameMenuName
		end
		v_u_23.openReportDialogForPlayer(p64, p65)
	end,
	["openGameSettingsPage"] = function() -- name: openGameSettingsPage
		-- upvalues: (copy) v_u_38, (copy) v_u_30, (copy) v_u_34, (copy) v_u_26
		v_u_38:dispatch(v_u_30(v_u_34.AnalyticsMenuOpenTypes.SettingsTriggered))
		v_u_38:dispatch(v_u_26("GameSettings"))
	end,
	["openGameLeavePage"] = function() -- name: openGameLeavePage
		-- upvalues: (copy) v_u_38, (copy) v_u_30, (copy) v_u_34, (copy) v_u_26
		v_u_38:dispatch(v_u_30(v_u_34.AnalyticsMenuOpenTypes.GamepadLeaveGame))
		v_u_38:dispatch(v_u_26(v_u_34.LeaveGamePromptPageKey))
	end,
	["openCharacterResetPage"] = function() -- name: openCharacterResetPage
		-- upvalues: (copy) v_u_38, (copy) v_u_30, (copy) v_u_34, (copy) v_u_26, (copy) v_u_29
		v_u_38:dispatch(v_u_30(v_u_34.AnalyticsMenuOpenTypes.GamepadResetCharacter))
		v_u_38:dispatch(v_u_26(v_u_34.MainPagePageKey))
		v_u_38:dispatch(v_u_29(true))
	end,
	["openPlayersPage"] = function() -- name: openPlayersPage
		-- upvalues: (copy) v_u_38, (copy) v_u_30, (copy) v_u_34, (copy) v_u_26
		v_u_38:dispatch(v_u_30(v_u_34.AnalyticsMenuOpenTypes.PlayersTriggered))
		v_u_38:dispatch(v_u_26("Players"))
	end,
	["getOpenChangedEvent"] = function() -- name: getOpenChangedEvent
		-- upvalues: (copy) v_u_36
		return v_u_36
	end,
	["getOpen"] = function() -- name: getOpen
		-- upvalues: (copy) v_u_38
		return v_u_38:getState().isMenuOpen
	end,
	["getRespawnBehaviour"] = function() -- name: getRespawnBehaviour
		-- upvalues: (copy) v_u_38
		local v66 = v_u_38:getState()
		return v66.respawn.enabled, v66.respawn.customCallback
	end,
	["getRespawnBehaviourChangedEvent"] = function() -- name: getRespawnBehaviourChangedEvent
		-- upvalues: (copy) v_u_37
		return v_u_37
	end,
	["setMenuIconTooltipOpen"] = function(p67) -- name: setMenuIconTooltipOpen
		-- upvalues: (copy) v_u_38, (copy) v_u_28
		v_u_38:dispatch(v_u_28(p67))
	end
}