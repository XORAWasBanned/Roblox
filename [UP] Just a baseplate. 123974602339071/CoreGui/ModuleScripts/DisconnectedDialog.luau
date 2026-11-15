-- Path: CoreGui.RobloxGui.Modules.TopBar.Components.Presentation.HeadsetMenu.DisconnectedDialog
local v_u_1 = game:GetService("CoreGui")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("ContextActionService")
local v4 = game:GetService("GuiService")
local v_u_5 = require(v2.Packages.Roact)
local v6 = require(v2.Packages.t)
local v7 = require(v2.Packages.FitFrame)
local v_u_8 = v7.FitFrameVertical
local v_u_9 = v7.FitTextLabel
local v10 = require(v2.Packages.UIBlox)
local v_u_11 = v10.App.Dialog.Alert.InteractiveAlert
local v_u_12 = v10.App.Button.Enum.ButtonType
local v_u_13 = v10.Core.Style.withStyle
local v14 = v10.App.ImageSet.Images
local v_u_15 = v10.Core.ImageSet.ImageSetLabel
local v16 = v_u_1.RobloxGui.Modules
local v_u_17 = require(v2.Workspace.Packages.RobloxTranslator)
local v_u_18 = require(v16.InGameMenuConstants)
local v_u_19 = v14["icons/status/alert"]
local v20 = v_u_5.PureComponent:extend("DisconnectedDialog")
v20.validateProps = v6.strictInterface({
	["visible"] = v6.boolean,
	["onConfirm"] = v6.callback,
	["screenSize"] = v6.Vector2,
	["guiService"] = v6.optional(v6.union(v6.instanceOf("GuiService"), v6.table))
})
v20.defaultProps = {
	["guiService"] = v4
}
function v20.init(p_u_21) -- name: init
	p_u_21.guiService = p_u_21.props.guiService
	function p_u_21.onConfirmBindingAction(_, p22, _)
		-- upvalues: (copy) p_u_21
		if p22 ~= Enum.UserInputState.Begin then
			return Enum.ContextActionResult.Pass
		end
		p_u_21.props.onConfirm()
		return Enum.ContextActionResult.Sink
	end
end
function v20.render(p_u_23) -- name: render
	-- upvalues: (copy) v_u_13, (copy) v_u_17, (copy) v_u_5, (copy) v_u_11, (copy) v_u_8, (copy) v_u_15, (copy) v_u_19, (copy) v_u_9, (copy) v_u_12, (copy) v_u_1, (copy) v_u_18
	return v_u_13(function(p24)
		-- upvalues: (ref) v_u_17, (ref) v_u_5, (ref) v_u_11, (ref) v_u_8, (ref) v_u_15, (ref) v_u_19, (ref) v_u_9, (ref) v_u_12, (copy) p_u_23, (ref) v_u_1, (ref) v_u_18
		local v_u_25 = p24.Theme
		local v_u_26 = p24.Font
		local v27 = v_u_17:FormatByKey("InGame.ConnectionError.Heading.VRDisconnected")
		local v_u_28 = v_u_17:FormatByKey("InGame.ConnectionError.Message.RestartApp")
		local v29 = v_u_17:FormatByKey("InGame.ConnectionError.Action.Restart")
		local v30 = v_u_5.createElement
		local v31 = v_u_11
		local v36 = {
			["title"] = v27,
			["middleContent"] = function() -- name: middleContent
				-- upvalues: (ref) v_u_5, (ref) v_u_8, (ref) v_u_15, (ref) v_u_19, (ref) v_u_9, (copy) v_u_26, (copy) v_u_28, (copy) v_u_25
				local v32 = v_u_5.createElement
				local v33 = v_u_8
				local v34 = {
					["BackgroundTransparency"] = 1,
					["width"] = nil,
					["FillDirection"] = nil,
					["HorizontalAlignment"] = nil,
					["VerticalAlignment"] = nil,
					["contentPadding"] = nil,
					["width"] = UDim.new(1, 0),
					["FillDirection"] = Enum.FillDirection.Vertical,
					["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
					["VerticalAlignment"] = Enum.VerticalAlignment.Center,
					["contentPadding"] = UDim.new(0, 24)
				}
				local v35 = {
					["Icon"] = v_u_5.createElement(v_u_15, {
						["LayoutOrder"] = 1,
						["BackgroundTransparency"] = 1,
						["Position"] = nil,
						["Size"] = nil,
						["Image"] = nil,
						["ImageTransparency"] = 0,
						["Position"] = UDim2.new(0, 5, 0, 5),
						["Size"] = UDim2.fromOffset(40, 40),
						["Image"] = v_u_19
					}),
					["BodyText"] = v_u_5.createElement(v_u_9, {
						["LayoutOrder"] = 2,
						["BackgroundTransparency"] = 1,
						["width"] = nil,
						["Font"] = nil,
						["Text"] = nil,
						["TextSize"] = nil,
						["TextColor3"] = nil,
						["width"] = v_u_9.Width.FitToText,
						["Font"] = v_u_26.Body.Font,
						["Text"] = v_u_28,
						["TextSize"] = v_u_26.BaseSize * v_u_26.Body.RelativeSize,
						["TextColor3"] = v_u_25.TextDefault.Color
					})
				}
				return v32(v33, v34, v35)
			end
		}
		local v37 = {}
		local v38 = {}
		local v39 = {
			["buttonType"] = v_u_12.PrimarySystem,
			["props"] = {
				["onActivated"] = p_u_23.props.onConfirm,
				["text"] = v29
			}
		}
		__set_list(v38, 1, {v39})
		v37.buttons = v38
		v36.buttonStackInfo = v37
		v36.screenSize = p_u_23.props.screenSize
		local v40 = v30(v31, v36)
		local v41 = v_u_5.createElement
		local v42 = v_u_5.Portal
		local v43 = {
			["target"] = v_u_1
		}
		local v44 = {}
		local v45 = v_u_5.createElement
		local v46 = {
			["DisplayOrder"] = nil,
			["IgnoreGuiInset"] = true,
			["OnTopOfCoreBlur"] = true,
			["Enabled"] = nil,
			["ZIndexBehavior"] = nil,
			["DisplayOrder"] = v_u_18.DisplayOrder.HeadsetDisconnectedDialog,
			["Enabled"] = p_u_23.props.visible,
			["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
		}
		local v47 = {
			["Overlay"] = v_u_5.createElement("Frame", {
				["Active"] = true,
				["BackgroundColor3"] = nil,
				["BackgroundTransparency"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = nil,
				["BackgroundColor3"] = v_u_25.Overlay.Color,
				["BackgroundTransparency"] = v_u_25.Overlay.Transparency,
				["Size"] = UDim2.fromScale(1, 1)
			}, {
				["Alert"] = v40
			})
		}
		v44.HeadsetDisconnectedDialog = v45("ScreenGui", v46, v47)
		return v41(v42, v43, v44)
	end)
end
function v20.bindActions(p48) -- name: bindActions
	-- upvalues: (copy) v_u_3
	v_u_3:BindCoreAction("TopBarGamepadDisableMenuShortcut", function() end, false, Enum.KeyCode.ButtonStart, Enum.KeyCode.Escape)
	v_u_3:BindCoreAction("TopBarDialogConfirm", p48.onConfirmBindingAction, false, Enum.KeyCode.Return, Enum.KeyCode.ButtonA)
end
function v20.unbindActions(_) -- name: unbindActions
	-- upvalues: (copy) v_u_3
	v_u_3:UnbindCoreAction("TopBarGamepadDisableMenuShortcut")
	v_u_3:UnbindCoreAction("TopBarDialogConfirm")
end
function v20.didMount(p49) -- name: didMount
	if p49.props.visible then
		p49:bindActions()
		p49.guiService:SetMenuIsOpen(true, "HeadsetDisconnectedDialog")
	end
end
function v20.didUpdate(p50, p51, _) -- name: didUpdate
	if p50.props.visible ~= p51.visible then
		if p50.props.visible then
			p50:bindActions()
			p50.guiService:SetMenuIsOpen(true, "HeadsetDisconnectedDialog")
			return
		end
		p50:unbindActions()
		p50.guiService:SetMenuIsOpen(false, "HeadsetDisconnectedDialog")
	end
end
function v20.willUnmount(p52) -- name: willUnmount
	p52:unbindActions()
	p52.guiService:SetMenuIsOpen(false, "HeadsetDisconnectedDialog")
end
return v20