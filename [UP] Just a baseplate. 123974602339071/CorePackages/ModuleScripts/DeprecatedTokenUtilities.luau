-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Style.Tokens.DeprecatedTokenUtilities
local function v_u_5(p1) -- name: cloneTokenValue
	-- upvalues: (copy) v_u_5
	if type(p1) ~= "table" then
		return p1
	end
	local v2 = {}
	for v3, v4 in p1 do
		v2[v3] = v_u_5(v4)
	end
	return v2
end
return {
	["getDeprecatedSemanticTokens"] = function(p6, p7) -- name: getDeprecatedSemanticTokens
		-- upvalues: (copy) v_u_5
		local v8 = v_u_5
		local v9 = {}
		local v10 = {
			["Background"] = {
				["Default"] = p6.Color.Surface.Surface_0,
				["Contrast"] = p6.Color.Surface.Surface_100,
				["Muted"] = p6.Color.Surface.Surface_200,
				["OnHover"] = p6.Color.State.Hover,
				["OnPress"] = p6.Color.State.Press
			},
			["BackgroundUi"] = {
				["Default"] = p6.Color.Surface.Surface_300,
				["Contrast"] = p6.Color.OverMedia.OverMedia_0
			},
			["Ui"] = {
				["Default"] = p6.Color.Shift.Shift_200,
				["Muted"] = p6.Color.Shift.Shift_100,
				["Emphasis"] = p6.Color.Shift.Shift_400
			},
			["Focus"] = {
				["Start"] = p6.Color.Selection.Start,
				["End"] = p6.Color.Selection.End,
				["Gradient"] = p6.Color.Selection.Start
			}
		}
		local v11 = {
			["Standard"] = {
				["Default"] = p6.Color.State.Idle,
				["Hover"] = p6.Color.State.Hover,
				["Pressed"] = p6.Color.State.Press
			},
			["Inverse"] = {
				["Default"] = p6.Inverse.State.Idle,
				["Hover"] = p6.Inverse.State.Hover,
				["Pressed"] = p6.Inverse.State.Press
			},
			["Darken"] = {
				["Default"] = p6.LightMode.State.Idle,
				["Hover"] = p6.LightMode.State.Hover,
				["Pressed"] = p6.LightMode.State.Press
			},
			["Lighten"] = {
				["Default"] = p6.DarkMode.State.Idle,
				["Hover"] = p6.DarkMode.State.Hover,
				["Pressed"] = p6.DarkMode.State.Press
			}
		}
		v10.State = v11
		v10.Text = {
			["Emphasis"] = p6.Color.Content.Emphasis,
			["Default"] = p6.Color.Content.Default,
			["Muted"] = p6.Color.Content.Muted,
			["Link"] = p6.Color.Content.Link,
			["Inverse"] = p6.Inverse.Content.Default
		}
		v10.Icon = {
			["Emphasis"] = p6.Color.Content.Emphasis,
			["Default"] = p6.Color.Content.Default,
			["OnHover"] = p6.Color.Content.Emphasis
		}
		v10.Common = {
			["Divider"] = p6.Color.Stroke.Emphasis,
			["Overlay"] = p6.Color.Common.Scrim,
			["DropShadow"] = p6.Color.Common.Shadow,
			["NavigationBar"] = p6.Color.Common.NavigationBar,
			["Placeholder"] = p6.Color.Common.Shimmer,
			["Badge"] = p6.Color.System.Contrast,
			["BadgeContent"] = p6.Inverse.Content.Emphasis,
			["Online"] = p6.Color.System.Success,
			["Offline"] = p6.Color.System.Neutral,
			["Alert"] = p6.Color.System.Alert,
			["Success"] = p6.Color.System.Success
		}
		local v12 = {
			["PrimaryBrand"] = {
				["Background"] = p6.Color.ActionEmphasis.Background,
				["Content"] = p6.Color.ActionEmphasis.Foreground,
				["Border"] = p6.Color.ActionEmphasis.Border
			},
			["Primary"] = {
				["Background"] = p6.Color.ActionSubEmphasis.Background,
				["Content"] = p6.Color.ActionSubEmphasis.Foreground,
				["Border"] = p6.Color.ActionSubEmphasis.Border
			},
			["Secondary"] = {
				["Background"] = p6.Color.ActionSubtle.Background,
				["Content"] = p6.Color.ActionSubtle.Foreground,
				["Border"] = p6.Color.ActionSubtle.Border
			},
			["Subtle"] = {
				["Background"] = p6.Color.ActionLink.Background,
				["Content"] = p6.Color.ActionLink.Foreground,
				["Border"] = p6.Color.ActionLink.Border
			},
			["Alert"] = {
				["Background"] = p6.Color.ActionAlert.Background,
				["Content"] = p6.Color.ActionAlert.Foreground,
				["Border"] = p6.Color.ActionAlert.Border
			}
		}
		v10.Action = v12
		v9.Color = v10
		local v13 = {
			["Size"] = {
				["Small"] = p6.Size.Size_400,
				["Medium"] = p6.Size.Size_900,
				["Large"] = p6.Size.Size_1200,
				["XLarge"] = p6.Size.Size_2400,
				["XXLarge"] = p7 * 192
			}
		}
		v9.Icon = v13
		local v14 = {
			["Focus"] = {
				["Standard"] = p6.Size.Size_150,
				["Inset"] = p6.Size.Size_0
			}
		}
		v9.Offset = v14
		local v15 = {
			["State"] = {
				["Lighten"] = {
					["Hover"] = 0.88,
					["Pressed"] = 0.8
				},
				["Darken"] = {
					["Hover"] = 0.88,
					["Pressed"] = 0.8
				}
			}
		}
		v9.Opacity = v15
		v9.Radius = {
			["None"] = p6.Radius.None,
			["Small"] = p6.Radius.Small,
			["Medium"] = p6.Radius.Medium,
			["Large"] = p6.Size.Size_300,
			["XLarge"] = p6.Radius.Large,
			["Circle"] = p6.Radius.Circle
		}
		v9.Stroke = {
			["Input"] = p6.Stroke.Standard,
			["Focus"] = p6.Stroke.Thick
		}
		local v16 = {
			["Title"] = {
				["Font"] = p6.Typography.HeadingLarge.Font,
				["FontSize"] = p6.Typography.HeadingLarge.FontSize,
				["LetterSpacing"] = p6.Typography.HeadingLarge.LetterSpacing,
				["LineHeight"] = p6.LineHeight.LineHeight_130
			},
			["Header"] = {
				["Font"] = p6.Typography.HeadingSmall.Font,
				["FontSize"] = p6.Typography.HeadingSmall.FontSize,
				["LetterSpacing"] = p6.Typography.HeadingSmall.LetterSpacing,
				["LineHeight"] = p6.Typography.HeadingSmall.LineHeight
			},
			["Subheader"] = {
				["Font"] = p6.Typography.TitleLarge.Font,
				["FontSize"] = p6.Typography.TitleLarge.FontSize,
				["LetterSpacing"] = p6.Typography.TitleLarge.LetterSpacing,
				["LineHeight"] = p6.Typography.TitleLarge.LineHeight
			},
			["Body"] = {
				["Font"] = p6.Typography.BodyLarge.Font,
				["FontSize"] = p6.Typography.BodyLarge.FontSize,
				["LetterSpacing"] = p6.Typography.BodyLarge.LetterSpacing,
				["LineHeight"] = p6.Typography.BodyLarge.LineHeight
			},
			["CaptionHeader"] = {
				["Font"] = p6.Typography.CaptionLarge.Font,
				["FontSize"] = p6.FontSize.FontSize_300,
				["LetterSpacing"] = p6.Typography.BodyLarge.LetterSpacing,
				["LineHeight"] = p6.LineHeight.LineHeight_130
			},
			["CaptionBody"] = {
				["Font"] = p6.Typography.BodySmall.Font,
				["FontSize"] = p6.Typography.BodySmall.FontSize,
				["LetterSpacing"] = p6.Typography.BodySmall.LetterSpacing,
				["LineHeight"] = p6.LineHeight.LineHeight_130
			},
			["Footer"] = {
				["Font"] = p6.Typography.CaptionSmall.Font,
				["FontSize"] = p6.Typography.CaptionSmall.FontSize,
				["LetterSpacing"] = p6.Typography.BodyLarge.LetterSpacing,
				["LineHeight"] = p6.Typography.CaptionSmall.LineHeight
			}
		}
		v9.Typography = v16
		return v8(v9)
	end
}