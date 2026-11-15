-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.EducationalPopup
local v_u_1 = game:GetService("GuiService")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("RbxAnalyticsService")
local v4 = require(v2.Packages.InGameMenuDependencies)
local v_u_5 = v4.Roact
local v6 = v4.RoactRodux
local v7 = v4.t
local v_u_8 = v4.UIBlox.App.ImageSet.Images
local v9 = script.Parent.Parent
local v_u_10 = require(v9.Localization.withLocalization)
local v_u_11 = require(v9.Actions.CloseNativeClosePrompt)
local v_u_12 = require(v9.Utility.LeaveGame)
local v_u_13 = require(script.Parent.EducationalPopupDialog)
local v_u_14 = require(v9.Utility.SendAnalytics)
local v_u_15 = v_u_1:GetNotificationTypeList()
local v16 = v_u_5.PureComponent:extend("EducationalPopup")
v16.validateProps = v7.strictInterface({
	["screenSize"] = v7.Vector2,
	["onDismiss"] = v7.callback,
	["onConfirm"] = v7.callback,
	["isClosingApp"] = v7.boolean
})
function v16.init(p17) -- name: init
	-- upvalues: (copy) v_u_14, (copy) v_u_1, (copy) v_u_15
	function p17.onCancel()
		-- upvalues: (ref) v_u_14, (ref) v_u_1, (ref) v_u_15
		v_u_14("educational_popup", "educational_close_app", {})
		v_u_1:BroadcastNotification("", v_u_15.NATIVE_EXIT)
	end
end
function v16.render(p_u_18) -- name: render
	-- upvalues: (copy) v_u_10, (copy) v_u_5, (copy) v_u_13, (copy) v_u_8
	return v_u_10({
		["title"] = "CoreScripts.InGameMenu.ExitModal.Title",
		["subtitle"] = "CoreScripts.InGameMenu.ExitModal.Subtitle",
		["bodyTextOpenMenu"] = "CoreScripts.InGameMenu.ExitModal.BodyTextOpenMenu",
		["bodyTextClickHome"] = "CoreScripts.InGameMenu.ExitModal.BodyTextClickHome",
		["actionExit"] = "CoreScripts.InGameMenu.ExitModal.ActionExit",
		["actionHome"] = "CoreScripts.InGameMenu.ExitModal.ActionHome"
	})(function(p19)
		-- upvalues: (ref) v_u_5, (ref) v_u_13, (ref) v_u_8, (copy) p_u_18
		local v20 = v_u_5.createElement
		local v21 = v_u_13
		local v22 = {
			["bodyContents"] = nil,
			["cancelText"] = nil,
			["confirmText"] = nil,
			["titleBackgroundImageProps"] = nil,
			["screenSize"] = nil,
			["onDismiss"] = nil,
			["onCancel"] = nil,
			["onConfirm"] = nil,
			["blurBackground"] = true,
			["visible"] = nil,
			["bodyContents"] = {
				{
					["text"] = nil,
					["isSystemMenuIcon"] = true,
					["text"] = p19.bodyTextOpenMenu
				},
				{
					["icon"] = v_u_8["icons/menu/home_off"],
					["text"] = p19.bodyTextClickHome
				}
			},
			["cancelText"] = p19.actionExit,
			["confirmText"] = p19.actionHome,
			["titleBackgroundImageProps"] = {
				["image"] = "rbxasset://textures/ui/LuaApp/graphic/Auth/GridBackground_05202026.jpg",
				["imageHeight"] = 200,
				["text"] = nil,
				["text"] = "<font face=\"GothamBlack\" size=\"42\">" .. p19.title .. "</font><font size=\"4\"><br /></font><br />" .. p19.subtitle
			},
			["screenSize"] = p_u_18.props.screenSize,
			["onDismiss"] = p_u_18.props.onDismiss,
			["onCancel"] = p_u_18.onCancel,
			["onConfirm"] = p_u_18.props.onConfirm,
			["visible"] = p_u_18.props.isClosingApp
		}
		return v20(v21, v22)
	end)
end
function v16.didUpdate(p23) -- name: didUpdate
	-- upvalues: (copy) v_u_1
	v_u_1:SetMenuIsOpen(p23.props.isClosingApp, "EducationalPopup")
end
return v6.UNSTABLE_connect2(function(p24, _)
	return {
		["isClosingApp"] = p24.nativeClosePrompt.closingApp,
		["screenSize"] = p24.screenSize
	}
end, function(p_u_25)
	-- upvalues: (copy) v_u_11, (copy) v_u_3, (copy) v_u_14, (copy) v_u_12
	return {
		["onDismiss"] = function() -- name: onDismiss
			-- upvalues: (copy) p_u_25, (ref) v_u_11, (ref) v_u_3, (ref) v_u_14
			p_u_25(v_u_11())
			v_u_3:ReportCounter("EducationalPopup_Dismiss", 1)
			v_u_14("educational_popup", "educational_dismiss_prompt", {})
		end,
		["onConfirm"] = function() -- name: onConfirm
			-- upvalues: (ref) v_u_3, (ref) v_u_14, (ref) v_u_12
			v_u_3:ReportCounter("EducationalPopup_Confirm", 1)
			v_u_14("educational_popup", "educational_confirmed", {})
			v_u_12()
		end
	}
end)(v16)