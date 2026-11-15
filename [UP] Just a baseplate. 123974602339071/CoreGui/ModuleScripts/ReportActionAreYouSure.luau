-- Path: CoreGui.RobloxGui.Modules.Settings.Components.ReportConfirmation.ReportActionAreYouSure
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.t)
local v_u_4 = require(v1.Packages.UIBlox)
local v5 = require(v1.Packages.Foundation)
local v_u_6 = v5.Utility.normalizeFontFace
local v_u_7 = v5.Utility.Flags.FoundationFontFaceMigration
local v_u_8 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v_u_9 = v_u_4.App.Button.TextButton
local v10 = v_u_2.PureComponent:extend("ReportActionSelection")
local function v11() end
v10.defaultProps = {
	["isMuted"] = true,
	["isBlocked"] = true,
	["onCancelActivated"] = nil,
	["onConfirmActivated"] = nil,
	["ZIndex"] = 1,
	["uiScale"] = 1.3,
	["onCancelActivated"] = v11,
	["onConfirmActivated"] = v11
}
v10.validateProps = v3.strictInterface({
	["mutedTitleText"] = v3.string,
	["blockedTitleText"] = v3.string,
	["mutedAndBlockedTitleText"] = v3.string,
	["mutedSubtitleText"] = v3.string,
	["blockedSubtitleText"] = v3.string,
	["mutedAndBlockedSubtitleText"] = v3.string,
	["cancelText"] = v3.string,
	["confirmText"] = v3.string,
	["isMuted"] = v3.boolean,
	["isBlocked"] = v3.boolean,
	["onCancelActivated"] = v3.callback,
	["onConfirmActivated"] = v3.callback,
	["ZIndex"] = v3.optional(v3.number),
	["uiScale"] = v3.optional(v3.number)
})
function v10.init(p_u_12) -- name: init
	function p_u_12.onCancelActivated()
		-- upvalues: (copy) p_u_12
		p_u_12.props.onCancelActivated()
	end
	function p_u_12.onConfirmActivated()
		-- upvalues: (copy) p_u_12
		p_u_12.props.onConfirmActivated()
	end
	local v13 = nil
	local v14 = nil
	if p_u_12.props.isMuted and p_u_12.props.isBlocked then
		v13 = p_u_12.props.mutedAndBlockedTitleText
		v14 = p_u_12.props.mutedAndBlockedSubtitleText
	elseif p_u_12.props.isMuted then
		v13 = p_u_12.props.mutedTitleText
		v14 = p_u_12.props.mutedSubtitleText
	elseif p_u_12.props.isBlocked then
		v13 = p_u_12.props.blockedTitleText
		v14 = p_u_12.props.blockedSubtitleText
	end
	p_u_12:setState({
		["titleText"] = v13,
		["subtitleText"] = v14
	})
end
function v10.render(p_u_15) -- name: render
	-- upvalues: (copy) v_u_8, (copy) v_u_7, (copy) v_u_2, (copy) v_u_6, (copy) v_u_9, (copy) v_u_4
	return v_u_8(function(p16)
		-- upvalues: (ref) v_u_7
		local v17 = {}
		local v18
		if v_u_7 then
			v18 = p16
		else
			v18 = nil
		end
		v17.Tokens = v18
		v17.Theme = {
			["SystemPrimaryContent"] = {
				["Color"] = p16.Color.ActionSubEmphasis.Foreground.Color3,
				["Transparency"] = p16.Color.ActionSubEmphasis.Foreground.Transparency
			},
			["TextEmphasis"] = {
				["Color"] = p16.Color.Content.Emphasis.Color3,
				["Transparency"] = p16.Color.Content.Emphasis.Transparency
			}
		}
		v17.Font = {
			["BaseSize"] = 1,
			["CaptionHeader"] = nil,
			["Header1"] = nil,
			["CaptionHeader"] = {
				["Font"] = p16.Typography.CaptionLarge.Font,
				["RelativeSize"] = p16.Typography.CaptionLarge.FontSize
			},
			["Header1"] = {
				["Font"] = p16.Typography.HeadingSmall.Font,
				["RelativeSize"] = p16.Typography.HeadingSmall.FontSize
			}
		}
		return v17
	end, function(p19)
		-- upvalues: (ref) v_u_2, (copy) p_u_15, (ref) v_u_7, (ref) v_u_6, (ref) v_u_9, (ref) v_u_4
		local v20 = p19.Font.BaseSize
		local v21 = v_u_2.createElement
		local v22 = "Frame"
		local v23 = {
			["Size"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["ZIndex"] = nil,
			["Size"] = UDim2.fromScale(1, 1),
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = UDim2.fromScale(0.5, 0.5),
			["ZIndex"] = p_u_15.props.ZIndex
		}
		local v24 = {
			["uiScale"] = v_u_2.createElement("UIScale", {
				["Scale"] = p_u_15.props.uiScale
			}),
			["layout"] = v_u_2.createElement("UIListLayout", {
				["VerticalAlignment"] = Enum.VerticalAlignment.Top,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
				["Padding"] = UDim.new(0, 22),
				["FillDirection"] = Enum.FillDirection.Vertical,
				["SortOrder"] = Enum.SortOrder.LayoutOrder
			})
		}
		local v25 = v_u_2.createElement
		local v26 = "TextLabel"
		local v27 = {
			["Text"] = nil,
			["TextColor3"] = nil,
			["TextTransparency"] = nil,
			["TextSize"] = nil,
			["Font"] = nil,
			["FontFace"] = nil,
			["BackgroundTransparency"] = 1,
			["AutomaticSize"] = nil,
			["LayoutOrder"] = 1,
			["Text"] = p_u_15.state.titleText,
			["TextColor3"] = p19.Theme.TextEmphasis.Color,
			["TextTransparency"] = p19.Theme.TextEmphasis.Transparency,
			["TextSize"] = p19.Font.Header1.RelativeSize * v20
		}
		local v28
		if v_u_7 then
			v28 = nil
		else
			v28 = p19.Font.Header1.Font
		end
		v27.Font = v28
		local v29
		if v_u_7 then
			v29 = v_u_6(p19.Tokens.Typography.HeadingSmall.Font)
		else
			v29 = nil
		end
		v27.FontFace = v29
		v27.AutomaticSize = Enum.AutomaticSize.XY
		v24.title = v25(v26, v27)
		local v30 = v_u_2.createElement
		local v31 = "TextLabel"
		local v32 = {
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
			["Text"] = p_u_15.state.subtitleText,
			["TextColor3"] = p19.Theme.TextEmphasis.Color,
			["TextTransparency"] = p19.Theme.TextEmphasis.Transparency,
			["TextSize"] = p19.Font.CaptionHeader.RelativeSize * v20
		}
		local v33
		if v_u_7 then
			v33 = nil
		else
			v33 = p19.Font.CaptionHeader.Font
		end
		v32.Font = v33
		local v34
		if v_u_7 then
			v34 = v_u_6(p19.Tokens.Typography.CaptionLarge.Font)
		else
			v34 = nil
		end
		v32.FontFace = v34
		v32.AutomaticSize = Enum.AutomaticSize.Y
		v24.subtitle = v30(v31, v32)
		v24.spacer = v_u_2.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["LayoutOrder"] = 3,
			["Size"] = UDim2.fromOffset(0, 62)
		})
		local v35 = v_u_2.createElement
		local v36 = {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["AutomaticSize"] = nil,
			["LayoutOrder"] = 4,
			["Size"] = UDim2.fromOffset(584, 0),
			["AutomaticSize"] = Enum.AutomaticSize.Y
		}
		local v37 = {
			["layout"] = v_u_2.createElement("UIListLayout", {
				["VerticalAlignment"] = Enum.VerticalAlignment.Center,
				["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
				["Padding"] = UDim.new(0, 70),
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["SortOrder"] = Enum.SortOrder.LayoutOrder
			}),
			["cancelContainer"] = v_u_2.createElement("Frame", {
				["BackgroundColor3"] = nil,
				["BackgroundTransparency"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = nil,
				["LayoutOrder"] = 1,
				["BackgroundColor3"] = p19.Theme.SystemPrimaryContent.Color,
				["BackgroundTransparency"] = p19.Theme.SystemPrimaryContent.Transparency,
				["Size"] = UDim2.fromOffset(234, 44)
			}, {
				["uiCorner"] = v_u_2.createElement("UICorner", {
					["CornerRadius"] = UDim.new(0, 4)
				}),
				["cancelButton"] = v_u_2.createElement(v_u_9, {
					["size"] = UDim2.fromScale(1, 1),
					["text"] = p_u_15.props.cancelText,
					["onActivated"] = p_u_15.onCancelActivated
				})
			}),
			["confirmContainer"] = v_u_2.createElement("Frame", {
				["BackgroundColor3"] = nil,
				["BackgroundTransparency"] = 0,
				["BorderSizePixel"] = 0,
				["Size"] = nil,
				["LayoutOrder"] = 2,
				["BackgroundColor3"] = v_u_4.App.Style.Colors.Blue,
				["Size"] = UDim2.fromOffset(234, 44)
			}, {
				["uiCorner"] = v_u_2.createElement("UICorner", {
					["CornerRadius"] = UDim.new(0, 4)
				}),
				["confirmButton"] = v_u_2.createElement(v_u_9, {
					["size"] = UDim2.fromScale(1, 1),
					["text"] = p_u_15.props.confirmText,
					["onActivated"] = p_u_15.onConfirmActivated
				})
			})
		}
		v24.actions = v35("Frame", v36, v37)
		return v21(v22, v23, v24)
	end)
end
return v10