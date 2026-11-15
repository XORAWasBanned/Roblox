-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.InformationalDialog
local v_u_1 = game:GetService("CoreGui")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("TextService")
local v4 = game:GetService("CorePackages")
local v_u_5 = game:GetService("ContextActionService")
local v_u_6 = game:GetService("GuiService")
local v7 = require(v4.Packages.InGameMenuDependencies)
local v_u_8 = v7.Roact
local v9 = v7.UIBlox
local v10 = v7.t
local v_u_11 = v9.App.Button.Button
local v_u_12 = v9.App.Button.Enum.ButtonType
local v_u_13 = v9.Core.Style.withStyle
local v14 = script.Parent.Parent
local v15 = v14.Flags
local v_u_16 = require(v15.GetFFlagIGMGamepadSelectionHistory)
local v_u_17 = require(v14.Resources.Constants)
local v_u_18 = require(v14.Resources.Assets)
local v_u_19 = require(script.Parent.ThemedTextLabel)
local v_u_20 = v9.Core.ImageSet.ImageSetLabel
local v_u_21 = require(script.Parent.Connection.FocusHandler)
local v22 = require(v4.Packages.Foundation)
local v_u_23 = require(v4.Workspace.Packages.Style).GetTextSize
local v_u_24 = v22.Utility.Flags.FoundationFontFaceMigration
local v25 = v_u_8.PureComponent:extend("InformationalDialog")
v25.validateProps = v10.strictInterface({
	["bodyText"] = v10.string,
	["confirmText"] = v10.string,
	["titleText"] = v10.string,
	["subBodyText"] = v10.optional(v10.string),
	["iconImage"] = v10.optional(v10.union(v10.table, v10.string)),
	["iconSize"] = v10.number,
	["onContinueFunc"] = v10.optional(v10.callback),
	["bindReturnToConfirm"] = v10.boolean,
	["blurBackground"] = v10.boolean,
	["visible"] = v10.boolean,
	["inputType"] = v10.optional(v10.string)
})
v25.defaultProps = {
	["subBodyText"] = nil,
	["blurBackground"] = false,
	["iconImage"] = nil,
	["iconSize"] = 64
}
function v25.init(p_u_26) -- name: init
	-- upvalues: (copy) v_u_8
	p_u_26.state = {
		["isRooted"] = false,
		["show"] = true
	}
	function p_u_26.onAncestryChanged(p27)
		-- upvalues: (copy) p_u_26
		if p27:IsDescendantOf(game) then
			p_u_26:setState({
				["isRooted"] = true
			})
		end
	end
	p_u_26.confirmButtonRef = v_u_8.createRef()
	p_u_26.buttonContainerRef = v_u_8.createRef()
end
function v25.render(p_u_28) -- name: render
	-- upvalues: (copy) v_u_13, (copy) v_u_24, (copy) v_u_23, (copy) v_u_3, (copy) v_u_16, (copy) v_u_8, (copy) v_u_1, (copy) v_u_20, (copy) v_u_18, (copy) v_u_19, (copy) v_u_11, (copy) v_u_12, (copy) v_u_2, (copy) v_u_21, (copy) v_u_17, (copy) v_u_6
	local v_u_29 = p_u_28.props
	return v_u_13(function(p30)
		-- upvalues: (copy) v_u_29, (ref) v_u_24, (ref) v_u_23, (ref) v_u_3, (ref) v_u_16, (copy) p_u_28, (ref) v_u_8, (ref) v_u_1, (ref) v_u_20, (ref) v_u_18, (ref) v_u_19, (ref) v_u_11, (ref) v_u_12, (ref) v_u_2, (ref) v_u_21, (ref) v_u_17, (ref) v_u_6
		local v31 = p30.Font.Body.Font
		local v32 = p30.Font.Body.RelativeSize * p30.Font.BaseSize
		local v33 = v_u_29.bodyText
		local v34
		if v_u_24 then
			v34 = v_u_23(v33, v32, p30.Tokens.Typography.BodyLarge.Font, Vector2.new(295, (1 / 0)), {
				["addTemporaryPadding"] = false
			}).Y
		else
			v34 = v_u_3:GetTextSize(v33, v32, v31, Vector2.new(295, (1 / 0))).Y
		end
		local v35
		if v_u_24 then
			v35 = v_u_23(v_u_29.subBodyText, v32, p30.Tokens.Typography.BodyLarge.Font, Vector2.new(295, (1 / 0)), {
				["addTemporaryPadding"] = false
			}).Y
		else
			v35 = v_u_3:GetTextSize(v_u_29.subBodyText, v32, v31, Vector2.new(295, (1 / 0))).Y
		end
		local v36 = v32 * 2
		local v37 = math.max(v34, v36) + 20
		local v38 = v32 * 2
		local v39 = math.max(v35, v38) + 20
		local v40
		if v_u_16() then
			v40 = not p_u_28.props.visible
		else
			v40 = nil
		end
		local v41 = v_u_8.createElement
		local v42 = v_u_8.Portal
		local v43 = {
			["target"] = v_u_1
		}
		local v44 = {}
		local v45 = v_u_8.createElement
		local v46 = "ScreenGui"
		local v47 = {
			["DisplayOrder"] = 8,
			["IgnoreGuiInset"] = true,
			["OnTopOfCoreBlur"] = nil,
			["Enabled"] = nil,
			["ZIndexBehavior"] = nil,
			["OnTopOfCoreBlur"] = v_u_29.blurBackground
		}
		local v48 = v_u_29.visible
		if v48 then
			v48 = p_u_28.state.show
		end
		v47.Enabled = v48
		v47.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		local v49 = {
			["Overlay"] = v_u_8.createElement("TextButton", {
				["AutoButtonColor"] = false,
				["BackgroundColor3"] = nil,
				["BackgroundTransparency"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = nil,
				["Text"] = "",
				["BackgroundColor3"] = p30.Theme.Overlay.Color,
				["BackgroundTransparency"] = p30.Theme.Overlay.Transparency,
				["Size"] = UDim2.new(1, 0, 1, 0)
			})
		}
		local v50 = v_u_8.createElement
		local v51 = v_u_20
		local v52 = {
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
			["ImageColor3"] = p30.Theme.BackgroundUIDefault.Color,
			["ImageTransparency"] = p30.Theme.BackgroundUIDefault.Transparency,
			["Position"] = UDim2.new(0.5, 0, 0.5, 0),
			["ScaleType"] = v_u_18.Images.RoundedRect.ScaleType,
			["Size"] = UDim2.new(0, 335, 0, v37 + 49 + v39 + 36 + 70 + v_u_29.iconSize),
			["SliceCenter"] = v_u_18.Images.RoundedRect.SliceCenter
		}
		local v53 = {
			["Padding"] = v_u_8.createElement("UIPadding", {
				["PaddingTop"] = UDim.new(0, 20),
				["PaddingBottom"] = UDim.new(0, 20),
				["PaddingLeft"] = UDim.new(0, 20),
				["PaddingRight"] = UDim.new(0, 20)
			}),
			["Layout"] = v_u_8.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Vertical,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
				["SortOrder"] = Enum.SortOrder.LayoutOrder
			}),
			["Icon"] = v_u_8.createElement(v_u_20, {
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["Image"] = nil,
				["Size"] = nil,
				["LayoutOrder"] = 1,
				["BackgroundTransparency"] = 1,
				["BorderSizePixel"] = 0,
				["Position"] = UDim2.fromScale(0.5, 0.5),
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["Image"] = v_u_29.iconImage,
				["Size"] = UDim2.new(0, v_u_29.iconSize, 0, v_u_29.iconSize)
			}),
			["Title"] = v_u_8.createElement(v_u_19, {
				["fontKey"] = "Header1",
				["themeKey"] = "TextEmphasis",
				["LayoutOrder"] = 2,
				["Size"] = nil,
				["Text"] = nil,
				["Size"] = UDim2.new(1, 0, 0, 48),
				["Text"] = v_u_29.titleText
			}),
			["Divider"] = v_u_8.createElement("Frame", {
				["BackgroundColor3"] = nil,
				["BackgroundTransparency"] = nil,
				["BorderSizePixel"] = 0,
				["LayoutOrder"] = 3,
				["Size"] = nil,
				["BackgroundColor3"] = p30.Theme.Divider.Color,
				["BackgroundTransparency"] = p30.Theme.Divider.Transparency,
				["Size"] = UDim2.new(0.8, 0, 0, 1)
			}),
			["SpaceContainer"] = v_u_8.createElement("Frame", {
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 4,
				["Size"] = nil,
				["Size"] = UDim2.new(1, 0, 0, 10)
			}),
			["BodyTextContainer"] = v_u_8.createElement("Frame", {
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 5,
				["Size"] = nil,
				["Size"] = UDim2.new(1, 0, 0, v37)
			}, {
				["BodyText"] = v_u_8.createElement(v_u_19, {
					["Size"] = nil,
					["Text"] = nil,
					["TextWrapped"] = true,
					["Size"] = UDim2.new(1, 0, 1, 0),
					["Text"] = v_u_29.bodyText
				})
			}),
			["SubBodyTextContainer"] = v_u_8.createElement("Frame", {
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 6,
				["Size"] = nil,
				["Size"] = UDim2.new(1, 0, 0, v39)
			}, {
				["BodyText"] = v_u_8.createElement(v_u_19, {
					["Size"] = nil,
					["Text"] = nil,
					["TextWrapped"] = true,
					["Size"] = UDim2.new(1, 0, 1, 0),
					["Text"] = v_u_29.subBodyText
				})
			}),
			["SpaceContainer2"] = v_u_8.createElement("Frame", {
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 7,
				["Size"] = nil,
				["Size"] = UDim2.new(1, 0, 0, 10)
			}),
			["ButtonContainer"] = v_u_8.createElement("Frame", {
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 8,
				["Size"] = UDim2.new(1, 0, 0, 36),
				[v_u_8.Ref] = p_u_28.buttonContainerRef,
				[v_u_8.Event.AncestryChanged] = p_u_28.onAncestryChanged
			}, {
				["Layout"] = v_u_8.createElement("UIListLayout", {
					["FillDirection"] = Enum.FillDirection.Horizontal,
					["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
					["Padding"] = UDim.new(0, 20),
					["SortOrder"] = Enum.SortOrder.LayoutOrder,
					["VerticalAlignment"] = Enum.VerticalAlignment.Center
				}),
				["ConfirmButton"] = v_u_8.createElement(v_u_11, {
					["buttonType"] = v_u_12.PrimarySystem,
					["layoutOrder"] = 1,
					["size"] = UDim2.new(1, -5, 1, 0),
					["text"] = v_u_29.confirmText,
					["onActivated"] = function() -- name: onActivated
						-- upvalues: (ref) p_u_28, (ref) v_u_2
						p_u_28:setState({
							["show"] = false
						})
						if p_u_28.props.onContinueFunc then
							p_u_28.props.onContinueFunc()
						end
						v_u_2:SetRobloxGuiFocused(false)
					end,
					[v_u_8.Ref] = p_u_28.confirmButtonRef
				})
			})
		}
		v49.DialogMainFrame = v50(v51, v52, v53)
		v44.InGameMenuInformationalDialog = v45(v46, v47, v49)
		local v54 = v_u_8.createElement
		local v55 = v_u_21
		local v56 = {}
		local v57 = p_u_28.state.isRooted and p_u_28.props.visible
		if v57 then
			v57 = p_u_28.props.inputType == v_u_17.InputType.Gamepad
		end
		v56.isFocused = v57
		v56.shouldForgetPreviousSelection = v40
		function v56.didFocus() -- name: didFocus
			-- upvalues: (ref) v_u_6, (ref) p_u_28
			v_u_6:RemoveSelectionGroup("InGameMenuModalButtonsSelectionParent")
			v_u_6:AddSelectionParent("InGameMenuModalButtonsSelectionParent", p_u_28.buttonContainerRef:getValue())
			v_u_6.SelectedCoreObject = p_u_28.confirmButtonRef:getValue()
		end
		v44.FocusHandler = v54(v55, v56)
		return v41(v42, v43, v44)
	end)
end
function v25.updateBlur(p58) -- name: updateBlur
	-- upvalues: (copy) v_u_2
	local v59 = p58.props.blurBackground
	if v59 then
		v59 = p58.props.visible
	end
	v_u_2:SetRobloxGuiFocused(v59)
end
function v25.bindActions(p_u_60) -- name: bindActions
	-- upvalues: (copy) v_u_5
	local function v62(_, p61, _) -- name: confirmFunc
		-- upvalues: (copy) p_u_60
		if p61 == Enum.UserInputState.Begin then
			p_u_60.props.onConfirm()
		end
	end
	if p_u_60.props.bindReturnToConfirm then
		v_u_5:BindCoreAction("InGameMenuModalConfirm", v62, false, Enum.KeyCode.Return)
	end
end
function v25.unbindActions(_) -- name: unbindActions
	-- upvalues: (copy) v_u_5
	v_u_5:UnbindCoreAction("InGameMenuModalConfirm")
end
function v25.didMount(p63) -- name: didMount
	p63:updateBlur()
	if p63.props.visible then
		p63:bindActions()
	end
end
function v25.didUpdate(p64) -- name: didUpdate
	p64:updateBlur()
	if p64.props.visible then
		p64:bindActions()
	else
		p64:unbindActions()
	end
end
function v25.willUnmount(p65) -- name: willUnmount
	-- upvalues: (copy) v_u_2
	if p65.props.blurBackground then
		v_u_2:SetRobloxGuiFocused(false)
	end
	p65:unbindActions()
end
return v25