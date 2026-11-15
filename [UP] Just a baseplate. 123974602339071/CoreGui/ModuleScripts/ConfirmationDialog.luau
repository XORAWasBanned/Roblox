-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.ConfirmationDialog
local v_u_1 = game:GetService("CoreGui")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("TextService")
local v4 = game:GetService("CorePackages")
local v_u_5 = game:GetService("ContextActionService")
local v_u_6 = game:GetService("GuiService")
local v7 = require(v4.Packages.InGameMenuDependencies)
local v_u_8 = v7.Roact
local v9 = v7.t
local v10 = v7.UIBlox
local v_u_11 = v10.App.Button.Button
local v_u_12 = v10.App.Button.Enum.ButtonType
local v_u_13 = require(v4.Workspace.Packages.Style).GetTextSize
local v_u_14 = require(v4.Packages.Foundation).Utility.Flags.FoundationFontFaceMigration
local v_u_15 = require(v4.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v16 = script.Parent.Parent
local v_u_17 = require(v16.Resources.Constants)
local v_u_18 = require(v16.Resources.Assets)
local v_u_19 = require(v16.Flags.FFlagIGMDialogButtonsUseUIBloxButton)
local v_u_20 = require(script.Parent.ThemedTextLabel)
local v_u_21 = v10.Core.ImageSet.ImageSetLabel
local v_u_22 = require(script.Parent.Connection.FocusHandler)
local v23 = v_u_8.PureComponent:extend("ConfirmationDialog")
v23.validateProps = v9.strictInterface({
	["bodyText"] = v9.string,
	["cancelText"] = v9.string,
	["confirmText"] = v9.string,
	["titleText"] = v9.string,
	["bindReturnToConfirm"] = v9.boolean,
	["onCancel"] = v9.callback,
	["onConfirm"] = v9.callback,
	["blurBackground"] = v9.boolean,
	["visible"] = v9.boolean,
	["inputType"] = v9.optional(v9.string)
})
v23.defaultProps = {
	["bodyText"] = "This is some body text. It will wrap when needed.",
	["cancelText"] = "Cancel",
	["confirmText"] = "Confirm",
	["titleText"] = "Dialog Title",
	["blurBackground"] = false
}
function v23.init(p_u_24) -- name: init
	-- upvalues: (copy) v_u_8
	p_u_24.state = {
		["isRooted"] = false
	}
	function p_u_24.onAncestryChanged(p25)
		-- upvalues: (copy) p_u_24
		if p25:IsDescendantOf(game) then
			p_u_24:setState({
				["isRooted"] = true
			})
		end
	end
	p_u_24.confirmButtonRef = v_u_8.createRef()
	p_u_24.buttonContainerRef = v_u_8.createRef()
end
function v23.render(p_u_26) -- name: render
	-- upvalues: (copy) v_u_15, (copy) v_u_14, (copy) v_u_13, (copy) v_u_3, (copy) v_u_8, (copy) v_u_1, (copy) v_u_17, (copy) v_u_21, (copy) v_u_18, (copy) v_u_20, (copy) v_u_11, (copy) v_u_12, (copy) v_u_19, (copy) v_u_22, (copy) v_u_6
	local v_u_27 = p_u_26.props
	return v_u_15(function(p28)
		-- upvalues: (ref) v_u_14
		local v29 = {}
		local v30
		if v_u_14 then
			v30 = p28
		else
			v30 = nil
		end
		v29.Tokens = v30
		v29.Theme = {
			["Overlay"] = {
				["Color"] = p28.Color.Common.Scrim.Color3,
				["Transparency"] = p28.Color.Common.Scrim.Transparency
			},
			["BackgroundUIDefault"] = {
				["Color"] = p28.Color.Surface.Surface_300.Color3,
				["Transparency"] = p28.Color.Surface.Surface_300.Transparency
			},
			["Divider"] = {
				["Color"] = p28.Color.Stroke.Emphasis.Color3,
				["Transparency"] = p28.Color.Stroke.Emphasis.Transparency
			}
		}
		v29.Font = {
			["BaseSize"] = 1,
			["Body"] = nil,
			["Body"] = {
				["Font"] = p28.Typography.BodyLarge.Font,
				["RelativeSize"] = p28.Typography.BodyLarge.FontSize
			}
		}
		return v29
	end, function(p31)
		-- upvalues: (copy) v_u_27, (ref) v_u_14, (ref) v_u_13, (ref) v_u_3, (ref) v_u_8, (ref) v_u_1, (ref) v_u_17, (ref) v_u_21, (ref) v_u_18, (ref) v_u_20, (copy) p_u_26, (ref) v_u_11, (ref) v_u_12, (ref) v_u_19, (ref) v_u_22, (ref) v_u_6
		local v32 = p31.Font.Body.Font
		local v33 = p31.Font.Body.RelativeSize * p31.Font.BaseSize
		local v34 = v_u_27.bodyText
		local v35
		if v_u_14 then
			v35 = v_u_13(v34, v33, p31.Tokens.Typography.BodyLarge.Font, Vector2.new(295, (1 / 0)), {
				["addTemporaryPadding"] = false
			}).Y
		else
			v35 = v_u_3:GetTextSize(v34, v33, v32, Vector2.new(295, (1 / 0))).Y
		end
		local v36 = v33 * 2
		local v37 = math.max(v35, v36) + 20 + 20
		local v38 = v_u_8.createElement
		local v39 = v_u_8.Portal
		local v40 = {
			["target"] = v_u_1
		}
		local v41 = {}
		local v42 = v_u_8.createElement
		local v43 = {
			["DisplayOrder"] = nil,
			["IgnoreGuiInset"] = true,
			["OnTopOfCoreBlur"] = nil,
			["Enabled"] = nil,
			["ZIndexBehavior"] = nil,
			["DisplayOrder"] = v_u_17.DisplayOrder.ConfirmationDialog,
			["OnTopOfCoreBlur"] = v_u_27.blurBackground,
			["Enabled"] = v_u_27.visible,
			["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
		}
		local v44 = {
			["Overlay"] = v_u_8.createElement("TextButton", {
				["AutoButtonColor"] = false,
				["BackgroundColor3"] = nil,
				["BackgroundTransparency"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = nil,
				["Text"] = "",
				["BackgroundColor3"] = p31.Theme.Overlay.Color,
				["BackgroundTransparency"] = p31.Theme.Overlay.Transparency,
				["Size"] = UDim2.new(1, 0, 1, 0)
			})
		}
		local v45 = v_u_8.createElement
		local v46 = v_u_21
		local v47 = {
			["AnchorPoint"] = nil,
			["BackgroundTransparency"] = 1,
			["Image"] = nil,
			["ImageColor3"] = nil,
			["ImageTransparency"] = nil,
			["Position"] = nil,
			["ScaleType"] = nil,
			["Size"] = nil,
			["SliceCenter"] = nil,
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Image"] = v_u_18.Images.RoundedRect.Image,
			["ImageColor3"] = p31.Theme.BackgroundUIDefault.Color,
			["ImageTransparency"] = p31.Theme.BackgroundUIDefault.Transparency,
			["Position"] = UDim2.new(0.5, 0, 0.5, 0),
			["ScaleType"] = v_u_18.Images.RoundedRect.ScaleType,
			["Size"] = UDim2.new(0, 335, 0, v37 + 49 + 36 + 20),
			["SliceCenter"] = v_u_18.Images.RoundedRect.SliceCenter
		}
		local v48 = {
			["Padding"] = v_u_8.createElement("UIPadding", {
				["PaddingBottom"] = UDim.new(0, 20),
				["PaddingLeft"] = UDim.new(0, 20),
				["PaddingRight"] = UDim.new(0, 20)
			}),
			["Layout"] = v_u_8.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Vertical,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
				["SortOrder"] = Enum.SortOrder.LayoutOrder
			}),
			["Title"] = v_u_8.createElement(v_u_20, {
				["fontKey"] = "Header1",
				["themeKey"] = "TextEmphasis",
				["LayoutOrder"] = 1,
				["Size"] = nil,
				["Text"] = nil,
				["Size"] = UDim2.new(1, 0, 0, 48),
				["Text"] = v_u_27.titleText
			}),
			["Divider"] = v_u_8.createElement("Frame", {
				["BackgroundColor3"] = nil,
				["BackgroundTransparency"] = nil,
				["BorderSizePixel"] = 0,
				["LayoutOrder"] = 3,
				["Size"] = nil,
				["BackgroundColor3"] = p31.Theme.Divider.Color,
				["BackgroundTransparency"] = p31.Theme.Divider.Transparency,
				["Size"] = UDim2.new(0.8, 0, 0, 1)
			}),
			["BodyTextContainer"] = v_u_8.createElement("Frame", {
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 4,
				["Size"] = nil,
				["Size"] = UDim2.new(1, 0, 0, v37)
			}, {
				["BodyText"] = v_u_8.createElement(v_u_20, {
					["Size"] = nil,
					["Text"] = nil,
					["TextWrapped"] = true,
					["Size"] = UDim2.new(1, 0, 1, 0),
					["Text"] = v_u_27.bodyText
				})
			})
		}
		local v49 = v_u_8.createElement
		local v50 = {
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 5,
			["Size"] = UDim2.new(1, 0, 0, 36),
			[v_u_8.Ref] = p_u_26.buttonContainerRef,
			[v_u_8.Event.AncestryChanged] = p_u_26.onAncestryChanged
		}
		local v51 = {
			["Layout"] = v_u_8.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
				["Padding"] = UDim.new(0, 10),
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center
			}),
			["CancelButton"] = v_u_8.createElement(v_u_11, {
				["buttonType"] = nil,
				["layoutOrder"] = 1,
				["size"] = nil,
				["text"] = nil,
				["onActivated"] = nil,
				["DO_NOT_USE_useUIBloxButton"] = nil,
				["buttonType"] = v_u_12.Secondary,
				["size"] = UDim2.new(0.5, -5, 1, 0),
				["text"] = v_u_27.cancelText,
				["onActivated"] = v_u_27.onCancel,
				["DO_NOT_USE_useUIBloxButton"] = v_u_19 and true or nil
			}),
			["ConfirmButton"] = v_u_8.createElement(v_u_11, {
				["buttonType"] = v_u_12.PrimarySystem,
				["layoutOrder"] = 2,
				["size"] = UDim2.new(0.5, -5, 1, 0),
				["text"] = v_u_27.confirmText,
				["onActivated"] = v_u_27.onConfirm,
				[v_u_8.Ref] = p_u_26.confirmButtonRef,
				["DO_NOT_USE_useUIBloxButton"] = v_u_19 and true or nil
			})
		}
		v48.ButtonContainer = v49("Frame", v50, v51)
		v44.DialogMainFrame = v45(v46, v47, v48)
		v41.InGameMenuConfirmationDialog = v42("ScreenGui", v43, v44)
		local v52 = v_u_8.createElement
		local v53 = v_u_22
		local v54 = {}
		local v55 = p_u_26.state.isRooted and p_u_26.props.visible
		if v55 then
			v55 = p_u_26.props.inputType == v_u_17.InputType.Gamepad
		end
		v54.isFocused = v55
		function v54.didFocus() -- name: didFocus
			-- upvalues: (ref) v_u_6, (ref) p_u_26
			v_u_6:RemoveSelectionGroup("InGameMenuModalButtonsSelectionParent")
			v_u_6:AddSelectionParent("InGameMenuModalButtonsSelectionParent", p_u_26.buttonContainerRef:getValue())
			v_u_6.SelectedCoreObject = p_u_26.confirmButtonRef:getValue()
		end
		v41.FocusHandler = v52(v53, v54)
		return v38(v39, v40, v41)
	end)
end
function v23.updateBlur(p56) -- name: updateBlur
	-- upvalues: (copy) v_u_2
	local v57 = p56.props.blurBackground
	if v57 then
		v57 = p56.props.visible
	end
	v_u_2:SetRobloxGuiFocused(v57)
end
function v23.bindActions(p_u_58) -- name: bindActions
	-- upvalues: (copy) v_u_5
	local function v60(_, p59, _) -- name: confirmFunc
		-- upvalues: (copy) p_u_58
		if p59 == Enum.UserInputState.Begin then
			p_u_58.props.onConfirm()
		end
	end
	if p_u_58.props.bindReturnToConfirm then
		v_u_5:BindCoreAction("InGameMenuModalConfirm", v60, false, Enum.KeyCode.Return)
	end
	v_u_5:BindCoreAction("InGameMenuModalCancel", function(_, p61, _) -- name: cancelFunc
		-- upvalues: (copy) p_u_58
		if p61 == Enum.UserInputState.Begin then
			p_u_58.props.onCancel()
		end
	end, false, Enum.KeyCode.Escape)
end
function v23.unbindActions(_) -- name: unbindActions
	-- upvalues: (copy) v_u_5
	v_u_5:UnbindCoreAction("InGameMenuModalConfirm")
	v_u_5:UnbindCoreAction("InGameMenuModalCancel")
end
function v23.didMount(p62) -- name: didMount
	p62:updateBlur()
	if p62.props.visible then
		p62:bindActions()
	end
end
function v23.didUpdate(p63) -- name: didUpdate
	p63:updateBlur()
	if p63.props.visible then
		p63:bindActions()
	else
		p63:unbindActions()
	end
end
function v23.willUnmount(p64) -- name: willUnmount
	-- upvalues: (copy) v_u_2
	if p64.props.blurBackground then
		v_u_2:SetRobloxGuiFocused(false)
	end
	p64:unbindActions()
end
return v23