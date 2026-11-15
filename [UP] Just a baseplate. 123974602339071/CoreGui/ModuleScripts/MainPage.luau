-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.MainPage
local v_u_1 = game:GetService("ContextActionService")
local v_u_2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("CorePackages")
local v_u_4 = game:GetService("GuiService")
local v_u_5 = game:GetService("Players")
local v_u_6 = game:GetService("RunService")
local v_u_7 = game:GetService("UserInputService")
local v_u_8 = game:GetService("VRService")
local v9 = v_u_2:WaitForChild("RobloxGui")
local v10 = require(v_u_3.Packages.InGameMenuDependencies)
local v_u_11 = v10.Roact
local v12 = v10.RoactRodux
local v13 = v10.UIBlox
local v14 = v10.t
local v_u_15 = require(v_u_3.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v_u_16 = v13.App.Menu.ContextualMenu
local v_u_17 = v13.App.Menu.MenuDirection
local v_u_18 = v13.App.Menu.KeyLabel
local v_u_19 = v13.App.Button.Button
local v_u_20 = v13.App.Button.Enum.ButtonType
local v21 = script.Parent.Parent
local v_u_22 = require(v21.Localization.withLocalization)
local v_u_23 = require(v21.Actions.SetRespawning)
local v_u_24 = require(v21.Thunks.CloseMenu)
local v_u_25 = require(v21.Resources.Assets)
local v_u_26 = require(v21.Actions.SetCurrentPage)
local v_u_27 = require(v9.Modules.VoiceChat.Components.VoiceIndicator)
local v_u_28 = require(v21.Resources.Constants)
local v_u_29 = require(v21.Enums.Direction)
local v_u_30 = require(script.Parent.PageNavigation)
local v_u_31 = require(script.Parent.GameIconHeader)
local v_u_32 = require(script.Parent.ZonePortal)
local v33 = v21.Flags
local v_u_34 = game:DefineFastFlag("TakeAScreenshotOfThis", false)
local v_u_35 = game:DefineFastFlag("ShowContextMenuWhenButtonsArePresent", false)
local v_u_36 = game:DefineFastFlag("UseVRSpecificLeaveButton", false)
local v_u_37 = require(v33.GetFFlagIGMGamepadSelectionHistory)
local v_u_38 = v13.App.ImageSet.Images
local v_u_39 = require(script.Parent.Connection.FocusHandler)
local v_u_40 = require(script.Parent.IGMMainPageControllerBar)
local v_u_41 = require(v9.Modules.VoiceChat.VoiceChatServiceManager).default
local v_u_42 = {
	[v_u_28.InputType.MouseAndKeyboard] = Enum.KeyCode.R,
	[v_u_28.InputType.Gamepad] = Enum.KeyCode.ButtonY
}
local v_u_43 = {
	[v_u_28.InputType.MouseAndKeyboard] = Enum.KeyCode.L,
	[v_u_28.InputType.Gamepad] = Enum.KeyCode.ButtonX
}
local v44 = v_u_11.PureComponent:extend("MainPage")
function v44.renderButtonModels(p_u_45, _, p46) -- name: renderButtonModels
	-- upvalues: (copy) v_u_8, (copy) v_u_34, (copy) v_u_3, (copy) v_u_38, (copy) v_u_6, (copy) v_u_2, (copy) v_u_25, (copy) v_u_42
	local v47 = {}
	local v48 = p_u_45.props.inputType
	local v49
	if v_u_8.VREnabled then
		v49 = false
	else
		v49 = not v_u_34 and true or not require(v_u_3.Workspace.Packages.CachedPolicyService):IsSubjectToChinaPolicies()
	end
	if v49 and v_u_34 then
		local v50 = {
			["icon"] = v_u_38["icons/controls/screenshot"],
			["text"] = p46.screenCapture,
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (copy) p_u_45, (ref) v_u_6, (ref) v_u_2
				p_u_45:setState({
					["modalOpen"] = false
				})
				p_u_45.props.closeMenu()
				v_u_6.RenderStepped:Wait()
				v_u_6.RenderStepped:Wait()
				v_u_2:TakeScreenshot()
			end
		}
		table.insert(v47, v50)
	end
	if p_u_45.props.respawnButtonVisible then
		local v51 = {
			["icon"] = v_u_25.Images.RespawnIcon,
			["text"] = p46.respawnCharacter,
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (copy) p_u_45
				p_u_45:setState({
					["modalOpen"] = false
				})
				p_u_45.props.startRespawning()
			end,
			["keyCodeLabel"] = v_u_42[v48]
		}
		table.insert(v47, v51)
	end
	return v47
end
v44.validateProps = v14.strictInterface({
	["open"] = v14.boolean,
	["isMainPageMoreMenuOpen"] = v14.optional(v14.boolean),
	["respawnButtonVisible"] = v14.boolean,
	["startLeavingGame"] = v14.callback,
	["startRespawning"] = v14.callback,
	["setMainPageMoreMenuOpen"] = v14.optional(v14.callback),
	["closeMenu"] = v14.callback,
	["screenSize"] = v14.Vector2,
	["canCaptureFocus"] = v14.optional(v14.boolean),
	["inputType"] = v14.optional(v14.string),
	["setFirstItemRef"] = v14.optional(v14.callback),
	["voiceEnabled"] = v14.optional(v14.boolean),
	["currentZone"] = v_u_37() and v14.optional(v14.number) or nil
})
function v44.init(p_u_52) -- name: init
	-- upvalues: (copy) v_u_11
	p_u_52.moreMenuFrameRef = nil
	p_u_52.moreMenuFirstItemFrameRef = nil
	p_u_52.moreMenuButtonRef = v_u_11.createRef()
	p_u_52.mainPageFirstButtonRef = v_u_11.createRef()
	function p_u_52.setMoreMenuRef(p53)
		-- upvalues: (copy) p_u_52
		p_u_52.moreMenuFrameRef = p53
	end
	function p_u_52.setMoreMenuFirstItemRef(p54)
		-- upvalues: (copy) p_u_52
		p_u_52.moreMenuFirstItemFrameRef = p54
	end
	p_u_52.state = {
		["modalOpen"] = false
	}
end
function v44.getDerivedStateFromProps(p55) -- name: getDerivedStateFromProps
	return not p55.canCaptureFocus and {
		["modalOpen"] = false
	} or nil
end
function v44.renderMainPageFocusHandler(p_u_56) -- name: renderMainPageFocusHandler
	-- upvalues: (copy) v_u_37, (copy) v_u_11, (copy) v_u_39, (copy) v_u_1, (copy) v_u_4
	local v57 = p_u_56.canGamepadCaptureFocus(p_u_56.props)
	local v58
	if v_u_37() then
		local v59 = p_u_56.state.modalOpen
		v57 = p_u_56.canGamepadCaptureFocus(p_u_56.props)
		if v57 then
			v57 = not v59
		end
		v58 = not p_u_56.props.open or p_u_56.props.currentZone == 0
	else
		v58 = nil
	end
	return v_u_11.createElement(v_u_39, {
		["isFocused"] = v57,
		["shouldForgetPreviousSelection"] = v58,
		["didFocus"] = v_u_37() and function(p60)
			-- upvalues: (ref) v_u_1, (copy) p_u_56, (ref) v_u_4
			v_u_1:BindCoreAction("LeftStickTogglesMoreMenuAction", function(_, p61)
				-- upvalues: (ref) p_u_56
				if p61 ~= Enum.UserInputState.End then
					return Enum.ContextActionResult.Pass
				end
				p_u_56:setState({
					["modalOpen"] = true
				})
				return Enum.ContextActionResult.Sink
			end, false, Enum.KeyCode.ButtonL3)
			v_u_4.SelectedCoreObject = p60 or p_u_56.mainPageFirstButtonRef:getValue()
		end or function()
			-- upvalues: (ref) v_u_1, (copy) p_u_56
			v_u_1:BindCoreAction("LeftStickTogglesMoreMenuAction", function(_, p62)
				-- upvalues: (ref) p_u_56
				if p62 ~= Enum.UserInputState.End then
					return Enum.ContextActionResult.Pass
				end
				p_u_56:setState({
					["modalOpen"] = not p_u_56.state.modalOpen
				})
				return Enum.ContextActionResult.Sink
			end, false, Enum.KeyCode.ButtonL3)
		end,
		["didBlur"] = function() -- name: didBlur
			-- upvalues: (ref) v_u_1
			v_u_1:UnbindCoreAction("LeftStickTogglesMoreMenuAction")
		end
	})
end
function v44.renderMoreMenuFocusHandler(p_u_63) -- name: renderMoreMenuFocusHandler
	-- upvalues: (copy) v_u_11, (copy) v_u_39, (copy) v_u_37, (copy) v_u_1, (copy) v_u_4
	local v66 = {
		["isFocused"] = p_u_63.canGamepadCaptureFocus(p_u_63.props) and p_u_63.state.modalOpen,
		["didFocus"] = function() -- name: didFocus
			-- upvalues: (copy) p_u_63, (ref) v_u_37, (ref) v_u_1, (ref) v_u_4
			local function v65(_, p64)
				-- upvalues: (ref) p_u_63
				if p64 ~= Enum.UserInputState.End then
					return Enum.ContextActionResult.Pass
				end
				p_u_63:setState({
					["modalOpen"] = false
				})
				return Enum.ContextActionResult.Sink
			end
			if v_u_37() then
				v_u_1:BindCoreAction("CloseMoreMenuAction", v65, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonL3)
			else
				v_u_1:BindCoreAction("CloseMoreMenuAction", v65, false, Enum.KeyCode.ButtonB)
			end
			if p_u_63.moreMenuFrameRef ~= nil then
				v_u_4:RemoveSelectionGroup("MainPageMoreMenu")
			end
			v_u_4:AddSelectionParent("MainPageMoreMenu", p_u_63.moreMenuFrameRef)
			v_u_4.SelectedCoreObject = p_u_63.moreMenuFirstItemFrameRef
		end,
		["didBlur"] = function() -- name: didBlur
			-- upvalues: (ref) v_u_1
			v_u_1:UnbindCoreAction("CloseMoreMenuAction")
		end
	}
	return v_u_11.createElement(v_u_39, v66)
end
function v44.render(p_u_67) -- name: render
	-- upvalues: (copy) v_u_15, (copy) v_u_22, (copy) v_u_11, (copy) v_u_19, (copy) v_u_20, (copy) v_u_25, (copy) v_u_35, (copy) v_u_8, (copy) v_u_36, (copy) v_u_43, (copy) v_u_40, (copy) v_u_27, (copy) v_u_5, (copy) v_u_41, (copy) v_u_32, (copy) v_u_29, (copy) v_u_31, (copy) v_u_30, (copy) v_u_28, (copy) v_u_16, (copy) v_u_17, (copy) v_u_18
	local v_u_68 = p_u_67.canGamepadCaptureFocus(p_u_67.props)
	return v_u_15(function(p69)
		local v70 = {}
		local v71 = {
			["BackgroundDefault"] = {
				["Color"] = p69.Color.Surface.Surface_0.Color3,
				["Transparency"] = p69.Color.Surface.Surface_0.Transparency
			}
		}
		v70.Theme = v71
		return v70
	end, function(p_u_72)
		-- upvalues: (ref) v_u_22, (ref) v_u_11, (ref) v_u_19, (ref) v_u_20, (copy) p_u_67, (ref) v_u_25, (ref) v_u_35, (ref) v_u_8, (ref) v_u_36, (ref) v_u_43, (ref) v_u_40, (copy) v_u_68, (ref) v_u_27, (ref) v_u_5, (ref) v_u_41, (ref) v_u_32, (ref) v_u_29, (ref) v_u_31, (ref) v_u_30, (ref) v_u_28, (ref) v_u_16, (ref) v_u_17, (ref) v_u_18
		return v_u_22({
			["leaveGame"] = "CoreScripts.InGameMenu.LeaveGame",
			["respawnCharacter"] = "CoreScripts.InGameMenu.RespawnCharacter",
			["screenCapture"] = "CoreScripts.InGameMenu.Controls.Screenshot"
		})(function(p73)
			-- upvalues: (ref) v_u_11, (ref) v_u_19, (ref) v_u_20, (ref) p_u_67, (ref) v_u_25, (copy) p_u_72, (ref) v_u_35, (ref) v_u_8, (ref) v_u_36, (ref) v_u_43, (ref) v_u_40, (ref) v_u_68, (ref) v_u_27, (ref) v_u_5, (ref) v_u_41, (ref) v_u_32, (ref) v_u_29, (ref) v_u_31, (ref) v_u_30, (ref) v_u_28, (ref) v_u_16, (ref) v_u_17, (ref) v_u_18
			local v74 = v_u_11.createElement(v_u_19, {
				["buttonType"] = v_u_20.Secondary,
				["size"] = UDim2.fromOffset(44, 44),
				["onActivated"] = function() -- name: onActivated
					-- upvalues: (ref) p_u_67
					p_u_67:setState({
						["modalOpen"] = true
					})
				end,
				["icon"] = v_u_25.Images.MoreActions,
				[v_u_11.Ref] = p_u_67.moreMenuButtonRef
			})
			local v75 = p_u_67:renderButtonModels(p_u_72, p73)
			local v76 = p_u_67.props.respawnButtonVisible
			if v_u_35 then
				v76 = #v75 > 0
			end
			local v77 = p_u_67.props.inputType
			local v78
			if v_u_8.VREnabled and v_u_36 then
				v78 = Enum.KeyCode.ButtonX
			else
				v78 = v_u_43[v77]
			end
			local v79 = v76 and -56 or 0
			local v80 = p_u_67.state.modalOpen
			local v81 = {
				["canCaptureFocus"] = v_u_68,
				["isMainPageMoreMenuOpen"] = v80
			}
			local v82 = v_u_11.createElement(v_u_40, v81)
			local v83
			if p_u_67.props.voiceEnabled then
				local v84 = v_u_11.createElement
				local v85 = v_u_27
				local v86 = {
					["size"] = nil,
					["userId"] = nil,
					["iconStyle"] = "MicLight",
					["onClicked"] = nil,
					["size"] = UDim2.fromOffset(44, 44)
				}
				local v87 = v_u_5.LocalPlayer.UserId
				v86.userId = tostring(v87)
				function v86.onClicked() -- name: onClicked
					-- upvalues: (ref) v_u_41
					v_u_41:ToggleMic("VRInGameMenuMainPage")
				end
				v83 = v84(v85, v86)
				v79 = v79 - 56
			else
				v83 = nil
			end
			local v88 = v_u_11.createElement
			local v89 = "TextButton"
			local v90 = {
				["Size"] = nil,
				["BackgroundColor3"] = nil,
				["BackgroundTransparency"] = nil,
				["BorderSizePixel"] = 0,
				["Visible"] = nil,
				["Text"] = "",
				["AutoButtonColor"] = false,
				["Selectable"] = false,
				["Size"] = UDim2.new(0, 400, 1, 0),
				["BackgroundColor3"] = p_u_72.Theme.BackgroundDefault.Color,
				["BackgroundTransparency"] = p_u_72.Theme.BackgroundDefault.Transparency,
				["Visible"] = p_u_67.props.open
			}
			local v91 = {
				["MoreMenuFocusHandler"] = p_u_67:renderMoreMenuFocusHandler()
			}
			local v92
			if v_u_8.VREnabled then
				v92 = nil
			else
				v92 = p_u_67:renderMainPageFocusHandler() or nil
			end
			v91.MainPageFocusHandler = v92
			v91.ControllerBar = v82
			v91.ZonePortal = v_u_11.createElement(v_u_32, {
				["targetZone"] = 0,
				["direction"] = nil,
				["direction"] = v_u_29.Left
			})
			v91.GameIconHeader = v_u_11.createElement(v_u_31)
			v91.PageNavigation = v_u_11.createElement(v_u_30, {
				["Position"] = UDim2.new(0, v_u_28.Zone.ContentOffset, 0, 148),
				["mainPageFirstButtonRef"] = p_u_67.mainPageFirstButtonRef
			})
			v91.ContextualMenu = v_u_11.createElement(v_u_16, {
				["buttonProps"] = nil,
				["setFrameRef"] = nil,
				["setFirstItemRef"] = nil,
				["open"] = nil,
				["menuDirection"] = nil,
				["openPositionY"] = nil,
				["closeBackgroundVisible"] = true,
				["screenSize"] = nil,
				["onDismiss"] = nil,
				["buttonProps"] = v75,
				["setFrameRef"] = p_u_67.setMoreMenuRef,
				["setFirstItemRef"] = p_u_67.setMoreMenuFirstItemRef,
				["open"] = v80,
				["menuDirection"] = v_u_17.Up,
				["openPositionY"] = UDim.new(1, -84),
				["screenSize"] = p_u_67.props.screenSize,
				["onDismiss"] = function() -- name: onDismiss
					-- upvalues: (ref) p_u_67
					p_u_67:setState({
						["modalOpen"] = false
					})
				end
			})
			local v93 = v_u_11.createElement
			local v94 = "Frame"
			local v95 = {
				["Size"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.new(1, 0, 0, 84),
				["Position"] = UDim2.new(0, 0, 1, 0),
				["AnchorPoint"] = Vector2.new(0, 1)
			}
			local v96 = {
				["Layout"] = v_u_11.createElement("UIListLayout", {
					["FillDirection"] = Enum.FillDirection.Horizontal,
					["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
					["Padding"] = UDim.new(0, 12),
					["SortOrder"] = Enum.SortOrder.LayoutOrder,
					["VerticalAlignment"] = Enum.VerticalAlignment.Top
				}),
				["Padding"] = v_u_11.createElement("UIPadding", {
					["PaddingTop"] = UDim.new(0, 24),
					["PaddingBottom"] = UDim.new(0, 24),
					["PaddingLeft"] = UDim.new(0, 24),
					["PaddingRight"] = UDim.new(0, 24)
				})
			}
			local v97 = v_u_11.createElement
			local v98 = "Frame"
			local v99 = {
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["LayoutOrder"] = 1,
				["Size"] = UDim2.new(1, v79, 0, 44),
				["Position"] = UDim2.fromScale(1, 0),
				["AnchorPoint"] = Vector2.new(1, 0)
			}
			local v100 = {
				["Button"] = v_u_11.createElement(v_u_19, {
					["buttonType"] = v_u_20.PrimarySystem,
					["size"] = UDim2.new(1, 0, 0, 44),
					["onActivated"] = p_u_67.props.startLeavingGame,
					["text"] = p73.leaveGame
				})
			}
			local v101
			if v78 then
				v101 = v_u_11.createElement(v_u_18, {
					["keyCode"] = nil,
					["iconThemeKey"] = "UIDefault",
					["textThemeKey"] = "SystemPrimaryContent",
					["AnchorPoint"] = nil,
					["Position"] = nil,
					["LayoutOrder"] = 2,
					["ZIndex"] = 2,
					["keyCode"] = v78,
					["AnchorPoint"] = Vector2.new(1, 0.5),
					["Position"] = UDim2.new(1, -16, 0.5, 0)
				}) or nil
			else
				v101 = nil
			end
			v100.KeyLabel = v101
			v96.LeaveGame = v97(v98, v99, v100)
			v96.VoiceChatMuteButton = v83
			v96.MoreButton = v76 and v74
			v91.BottomButtons = v93(v94, v95, v96)
			return v88(v89, v90, v91)
		end)
	end)
end
function v44.willUnmount(_) -- name: willUnmount
	-- upvalues: (copy) v_u_4
	v_u_4:RemoveSelectionGroup("MainPageMoreMenu")
end
function v44.canGamepadCaptureFocus(p102) -- name: canGamepadCaptureFocus
	-- upvalues: (copy) v_u_28
	local v103 = p102.canCaptureFocus
	if v103 then
		v103 = p102.inputType == v_u_28.InputType.Gamepad
	end
	return v103
end
function v44.didUpdate(p104, p105, p106) -- name: didUpdate
	-- upvalues: (copy) v_u_37, (copy) v_u_4, (copy) v_u_8, (copy) v_u_7
	local v107 = p104.state.modalOpen
	local v108 = p106.modalOpen
	if not v_u_37() and (p104.canGamepadCaptureFocus(p104.props) and not v107) then
		if v108 then
			v_u_4.SelectedCoreObject = p104.moreMenuButtonRef:getValue()
		elseif not p104.canGamepadCaptureFocus(p105) then
			v_u_4.SelectedCoreObject = p104.mainPageFirstButtonRef:getValue()
		end
	end
	if v_u_8.VREnabled then
		v_u_7.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
	end
end
return v12.UNSTABLE_connect2(function(p109, _)
	-- upvalues: (copy) v_u_37, (copy) v_u_28
	local v110
	if v_u_37() then
		v110 = p109.currentZone
	else
		v110 = nil
	end
	local v111 = p109.menuPage == v_u_28.MainPagePageKey and (p109.isMenuOpen and not p109.respawn.dialogOpen)
	if v111 then
		v111 = p109.currentZone == 1
	end
	return {
		["open"] = nil,
		["respawnButtonVisible"] = nil,
		["screenSize"] = nil,
		["voiceEnabled"] = nil,
		["canCaptureFocus"] = nil,
		["currentZone"] = nil,
		["inputType"] = nil,
		["isMainPageInForeground"] = nil,
		["open"] = p109.isMenuOpen,
		["respawnButtonVisible"] = p109.respawn.enabled,
		["screenSize"] = p109.screenSize,
		["voiceEnabled"] = p109.voiceState.voiceEnabled,
		["canCaptureFocus"] = v111,
		["currentZone"] = v110,
		["inputType"] = p109.displayOptions.inputType
	}
end, function(p_u_112)
	-- upvalues: (copy) v_u_26, (copy) v_u_28, (copy) v_u_23, (copy) v_u_24
	return {
		["startLeavingGame"] = function() -- name: startLeavingGame
			-- upvalues: (copy) p_u_112, (ref) v_u_26, (ref) v_u_28
			p_u_112(v_u_26(v_u_28.LeaveGamePromptPageKey))
		end,
		["startRespawning"] = function() -- name: startRespawning
			-- upvalues: (copy) p_u_112, (ref) v_u_23
			p_u_112(v_u_23(true))
		end,
		["closeMenu"] = function() -- name: closeMenu
			-- upvalues: (copy) p_u_112, (ref) v_u_24
			p_u_112(v_u_24)
		end
	}
end)(v44)