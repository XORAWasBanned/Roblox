-- Path: CorePackages.Packages._Index.RbxDesignFoundations-31ab8d40-1.1.108.RbxDesignFoundations.tokens.Schema.Validators.validateSemantic
return function(p1)
	local v2 = {}
	local v3 = p1.strictInterface
	local v4 = {
		["Title"] = p1.strictInterface({
			["Font"] = p1.enum(Enum.Font),
			["FontSize"] = p1.number,
			["LineHeight"] = p1.number,
			["LetterSpacing"] = p1.number
		}),
		["Header"] = p1.strictInterface({
			["Font"] = p1.enum(Enum.Font),
			["FontSize"] = p1.number,
			["LineHeight"] = p1.number,
			["LetterSpacing"] = p1.number
		}),
		["Subheader"] = p1.strictInterface({
			["Font"] = p1.enum(Enum.Font),
			["FontSize"] = p1.number,
			["LineHeight"] = p1.number,
			["LetterSpacing"] = p1.number
		}),
		["Body"] = p1.strictInterface({
			["Font"] = p1.enum(Enum.Font),
			["FontSize"] = p1.number,
			["LineHeight"] = p1.number,
			["LetterSpacing"] = p1.number
		}),
		["CaptionHeader"] = p1.strictInterface({
			["Font"] = p1.enum(Enum.Font),
			["FontSize"] = p1.number,
			["LineHeight"] = p1.number,
			["LetterSpacing"] = p1.number
		}),
		["CaptionBody"] = p1.strictInterface({
			["Font"] = p1.enum(Enum.Font),
			["FontSize"] = p1.number,
			["LineHeight"] = p1.number,
			["LetterSpacing"] = p1.number
		}),
		["Footer"] = p1.strictInterface({
			["Font"] = p1.enum(Enum.Font),
			["FontSize"] = p1.number,
			["LineHeight"] = p1.number,
			["LetterSpacing"] = p1.number
		})
	}
	v2.Typography = v3(v4)
	local v5 = p1.strictInterface
	local v6 = {}
	local v7 = p1.strictInterface
	local v8 = {
		["Default"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Contrast"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Muted"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["OnHover"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["OnPress"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v6.Background = v7(v8)
	local v9 = p1.strictInterface
	local v10 = {
		["Default"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Contrast"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v6.BackgroundUi = v9(v10)
	local v11 = p1.strictInterface
	local v12 = {
		["Default"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Muted"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Emphasis"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v6.Ui = v11(v12)
	local v13 = p1.strictInterface
	local v14 = {
		["Default"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Muted"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Emphasis"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Link"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Inverse"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v6.Text = v13(v14)
	local v15 = p1.strictInterface
	local v16 = {
		["Default"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Emphasis"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["OnHover"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v6.Icon = v15(v16)
	local v17 = p1.strictInterface
	local v18 = {}
	local v19 = p1.strictInterface
	local v20 = {
		["Background"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Border"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Content"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v18.Primary = v19(v20)
	local v21 = p1.strictInterface
	local v22 = {
		["Background"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Border"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Content"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v18.PrimaryBrand = v21(v22)
	local v23 = p1.strictInterface
	local v24 = {
		["Background"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Border"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Content"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v18.Secondary = v23(v24)
	local v25 = p1.strictInterface
	local v26 = {
		["Background"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Border"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Content"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v18.Alert = v25(v26)
	local v27 = p1.strictInterface
	local v28 = {
		["Background"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Border"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Content"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v18.Subtle = v27(v28)
	v6.Action = v17(v18)
	local v29 = p1.strictInterface
	local v30 = {}
	local v31 = p1.strictInterface
	local v32 = {
		["Default"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Hover"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Pressed"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v30.Standard = v31(v32)
	local v33 = p1.strictInterface
	local v34 = {
		["Default"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Hover"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Pressed"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v30.Lighten = v33(v34)
	local v35 = p1.strictInterface
	local v36 = {
		["Default"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Hover"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Pressed"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v30.Inverse = v35(v36)
	local v37 = p1.strictInterface
	local v38 = {
		["Default"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Hover"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Pressed"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v30.Darken = v37(v38)
	v6.State = v29(v30)
	local v39 = p1.strictInterface
	local v40 = {
		["Start"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["End"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Gradient"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v6.Focus = v39(v40)
	local v41 = p1.strictInterface
	local v42 = {
		["Divider"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Overlay"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["DropShadow"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["NavigationBar"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Badge"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["BadgeContent"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Placeholder"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Online"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Offline"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Alert"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Success"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v6.Common = v41(v42)
	v2.Color = v5(v6)
	v2.Radius = p1.strictInterface({
		["None"] = p1.number,
		["Small"] = p1.number,
		["Medium"] = p1.number,
		["Large"] = p1.number,
		["XLarge"] = p1.number,
		["Circle"] = p1.number
	})
	local v43 = p1.strictInterface
	local v44 = {
		["Size"] = p1.strictInterface({
			["Small"] = p1.number,
			["Medium"] = p1.number,
			["Large"] = p1.number,
			["XLarge"] = p1.number,
			["XxLarge"] = p1.number
		})
	}
	v2.Icon = v43(v44)
	v2.Stroke = p1.strictInterface({
		["Input"] = p1.number,
		["Focus"] = p1.number
	})
	local v45 = p1.strictInterface
	local v46 = {
		["Focus"] = p1.strictInterface({
			["Standard"] = p1.number,
			["Inset"] = p1.number
		})
	}
	v2.Offset = v45(v46)
	local v47 = p1.strictInterface
	local v48 = {}
	local v49 = p1.strictInterface
	local v50 = {
		["Lighten"] = p1.strictInterface({
			["Hover"] = p1.number,
			["Pressed"] = p1.number
		}),
		["Darken"] = p1.strictInterface({
			["Hover"] = p1.number,
			["Pressed"] = p1.number
		})
	}
	v48.State = v49(v50)
	v2.Opacity = v47(v48)
	return v2
end