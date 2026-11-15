-- Path: CoreGui.RobloxGui.Modules.Settings.Components.ReportConfirmation.CheckboxRow
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.t)
local v4 = require(v1.Packages.UIBlox)
local v_u_5 = require(v1.Packages.Foundation)
local v_u_6 = v_u_5.Checkbox
local v_u_7 = v_u_5.Utility.normalizeFontFace
local v_u_8 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v_u_9 = require(v1.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local v_u_10 = v_u_5.Utility.Flags.FoundationFontFaceMigration
local v_u_11 = v4.Core.ImageSet.ImageSetLabel
local v_u_12 = v4.App.ImageSet.Images
local v13 = v_u_2.PureComponent:extend("CheckboxRow")
v13.defaultProps = {
	["height"] = 28,
	["image"] = "icons/controls/microphone",
	["descriptionText"] = "Description Text",
	["checkboxSelected"] = false,
	["actionDisabled"] = false,
	["onCheckboxActivated"] = nil,
	["LayoutOrder"] = 1,
	["onCheckboxActivated"] = function() -- name: onCheckboxActivated end
}
v13.validateProps = v3.interface({
	["height"] = v3.number,
	["image"] = v3.string,
	["descriptionText"] = v3.string,
	["checkboxSelected"] = v3.boolean,
	["actionDisabled"] = v3.boolean,
	["onCheckboxActivated"] = v3.callback,
	["LayoutOrder"] = v3.optional(v3.number)
})
function v13.render(p_u_14) -- name: render
	-- upvalues: (copy) v_u_8, (copy) v_u_10, (copy) v_u_9, (copy) v_u_2, (copy) v_u_5, (copy) v_u_11, (copy) v_u_12, (copy) v_u_7, (copy) v_u_6
	return v_u_8(function(p15)
		-- upvalues: (ref) v_u_10
		local v16 = {}
		local v17
		if v_u_10 then
			v17 = p15
		else
			v17 = nil
		end
		v16.Tokens = v17
		v16.Theme = {
			["IconDefault"] = {
				["Color"] = p15.Color.Content.Default.Color3,
				["Transparency"] = p15.Color.Content.Default.Transparency
			},
			["IconEmphasis"] = {
				["Color"] = p15.Color.Content.Emphasis.Color3,
				["Transparency"] = p15.Color.Content.Emphasis.Transparency
			},
			["TextEmphasis"] = {
				["Color"] = p15.Color.Content.Emphasis.Color3,
				["Transparency"] = p15.Color.Content.Emphasis.Transparency
			},
			["TextMuted"] = {
				["Color"] = p15.Color.Content.Muted.Color3,
				["Transparency"] = p15.Color.Content.Muted.Transparency
			}
		}
		v16.Font = {
			["BaseSize"] = 1,
			["Header2"] = nil,
			["Header2"] = {
				["Font"] = p15.Typography.TitleLarge.Font,
				["RelativeSize"] = p15.Typography.TitleLarge.FontSize
			}
		}
		return v16
	end, function(p18)
		-- upvalues: (copy) p_u_14, (ref) v_u_9, (ref) v_u_2, (ref) v_u_5, (ref) v_u_11, (ref) v_u_12, (ref) v_u_10, (ref) v_u_7, (ref) v_u_6
		local v19 = p18.Font.BaseSize
		local v20, v21
		if p_u_14.props.actionDisabled then
			v20 = p18.Theme.TextMuted
			v21 = p18.Theme.IconDefault
		else
			v20 = p18.Theme.TextEmphasis
			v21 = p18.Theme.IconEmphasis
		end
		local v22
		if v_u_9 then
			v22 = v_u_2.createElement(v_u_5.Icon, {
				["name"] = nil,
				["size"] = nil,
				["style"] = nil,
				["LayoutOrder"] = 1,
				["name"] = p_u_14.props.image,
				["size"] = v_u_5.Enums.IconSize.Medium,
				["style"] = {
					["Color3"] = v21.Color,
					["Transparency"] = v21.Transparency
				}
			})
		else
			v22 = v_u_2.createElement(v_u_11, {
				["Size"] = nil,
				["Image"] = nil,
				["ImageColor3"] = nil,
				["ImageTransparency"] = nil,
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 1,
				["Size"] = UDim2.fromOffset(p_u_14.props.height, p_u_14.props.height),
				["Image"] = v_u_12[p_u_14.props.image],
				["ImageColor3"] = v21.Color,
				["ImageTransparency"] = v21.Transparency
			})
		end
		local v23 = v_u_2.createElement
		local v24 = "Frame"
		local v25 = {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = nil,
			["Size"] = UDim2.new(1, 0, 0, p_u_14.props.height),
			["LayoutOrder"] = p_u_14.props.LayoutOrder
		}
		local v26 = {
			["layout"] = v_u_2.createElement("UIListLayout", {
				["VerticalAlignment"] = Enum.VerticalAlignment.Center,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
				["Padding"] = UDim.new(0, 12),
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["SortOrder"] = Enum.SortOrder.LayoutOrder
			}),
			["image"] = v22
		}
		local v27 = v_u_2.createElement
		local v28 = "TextLabel"
		local v29 = {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Text"] = nil,
			["TextColor3"] = nil,
			["TextTransparency"] = nil,
			["TextSize"] = nil,
			["Font"] = nil,
			["FontFace"] = nil,
			["TextXAlignment"] = nil,
			["LayoutOrder"] = 2,
			["Size"] = UDim2.new(1, -(p_u_14.props.height + 12) * 4, 1, 0),
			["Text"] = p_u_14.props.descriptionText,
			["TextColor3"] = v20.Color,
			["TextTransparency"] = v20.Transparency,
			["TextSize"] = p18.Font.Header2.RelativeSize * v19
		}
		local v30
		if v_u_10 then
			v30 = nil
		else
			v30 = p18.Font.Header2.Font
		end
		v29.Font = v30
		local v31
		if v_u_10 then
			v31 = v_u_7(p18.Tokens.Typography.TitleLarge.Font)
		else
			v31 = nil
		end
		v29.FontFace = v31
		v29.TextXAlignment = Enum.TextXAlignment.Left
		v26.text = v27(v28, v29)
		v26.checkbox = v_u_2.createElement(v_u_6, {
			["isDisabled"] = nil,
			["isChecked"] = nil,
			["onActivated"] = nil,
			["label"] = "",
			["LayoutOrder"] = 3,
			["isDisabled"] = p_u_14.props.actionDisabled,
			["isChecked"] = p_u_14.props.checkboxSelected,
			["onActivated"] = p_u_14.props.onCheckboxActivated
		})
		return v23(v24, v25, v26)
	end)
end
return v13