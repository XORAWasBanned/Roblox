-- Path: CoreGui.RobloxGui.Modules.Settings.Components.ReportConfirmation.ReportActionSelection
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.t)
local v4 = require(v1.Packages.UIBlox)
local v5 = require(v1.Packages.Foundation)
local v_u_6 = v5.Utility.normalizeFontFace
local v_u_7 = v5.Utility.Flags.FoundationFontFaceMigration
local v_u_8 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v_u_9 = v4.App.Button.TextButton
local v_u_10 = require(script.Parent.CheckboxRow)
local v11 = v_u_2.PureComponent:extend("ReportActionSelection")
local function v12() end
v11.defaultProps = {
	["titleText"] = "Thanks for your report!",
	["subtitleText"] = "We\'ve received your report and will take action soon if needed. Your feedback helps keep our community safe.",
	["instructionText"] = "Other steps you can take:",
	["muteText"] = "Mute {DISPLAYNAME}(@username)",
	["blockText"] = "Block {DISPLAYNAME}(@username)",
	["doneText"] = "Done",
	["showVoiceMuting"] = true,
	["isVoiceMuted"] = false,
	["isBlocked"] = false,
	["onMuteCheckboxActivated"] = nil,
	["onBlockCheckboxActivated"] = nil,
	["onDoneActivated"] = nil,
	["ZIndex"] = 1,
	["uiScale"] = 1.3,
	["onMuteCheckboxActivated"] = v12,
	["onBlockCheckboxActivated"] = v12,
	["onDoneActivated"] = v12
}
v11.validateProps = v3.interface({
	["titleText"] = v3.string,
	["subtitleText"] = v3.string,
	["instructionText"] = v3.string,
	["muteText"] = v3.string,
	["blockText"] = v3.string,
	["doneText"] = v3.string,
	["showVoiceMuting"] = v3.boolean,
	["isVoiceMuted"] = v3.optional(v3.boolean),
	["isBlocked"] = v3.optional(v3.boolean),
	["onMuteCheckboxActivated"] = v3.optional(v3.callback),
	["onBlockCheckboxActivated"] = v3.optional(v3.callback),
	["onDoneActivated"] = v3.callback,
	["ZIndex"] = v3.number
})
function v11.init(p_u_13) -- name: init
	function p_u_13.onMuteCheckboxActivated(p14)
		-- upvalues: (copy) p_u_13
		p_u_13:setState({
			["isVoiceMuted"] = p14
		})
		p_u_13.props.onMuteCheckboxActivated(p14)
	end
	function p_u_13.onBlockCheckboxActivated(p15)
		-- upvalues: (copy) p_u_13
		p_u_13:setState({
			["isBlocked"] = p15
		})
		p_u_13.props.onBlockCheckboxActivated(p15)
	end
	function p_u_13.onDoneActivated()
		-- upvalues: (copy) p_u_13
		p_u_13.props.onDoneActivated(p_u_13.state.isBlocked, p_u_13.state.isVoiceMuted)
	end
	p_u_13:setState({
		["isVoiceMuted"] = p_u_13.props.isVoiceMuted,
		["isBlocked"] = p_u_13.props.isBlocked
	})
end
function v11.render(p_u_16) -- name: render
	-- upvalues: (copy) v_u_8, (copy) v_u_7, (copy) v_u_2, (copy) v_u_6, (copy) v_u_10, (copy) v_u_9
	return v_u_8(function(p17)
		-- upvalues: (ref) v_u_7
		local v18 = {}
		local v19
		if v_u_7 then
			v19 = p17
		else
			v19 = nil
		end
		v18.Tokens = v19
		v18.Theme = {
			["Divider"] = {
				["Color"] = p17.Color.Stroke.Emphasis.Color3,
				["Transparency"] = p17.Color.Stroke.Emphasis.Transparency
			},
			["SystemPrimaryContent"] = {
				["Color"] = p17.Color.ActionSubEmphasis.Foreground.Color3,
				["Transparency"] = p17.Color.ActionSubEmphasis.Foreground.Transparency
			},
			["TextDefault"] = {
				["Color"] = p17.Color.Content.Default.Color3,
				["Transparency"] = p17.Color.Content.Default.Transparency
			},
			["TextEmphasis"] = {
				["Color"] = p17.Color.Content.Emphasis.Color3,
				["Transparency"] = p17.Color.Content.Emphasis.Transparency
			}
		}
		v18.Font = {
			["BaseSize"] = 1,
			["CaptionHeader"] = nil,
			["Header1"] = nil,
			["CaptionHeader"] = {
				["Font"] = p17.Typography.CaptionLarge.Font,
				["RelativeSize"] = p17.Typography.CaptionLarge.FontSize
			},
			["Header1"] = {
				["Font"] = p17.Typography.HeadingSmall.Font,
				["RelativeSize"] = p17.Typography.HeadingSmall.FontSize
			}
		}
		return v18
	end, function(p20)
		-- upvalues: (ref) v_u_2, (copy) p_u_16, (ref) v_u_7, (ref) v_u_6, (ref) v_u_10, (ref) v_u_9
		local v21 = p20.Font.BaseSize
		local v22 = v_u_2.createElement
		local v23 = "Frame"
		local v24 = {
			["Size"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["ZIndex"] = nil,
			["Size"] = UDim2.fromScale(1, 1),
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = UDim2.fromScale(0.5, 0.5),
			["ZIndex"] = p_u_16.props.ZIndex
		}
		local v25 = {
			["uiScale"] = v_u_2.createElement("UIScale", {
				["Scale"] = p_u_16.props.uiScale
			}),
			["layout"] = v_u_2.createElement("UIListLayout", {
				["VerticalAlignment"] = Enum.VerticalAlignment.Top,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
				["Padding"] = UDim.new(0, 22),
				["FillDirection"] = Enum.FillDirection.Vertical,
				["SortOrder"] = Enum.SortOrder.LayoutOrder
			})
		}
		local v26 = v_u_2.createElement
		local v27 = "TextLabel"
		local v28 = {
			["Text"] = nil,
			["TextColor3"] = nil,
			["TextTransparency"] = nil,
			["TextSize"] = nil,
			["Font"] = nil,
			["FontFace"] = nil,
			["BackgroundTransparency"] = 1,
			["AutomaticSize"] = nil,
			["LayoutOrder"] = 1,
			["Text"] = p_u_16.props.titleText,
			["TextColor3"] = p20.Theme.TextEmphasis.Color,
			["TextTransparency"] = p20.Theme.TextEmphasis.Transparency,
			["TextSize"] = p20.Font.Header1.RelativeSize * v21
		}
		local v29
		if v_u_7 then
			v29 = nil
		else
			v29 = p20.Font.Header1.Font
		end
		v28.Font = v29
		local v30
		if v_u_7 then
			v30 = v_u_6(p20.Tokens.Typography.HeadingSmall.Font)
		else
			v30 = nil
		end
		v28.FontFace = v30
		v28.AutomaticSize = Enum.AutomaticSize.XY
		v25.title = v26(v27, v28)
		local v31 = v_u_2.createElement
		local v32 = "TextLabel"
		local v33 = {
			["Size"] = nil,
			["Text"] = nil,
			["TextColor3"] = nil,
			["TextTransparency"] = nil,
			["TextSize"] = nil,
			["Font"] = nil,
			["FontFace"] = nil,
			["TextWrapped"] = true,
			["BackgroundTransparency"] = 1,
			["AutomaticSize"] = nil,
			["LayoutOrder"] = 2,
			["Size"] = UDim2.fromOffset(612, 0),
			["Text"] = p_u_16.props.subtitleText,
			["TextColor3"] = p20.Theme.TextEmphasis.Color,
			["TextTransparency"] = p20.Theme.TextEmphasis.Transparency,
			["TextSize"] = p20.Font.CaptionHeader.RelativeSize * v21
		}
		local v34
		if v_u_7 then
			v34 = nil
		else
			v34 = p20.Font.CaptionHeader.Font
		end
		v33.Font = v34
		local v35
		if v_u_7 then
			v35 = v_u_6(p20.Tokens.Typography.CaptionLarge.Font)
		else
			v35 = nil
		end
		v33.FontFace = v35
		v33.AutomaticSize = Enum.AutomaticSize.Y
		v25.subtitle = v31(v32, v33)
		local v36 = v_u_2.createElement
		local v37 = "Frame"
		local v38 = {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["AutomaticSize"] = nil,
			["LayoutOrder"] = 3,
			["Size"] = UDim2.fromOffset(584, 0),
			["AutomaticSize"] = Enum.AutomaticSize.Y
		}
		local v39 = {
			["layout"] = v_u_2.createElement("UIListLayout", {
				["VerticalAlignment"] = Enum.VerticalAlignment.Top,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
				["Padding"] = UDim.new(0, 18),
				["FillDirection"] = Enum.FillDirection.Vertical,
				["SortOrder"] = Enum.SortOrder.LayoutOrder
			})
		}
		local v40 = v_u_2.createElement
		local v41 = "TextLabel"
		local v42 = {
			["Size"] = nil,
			["Text"] = nil,
			["TextColor3"] = nil,
			["TextTransparency"] = nil,
			["TextSize"] = nil,
			["Font"] = nil,
			["FontFace"] = nil,
			["TextXAlignment"] = nil,
			["BackgroundTransparency"] = 1,
			["AutomaticSize"] = nil,
			["LayoutOrder"] = 1,
			["Size"] = UDim2.fromScale(1, 0),
			["Text"] = p_u_16.props.instructionText,
			["TextColor3"] = p20.Theme.TextDefault.Color,
			["TextTransparency"] = p20.Theme.TextDefault.Transparency,
			["TextSize"] = p20.Font.CaptionHeader.RelativeSize * v21
		}
		local v43
		if v_u_7 then
			v43 = nil
		else
			v43 = p20.Font.CaptionHeader.Font
		end
		v42.Font = v43
		local v44
		if v_u_7 then
			v44 = v_u_6(p20.Tokens.Typography.CaptionLarge.Font)
		else
			v44 = nil
		end
		v42.FontFace = v44
		v42.TextXAlignment = Enum.TextXAlignment.Left
		v42.AutomaticSize = Enum.AutomaticSize.Y
		v39.instruction = v40(v41, v42)
		local v45 = p_u_16.props.showVoiceMuting
		if v45 then
			v45 = v_u_2.createElement(v_u_10, {
				["height"] = 28,
				["image"] = "icons/controls/microphone",
				["descriptionText"] = nil,
				["actionDisabled"] = nil,
				["checkboxSelected"] = nil,
				["onCheckboxActivated"] = nil,
				["LayoutOrder"] = 2,
				["descriptionText"] = p_u_16.props.muteText,
				["actionDisabled"] = p_u_16.state.isBlocked,
				["checkboxSelected"] = p_u_16.state.isBlocked or p_u_16.state.isVoiceMuted,
				["onCheckboxActivated"] = p_u_16.onMuteCheckboxActivated
			})
		end
		v39.muteCheckbox = v45
		local v46 = p_u_16.props.showVoiceMuting
		if v46 then
			v46 = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["BackgroundColor3"] = nil,
				["BackgroundTransparency"] = nil,
				["BorderSizePixel"] = 0,
				["LayoutOrder"] = 3,
				["Size"] = UDim2.new(1, 0, 0, 1),
				["BackgroundColor3"] = p20.Theme.Divider.Color,
				["BackgroundTransparency"] = p20.Theme.Divider.Transparency
			})
		end
		v39.div = v46
		v39.blockCheckbox = v_u_2.createElement(v_u_10, {
			["height"] = 28,
			["image"] = "icons/actions/block",
			["descriptionText"] = nil,
			["checkboxSelected"] = nil,
			["onCheckboxActivated"] = nil,
			["LayoutOrder"] = 4,
			["descriptionText"] = p_u_16.props.blockText,
			["checkboxSelected"] = p_u_16.state.isBlocked,
			["onCheckboxActivated"] = p_u_16.onBlockCheckboxActivated
		})
		v39.doneContainer = v_u_2.createElement("Frame", {
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = nil,
			["LayoutOrder"] = 5,
			["BackgroundColor3"] = p20.Theme.SystemPrimaryContent.Color,
			["BackgroundTransparency"] = p20.Theme.SystemPrimaryContent.Transparency,
			["Size"] = UDim2.new(1, 0, 0, 44)
		}, {
			["uiCorner"] = v_u_2.createElement("UICorner", {
				["CornerRadius"] = UDim.new(0, 4)
			}),
			["doneButton"] = v_u_2.createElement(v_u_9, {
				["size"] = UDim2.fromScale(1, 1),
				["text"] = p_u_16.props.doneText,
				["onActivated"] = p_u_16.onDoneActivated
			})
		})
		v25.actions = v36(v37, v38, v39)
		return v22(v23, v24, v25)
	end)
end
return v11