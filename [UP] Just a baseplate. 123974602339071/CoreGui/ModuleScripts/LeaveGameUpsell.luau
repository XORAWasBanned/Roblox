-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.LeaveGameUpsell.LeaveGameUpsell
local v1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("ContextActionService")
local v_u_4 = v1:WaitForChild("RobloxGui")
local v_u_5 = game:GetService("GuiService")
local v_u_6 = game:GetService("RbxAnalyticsService")
local v_u_7 = require(v_u_4.Modules.VoiceChat.VoiceChatServiceManager).default
local v_u_8 = require(v_u_4.Modules.VoiceChat.Constants)
local v_u_9 = require(v2.Packages.Roact)
local v_u_10 = require(v2.Packages.React)
local v11 = require(v2.Packages.UIBlox)
local v_u_12 = v11.App.Text.StyledTextLabel
local v_u_13 = v11.App.Button.Button
local v_u_14 = v11.App.Button.ButtonStack
local v_u_15 = v11.App.Button.Enum.ButtonType
local v_u_16 = v11.Core.Style.useStyle
local v_u_17 = require(v2.Workspace.Packages.PhoneUpsell).PhoneLegalDisclaimer
local v_u_18 = require(v2.Workspace.Packages.InExperienceContainer).InExperienceProviderContainer
local v_u_19 = require(v2.Workspace.Packages.PhoneUpsell).Http.Requests.PostPhoneUpsellDisplayed
local v_u_20 = require(v2.Workspace.Packages.PhoneUpsell).PhoneUpsellController
local v_u_21 = require(v2.Workspace.Packages.PhoneUpsell).Constants
local v_u_22 = require(v2.Workspace.Packages.RoactServiceTags).RoactNetworking
local v_u_23 = require(v2.Workspace.Packages.UniversalAppPolicy).useAppPolicy
local v_u_24 = require(v2.Workspace.Packages.Localization).Hooks.useLocalization
local v_u_25 = require(v2.Workspace.Packages.RobloxAppHooks).useRoactService
local v_u_26 = require(v2.Workspace.Packages.RoactUtils).Hooks.useInputType
local v_u_27 = require(v2.Workspace.Packages.InputType).InputTypeConstants
local v_u_28 = require(v2.Packages.ReactUtils).useEventConnection
local v_u_29 = require(v2.Workspace.Packages.Analytics).getPlatformTarget
local v_u_30 = require(v2.Workspace.Packages.AuthAnalytics).EventStreamConstants
local v_u_31 = require(v_u_4.Modules.Settings.leaveGame)
local v_u_32 = require(v2.Workspace.Packages.SharedFlags).GetFFlagDisablePVUpsellDataConsent
local v_u_33 = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local v_u_34 = require(v2.Workspace.Packages.SharedFlags).GetFFlagAddMorePhoneUpsellEvents
v_u_4:WaitForChild("Modules"):WaitForChild("TenFootInterface")
local v_u_35 = require(v_u_4.Modules:WaitForChild("InGameMenu"):WaitForChild("Resources"):WaitForChild("Constants"))
local v107 = (function() -- name: Initialize
	-- upvalues: (copy) v_u_4, (copy) v_u_33, (copy) v_u_6, (copy) v_u_35, (copy) v_u_16, (copy) v_u_24, (copy) v_u_8, (copy) v_u_23, (copy) v_u_10, (copy) v_u_12, (copy) v_u_13, (copy) v_u_15, (copy) v_u_34, (copy) v_u_29, (copy) v_u_30, (copy) v_u_20, (copy) v_u_7, (copy) v_u_32, (copy) v_u_17, (copy) v_u_21, (copy) v_u_25, (copy) v_u_22, (copy) v_u_26, (copy) v_u_27, (copy) v_u_5, (copy) v_u_3, (copy) v_u_19, (copy) v_u_28, (copy) v_u_14, (copy) v_u_31, (copy) v_u_18, (copy) v_u_9
	local v_u_36 = require(v_u_4.Modules.Settings.SettingsPageFactory):CreateNewPage()
	v_u_36.playsessionid = ""
	if v_u_33 then
		v_u_36.playsessionid = v_u_6:GetPlaySessionId()
	end
	function v_u_36.DontLeaveFunc(p37)
		-- upvalues: (copy) v_u_36, (ref) v_u_6, (ref) v_u_35
		if v_u_36.HubRef then
			v_u_36.HubRef:PopMenu(p37, true)
		end
		local v38 = v_u_6
		local v39 = v_u_35.AnalyticsTargetName
		local v40 = v_u_35.AnalyticsInGameMenuName
		local v41 = v_u_35.AnalyticsLeaveGameName
		local v42 = {
			["confirmed"] = v_u_35.AnalyticsCancelledName
		}
		local v43 = game.GameId
		v42.universeid = tostring(v43)
		v42.source = v_u_35.AnalyticsLeaveGameSource
		v42.playsessionid = v_u_36.playsessionid
		v38:SetRBXEventStream(v39, v40, v41, v42)
	end
	function v_u_36.DontLeaveFromHotkey(_, p44, p45)
		-- upvalues: (copy) v_u_36
		if p44 == Enum.UserInputState.Begin then
			local v46 = (p45.UserInputType == Enum.UserInputType.Gamepad1 or (p45.UserInputType == Enum.UserInputType.Gamepad2 or p45.UserInputType == Enum.UserInputType.Gamepad3)) and true or p45.UserInputType == Enum.UserInputType.Gamepad4
			v_u_36.DontLeaveFunc(v46)
		end
	end
	function v_u_36.DontLeaveFromButton(p47)
		-- upvalues: (copy) v_u_36
		v_u_36.DontLeaveFunc(p47)
	end
	v_u_36.TabHeader = nil
	v_u_36.Page.Name = "LeaveGameUpsellPage"
	v_u_36.ShouldShowBottomBar = false
	v_u_36.ShouldShowHubBar = false
	v_u_36.DisableTopPadding = true
	function v_u_36.UpsellComponent(p_u_48)
		-- upvalues: (copy) v_u_36, (ref) v_u_16, (ref) v_u_24, (ref) v_u_8, (ref) v_u_23, (ref) v_u_10, (ref) v_u_12, (ref) v_u_13, (ref) v_u_15, (ref) v_u_34, (ref) v_u_6, (ref) v_u_29, (ref) v_u_30, (ref) v_u_20, (ref) v_u_7, (ref) v_u_32, (ref) v_u_17, (ref) v_u_21
		local v_u_49 = v_u_36.upsellType
		local v50 = v_u_16()
		local v51 = v_u_24({
			["headerKey"] = nil,
			["bodyKey"] = nil,
			["voiceConsent"] = "Feature.VerificationUpsell.Description.VoiceLegalConsent2",
			["voiceDisclaimer"] = "Feature.VerificationUpsell.Description.VoiceLegalDisclaimer2",
			["button"] = "Feature.VerificationUpsell.Action.AddPhoneNumber",
			["termsOfUse"] = "Feature.VerificationUpsell.Action.SMSTerms",
			["privacyPolicy"] = "Feature.VerificationUpsell.Action.Privacy",
			["headerKey"] = v_u_49 == v_u_8.PHONE_UPSELL_VALUE_PROP.VoiceChat and "Feature.VerificationUpsell.Heading.UnlockVoiceChat" or "Feature.VerificationUpsell.Heading.DontLoseAccess",
			["bodyKey"] = v_u_49 == v_u_8.PHONE_UPSELL_VALUE_PROP.VoiceChat and "Feature.VerificationUpsell.Description.UnlockVoiceChatBody" or "Feature.VerificationUpsell.Description.RecoverAccountEasily"
		})
		v51.voiceDisclaimer = v51.voiceDisclaimer:gsub("{buttonText}", v51.button)
		local v54 = v_u_23(function(p52)
			-- upvalues: (copy) v_u_49, (ref) v_u_8
			local v53
			if v_u_49 == v_u_8.PHONE_UPSELL_VALUE_PROP.VoiceChat then
				v53 = p52.RequireExplicitVoiceConsent()
			else
				v53 = false
			end
			return v53
		end)
		local v_u_55, v_u_56 = v_u_10.useState(false)
		local v57 = v_u_10.createElement
		local v58 = "Frame"
		local v59 = {
			["Size"] = nil,
			["AutomaticSize"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 0),
			["AutomaticSize"] = Enum.AutomaticSize.Y,
			["LayoutOrder"] = p_u_48.LayoutOrder
		}
		local v60 = {
			["ListLayout"] = v_u_10.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Vertical,
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["Padding"] = UDim.new(0, 12)
			}),
			["Header"] = v_u_10.createElement(v_u_12, {
				["text"] = nil,
				["fontStyle"] = nil,
				["colorStyle"] = nil,
				["layoutOrder"] = 1,
				["text"] = v51.headerKey,
				["fontStyle"] = v50.Font.Header2,
				["colorStyle"] = v50.Theme.TextEmphasis
			}),
			["Body"] = v_u_10.createElement(v_u_12, {
				["text"] = nil,
				["textWrapped"] = true,
				["size"] = nil,
				["automaticSize"] = nil,
				["fontStyle"] = nil,
				["lineHeight"] = 1.1,
				["colorStyle"] = nil,
				["layoutOrder"] = 2,
				["text"] = v51.bodyKey,
				["size"] = UDim2.new(1, 0, 0, 0),
				["automaticSize"] = Enum.AutomaticSize.Y,
				["fontStyle"] = v50.Font.Body,
				["colorStyle"] = v50.Theme.TextDefault
			})
		}
		local v61 = v_u_10.createElement
		local v62 = v_u_13
		local v63 = {
			["buttonType"] = nil,
			["size"] = nil,
			["layoutOrder"] = 3,
			["text"] = nil,
			["onActivated"] = nil,
			["isDisabled"] = nil,
			["buttonType"] = v_u_15.Secondary,
			["size"] = UDim2.new(1, 0, 0, v50.Tokens.Size.Size_1200),
			["text"] = v51.button,
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (ref) v_u_36, (ref) v_u_34, (ref) v_u_6, (ref) v_u_29, (copy) p_u_48, (ref) v_u_30, (ref) v_u_20, (ref) v_u_7, (copy) v_u_49, (ref) v_u_8
				v_u_36.HubRef:SetVisibility(false, true)
				if v_u_34() then
					v_u_6:SendEventDeferred(v_u_29(), "verificationUpsell", "modalAction", {
						["origin"] = p_u_48.origin,
						["btn"] = v_u_30.Button.Continue,
						["section"] = p_u_48.section
					})
				end
				v_u_20.openPhoneUpsell({
					["origin"] = nil,
					["eventContext"] = "verificationUpsell",
					["onSuccessBeforeToast"] = nil,
					["onSuccess"] = nil,
					["origin"] = p_u_48.origin,
					["onSuccessBeforeToast"] = function() -- name: onSuccessBeforeToast
						-- upvalues: (ref) v_u_7, (ref) p_u_48, (ref) v_u_36
						v_u_7:DisablePhoneVerificationUpsell()
						p_u_48.onUpsellComplete()
						v_u_36.HubRef:SetVisibility(true, false)
						v_u_36.HubRef:SwitchToPage(v_u_36.HubRef.LeaveGameUpsellPage, true)
					end,
					["onSuccess"] = function() -- name: onSuccess
						-- upvalues: (ref) v_u_49, (ref) v_u_8, (ref) v_u_7, (ref) p_u_48
						if v_u_49 == v_u_8.PHONE_UPSELL_VALUE_PROP.VoiceChat then
							v_u_7:EnableVoice()
							p_u_48.setVoiceEnabled(true)
						end
					end
				})
			end
		}
		local v64
		if v54 then
			v64 = not v_u_55
		else
			v64 = v54
		end
		v63.isDisabled = v64
		v60.Button = v61(v62, v63)
		local v65
		if v_u_32() then
			v65 = nil
		else
			local v66 = v_u_10.createElement
			local v67 = v_u_17
			local v68 = {
				["legalText"] = nil,
				["termsOfUse"] = nil,
				["privacyPolicy"] = nil,
				["showLegalText"] = nil,
				["showLegalButtons"] = true,
				["showLegalTextCheckbox"] = nil,
				["legalTextChecked"] = nil,
				["setLegalTextChecked"] = nil,
				["onTermsOfUseClick"] = nil,
				["onPrivacyPolicyClick"] = nil,
				["LayoutOrder"] = 4
			}
			local v69
			if v54 then
				v69 = v51.voiceConsent
			else
				v69 = v51.voiceDisclaimer
			end
			v68.legalText = v69
			v68.termsOfUse = v51.termsOfUse
			v68.privacyPolicy = v51.privacyPolicy
			v68.showLegalText = v_u_49 == v_u_8.PHONE_UPSELL_VALUE_PROP.VoiceChat
			v68.showLegalTextCheckbox = v54
			v68.legalTextChecked = v_u_55
			function v68.setLegalTextChecked() -- name: setLegalTextChecked
				-- upvalues: (copy) v_u_56, (copy) v_u_55
				v_u_56(not v_u_55)
			end
			function v68.onTermsOfUseClick() -- name: onTermsOfUseClick
				-- upvalues: (ref) v_u_34, (ref) v_u_6, (ref) v_u_29, (copy) p_u_48, (ref) v_u_21
				if v_u_34() then
					v_u_6:SendEventDeferred(v_u_29(), "verificationUpsell", "modalAction", {
						["origin"] = nil,
						["field"] = "termsOfService",
						["section"] = nil,
						["origin"] = p_u_48.origin,
						["section"] = p_u_48.section
					})
				end
				p_u_48.showWebpage(v_u_21.TERMS_OF_SERVICE_URL)
			end
			function v68.onPrivacyPolicyClick() -- name: onPrivacyPolicyClick
				-- upvalues: (ref) v_u_34, (ref) v_u_6, (ref) v_u_29, (copy) p_u_48, (ref) v_u_21
				if v_u_34() then
					v_u_6:SendEventDeferred(v_u_29(), "verificationUpsell", "modalAction", {
						["origin"] = nil,
						["field"] = "privacyPolicy",
						["section"] = nil,
						["origin"] = p_u_48.origin,
						["section"] = p_u_48.section
					})
				end
				p_u_48.showWebpage(v_u_21.PRIVACY_POLICY_URL)
			end
			v65 = v66(v67, v68)
		end
		v60.PhoneLegalDisclaimer = v65
		return v57(v58, v59, v60)
	end
	function v_u_36.LeaveGameComponent(p_u_70)
		-- upvalues: (ref) v_u_16, (ref) v_u_24, (ref) v_u_10, (copy) v_u_36, (ref) v_u_8, (ref) v_u_34, (ref) v_u_25, (ref) v_u_22, (ref) v_u_26, (ref) v_u_27, (ref) v_u_5, (ref) v_u_3, (ref) v_u_19, (ref) v_u_6, (ref) v_u_29, (ref) v_u_30, (ref) v_u_28, (ref) v_u_4, (ref) v_u_14, (ref) v_u_15, (ref) v_u_7, (ref) v_u_31
		local v71 = v_u_16()
		local v72 = v_u_24({
			["confirmLeave"] = "Feature.VerificationUpsell.Action.ConfirmLeave",
			["dontLeave"] = "Feature.VerificationUpsell.Action.DontLeave",
			["returnWithVoice"] = "Feature.VerificationUpsell.Action.ReturnWithVoice"
		})
		local v_u_73, v_u_74 = v_u_10.useState("Incomplete")
		local v75 = v_u_73 == "Incomplete"
		local v_u_76 = v_u_36.upsellType
		local v_u_77 = v_u_76 == v_u_8.PHONE_UPSELL_VALUE_PROP.VoiceChat and "exitConfirmationScreenVoice" or "exitConfirmationScreenSecurity"
		local v_u_78 = v_u_34() and (v_u_73 == "Incomplete" and "entry" or "verifyPhoneSuccess") or nil
		local v_u_79 = v_u_10.useRef(nil)
		local v_u_80, v_u_81 = v_u_10.useState(false)
		local v_u_82 = v_u_25(v_u_22)
		local v_u_83 = v_u_26()
		local function v84()
			-- upvalues: (copy) v_u_83, (ref) v_u_27, (ref) v_u_5, (copy) v_u_79, (ref) v_u_3, (ref) v_u_36, (ref) v_u_19, (copy) v_u_82, (ref) v_u_8, (ref) v_u_34, (ref) v_u_6, (ref) v_u_29, (copy) p_u_70, (ref) v_u_30
			if v_u_83 ~= v_u_27.Touch then
				v_u_5.SelectedCoreObject = v_u_79.current
			end
			v_u_3:BindCoreAction("LeaveGameCancelAction", v_u_36.DontLeaveFromHotkey, false, Enum.KeyCode.ButtonB)
			if not v_u_36.postSent then
				v_u_19(v_u_82, v_u_8.EXIT_CONFIRMATION_PHONE_UPSELL_IXP_LAYER, os.time(), true, true):catch(function(_) end)
				if v_u_34() then
					v_u_6:SendEventDeferred(v_u_29(), "verificationUpsell", "modalAction", {
						["origin"] = p_u_70.origin,
						["aType"] = v_u_30.ActionType.Shown,
						["section"] = p_u_70.section
					})
				end
				v_u_36.postSent = true
			end
		end
		local function v85()
			-- upvalues: (ref) v_u_3, (copy) v_u_73, (copy) v_u_74
			v_u_3:UnbindCoreAction("LeaveGameCancelAction")
			if v_u_73 == "Completed" then
				v_u_74("CompletedAndClosed")
			end
		end
		v_u_28(v_u_36.Displayed.Event, v84)
		v_u_28(v_u_36.Hidden.Event, v85)
		local v86 = (v_u_4.AbsoluteSize.Y < 500 or v_u_4.AbsoluteSize.X < 500) and 0 or 200
		local v87 = v_u_10.createElement
		local v88 = "Frame"
		local v89 = {
			["Size"] = nil,
			["Position"] = nil,
			["AutomaticSize"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 0, 0),
			["Position"] = UDim2.new(0, 0, 0, v86),
			["AutomaticSize"] = Enum.AutomaticSize.Y
		}
		local v90 = {
			["ListLayout"] = v_u_10.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Vertical,
				["SortOrder"] = Enum.SortOrder.LayoutOrder
			})
		}
		local v91 = v_u_10.createElement
		local v92 = "Frame"
		local v93 = {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["AutomaticSize"] = nil,
			["LayoutOrder"] = 1,
			["Size"] = UDim2.new(1, 0, 0, 0),
			["AutomaticSize"] = Enum.AutomaticSize.Y
		}
		local v94 = {
			["ListLayout"] = v_u_10.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Vertical,
				["Padding"] = UDim.new(0, v71.Tokens.Size.Size_600),
				["SortOrder"] = Enum.SortOrder.LayoutOrder
			})
		}
		local v95 = v_u_10.createElement
		local v96 = v_u_14
		local v97 = {
			["buttons"] = nil,
			["buttonHeight"] = nil,
			["disableGamepadRefs"] = true,
			["isRoactGamepadEnabled"] = false
		}
		local v98 = {}
		local v100 = {
			["buttonType"] = nil,
			["isDefaultChild"] = true,
			["props"] = nil,
			["buttonType"] = v_u_15.PrimarySystem,
			["props"] = {
				["layoutOrder"] = 1,
				["text"] = nil,
				["onActivated"] = nil,
				["buttonRef"] = nil,
				["text"] = v72.confirmLeave,
				["onActivated"] = function() -- name: onActivated
					-- upvalues: (copy) v_u_80, (copy) v_u_73, (copy) v_u_76, (ref) v_u_8, (ref) v_u_7, (copy) v_u_81, (ref) v_u_34, (ref) v_u_6, (ref) v_u_29, (copy) v_u_77, (copy) v_u_78, (ref) v_u_31
					if not v_u_80 and (v_u_73 == "Completed" or v_u_73 == "CompletedAndClosed") and v_u_76 == v_u_8.PHONE_UPSELL_VALUE_PROP.VoiceChat then
						v_u_7:EnableVoice()
						v_u_81(true)
					end
					if v_u_34() then
						local v99 = {
							["origin"] = nil,
							["btn"] = "confirmLeave",
							["section"] = nil,
							["origin"] = v_u_77,
							["section"] = v_u_78
						}
						v_u_6:SendEventDeferred(v_u_29(), "verificationUpsell", "formInteraction", v99)
					end
					v_u_31(false)
				end,
				["buttonRef"] = v_u_79
			}
		}
		local v101 = {
			["buttonType"] = v_u_15.Secondary
		}
		local v102 = {
			["layoutOrder"] = 2,
			["text"] = nil,
			["onActivated"] = nil
		}
		local v103
		if v_u_73 == "Completed" and v_u_76 == v_u_8.PHONE_UPSELL_VALUE_PROP.VoiceChat then
			v103 = v72.returnWithVoice
		else
			v103 = v72.dontLeave
		end
		v102.text = v103
		function v102.onActivated() -- name: onActivated
			-- upvalues: (ref) v_u_34, (copy) v_u_73, (copy) v_u_76, (ref) v_u_8, (ref) v_u_6, (ref) v_u_29, (copy) v_u_77, (copy) v_u_78, (ref) v_u_30, (ref) v_u_36
			if v_u_34() then
				if v_u_73 == "Completed" and v_u_76 == v_u_8.PHONE_UPSELL_VALUE_PROP.VoiceChat then
					local v104 = {
						["origin"] = nil,
						["btn"] = "returnWithVoice",
						["section"] = nil,
						["origin"] = v_u_77,
						["section"] = v_u_78
					}
					v_u_6:SendEventDeferred(v_u_29(), "verificationUpsell", "formInteraction", v104)
				elseif v_u_73 == "Incomplete" then
					v_u_6:SendEventDeferred(v_u_29(), "verificationUpsell", "modalAction", {
						["origin"] = v_u_77,
						["aType"] = v_u_30.ActionType.Dismiss,
						["section"] = v_u_78
					})
				end
			end
			v_u_36.DontLeaveFromButton()
		end
		v101.props = v102
		__set_list(v98, 1, {v100, v101})
		v97.buttons = v98
		v97.buttonHeight = v71.Tokens.Size.Size_1200
		v94.LeaveGameButtons = v95(v96, v97)
		v90.LeaveGame = v91(v92, v93, v94)
		v90.TopSpacer = v_u_10.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 2,
			["Size"] = nil,
			["Size"] = UDim2.new(1, 0, 0, v71.Tokens.Size.Size_600)
		})
		local v105
		if v75 then
			v105 = v_u_10.createElement(v_u_10.Fragment, {}, {
				["Divider"] = v_u_10.createElement("Frame", {
					["LayoutOrder"] = 3,
					["BackgroundColor3"] = nil,
					["BackgroundTransparency"] = nil,
					["BorderSizePixel"] = 0,
					["Size"] = nil,
					["BackgroundColor3"] = v71.Tokens.Color.Stroke.Emphasis.Color3,
					["BackgroundTransparency"] = v71.Tokens.Color.Stroke.Emphasis.Transparency,
					["Size"] = UDim2.new(1, 0, 0, 1)
				}),
				["BottomSpacer"] = v_u_10.createElement("Frame", {
					["BackgroundTransparency"] = 1,
					["LayoutOrder"] = 4,
					["Size"] = nil,
					["Size"] = UDim2.new(1, 0, 0, v71.Tokens.Size.Size_600)
				}),
				["Upsell"] = v_u_10.createElement(v_u_36.UpsellComponent, {
					["origin"] = nil,
					["section"] = nil,
					["LayoutOrder"] = 5,
					["showWebpage"] = nil,
					["onUpsellComplete"] = nil,
					["setVoiceEnabled"] = nil,
					["origin"] = v_u_77,
					["section"] = v_u_78,
					["showWebpage"] = p_u_70.showWebpage,
					["onUpsellComplete"] = function() -- name: onUpsellComplete
						-- upvalues: (copy) v_u_74
						v_u_74("Completed")
					end,
					["setVoiceEnabled"] = v_u_81
				})
			})
		else
			v105 = nil
		end
		v90.UpsellComponents = v105
		return v87(v88, v89, v90)
	end
	local v106 = v_u_10.createElement(v_u_18, {}, v_u_10.createElement(v_u_36.LeaveGameComponent, {
		["showWebpage"] = function() -- name: showWebpage end
	}, {}))
	v_u_36.handle = v_u_9.mount(v106, v_u_36.Page, "LeaveGameUpsell")
	v_u_36.Page.Size = UDim2.new(1, 0, 0, 0)
	v_u_36.Page.AutomaticSize = Enum.AutomaticSize.Y
	return v_u_36
end)()
function v107.SetUpsellProp(p108, p109) -- name: SetUpsellProp
	-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_18
	if p109 ~= v_u_8.PHONE_UPSELL_VALUE_PROP.None then
		p108.upsellType = p109
		p108.handle = v_u_9.update(p108.handle, v_u_10.createElement(v_u_18, {}, v_u_10.createElement(p108.LeaveGameComponent, {
			["showWebpage"] = function() -- name: showWebpage end
		}, {})))
	end
end
return v107