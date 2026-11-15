-- Path: CorePackages.Packages._Index.RbxDesignFoundations-31ab8d40-1.1.108.RbxDesignFoundations.tokens.Schema.Validators.validateComponent
return function(p1)
	local v2 = {}
	local v3 = p1.strictInterface
	local v4 = {}
	local v5 = p1.strictInterface
	local v6 = {}
	local v7 = p1.strictInterface
	local v8 = {
		["Background"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["BorderWidth"] = p1.number,
		["BorderColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	local v9 = p1.strictInterface
	local v10 = {
		["X"] = p1.number,
		["Y"] = p1.number,
		["Blur"] = p1.number,
		["Color"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v8.DropShadow = v9(v10)
	v8.BorderRadius = p1.strictInterface({
		["LeadingTop"] = p1.number,
		["TrailingTop"] = p1.number,
		["TrailingBottom"] = p1.number,
		["LeadingBottom"] = p1.number
	})
	v6.Container = v7(v8)
	local v11 = p1.strictInterface
	local v12 = {
		["Spacing"] = p1.strictInterface({
			["Top"] = p1.number,
			["Trailing"] = p1.number,
			["Bottom"] = p1.number,
			["Leading"] = p1.number
		})
	}
	v6.ContentTop = v11(v12)
	local v13 = p1.strictInterface
	local v14 = {
		["Spacing"] = p1.strictInterface({
			["Top"] = p1.number,
			["Trailing"] = p1.number,
			["Bottom"] = p1.number,
			["Leading"] = p1.number
		})
	}
	v6.ContentBottom = v13(v14)
	v4.Base = v5(v6)
	v2.VerticalTile = v3(v4)
	local v15 = p1.strictInterface
	local v16 = {}
	local v17 = p1.strictInterface
	local v18 = {}
	local v19 = p1.strictInterface
	local v20 = {
		["Gap"] = p1.number,
		["Spacing"] = p1.strictInterface({
			["Top"] = p1.number,
			["Trailing"] = p1.number,
			["Bottom"] = p1.number,
			["Leading"] = p1.number
		})
	}
	v18.Container = v19(v20)
	local v21 = p1.strictInterface
	local v22 = {
		["Size"] = p1.number,
		["BackgroundColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["BorderColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["BorderRadius"] = p1.number,
		["BorderWidth"] = p1.number
	}
	v18.Image = v21(v22)
	local v23 = p1.strictInterface
	local v24 = {
		["Size"] = p1.number,
		["BackgroundColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["BorderColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["BorderWidth"] = p1.number
	}
	v18.Status = v23(v24)
	local v25 = p1.strictInterface
	local v26 = {
		["Gap"] = p1.number,
		["Typography"] = p1.strictInterface({
			["Font"] = p1.enum(Enum.Font),
			["FontSize"] = p1.number,
			["LineHeight"] = p1.number,
			["LetterSpacing"] = p1.number
		}),
		["ContentColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v18.Content = v25(v26)
	v18.Icon = p1.strictInterface({
		["Size"] = p1.number
	})
	local v27 = p1.strictInterface
	local v28 = {
		["ContentColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v18.Presence = v27(v28)
	v16.Base = v17(v18)
	v2.PlayerTileSmall = v15(v16)
	local v29 = p1.strictInterface
	local v30 = {
		["Container"] = p1.strictInterface({
			["Gap"] = p1.number
		}),
		["FaceGroup"] = p1.strictInterface({
			["Gap"] = p1.number
		})
	}
	local v31 = p1.strictInterface
	local v32 = {
		["BackgroundColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["BorderWidth"] = p1.number,
		["BorderColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["BorderRadius"] = p1.number,
		["Width"] = p1.number,
		["Height"] = p1.number
	}
	v30.Face = v31(v32)
	local v33 = p1.strictInterface
	local v34 = {
		["BackgroundColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["BorderWidth"] = p1.number,
		["BorderColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["BorderRadius"] = p1.number,
		["Spacing"] = p1.number,
		["Height"] = p1.number,
		["MinWidth"] = p1.number,
		["ContentColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Typography"] = p1.strictInterface({
			["Font"] = p1.enum(Enum.Font),
			["FontSize"] = p1.number,
			["LineHeight"] = p1.number,
			["LetterSpacing"] = p1.number
		})
	}
	v30.Badge = v33(v34)
	local v35 = p1.strictInterface
	local v36 = {
		["ContentColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Typography"] = p1.strictInterface({
			["Font"] = p1.enum(Enum.Font),
			["FontSize"] = p1.number,
			["LineHeight"] = p1.number,
			["LetterSpacing"] = p1.number
		})
	}
	v30.Label = v35(v36)
	v2.Facepile = v29(v30)
	local v37 = p1.strictInterface
	local v38 = {
		["BackgroundColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["BorderRadius"] = p1.strictInterface({
			["LeadingTop"] = p1.number,
			["TrailingTop"] = p1.number,
			["TrailingBottom"] = p1.number,
			["LeadingBottom"] = p1.number
		}),
		["Spacing"] = p1.strictInterface({
			["Top"] = p1.number,
			["Trailing"] = p1.number,
			["Bottom"] = p1.number,
			["Leading"] = p1.number
		}),
		["Gap"] = p1.number
	}
	v2.ControllerBar = v37(v38)
	local v39 = p1.strictInterface
	local v40 = {}
	local v41 = p1.strictInterface
	local v42 = {
		["Gap"] = p1.number,
		["ContentColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v40.Container = v41(v42)
	v40.Icon = p1.strictInterface({
		["Size"] = p1.number
	})
	local v43 = p1.strictInterface
	local v44 = {
		["Typography"] = p1.strictInterface({
			["Font"] = p1.enum(Enum.Font),
			["FontSize"] = p1.number,
			["LineHeight"] = p1.number,
			["LetterSpacing"] = p1.number
		})
	}
	v40.Label = v43(v44)
	v2.ControllerBarShortcut = v39(v40)
	local v45 = p1.strictInterface
	local v46 = {
		["BorderWidth"] = p1.number,
		["Offset"] = p1.number,
		["Inset"] = p1.number
	}
	local v47 = p1.strictInterface
	local v48 = {
		["Start"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["End"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v46.Gradient = v47(v48)
	v2.SelectionCursor = v45(v46)
	local v49 = p1.strictInterface
	local v50 = {
		["Base"] = p1.strictInterface({
			["BorderWidth"] = p1.number
		})
	}
	local v51 = p1.strictInterface
	local v52 = {}
	local v53 = p1.strictInterface
	local v54 = {
		["Color"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v52.Initialize = v53(v54)
	local v55 = p1.strictInterface
	local v56 = {
		["Color"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v52.Default = v55(v56)
	local v57 = p1.strictInterface
	local v58 = {
		["Color"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v52.Hover = v57(v58)
	local v59 = p1.strictInterface
	local v60 = {
		["Color"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v52.Pressed = v59(v60)
	local v61 = p1.strictInterface
	local v62 = {
		["Color"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v52.Selected = v61(v62)
	local v63 = p1.strictInterface
	local v64 = {
		["Color"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v52.SelectedPressed = v63(v64)
	local v65 = p1.strictInterface
	local v66 = {
		["Color"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v52.Disabled = v65(v66)
	v50.Standard = v51(v52)
	local v67 = p1.strictInterface
	local v68 = {}
	local v69 = p1.strictInterface
	local v70 = {
		["Color"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v68.Initialize = v69(v70)
	local v71 = p1.strictInterface
	local v72 = {
		["Color"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v68.Default = v71(v72)
	local v73 = p1.strictInterface
	local v74 = {
		["Color"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v68.Hover = v73(v74)
	local v75 = p1.strictInterface
	local v76 = {
		["Color"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v68.Pressed = v75(v76)
	local v77 = p1.strictInterface
	local v78 = {
		["Color"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v68.Selected = v77(v78)
	local v79 = p1.strictInterface
	local v80 = {
		["Color"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v68.SelectedPressed = v79(v80)
	local v81 = p1.strictInterface
	local v82 = {
		["Color"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v68.Disabled = v81(v82)
	v50.Lighten = v67(v68)
	local v83 = p1.strictInterface
	local v84 = {}
	local v85 = p1.strictInterface
	local v86 = {
		["Color"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v84.Initialize = v85(v86)
	local v87 = p1.strictInterface
	local v88 = {
		["Color"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v84.Default = v87(v88)
	local v89 = p1.strictInterface
	local v90 = {
		["Color"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v84.Hover = v89(v90)
	local v91 = p1.strictInterface
	local v92 = {
		["Color"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v84.Pressed = v91(v92)
	local v93 = p1.strictInterface
	local v94 = {
		["Color"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v84.Selected = v93(v94)
	local v95 = p1.strictInterface
	local v96 = {
		["Color"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v84.SelectedPressed = v95(v96)
	local v97 = p1.strictInterface
	local v98 = {
		["Color"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v84.Disabled = v97(v98)
	v50.Inverse = v83(v84)
	local v99 = p1.strictInterface
	local v100 = {}
	local v101 = p1.strictInterface
	local v102 = {
		["Color"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v100.Initialize = v101(v102)
	local v103 = p1.strictInterface
	local v104 = {
		["Color"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v100.Default = v103(v104)
	local v105 = p1.strictInterface
	local v106 = {
		["Color"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v100.Hover = v105(v106)
	local v107 = p1.strictInterface
	local v108 = {
		["Color"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v100.Pressed = v107(v108)
	local v109 = p1.strictInterface
	local v110 = {
		["Color"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v100.Selected = v109(v110)
	local v111 = p1.strictInterface
	local v112 = {
		["Color"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v100.SelectedPressed = v111(v112)
	local v113 = p1.strictInterface
	local v114 = {
		["Color"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v100.Disabled = v113(v114)
	v50.Darken = v99(v100)
	v2.StateLayer = v49(v50)
	local v115 = p1.strictInterface
	local v116 = {}
	local v117 = p1.strictInterface
	local v118 = {}
	local v119 = p1.strictInterface
	local v120 = {
		["Height"] = p1.number,
		["ContentColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["BackgroundColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["BorderColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["BorderRadius"] = p1.strictInterface({
			["TopLeading"] = p1.number,
			["TopTrailing"] = p1.number,
			["BottomTrailing"] = p1.number,
			["BottomLeading"] = p1.number
		}),
		["BorderWidth"] = p1.number,
		["Spacing"] = p1.strictInterface({
			["Top"] = p1.number,
			["Trailing"] = p1.number,
			["Bottom"] = p1.number,
			["Leading"] = p1.number
		})
	}
	v118.Container = v119(v120)
	v118.IconFrame = p1.strictInterface({
		["Size"] = p1.number
	})
	local v121 = p1.strictInterface
	local v122 = {
		["Spacing"] = p1.strictInterface({
			["Top"] = p1.number,
			["Trailing"] = p1.number,
			["Bottom"] = p1.number,
			["Leading"] = p1.number
		})
	}
	v118.TextFrame = v121(v122)
	local v123 = p1.strictInterface
	local v124 = {
		["Typography"] = p1.strictInterface({
			["Font"] = p1.enum(Enum.Font),
			["FontSize"] = p1.number,
			["LineHeight"] = p1.number,
			["LetterSpacing"] = p1.number
		})
	}
	v118.Text = v123(v124)
	v118.CheckFrame = p1.strictInterface({
		["Size"] = p1.number
	})
	v116.Base = v117(v118)
	local v125 = p1.strictInterface
	local v126 = {
		["Container"] = p1.strictInterface({
			["BorderWidth"] = p1.number
		})
	}
	v116.Divider = v125(v126)
	local v127 = p1.strictInterface
	local v128 = {}
	local v129 = p1.strictInterface
	local v130 = {
		["ContentColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v128.Container = v129(v130)
	v116.Disabled = v127(v128)
	local v131 = p1.strictInterface
	local v132 = {}
	local v133 = p1.strictInterface
	local v134 = {
		["BorderRadius"] = p1.strictInterface({
			["BottomTrailing"] = p1.number,
			["BottomLeading"] = p1.number
		})
	}
	v132.Container = v133(v134)
	v116.HasRoundBottom = v131(v132)
	local v135 = p1.strictInterface
	local v136 = {}
	local v137 = p1.strictInterface
	local v138 = {
		["BorderRadius"] = p1.strictInterface({
			["TopLeading"] = p1.number,
			["TopTrailing"] = p1.number
		})
	}
	v136.Container = v137(v138)
	v116.HasRoundTop = v135(v136)
	v2.MenuCell = v115(v116)
	local v139 = p1.strictInterface
	local v140 = {
		["BorderRadius"] = p1.number,
		["BackgroundColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v2.BaseMenu = v139(v140)
	v2.StatGroup = p1.strictInterface({
		["Gap"] = p1.number
	})
	local v141 = p1.strictInterface
	local v142 = {}
	local v143 = p1.strictInterface
	local v144 = {
		["Gap"] = p1.number,
		["ContentColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v142.Container = v143(v144)
	v142.Icon = p1.strictInterface({
		["Size"] = p1.number
	})
	local v145 = p1.strictInterface
	local v146 = {
		["Typography"] = p1.strictInterface({
			["Font"] = p1.enum(Enum.Font),
			["FontSize"] = p1.number,
			["LineHeight"] = p1.number,
			["LetterSpacing"] = p1.number
		})
	}
	v142.Label = v145(v146)
	v2.StatItem = v141(v142)
	local v147 = p1.strictInterface
	local v148 = {
		["Container"] = p1.strictInterface({
			["BorderRadius"] = p1.number
		}),
		["Icon"] = p1.strictInterface({
			["Size"] = p1.number
		})
	}
	v2.MediaTile = v147(v148)
	local v149 = p1.strictInterface
	local v150 = {}
	local v151 = p1.strictInterface
	local v152 = {
		["Gap"] = p1.number,
		["ContentColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v150.Container = v151(v152)
	v150.Icon = p1.strictInterface({
		["Size"] = p1.number
	})
	v150.DataGroup = p1.strictInterface({
		["Gap"] = p1.number
	})
	local v153 = p1.strictInterface
	local v154 = {
		["Typography"] = p1.strictInterface({
			["Font"] = p1.enum(Enum.Font),
			["FontSize"] = p1.number,
			["LineHeight"] = p1.number,
			["LetterSpacing"] = p1.number
		})
	}
	v150.Data = v153(v154)
	local v155 = p1.strictInterface
	local v156 = {
		["Typography"] = p1.strictInterface({
			["Font"] = p1.enum(Enum.Font),
			["FontSize"] = p1.number,
			["LineHeight"] = p1.number,
			["LetterSpacing"] = p1.number
		})
	}
	v150.Label = v155(v156)
	v2.StatWidget = v149(v150)
	local v157 = p1.strictInterface
	local v158 = {}
	local v159 = p1.strictInterface
	local v160 = {
		["Spacing"] = p1.number,
		["Gap"] = p1.number,
		["BorderRadius"] = p1.number,
		["BackgroundColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v158.Container = v159(v160)
	v158.ButtonGroup = p1.strictInterface({
		["Gap"] = p1.number
	})
	v2.RateCount = v157(v158)
	local v161 = p1.strictInterface
	local v162 = {}
	local v163 = p1.strictInterface
	local v164 = {
		["Spacing"] = p1.number,
		["BorderRadius"] = p1.number,
		["BackgroundColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v162.Container = v163(v164)
	v2.PlayerCount = v161(v162)
	local v165 = p1.strictInterface
	local v166 = {}
	local v167 = p1.strictInterface
	local v168 = {}
	local v169 = p1.strictInterface
	local v170 = {
		["BackgroundColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["ContentColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["BorderRadius"] = p1.number
	}
	v168.Handle = v169(v170)
	v168.Icon = p1.strictInterface({
		["Size"] = p1.number
	})
	local v171 = p1.strictInterface
	local v172 = {
		["Opacity"] = p1.number,
		["Spacing"] = p1.strictInterface({
			["Top"] = p1.number,
			["Bottom"] = p1.number
		})
	}
	v168.Track = v171(v172)
	v166.Base = v167(v168)
	local v173 = p1.strictInterface
	local v174 = {
		["Handle"] = p1.strictInterface({
			["Width"] = p1.number
		}),
		["Track"] = p1.strictInterface({
			["Width"] = p1.number
		})
	}
	v166.Compact = v173(v174)
	local v175 = p1.strictInterface
	local v176 = {
		["Handle"] = p1.strictInterface({
			["Width"] = p1.number
		}),
		["Track"] = p1.strictInterface({
			["Width"] = p1.number
		})
	}
	v166.Wide = v175(v176)
	local v177 = p1.strictInterface
	local v178 = {
		["Handle"] = p1.strictInterface({
			["Width"] = p1.number
		}),
		["Track"] = p1.strictInterface({
			["Width"] = p1.number
		})
	}
	v166.Gamepad = v177(v178)
	v2.VerticalScrollView = v165(v166)
	local v179 = p1.strictInterface
	local v180 = {}
	local v181 = p1.strictInterface
	local v182 = {}
	local v183 = p1.strictInterface
	local v184 = {
		["BorderColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["BorderRadius"] = p1.number,
		["Typography"] = p1.strictInterface({
			["Font"] = p1.enum(Enum.Font),
			["FontSize"] = p1.number,
			["LineHeight"] = p1.number,
			["LetterSpacing"] = p1.number
		}),
		["Spacing"] = p1.strictInterface({
			["Leading"] = p1.number,
			["Trailing"] = p1.number
		}),
		["Gap"] = p1.number,
		["Opacity"] = p1.number
	}
	v182.Field = v183(v184)
	local v185 = p1.strictInterface
	local v186 = {
		["ContentColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v182.PlaceholderText = v185(v186)
	local v187 = p1.strictInterface
	local v188 = {
		["ContentColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v182.FieldValue = v187(v188)
	local v189 = p1.strictInterface
	local v190 = {
		["ContentColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Size"] = p1.number
	}
	v182.IconLeading = v189(v190)
	v180.Base = v181(v182)
	local v191 = p1.strictInterface
	local v192 = {}
	local v193 = p1.strictInterface
	local v194 = {
		["BorderColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v192.Field = v193(v194)
	v180.Error = v191(v192)
	local v195 = p1.strictInterface
	local v196 = {
		["Field"] = p1.strictInterface({
			["Opacity"] = p1.number
		})
	}
	v180.Disabled = v195(v196)
	v2.TextField = v179(v180)
	local v197 = p1.strictInterface
	local v198 = {}
	local v199 = p1.strictInterface
	local v200 = {
		["Typography"] = p1.strictInterface({
			["Font"] = p1.enum(Enum.Font),
			["FontSize"] = p1.number,
			["LineHeight"] = p1.number,
			["LetterSpacing"] = p1.number
		}),
		["ContentColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Spacing"] = p1.strictInterface({
			["Bottom"] = p1.number
		}),
		["Opacity"] = p1.number
	}
	v198.Base = v199(v200)
	v198.Disabled = p1.strictInterface({
		["Opacity"] = p1.number
	})
	v2.InputLabel = v197(v198)
	local v201 = p1.strictInterface
	local v202 = {}
	local v203 = p1.strictInterface
	local v204 = {
		["Typography"] = p1.strictInterface({
			["Font"] = p1.enum(Enum.Font),
			["FontSize"] = p1.number,
			["LineHeight"] = p1.number,
			["LetterSpacing"] = p1.number
		}),
		["ContentColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		}),
		["Padding"] = p1.strictInterface({
			["Top"] = p1.number
		}),
		["Opacity"] = p1.number
	}
	v202.Base = v203(v204)
	local v205 = p1.strictInterface
	local v206 = {
		["ContentColor"] = p1.strictInterface({
			["Color3"] = p1.Color3,
			["Transparency"] = p1.number
		})
	}
	v202.Error = v205(v206)
	v2.HelperText = v201(v202)
	return v2
end