-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.ThemedTextLabel
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v_u_4 = v2.Cryo
local v5 = v2.t
local v6 = require(v1.Packages.Foundation)
local v_u_7 = v6.Utility.normalizeFontFace
local v_u_8 = v6.Utility.Flags.FoundationFontFaceMigration
local v_u_9 = require(v1.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local v10 = script.Parent.Parent
local v_u_11 = require(v10.GlobalConfig)
local v_u_12 = {
	["Title"] = "HeadingLarge",
	["Header1"] = "HeadingSmall",
	["Header2"] = "TitleLarge",
	["SubHeader1"] = "TitleLarge",
	["Body"] = "BodyLarge",
	["CaptionHeader"] = "CaptionLarge",
	["CaptionSubHeader"] = "CaptionLarge",
	["CaptionBody"] = "BodySmall",
	["Footer"] = "CaptionSmall"
}
local v_u_13 = v5.strictInterface({
	["themeKey"] = v5.optional(v5.string),
	["fontKey"] = v5.optional(v5.string),
	["AnchorPoint"] = v5.optional(v5.Vector2),
	["LayoutOrder"] = v5.optional(v5.integer),
	["Position"] = v5.optional(v5.UDim2),
	["Size"] = v5.optional(v5.UDim2),
	["Text"] = v5.string,
	["TextColor3"] = v5.optional(v5.Color3),
	["TextTransparency"] = v5.optional(v5.numberConstrained(0, 1)),
	["TextWrapped"] = v5.optional(v5.boolean),
	["TextXAlignment"] = v5.optional(v5.enum(Enum.TextXAlignment)),
	["TextYAlignment"] = v5.optional(v5.enum(Enum.TextYAlignment)),
	["TextTruncate"] = v5.optional(v5.enum(Enum.TextTruncate)),
	["Visible"] = v5.optional(v5.boolean),
	["ZIndex"] = v5.optional(v5.integer),
	["AutomaticSize"] = v5.optional(v5.enum(Enum.AutomaticSize)),
	[v_u_3.Children] = v5.optional(v5.table)
})
return function(p_u_14) -- name: ThemedTextLabel
	-- upvalues: (copy) v_u_11, (copy) v_u_13, (copy) v_u_9, (copy) v_u_8, (copy) v_u_12, (copy) v_u_7, (copy) v_u_4, (copy) v_u_3
	if v_u_11.propValidation then
		local v15 = v_u_13
		assert(v15(p_u_14))
	end
	return v_u_9(function(p16)
		-- upvalues: (ref) v_u_8
		local v17 = {}
		local v18
		if v_u_8 then
			v18 = p16
		else
			v18 = nil
		end
		v17.Tokens = v18
		v17.Theme = {
			["BackgroundDefault"] = {
				["Color"] = p16.Color.Surface.Surface_0.Color3,
				["Transparency"] = p16.Color.Surface.Surface_0.Transparency
			},
			["BackgroundContrast"] = {
				["Color"] = p16.Color.Surface.Surface_100.Color3,
				["Transparency"] = p16.Color.Surface.Surface_100.Transparency
			},
			["BackgroundMuted"] = {
				["Color"] = p16.Color.Surface.Surface_200.Color3,
				["Transparency"] = p16.Color.Surface.Surface_200.Transparency
			},
			["BackgroundUIDefault"] = {
				["Color"] = p16.Color.Surface.Surface_300.Color3,
				["Transparency"] = p16.Color.Surface.Surface_300.Transparency
			},
			["BackgroundUIContrast"] = {
				["Color"] = p16.Color.OverMedia.OverMedia_0.Color3,
				["Transparency"] = p16.Color.OverMedia.OverMedia_0.Transparency
			},
			["BackgroundOnHover"] = {
				["Color"] = p16.Color.State.Hover.Color3,
				["Transparency"] = p16.Color.State.Hover.Transparency
			},
			["BackgroundOnPress"] = {
				["Color"] = p16.Color.State.Press.Color3,
				["Transparency"] = p16.Color.State.Press.Transparency
			},
			["UIDefault"] = {
				["Color"] = p16.Color.Shift.Shift_200.Color3,
				["Transparency"] = p16.Color.Shift.Shift_200.Transparency
			},
			["UIMuted"] = {
				["Color"] = p16.Color.Shift.Shift_100.Color3,
				["Transparency"] = p16.Color.Shift.Shift_100.Transparency
			},
			["UIEmphasis"] = {
				["Color"] = p16.Color.Shift.Shift_400.Color3,
				["Transparency"] = p16.Color.Shift.Shift_400.Transparency
			},
			["ContextualPrimaryDefault"] = {
				["Color"] = p16.Color.ActionEmphasis.Background.Color3,
				["Transparency"] = p16.Color.ActionEmphasis.Background.Transparency
			},
			["ContextualPrimaryContent"] = {
				["Color"] = p16.Color.ActionEmphasis.Foreground.Color3,
				["Transparency"] = p16.Color.ActionEmphasis.Foreground.Transparency
			},
			["SystemPrimaryDefault"] = {
				["Color"] = p16.Color.ActionSubEmphasis.Background.Color3,
				["Transparency"] = p16.Color.ActionSubEmphasis.Background.Transparency
			},
			["SystemPrimaryContent"] = {
				["Color"] = p16.Color.ActionSubEmphasis.Foreground.Color3,
				["Transparency"] = p16.Color.ActionSubEmphasis.Foreground.Transparency
			},
			["IconDefault"] = {
				["Color"] = p16.Color.Content.Default.Color3,
				["Transparency"] = p16.Color.Content.Default.Transparency
			},
			["IconEmphasis"] = {
				["Color"] = p16.Color.Content.Emphasis.Color3,
				["Transparency"] = p16.Color.Content.Emphasis.Transparency
			},
			["IconOnHover"] = {
				["Color"] = p16.Color.Content.Emphasis.Color3,
				["Transparency"] = p16.Color.Content.Emphasis.Transparency
			},
			["TextEmphasis"] = {
				["Color"] = p16.Color.Content.Emphasis.Color3,
				["Transparency"] = p16.Color.Content.Emphasis.Transparency
			},
			["TextDefault"] = {
				["Color"] = p16.Color.Content.Default.Color3,
				["Transparency"] = p16.Color.Content.Default.Transparency
			},
			["TextMuted"] = {
				["Color"] = p16.Color.Content.Muted.Color3,
				["Transparency"] = p16.Color.Content.Muted.Transparency
			},
			["TextLink"] = {
				["Color"] = p16.Color.Content.Link.Color3,
				["Transparency"] = p16.Color.Content.Link.Transparency
			},
			["Divider"] = {
				["Color"] = p16.Color.Stroke.Emphasis.Color3,
				["Transparency"] = p16.Color.Stroke.Emphasis.Transparency
			},
			["Overlay"] = {
				["Color"] = p16.Color.Common.Scrim.Color3,
				["Transparency"] = p16.Color.Common.Scrim.Transparency
			},
			["DropShadow"] = {
				["Color"] = p16.Color.Common.Shadow.Color3,
				["Transparency"] = p16.Color.Common.Shadow.Transparency
			},
			["NavigationBar"] = {
				["Color"] = p16.Color.Common.NavigationBar.Color3,
				["Transparency"] = p16.Color.Common.NavigationBar.Transparency
			},
			["PlaceHolder"] = {
				["Color"] = p16.Color.Common.Shimmer.Color3,
				["Transparency"] = p16.Color.Common.Shimmer.Transparency
			},
			["OnlineStatus"] = {
				["Color"] = p16.Color.System.Success.Color3,
				["Transparency"] = p16.Color.System.Success.Transparency
			},
			["OfflineStatus"] = {
				["Color"] = p16.Color.System.Neutral.Color3,
				["Transparency"] = p16.Color.System.Neutral.Transparency
			},
			["Success"] = {
				["Color"] = p16.Color.System.Success.Color3,
				["Transparency"] = p16.Color.System.Success.Transparency
			},
			["Alert"] = {
				["Color"] = p16.Color.System.Alert.Color3,
				["Transparency"] = p16.Color.System.Alert.Transparency
			},
			["Badge"] = {
				["Color"] = p16.Color.System.Contrast.Color3,
				["Transparency"] = p16.Color.System.Contrast.Transparency
			},
			["BadgeContent"] = {
				["Color"] = p16.Inverse.Content.Emphasis.Color3,
				["Transparency"] = p16.Inverse.Content.Emphasis.Transparency
			},
			["SecondaryContent"] = {
				["Color"] = p16.Color.Extended.White.White_70.Color3,
				["Transparency"] = p16.Color.Extended.White.White_70.Transparency
			}
		}
		v17.Font = {
			["BaseSize"] = 1,
			["Title"] = nil,
			["Header1"] = nil,
			["Header2"] = nil,
			["SubHeader1"] = nil,
			["Body"] = nil,
			["CaptionHeader"] = nil,
			["CaptionSubHeader"] = nil,
			["CaptionBody"] = nil,
			["Footer"] = nil,
			["Title"] = {
				["Font"] = p16.Typography.HeadingLarge.Font,
				["RelativeSize"] = p16.Typography.HeadingLarge.FontSize
			},
			["Header1"] = {
				["Font"] = p16.Typography.HeadingSmall.Font,
				["RelativeSize"] = p16.Typography.HeadingSmall.FontSize
			},
			["Header2"] = {
				["Font"] = p16.Typography.TitleLarge.Font,
				["RelativeSize"] = p16.Typography.TitleLarge.FontSize
			},
			["SubHeader1"] = {
				["Font"] = p16.Typography.TitleLarge.Font,
				["RelativeSize"] = p16.Typography.TitleLarge.FontSize
			},
			["Body"] = {
				["Font"] = p16.Typography.BodyLarge.Font,
				["RelativeSize"] = p16.Typography.BodyLarge.FontSize
			},
			["CaptionHeader"] = {
				["Font"] = p16.Typography.CaptionLarge.Font,
				["RelativeSize"] = p16.Typography.CaptionLarge.FontSize
			},
			["CaptionSubHeader"] = {
				["Font"] = p16.Typography.CaptionLarge.Font,
				["RelativeSize"] = p16.Typography.CaptionLarge.FontSize
			},
			["CaptionBody"] = {
				["Font"] = p16.Typography.BodySmall.Font,
				["RelativeSize"] = p16.Typography.BodySmall.FontSize
			},
			["Footer"] = {
				["Font"] = p16.Typography.CaptionSmall.Font,
				["RelativeSize"] = p16.Typography.CaptionSmall.FontSize
			}
		}
		return v17
	end, function(p19)
		-- upvalues: (copy) p_u_14, (ref) v_u_8, (ref) v_u_12, (ref) v_u_7, (ref) v_u_4, (ref) v_u_3
		local v20 = p19.Theme[p_u_14.themeKey or "TextDefault"]
		local v21 = p19.Font[p_u_14.fontKey or "Body"]
		local v22
		if v_u_8 then
			v22 = v_u_7((p19.Tokens.Typography[v_u_12[p_u_14.fontKey or "Body"]] or v21).Font)
		else
			v22 = nil
		end
		local v23 = v_u_4.Dictionary.join
		local v24 = {
			["TextColor3"] = v20.Color,
			["TextTransparency"] = v20.Transparency
		}
		local v25 = p_u_14
		local v26 = {
			["fontKey"] = nil,
			["themeKey"] = nil,
			["BackgroundTransparency"] = 1,
			["Font"] = nil,
			["FontFace"] = nil,
			["TextSize"] = nil,
			["fontKey"] = v_u_4.None,
			["themeKey"] = v_u_4.None
		}
		local v27
		if v_u_8 then
			v27 = v_u_4.None
		else
			v27 = v21.Font
		end
		v26.Font = v27
		v26.FontFace = v22
		v26.TextSize = v21.RelativeSize * p19.Font.BaseSize
		local v28 = v23(v24, v25, v26)
		return v_u_3.createElement("TextLabel", v28)
	end)
end