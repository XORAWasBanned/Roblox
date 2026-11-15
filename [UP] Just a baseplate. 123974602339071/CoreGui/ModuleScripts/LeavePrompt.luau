-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.Pages.Dialog.LeavePrompt
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = game:GetService("ContextActionService")
local v4 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v5 = require(v1.Packages.InGameMenuDependencies)
local v_u_6 = v5.Roact
local v7 = v5.UIBlox
local v8 = v5.t
local v9 = script.Parent.Parent.Parent
local v10 = v9.Parent
local v_u_11 = require(v9.GameIcon)
local v_u_12 = v7.App.Button.Button
local v_u_13 = v7.App.Button.Enum.ButtonType
local v_u_14 = require(v9.ThemedTextLabel)
local v_u_15 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v_u_16 = require(v9.Connection.FocusHandler)
local v_u_17 = require(v9.ZonePortal)
local v_u_18 = require(v10.Enums.Direction)
local v_u_19 = require(v4.Modules.FTUX.Flags.GetFFlagEnableVRFTUXExperience)
local v_u_20 = require(v4.Modules.FTUX.Utility.IsFTUXExperience)
local v_u_21 = require(v4.Modules.FTUX.Enums.PlatformEnum)
local v22 = v_u_6.PureComponent:extend("LeavePrompt")
v22.validateProps = v8.strictInterface({
	["titleText"] = v8.string,
	["bodyText"] = v8.string,
	["confirmText"] = v8.string,
	["cancelText"] = v8.string,
	["onConfirm"] = v8.callback,
	["onCancel"] = v8.callback,
	["canGamepadCaptureFocus"] = v8.boolean,
	["canKeyboardCaptureFocus"] = v8.boolean
})
v22.defaultProps = {
	["canGamepadCaptureFocus"] = false,
	["canKeyboardCaptureFocus"] = false
}
function v22.init(p23) -- name: init
	-- upvalues: (copy) v_u_6
	p23.leaveButtonRef = v_u_6.createRef()
end
function v22.render(p_u_24) -- name: render
	-- upvalues: (copy) v_u_15, (copy) v_u_6, (copy) v_u_11, (copy) v_u_14, (copy) v_u_19, (copy) v_u_20, (copy) v_u_21, (copy) v_u_12, (copy) v_u_13, (copy) v_u_16, (copy) v_u_2, (copy) v_u_17, (copy) v_u_18, (copy) v_u_3
	return v_u_15(function(p25)
		local v26 = {}
		local v27 = {
			["BackgroundDefault"] = {
				["Color"] = p25.Color.Surface.Surface_0.Color3,
				["Transparency"] = p25.Color.Surface.Surface_0.Transparency
			}
		}
		v26.Theme = v27
		local v28 = {
			["BaseSize"] = 1,
			["Header1"] = nil,
			["Body"] = nil,
			["Header1"] = {
				["Font"] = p25.Typography.HeadingSmall.Font,
				["RelativeSize"] = p25.Typography.HeadingSmall.FontSize
			},
			["Body"] = {
				["Font"] = p25.Typography.BodyLarge.Font,
				["RelativeSize"] = p25.Typography.BodyLarge.FontSize
			}
		}
		v26.Font = v28
		return v26
	end, function(p29)
		-- upvalues: (ref) v_u_6, (ref) v_u_11, (ref) v_u_14, (copy) p_u_24, (ref) v_u_19, (ref) v_u_20, (ref) v_u_21, (ref) v_u_12, (ref) v_u_13, (ref) v_u_16, (ref) v_u_2, (ref) v_u_17, (ref) v_u_18, (ref) v_u_3
		local v30 = p29.Font
		local v31 = {
			["Layout"] = v_u_6.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Vertical,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center,
				["Padding"] = UDim.new(0, 24),
				["SortOrder"] = Enum.SortOrder.LayoutOrder
			}),
			["GameThumbnail"] = v_u_6.createElement(v_u_11, {
				["gameId"] = nil,
				["iconSize"] = 100,
				["layoutOrder"] = 1,
				["gameId"] = game.GameId
			}),
			["TitleText"] = v_u_6.createElement(v_u_14, {
				["fontKey"] = "Header1",
				["themeKey"] = "TextEmphasis",
				["LayoutOrder"] = 2,
				["Size"] = nil,
				["Text"] = nil,
				["Size"] = UDim2.new(1, 0, 0, v30.Header1.RelativeSize * v30.BaseSize + 4),
				["Text"] = p_u_24.props.titleText
			})
		}
		local v32 = v_u_6.createElement
		local v33 = v_u_14
		local v34 = {
			["fontKey"] = "Body",
			["themeKey"] = "TextDefault",
			["LayoutOrder"] = 3,
			["Size"] = nil,
			["Text"] = nil,
			["TextWrapped"] = true
		}
		local v35
		if v_u_19() and v_u_20(v_u_21.QuestVR) then
			v35 = UDim2.fromOffset(353, 4 * (v30.Body.RelativeSize * v30.BaseSize + 4))
		else
			v35 = UDim2.fromOffset(353, 2 * (v30.Body.RelativeSize * v30.BaseSize + 4))
		end
		v34.Size = v35
		v34.Text = p_u_24.props.bodyText
		v31.BodyText = v32(v33, v34)
		local v36 = v_u_6.createElement
		local v37 = {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["LayoutOrder"] = 4,
			["Size"] = UDim2.fromOffset(353, 84)
		}
		local v38 = {
			["ConfirmButton"] = v_u_6.createElement(v_u_12, {
				["buttonType"] = nil,
				["layoutOrder"] = 4,
				["position"] = nil,
				["size"] = nil,
				["onActivated"] = nil,
				["text"] = nil,
				["buttonRef"] = nil,
				["buttonType"] = v_u_13.PrimarySystem,
				["position"] = UDim2.fromOffset(0, 0),
				["size"] = UDim2.fromOffset(353, 36),
				["onActivated"] = p_u_24.props.onConfirm,
				["text"] = p_u_24.props.confirmText,
				["buttonRef"] = p_u_24.leaveButtonRef
			}),
			["CancelButton"] = v_u_6.createElement(v_u_12, {
				["buttonType"] = nil,
				["layoutOrder"] = 5,
				["position"] = nil,
				["size"] = nil,
				["onActivated"] = nil,
				["text"] = nil,
				["buttonType"] = v_u_13.Secondary,
				["position"] = UDim2.fromOffset(0, 48),
				["size"] = UDim2.fromOffset(353, 36),
				["onActivated"] = p_u_24.props.onCancel,
				["text"] = p_u_24.props.cancelText
			})
		}
		v31.ButtonGroup = v36("Frame", v37, v38)
		local v40 = {
			["Content"] = v_u_6.createElement("Frame", {
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["Selectable"] = false,
				["Size"] = UDim2.fromScale(1, 1)
			}, v31),
			["FocusHandler"] = v_u_6.createElement(v_u_16, {
				["isFocused"] = p_u_24.props.canGamepadCaptureFocus,
				["didFocus"] = function() -- name: didFocus
					-- upvalues: (ref) v_u_2, (ref) p_u_24
					v_u_2.SelectedCoreObject = p_u_24.leaveButtonRef.current
				end
			}),
			["ZonePortal"] = v_u_6.createElement(v_u_17, {
				["targetZone"] = 0,
				["direction"] = nil,
				["direction"] = v_u_18.Left
			}),
			["KeyboardFocusHandler"] = v_u_6.createElement(v_u_16, {
				["isFocused"] = p_u_24.props.canKeyboardCaptureFocus,
				["didFocus"] = function() -- name: didFocus
					-- upvalues: (ref) v_u_3, (ref) p_u_24
					v_u_3:BindCoreAction("LeavePromptConfirm", function(_, p39)
						-- upvalues: (ref) p_u_24
						if p39 ~= Enum.UserInputState.End then
							return Enum.ContextActionResult.Pass
						end
						p_u_24.props.onConfirm()
						return Enum.ContextActionResult.Sink
					end, false, Enum.KeyCode.Return)
				end,
				["didBlur"] = function() -- name: didBlur
					-- upvalues: (ref) v_u_3
					v_u_3:UnbindCoreAction("LeavePromptConfirm")
				end
			}) or nil
		}
		return v_u_6.createElement("ImageButton", {
			["Size"] = nil,
			["AutoButtonColor"] = false,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = nil,
			["Selectable"] = false,
			["Size"] = UDim2.fromScale(1, 1),
			["BackgroundColor3"] = p29.Theme.BackgroundDefault.Color,
			["BackgroundTransparency"] = p29.Theme.BackgroundDefault.Transparency
		}, v40)
	end)
end
return v22