-- Path: CoreGui.RobloxGui.Modules.VoiceChatPrompt.Components.VoiceChatConsentModal
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("TextService")
local v_u_3 = require(v1.Packages.Roact)
local v_u_4 = require(v1.Packages.React)
local v5 = require(v1.Packages.t)
local v6 = require(v1.Workspace.Packages.ArgCheck)
local v7 = require(v1.Workspace.Packages.VoiceChat)
local v_u_8 = require(v1.Packages.UIBlox)
local v9 = require(v1.Packages.Foundation)
local v_u_10 = v9.Checkbox
local v_u_11 = require(v1.Workspace.Packages.Style).GetTextSize
local v_u_12 = v9.Utility.Flags.FoundationFontFaceMigration
local v_u_13 = v_u_8.App.Button.Button
local v_u_14 = v_u_8.App.Button.Enum.ButtonType
local _ = v_u_8.App.ImageSet.Images
local v_u_15 = require(script.Parent.Parent.Parent.InGameMenu.Resources.Assets)
local v16 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_17 = v7.Flags.GetFFlagSupportGamepadNavInVoiceModals
local v_u_18 = require(v1.Workspace.Packages.SharedFlags).GetFFlagDisablePVUpsellDataConsent
local v_u_19 = v16:FormatByKey("Feature.SettingsHub.Action.TurnOn")
local v_u_20 = v16:FormatByKey("Feature.SettingsHub.Action.NotNow")
local v_u_21 = v16:FormatByKey("Feature.SettingsHub.Prompt.Subtitle.SelectingTurnOn")
local v_u_22 = v6.wrap(v5.strictInterface({
	["titleText"] = v5.optional(v5.string),
	["bodyText"] = v5.optional(v5.string),
	["handlePrimaryActivated"] = v5.optional(v5.callback),
	["handleSecondaryActivated"] = v5.optional(v5.callback),
	["Analytics"] = v5.optional(v5.table),
	["showCheckbox"] = v5.optional(v5.boolean),
	["promptStyle"] = v5.optional(v5.table),
	["showPrompt"] = v5.optional(v5.boolean)
}))
local function v70(p23, p24) -- name: VoiceChatConsentModal
	-- upvalues: (copy) v_u_22, (copy) v_u_4, (copy) v_u_12, (copy) v_u_11, (copy) v_u_2, (copy) v_u_21, (copy) v_u_17, (copy) v_u_3, (copy) v_u_8, (copy) v_u_15, (copy) v_u_18, (copy) v_u_10, (copy) v_u_13, (copy) v_u_14, (copy) v_u_20, (copy) v_u_19
	local v25 = v_u_22
	assert(v25(p23))
	local v26, v_u_27 = v_u_4.useState(false)
	local v28 = p23.promptStyle.Font.Header1.Font
	local v29 = p23.promptStyle.Font.Header1.RelativeSize * p23.promptStyle.Font.BaseSize
	local v30
	if v_u_12 then
		v30 = v_u_11(p23.titleText, v29, v28, Vector2.new(325, (1 / 0)), {
			["addTemporaryPadding"] = false
		}).Y
	else
		v30 = v_u_2:GetTextSize(p23.titleText, v29, v28, Vector2.new(325, (1 / 0))).Y
	end
	local v31 = 20 + v30
	local v32 = p23.promptStyle.Font.Body.Font
	local v33 = p23.promptStyle.Font.Body.RelativeSize * p23.promptStyle.Font.BaseSize
	local v34
	if v_u_12 then
		v34 = v_u_11(p23.bodyText, v33, v32, Vector2.new(325, (1 / 0)), {
			["addTemporaryPadding"] = false
		}).Y
	else
		v34 = v_u_2:GetTextSize(p23.bodyText, v33, v32, Vector2.new(325, (1 / 0))).Y
	end
	local v35 = 20 + v34
	local v36 = p23.promptStyle.Font.CaptionHeader.Font
	local v37 = p23.promptStyle.Font.CaptionHeader.RelativeSize * p23.promptStyle.Font.BaseSize
	local v38
	if v_u_12 then
		v38 = v_u_11(v_u_21, v37, v36, Vector2.new(325, (1 / 0)), {
			["addTemporaryPadding"] = false
		}).Y
	else
		v38 = v_u_2:GetTextSize(v_u_21, v37, v36, Vector2.new(325, (1 / 0))).Y
	end
	local v39 = 20 + v38
	local v40
	if v_u_17() then
		v40 = Enum.SelectionBehavior.Stop
	else
		v40 = nil
	end
	local v41 = v_u_17() and true or nil
	local v42 = v_u_3.createElement
	local v43 = "ScreenGui"
	local v44 = {
		["DisplayOrder"] = 8,
		["IgnoreGuiInset"] = true,
		["OnTopOfCoreBlur"] = true,
		["Enabled"] = nil,
		["ZIndexBehavior"] = nil,
		["Enabled"] = p23.showPrompt,
		["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
	}
	local v45 = {
		["Overlay"] = v_u_3.createElement("TextButton", {
			["AutoButtonColor"] = false,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = nil,
			["Text"] = "",
			["BackgroundColor3"] = p23.promptStyle.Theme.Overlay.Color,
			["BackgroundTransparency"] = p23.promptStyle.Theme.Overlay.Transparency,
			["Size"] = UDim2.new(1, 0, 1, 0)
		})
	}
	local v46 = v_u_3.createElement
	local v47 = v_u_8.Core.ImageSet.ImageSetLabel
	local v48 = {
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
		["Image"] = v_u_15.Images.RoundedRect.Image,
		["ImageColor3"] = p23.promptStyle.Theme.BackgroundUIDefault.Color,
		["ImageTransparency"] = p23.promptStyle.Theme.BackgroundUIDefault.Transparency,
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["ScaleType"] = v_u_15.Images.RoundedRect.ScaleType,
		["Size"] = UDim2.new(0, 365, 0, v31 + 1 + v35 + 14 + 36 + (v_u_18() and 0 or 60 + v39)),
		["AutomaticSize"] = Enum.AutomaticSize.Y,
		["SliceCenter"] = v_u_15.Images.RoundedRect.SliceCenter,
		["SelectionBehaviorDown"] = v40,
		["SelectionBehaviorLeft"] = v40,
		["SelectionBehaviorRight"] = v40,
		["SelectionBehaviorUp"] = v40,
		["SelectionGroup"] = v41
	}
	if not v_u_17() then
		p24 = nil
	end
	v48.ref = p24
	local v49 = {
		["Padding"] = v_u_3.createElement("UIPadding", {
			["PaddingTop"] = UDim.new(0, 10),
			["PaddingBottom"] = UDim.new(0, 20),
			["PaddingLeft"] = UDim.new(0, 20),
			["PaddingRight"] = UDim.new(0, 20)
		}),
		["Layout"] = v_u_3.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["TitleTextContainer"] = v_u_3.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 1,
			["Size"] = nil,
			["AutomaticSize"] = nil,
			["Size"] = UDim2.new(1, 0, 0, v31),
			["AutomaticSize"] = Enum.AutomaticSize.Y
		}, {
			["TitleText"] = v_u_3.createElement(v_u_8.App.Text.StyledTextLabel, {
				["fontStyle"] = p23.promptStyle.Font.Header1,
				["colorStyle"] = p23.promptStyle.Theme.SystemPrimaryDefault,
				["textXAlignment"] = Enum.TextXAlignment.Center,
				["size"] = UDim2.new(1, 0, 1, 0),
				["text"] = p23.titleText
			})
		}),
		["Divider"] = v_u_3.createElement("Frame", {
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = nil,
			["BorderSizePixel"] = 0,
			["LayoutOrder"] = 2,
			["Size"] = nil,
			["BackgroundColor3"] = p23.promptStyle.Theme.Divider.Color,
			["BackgroundTransparency"] = p23.promptStyle.Theme.Divider.Transparency,
			["Size"] = UDim2.new(1, 0, 0, 1)
		}),
		["DividerSpaceContainer"] = v_u_3.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 3,
			["Size"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 7)
		}),
		["BodyTextContainer"] = v_u_3.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 4,
			["Size"] = nil,
			["Size"] = UDim2.new(1, 0, 0, v35)
		}, {
			["BodyText"] = v_u_3.createElement(v_u_8.App.Text.StyledTextLabel, {
				["fontStyle"] = nil,
				["colorStyle"] = nil,
				["textXAlignment"] = nil,
				["size"] = nil,
				["text"] = nil,
				["lineHeight"] = 1.2,
				["fontStyle"] = p23.promptStyle.Font.Body,
				["colorStyle"] = p23.promptStyle.Theme.TextDefault,
				["textXAlignment"] = Enum.TextXAlignment.Left,
				["size"] = UDim2.new(1, 0, 1, 0),
				["text"] = p23.bodyText
			})
		})
	}
	local v50
	if v_u_18() then
		v50 = nil
	else
		local v51 = v_u_3.createElement
		local v52 = "Frame"
		local v53 = {
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 5,
			["Size"] = nil,
			["Size"] = UDim2.new(1, 0, 0, v39 + 20)
		}
		local v54 = {
			["Padding"] = v_u_3.createElement("UIPadding", {
				["PaddingTop"] = UDim.new(0, 15)
			}),
			["Layout"] = v_u_3.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["VerticalAlignment"] = Enum.VerticalAlignment.Top,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Left
			})
		}
		local v55 = p23.showCheckbox
		if v55 then
			v55 = v_u_3.createElement(v_u_10, {
				["label"] = "",
				["isChecked"] = nil,
				["isDisabled"] = false,
				["onActivated"] = nil,
				["LayoutOrder"] = 1,
				["isChecked"] = v26,
				["onActivated"] = function(p56) -- name: onActivated
					-- upvalues: (copy) v_u_27
					v_u_27(p56)
				end
			})
		end
		v54.Checkbox = v55
		local v57 = v_u_3.createElement
		local v58 = "Frame"
		local v59 = {
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 2,
			["Size"] = nil,
			["Size"] = UDim2.new(p23.showCheckbox and 0.95 or 1, 0, 0, v39)
		}
		local v60 = {}
		local v61 = p23.showCheckbox
		if v61 then
			v61 = v_u_3.createElement("UIPadding", {
				["PaddingLeft"] = UDim.new(0, 10)
			})
		end
		v60.Padding = v61
		v60.InfoText = v_u_3.createElement(v_u_8.App.Text.StyledTextLabel, {
			["fontStyle"] = nil,
			["colorStyle"] = nil,
			["textXAlignment"] = nil,
			["textYAlignment"] = nil,
			["size"] = nil,
			["text"] = nil,
			["lineHeight"] = 1.15,
			["fontStyle"] = p23.promptStyle.Font.CaptionHeader,
			["colorStyle"] = p23.promptStyle.Theme.TextDefault,
			["textXAlignment"] = Enum.TextXAlignment.Left,
			["textYAlignment"] = Enum.TextYAlignment.Top,
			["size"] = UDim2.new(1, 0, 1, 0),
			["text"] = v_u_21
		})
		v54.TextContainer = v57(v58, v59, v60)
		v50 = v51(v52, v53, v54)
	end
	v49.InfoTextContainer = v50
	v49.SpaceContainer = v_u_3.createElement("Frame", {
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 6,
		["Size"] = nil,
		["Size"] = UDim2.new(1, 0, 0, 10)
	})
	local v62 = v_u_3.createElement
	local v63 = "Frame"
	local v64 = {
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 7,
		["Size"] = nil,
		["AutomaticSize"] = nil,
		["Size"] = UDim2.new(1, 0, 0, 36),
		["AutomaticSize"] = Enum.AutomaticSize.Y
	}
	local v65 = {
		["Layout"] = v_u_3.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["Padding"] = UDim.new(0, 12),
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center
		}),
		["SecondaryButton"] = v_u_3.createElement(v_u_13, {
			["buttonType"] = nil,
			["layoutOrder"] = 1,
			["size"] = nil,
			["text"] = nil,
			["onActivated"] = nil,
			["Selectable"] = nil,
			["buttonType"] = v_u_14.Secondary,
			["size"] = UDim2.new(0.5, -5, 0, 36),
			["text"] = v_u_20,
			["onActivated"] = p23.handleSecondaryActivated,
			["Selectable"] = v41
		})
	}
	local v66 = v_u_3.createElement
	local v67 = v_u_13
	local v68 = {
		["buttonType"] = nil,
		["layoutOrder"] = 2,
		["size"] = nil,
		["text"] = nil,
		["isDisabled"] = nil,
		["onActivated"] = nil,
		["Selectable"] = nil,
		["buttonType"] = v_u_14.PrimarySystem,
		["size"] = UDim2.new(0.5, -5, 0, 36),
		["text"] = v_u_19
	}
	local v69 = p23.showCheckbox
	if v69 then
		v69 = not v26
	end
	v68.isDisabled = v69
	v68.onActivated = p23.handlePrimaryActivated
	v68.Selectable = v41
	v65.ConfirmButton = v66(v67, v68)
	v49.ButtonContainer = v62(v63, v64, v65)
	v45.DialogMainFrame = v46(v47, v48, v49)
	return v42(v43, v44, v45)
end
if v_u_17() then
	return v_u_4.forwardRef(v70)
else
	return v70
end