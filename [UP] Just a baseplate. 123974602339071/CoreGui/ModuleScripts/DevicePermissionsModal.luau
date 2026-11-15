-- Path: CoreGui.RobloxGui.Modules.VoiceChatPrompt.Components.DevicePermissionsModal
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("TextService")
local v_u_3 = require(v1.Packages.React)
local v4 = require(v1.Packages.t)
local v5 = require(v1.Workspace.Packages.ArgCheck)
local v6 = require(v1.Workspace.Packages.VoiceChat)
local v_u_7 = require(v1.Packages.UIBlox)
local v8 = require(v1.Packages.Foundation)
local v_u_9 = require(v1.Workspace.Packages.Style).GetTextSize
local v_u_10 = v8.Utility.Flags.FoundationFontFaceMigration
local v_u_11 = v_u_7.App.Button.Button
local v_u_12 = v_u_7.App.Button.Enum.ButtonType
local v13 = v_u_7.App.ImageSet.Images
local v_u_14 = require(script.Parent.Parent.Parent.InGameMenu.Resources.Assets)
local v15 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_16 = require(script.Parent.Parent.Helpers.getMicDeeplinkDirections)
local v_u_17 = require(script.Parent.Parent.Helpers.getPrimingText)
local v_u_18 = v6.Flags.GetFFlagSupportGamepadNavInVoiceModals
local v_u_19 = v15:FormatByKey("Feature.SettingsHub.Action.OpenSettings")
local v_u_20 = v15:FormatByKey("Feature.SettingsHub.Action.Ok")
local v_u_21 = v15:FormatByKey("Feature.SettingsHub.Action.NotNow")
local v_u_22 = v13["icons/controls/microphone"]
local v_u_23 = v5.wrap(v4.strictInterface({
	["titleText"] = v4.string,
	["bodyText"] = v4.string,
	["handlePrimaryActivated"] = v4.callback,
	["handleSecondaryActivated"] = v4.callback,
	["Analytics"] = v4.table,
	["promptStyle"] = v4.table,
	["showPrompt"] = v4.boolean,
	["settingsAppAvailable"] = v4.boolean,
	["UserInputService"] = v4.table
}))
local function v69(p24, p25) -- name: DevicePermissionsModal
	-- upvalues: (copy) v_u_23, (copy) v_u_16, (copy) v_u_17, (copy) v_u_10, (copy) v_u_9, (copy) v_u_2, (copy) v_u_18, (copy) v_u_3, (copy) v_u_7, (copy) v_u_14, (copy) v_u_22, (copy) v_u_11, (copy) v_u_12, (copy) v_u_21, (copy) v_u_19, (copy) v_u_20
	local v26 = v_u_23
	assert(v26(p24))
	local v27 = v_u_16(p24.settingsAppAvailable, p24.UserInputService)
	local v28 = v_u_17(p24.UserInputService)
	local v29 = p24.promptStyle.Font.Header1.Font
	local v30 = p24.promptStyle.Font.Header1.RelativeSize * p24.promptStyle.Font.BaseSize
	local v31
	if v_u_10 then
		v31 = v_u_9(p24.titleText, v30, v29, Vector2.new(325, (1 / 0)), {
			["addTemporaryPadding"] = false
		}).Y
	else
		v31 = v_u_2:GetTextSize(p24.titleText, v30, v29, Vector2.new(325, (1 / 0))).Y
	end
	local v32 = 20 + v31
	local v33 = p24.promptStyle.Font.Body.Font
	local v34 = p24.promptStyle.Font.Body.RelativeSize * p24.promptStyle.Font.BaseSize
	local v35
	if v_u_10 then
		v35 = v_u_9(p24.bodyText, v34, v33, Vector2.new(325, (1 / 0)), {
			["addTemporaryPadding"] = false
		}).Y
	else
		v35 = v_u_2:GetTextSize(p24.bodyText, v34, v33, Vector2.new(325, (1 / 0))).Y
	end
	local v36 = 20 + v35
	local v37
	if v28 then
		local v38 = p24.promptStyle.Font.CaptionHeader.Font
		local v39 = p24.promptStyle.Font.CaptionHeader.RelativeSize * p24.promptStyle.Font.BaseSize
		local v40
		if v_u_10 then
			v40 = v_u_9(v28, v39, v38, Vector2.new(325, (1 / 0)), {
				["addTemporaryPadding"] = false
			}).Y
		else
			v40 = v_u_2:GetTextSize(v28, v39, v38, Vector2.new(325, (1 / 0))).Y
		end
		v37 = 10 + v40
	else
		v37 = 0
	end
	local v41
	if v27 then
		local v42 = p24.promptStyle.Font.Body.Font
		local v43 = p24.promptStyle.Font.Body.RelativeSize * p24.promptStyle.Font.BaseSize
		local v44
		if v_u_10 then
			v44 = v_u_9(v27, v43, v42, Vector2.new(325, (1 / 0)), {
				["addTemporaryPadding"] = false
			}).Y
		else
			v44 = v_u_2:GetTextSize(v27, v43, v42, Vector2.new(325, (1 / 0))).Y
		end
		v41 = (v28 and 10 or 20) + v44
	else
		v41 = 0
	end
	local v45 = v28 and 5.5 or (v27 and 4.5 or 4)
	local v46
	if v_u_18() then
		v46 = Enum.SelectionBehavior.Stop
	else
		v46 = nil
	end
	local v47 = v_u_18() and true or nil
	local v48 = v_u_3.createElement
	local v49 = "ScreenGui"
	local v50 = {
		["DisplayOrder"] = 8,
		["IgnoreGuiInset"] = true,
		["OnTopOfCoreBlur"] = true,
		["Enabled"] = nil,
		["ZIndexBehavior"] = nil,
		["Enabled"] = p24.showPrompt,
		["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
	}
	local v51 = {
		["Overlay"] = v_u_3.createElement("TextButton", {
			["AutoButtonColor"] = false,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = nil,
			["Text"] = "",
			["BackgroundColor3"] = p24.promptStyle.Theme.Overlay.Color,
			["BackgroundTransparency"] = p24.promptStyle.Theme.Overlay.Transparency,
			["Size"] = UDim2.new(1, 0, 1, 0)
		})
	}
	local v52 = v_u_3.createElement
	local v53 = v_u_7.Core.ImageSet.ImageSetLabel
	local v54 = {
		["AnchorPoint"] = nil,
		["BackgroundTransparency"] = 1,
		["Image"] = nil,
		["ImageColor3"] = nil,
		["ImageTransparency"] = nil,
		["Position"] = nil,
		["ScaleType"] = nil,
		["Size"] = nil,
		["AutomaticSize"] = nil,
		["SliceCenter"] = nil,
		["SelectionBehaviorDown"] = nil,
		["SelectionBehaviorLeft"] = nil,
		["SelectionBehaviorRight"] = nil,
		["SelectionBehaviorUp"] = nil,
		["SelectionGroup"] = nil,
		["ref"] = nil,
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["Image"] = v_u_14.Images.RoundedRect.Image,
		["ImageColor3"] = p24.promptStyle.Theme.BackgroundUIDefault.Color,
		["ImageTransparency"] = p24.promptStyle.Theme.BackgroundUIDefault.Transparency,
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["ScaleType"] = v_u_14.Images.RoundedRect.ScaleType,
		["Size"] = UDim2.new(0, 365, 0, v32 + 5 + v36 + 36 + v45 * 20 + v41 + 55 + v37),
		["AutomaticSize"] = Enum.AutomaticSize.Y,
		["SliceCenter"] = v_u_14.Images.RoundedRect.SliceCenter,
		["SelectionBehaviorDown"] = v46,
		["SelectionBehaviorLeft"] = v46,
		["SelectionBehaviorRight"] = v46,
		["SelectionBehaviorUp"] = v46,
		["SelectionGroup"] = v47
	}
	if not v_u_18() then
		p25 = nil
	end
	v54.ref = p25
	local v55 = {
		["Padding"] = v_u_3.createElement("UIPadding", {
			["PaddingTop"] = UDim.new(0, 15),
			["PaddingBottom"] = UDim.new(0, 20),
			["PaddingLeft"] = UDim.new(0, 20),
			["PaddingRight"] = UDim.new(0, 20)
		}),
		["Layout"] = v_u_3.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["Icon"] = v_u_3.createElement(v_u_7.Core.ImageSet.ImageSetLabel, {
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["Image"] = nil,
			["Size"] = nil,
			["LayoutOrder"] = 1,
			["BackgroundTransparency"] = 1,
			["BorderSizePixel"] = 0,
			["Position"] = UDim2.fromScale(0.5, 0.5),
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Image"] = v_u_22,
			["Size"] = UDim2.new(0, 55, 0, 55)
		}),
		["TitleTextContainer"] = v_u_3.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 2,
			["Size"] = nil,
			["AutomaticSize"] = nil,
			["Size"] = UDim2.new(1, 0, 0, v32),
			["AutomaticSize"] = Enum.AutomaticSize.Y
		}, {
			["Padding"] = v_u_3.createElement("UIPadding", {
				["PaddingBottom"] = UDim.new(0, 7)
			}),
			["TitleText"] = v_u_3.createElement(v_u_7.App.Text.StyledTextLabel, {
				["fontStyle"] = p24.promptStyle.Font.Header1,
				["colorStyle"] = p24.promptStyle.Theme.SystemPrimaryDefault,
				["textXAlignment"] = Enum.TextXAlignment.Center,
				["size"] = UDim2.new(1, 0, 1, 0),
				["text"] = p24.titleText
			})
		}),
		["Divider"] = v_u_3.createElement("Frame", {
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = nil,
			["BorderSizePixel"] = 0,
			["LayoutOrder"] = 3,
			["Size"] = nil,
			["BackgroundColor3"] = p24.promptStyle.Theme.Divider.Color,
			["BackgroundTransparency"] = p24.promptStyle.Theme.Divider.Transparency,
			["Size"] = UDim2.new(1, 0, 0, 1)
		}),
		["DividerSpaceContainer"] = v_u_3.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 4,
			["Size"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 15)
		}),
		["BodyTextContainer"] = v_u_3.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 5,
			["Size"] = nil,
			["Size"] = UDim2.new(1, 0, 0, v36)
		}, {
			["BodyText"] = v_u_3.createElement(v_u_7.App.Text.StyledTextLabel, {
				["fontStyle"] = nil,
				["colorStyle"] = nil,
				["textXAlignment"] = nil,
				["size"] = nil,
				["text"] = nil,
				["lineHeight"] = 1.2,
				["fontStyle"] = p24.promptStyle.Font.Body,
				["colorStyle"] = p24.promptStyle.Theme.TextDefault,
				["textXAlignment"] = Enum.TextXAlignment.Left,
				["size"] = UDim2.new(1, 0, 1, 0),
				["text"] = p24.bodyText
			})
		})
	}
	local v56
	if v27 then
		v56 = v_u_3.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 6,
			["Size"] = nil,
			["Size"] = UDim2.new(1, 0, 0, v41 + 20)
		}, {
			["Padding"] = v_u_3.createElement("UIPadding", {
				["PaddingTop"] = UDim.new(0, v28 and 8 or 15),
				["PaddingLeft"] = UDim.new(0, 8)
			}),
			["TextContainer"] = v_u_3.createElement("Frame", {
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 2,
				["Size"] = nil,
				["Size"] = UDim2.new(1, 0, 0, v41)
			}, {
				["InfoText"] = v_u_3.createElement(v_u_7.App.Text.StyledTextLabel, {
					["fontStyle"] = nil,
					["colorStyle"] = nil,
					["textXAlignment"] = nil,
					["textYAlignment"] = nil,
					["size"] = nil,
					["text"] = nil,
					["lineHeight"] = 1.25,
					["fontStyle"] = p24.promptStyle.Font.Body,
					["colorStyle"] = p24.promptStyle.Theme.TextEmphasis,
					["textXAlignment"] = Enum.TextXAlignment.Left,
					["textYAlignment"] = Enum.TextYAlignment.Top,
					["size"] = UDim2.new(1, 0, 1, 0),
					["text"] = v27
				})
			})
		})
	else
		v56 = nil
	end
	v55.InfoTextContainer = v56
	local v57
	if v28 then
		v57 = nil
	else
		v57 = v_u_3.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 7,
			["Size"] = nil,
			["Size"] = UDim2.new(1, 0, 0, v27 and 40 or 20)
		})
	end
	v55.SpaceContainer = v57
	local v58
	if v28 then
		v58 = v_u_3.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 8,
			["Size"] = nil,
			["Size"] = UDim2.new(1, 0, 0, v37)
		}, {
			["PrimingText"] = v_u_3.createElement(v_u_7.App.Text.StyledTextLabel, {
				["fontStyle"] = nil,
				["colorStyle"] = nil,
				["textXAlignment"] = nil,
				["textYAlignment"] = nil,
				["size"] = nil,
				["text"] = nil,
				["lineHeight"] = 1.25,
				["fontStyle"] = p24.promptStyle.Font.Body,
				["colorStyle"] = p24.promptStyle.Theme.TextDefault,
				["textXAlignment"] = Enum.TextXAlignment.Left,
				["textYAlignment"] = Enum.TextYAlignment.Top,
				["size"] = UDim2.new(1, 0, 1, 0),
				["text"] = v28
			})
		})
	else
		v58 = nil
	end
	v55.PrimingTextContainer = v58
	local v59
	if v28 then
		v59 = v_u_3.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 9,
			["Size"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 30)
		})
	else
		v59 = nil
	end
	v55.SpaceContainerTemp = v59
	local v60 = v_u_3.createElement
	local v61 = "Frame"
	local v62 = {
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 10,
		["Size"] = nil,
		["Size"] = UDim2.new(1, 0, 0, 36)
	}
	local v63 = {
		["Layout"] = v_u_3.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["Padding"] = UDim.new(0, 12),
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center
		})
	}
	local v64
	if p24.settingsAppAvailable then
		v64 = v_u_3.createElement(v_u_11, {
			["buttonType"] = nil,
			["layoutOrder"] = 1,
			["size"] = nil,
			["text"] = nil,
			["onActivated"] = nil,
			["Selectable"] = nil,
			["buttonType"] = v_u_12.Secondary,
			["size"] = UDim2.new(0.5, -5, 0, 36),
			["text"] = v_u_21,
			["onActivated"] = p24.handleSecondaryActivated,
			["Selectable"] = v47
		})
	else
		v64 = nil
	end
	v63.SecondaryButton = v64
	local v65 = v_u_3.createElement
	local v66 = v_u_11
	local v67 = {
		["buttonType"] = nil,
		["layoutOrder"] = 2,
		["size"] = nil,
		["text"] = nil,
		["onActivated"] = nil,
		["Selectable"] = nil,
		["buttonType"] = v_u_12.PrimarySystem,
		["size"] = UDim2.new(p24.settingsAppAvailable and 0.5 or 1, -5, 0, 36)
	}
	local v68
	if p24.settingsAppAvailable then
		v68 = v_u_19
	else
		v68 = v_u_20
	end
	v67.text = v68
	v67.onActivated = p24.handlePrimaryActivated
	v67.Selectable = v47
	v63.ConfirmButton = v65(v66, v67)
	v55.ButtonContainer = v60(v61, v62, v63)
	v51.DialogMainFrame = v52(v53, v54, v55)
	return v48(v49, v50, v51)
end
if v_u_18() then
	return v_u_3.forwardRef(v69)
else
	return v69
end