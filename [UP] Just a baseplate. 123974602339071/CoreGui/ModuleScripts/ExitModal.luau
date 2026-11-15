-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ExitModal
local v_u_1 = game:GetService("CoreGui")
local v_u_2 = game:GetService("ContextActionService")
local v_u_3 = v_u_1:WaitForChild("RobloxGui")
local v_u_4 = game:GetService("GuiService")
local v_u_5 = game:GetService("RunService")
local v6 = game:GetService("CorePackages")
local v_u_7 = game:GetService("LocalizationService")
local v_u_8 = game:GetService("Players")
local v9 = v6.Workspace.Packages.SharedFlags
local v_u_10 = require(v9).GetFFlagGateEducationalPopupVisibilityViaGUAC
local v_u_11 = require(v6.Workspace.Packages.InExperienceCapabilities).InExperienceCapabilities
local v_u_12 = require(v6.Workspace.Packages.InExperienceSideSheetUtils.isSideSheetEnabled)
local v_u_13 = require(v9).FFlagSurvBloxEventTypeEnabled
local v_u_14
if v_u_12 then
	v_u_14 = require(v6.Workspace.Packages.InExperienceSideSheet).toggleSideSheet
else
	v_u_14 = nil
end
local v_u_15 = v_u_4:GetNotificationTypeList()
local v_u_16 = require(v6.Packages.Roact)
local v17 = require(v6.Workspace.Packages.LinkingProtocol)
local v_u_18 = v17.Enums.DeepLinkSource
local v_u_19 = v17.LinkingProtocol
local v_u_20 = require(v6.Workspace.Packages.InExperienceLocales).Localization
local v_u_21 = require(v_u_3.Modules.InGameMenu.Utility.SendAnalytics)
local v_u_22 = require(v_u_3.Modules.InGameMenu.Utility.UserLocalStore)
local v_u_23 = require(v6.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel
local v_u_24 = require(v6.Workspace.Packages.OnPlatformSurveys.SurveyEventPublisher)
local v_u_25 = require(v6.Workspace.Packages.OnPlatformSurveys.WebViewEventType)
local v_u_26 = require(v6.Workspace.Packages.MessageBus).MessageBus
local v27 = require(v6.Packages.InGameMenuDependencies).UIBlox
local v_u_28 = v27.App.ImageSet.Images
local v_u_29 = v27.App.Dialog.Modal.EducationalModal
local v_u_30 = require(v_u_3.Modules.Common.renderWithCoreScriptsStyleProvider)
local v_u_31 = nil
local v_u_32 = require(v_u_3.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local v_u_33 = require(v_u_3.Modules.Flags.GetFIntEducationalPopupDisplayMaxCount)
v_u_31 = (function() -- name: Initialize
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_21, (copy) v_u_5, (copy) v_u_23, (copy) v_u_15, (copy) v_u_19, (copy) v_u_18, (ref) v_u_31, (copy) v_u_22, (copy) v_u_33, (copy) v_u_20, (copy) v_u_7, (copy) v_u_16, (copy) v_u_29, (copy) v_u_28, (copy) v_u_1, (copy) v_u_13, (copy) v_u_24, (copy) v_u_25, (copy) v_u_8, (copy) v_u_26, (copy) v_u_32, (copy) v_u_30
	local v_u_34 = require(v_u_3.Modules.Settings.SettingsPageFactory):CreateNewPage()
	function v_u_34.LeaveAppFunc(p35)
		-- upvalues: (ref) v_u_4, (ref) v_u_21, (ref) v_u_5, (ref) v_u_23, (ref) v_u_15
		v_u_4.SelectedCoreObject = nil
		v_u_21("educational_popup", "educational_close_app", {
			["source"] = p35 and "Native" or "Button"
		})
		v_u_5.RenderStepped:wait()
		v_u_5.RenderStepped:wait()
		settings().Rendering.QualityLevel = v_u_23()
		v_u_4:BroadcastNotification("", v_u_15.NATIVE_EXIT)
	end
	function v_u_34.LeaveGameFunc(p36)
		-- upvalues: (ref) v_u_4, (ref) v_u_21, (ref) v_u_19, (ref) v_u_18, (ref) v_u_5, (ref) v_u_23
		v_u_4.SelectedCoreObject = nil
		v_u_21("educational_popup", "educational_confirmed", {
			["source"] = p36 and "Gamepad" or "Button"
		})
		if v_u_19.default:isInternalDlicEnabled() then
			local v37 = v_u_19.default:createInternalDlic("roblox://navigation/home", v_u_18.LuaInternal)
			v_u_19.default:detectDeeplinkIntent(v37)
		else
			v_u_19.default:detectURL("roblox://navigation/home")
		end
		v_u_5.RenderStepped:wait()
		v_u_5.RenderStepped:wait()
		game:Shutdown()
		settings().Rendering.QualityLevel = v_u_23()
	end
	function v_u_34.LeaveGameFromHotkey(_, p38, p39)
		-- upvalues: (copy) v_u_34
		if p38 == Enum.UserInputState.Begin then
			local v40 = (p39.UserInputType == Enum.UserInputType.Gamepad1 or (p39.UserInputType == Enum.UserInputType.Gamepad2 or p39.UserInputType == Enum.UserInputType.Gamepad3)) and true or p39.UserInputType == Enum.UserInputType.Gamepad4
			v_u_34.LeaveGameFunc(v40)
		end
	end
	function v_u_34.DontLeaveFunc(p41)
		-- upvalues: (ref) v_u_31, (copy) v_u_34
		v_u_31.dismissedFrom = p41 and "Gamepad" or "Button"
		if v_u_34.HubRef then
			v_u_34.HubRef:PopMenu(p41, true)
		end
	end
	function v_u_34.DontLeaveFromHotkey(_, p42, p43)
		-- upvalues: (copy) v_u_34
		if p42 == Enum.UserInputState.Begin then
			local v44 = (p43.UserInputType == Enum.UserInputType.Gamepad1 or (p43.UserInputType == Enum.UserInputType.Gamepad2 or p43.UserInputType == Enum.UserInputType.Gamepad3)) and true or p43.UserInputType == Enum.UserInputType.Gamepad4
			v_u_34.DontLeaveFunc(v44)
		end
	end
	function v_u_34.DontShowAgain()
		-- upvalues: (ref) v_u_22
		local v45 = v_u_22.new()
		v45:SetItem("NativeCloseLuaPromptDisplayCount", (tostring((1 / 0))))
		v45:Flush()
	end
	function v_u_34.ShouldShow()
		-- upvalues: (ref) v_u_22, (ref) v_u_33
		local v46 = v_u_22.new()
		local v47 = tonumber(v46:GetItem("NativeCloseLuaPromptDisplayCount"))
		if v_u_33() < v47 then
			return false
		end
		local v48 = v47 + 1
		v46:SetItem("NativeCloseLuaPromptDisplayCount", (tostring(v48)))
		v46:Flush()
		return true
	end
	v_u_34.TabHeader = nil
	v_u_34.Page.Name = "ExitModalPage"
	v_u_34.ShouldShowBottomBar = false
	v_u_34.ShouldShowHubBar = false
	v_u_34.IsPageClipped = false
	v_u_34.Page.Size = UDim2.new(1, 0, 0, 1)
	local v_u_49 = v_u_20.new(v_u_7.RobloxLocaleId)
	local function v_u_60() -- name: ExitModal
		-- upvalues: (copy) v_u_49, (ref) v_u_7, (ref) v_u_16, (ref) v_u_29, (ref) v_u_28, (ref) v_u_1, (copy) v_u_34, (ref) v_u_13, (ref) v_u_24, (ref) v_u_25, (ref) v_u_8, (ref) v_u_26, (ref) v_u_32, (ref) v_u_30
		v_u_49:SetLocale(v_u_7.RobloxLocaleId)
		local v50 = {
			["title"] = v_u_49:Format("CoreScripts.InGameMenu.ExitModal.Title"),
			["subtitle"] = v_u_49:Format("CoreScripts.InGameMenu.ExitModal.Subtitle"),
			["bodyTextOpenMenu"] = v_u_49:Format("CoreScripts.InGameMenu.ExitModal.BodyTextOpenMenu"),
			["bodyTextClickHome"] = v_u_49:Format("CoreScripts.InGameMenu.ExitModal.BodyTextClickHome"),
			["optionDontShow"] = v_u_49:Format("CoreScripts.InGameMenu.ExitModal.OptionDontShow"),
			["actionExit"] = v_u_49:Format("CoreScripts.InGameMenu.ExitModal.ActionExit"),
			["actionHome"] = v_u_49:Format("CoreScripts.InGameMenu.ExitModal.ActionHome")
		}
		local v51 = {}
		local v52 = v_u_16.createElement
		local v53 = v_u_29
		local v59 = {
			["bodyContents"] = nil,
			["hasDoNotShow"] = true,
			["cancelText"] = nil,
			["confirmText"] = nil,
			["doNotShowText"] = nil,
			["titleBackgroundImageProps"] = nil,
			["screenSize"] = nil,
			["onDismiss"] = nil,
			["onCancel"] = nil,
			["onConfirm"] = nil,
			["bodyContents"] = {
				{
					["text"] = nil,
					["isSystemMenuIcon"] = true,
					["text"] = v50.bodyTextOpenMenu
				},
				{
					["icon"] = v_u_28["icons/menu/home_off"],
					["text"] = v50.bodyTextClickHome
				}
			},
			["cancelText"] = v50.actionExit,
			["confirmText"] = v50.actionHome,
			["doNotShowText"] = v50.optionDontShow,
			["titleBackgroundImageProps"] = {
				["image"] = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground_05202026.jpg",
				["imageHeight"] = 200,
				["text"] = nil,
				["text"] = "<font face=\"GothamBlack\" size=\"42\">" .. v50.title .. "</font><font size=\"4\"><br /></font><br />" .. v50.subtitle
			},
			["screenSize"] = v_u_1.RobloxGui.AbsoluteSize,
			["onDismiss"] = function() -- name: onDismiss
				-- upvalues: (ref) v_u_34
				v_u_34.DontLeaveFunc(false)
			end,
			["onCancel"] = function(p54) -- name: onCancel
				-- upvalues: (ref) v_u_34
				if p54 then
					v_u_34.DontShowAgain()
				end
				v_u_34.LeaveAppFunc(false)
			end,
			["onConfirm"] = function(p55) -- name: onConfirm
				-- upvalues: (ref) v_u_34, (ref) v_u_13, (ref) v_u_24, (ref) v_u_25, (ref) v_u_8, (ref) v_u_26, (ref) v_u_32
				if p55 then
					v_u_34.DontShowAgain()
				end
				v_u_34.LeaveGameFunc(false)
				if v_u_13 then
					v_u_24.publishSurveyEvent(v_u_25.LeaveButtonClick)
				else
					local v56 = {
						["chromeSeenCount"] = tostring(0)
					}
					local v57 = v_u_8.LocalPlayer.UserId
					local v58 = tostring(v57)
					v_u_26.publish(v_u_32.OnSurveyEventDescriptor, {
						["eventType"] = v_u_32.SurveyEventType,
						["userId"] = v58,
						["customProps"] = v56
					})
				end
			end
		}
		__set_list(v51, 1, {v52(v53, v59)})
		return v_u_30(v51)
	end
	local v_u_61 = v_u_16.mount(v_u_60(), v_u_34.Page, "ExitModal")
	local v_u_62 = false
	local function v63()
		-- upvalues: (ref) v_u_62, (ref) v_u_61, (ref) v_u_16, (copy) v_u_60
		if not v_u_62 then
			v_u_62 = true
			task.delay(1, function()
				-- upvalues: (ref) v_u_62, (ref) v_u_61, (ref) v_u_16, (ref) v_u_60
				v_u_62 = false
				v_u_61 = v_u_16.update(v_u_61, v_u_60())
			end)
		end
	end
	v_u_7:GetPropertyChangedSignal("RobloxLocaleId"):Connect(v63)
	v_u_1.RobloxGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(v63)
	return v_u_34
end)()
v_u_31.Displayed.Event:connect(function()
	-- upvalues: (ref) v_u_31, (copy) v_u_10, (copy) v_u_11, (copy) v_u_2, (copy) v_u_12, (ref) v_u_14
	if not v_u_31.ShouldShow() or v_u_10() and not v_u_11.canViewEducationalPopup then
		v_u_31.LeaveAppFunc(true)
	end
	v_u_31.dismissedFrom = "Menu"
	v_u_2:BindCoreAction("LeaveGameAction", v_u_31.LeaveGameFromHotkey, false, Enum.KeyCode.ButtonA)
	v_u_2:BindCoreAction("DontLeaveAction", v_u_31.DontLeaveFromHotkey, false, Enum.KeyCode.ButtonB)
	if v_u_12 then
		v_u_14(false)
	end
end)
v_u_31.Hidden.Event:connect(function()
	-- upvalues: (ref) v_u_31, (copy) v_u_21, (copy) v_u_2
	if v_u_31.dismissedFrom then
		v_u_21("educational_popup", "educational_dismiss_prompt", {
			["source"] = v_u_31.dismissedFrom
		})
		v_u_31.dismissedFrom = nil
	end
	v_u_2:UnbindCoreAction("LeaveGameAction")
	v_u_2:UnbindCoreAction("DontLeaveAction")
end)
return v_u_31