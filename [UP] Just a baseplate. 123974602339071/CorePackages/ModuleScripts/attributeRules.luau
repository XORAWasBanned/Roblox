-- Path: CorePackages.Packages._Index.Foundation.Foundation.StyleSheet.Rules.attributeRules
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
require(v1.Providers.Style.Tokens)
require(script.Parent.Types)
local v_u_4 = require(script.Parent.cornerRules)
local v_u_5 = require(script.Parent.shadowRules)
local v_u_6 = require(script.Parent.Parent.tokenAttributePascalName)
local function v_u_10(p7) -- name: kebabToPascal
	return p7:gsub("^%-?(.)", function(p8)
		return p8:upper()
	end):gsub("%-(.)", function(p9)
		return p9:upper()
	end)
end
local function v_u_19(p11, p12) -- name: DefaultSizeRules
	local v13 = p11.TextSize / p12 * (p11.LineHeight * p12) - p11.TextSize
	local v14 = UDim.new(0, v13 / 2)
	local v15 = {}
	local v16 = {
		["tag"] = "text-size-defaults",
		["priority"] = -1,
		["properties"] = nil,
		["children"] = nil,
		["attributes"] = nil,
		["properties"] = {
			["TextSize"] = "$TextSizeBodyLarge",
			["LineHeight"] = nil,
			["LineHeight"] = p11.LineHeight
		}
	}
	local v17 = {}
	local v18 = {
		["tag"] = "text-size-defaults",
		["pseudo"] = "UIPadding",
		["priority"] = -1,
		["properties"] = nil,
		["attributes"] = nil,
		["properties"] = {
			["PaddingTop"] = "$TextPaddingBodyLarge",
			["PaddingBottom"] = "$TextPaddingBodyLarge"
		},
		["attributes"] = {
			{
				["name"] = "TextPaddingBodyLarge",
				["value"] = nil,
				["value"] = v14
			}
		}
	}
	__set_list(v17, 1, {v18})
	v16.children = v17
	v16.attributes = {
		{
			["name"] = "TextSizeBodyLarge",
			["value"] = nil,
			["value"] = p11.TextSize
		}
	}
	__set_list(v15, 1, {v16})
	return v15
end
local function v_u_30(p20, p21) -- name: ListLayoutSpacingRules
	-- upvalues: (copy) v_u_10, (copy) v_u_3
	local v22 = {}
	for _, v23 in p20 do
		local v24 = v_u_10(v23.name)
		local v25 = {
			["tag"] = nil,
			["pseudo"] = "UIListLayout",
			["properties"] = nil,
			["attributes"] = nil,
			["tag"] = ("gap-%*"):format(v23.name),
			["properties"] = {
				["Padding"] = ("$Gap%*"):format(v24)
			},
			["attributes"] = {
				{
					["name"] = ("Gap%*"):format(v24),
					["value"] = v23.size
				}
			}
		}
		table.insert(v22, v25)
	end
	local v26 = {}
	for _, v27 in p21 do
		local v28 = v_u_10(v27.name)
		local v29 = {
			["tag"] = nil,
			["pseudo"] = "UIListLayout",
			["properties"] = nil,
			["attributes"] = nil,
			["tag"] = ("gutter-%*"):format(v27.name),
			["properties"] = {
				["Padding"] = ("$Gutter%*"):format(v28)
			},
			["attributes"] = {
				{
					["name"] = ("Gutter%*"):format(v28),
					["value"] = v27.size
				}
			}
		}
		table.insert(v26, v29)
	end
	return v_u_3.joinArrays(v22, v26)
end
local function v_u_39(p31) -- name: SizeRules
	-- upvalues: (copy) v_u_10
	local v32 = {}
	for _, v33 in p31 do
		local v34 = v_u_10(v33.name)
		local v35 = {
			["tag"] = ("size-%*"):format(v33.name),
			["properties"] = {
				["Size"] = ("$Size%*"):format(v34)
			},
			["attributes"] = {
				{
					["name"] = ("Size%*"):format(v34),
					["value"] = UDim2.new(v33.size, v33.size)
				}
			}
		}
		table.insert(v32, v35)
		for _, v36 in p31 do
			local v37 = v_u_10(v36.name)
			local v38 = {
				["tag"] = ("size-%*-%*"):format(v33.name, v36.name),
				["properties"] = {
					["Size"] = ("$Size%*_%*"):format(v34, v37)
				},
				["attributes"] = {
					{
						["name"] = ("Size%*_%*"):format(v34, v37),
						["value"] = UDim2.new(v33.size, v36.size)
					}
				}
			}
			table.insert(v32, v38)
		end
	end
	return v32
end
local function v_u_53(p40, p41, p42) -- name: TypographyRules
	-- upvalues: (copy) v_u_10
	local v43 = {}
	for v44, v45 in p40 do
		local v46 = v_u_10(v44)
		local v47 = v45.TextSize / p41 * (v45.LineHeight * p41) - v45.TextSize
		local v48 = UDim.new(0, v47 / 2)
		local v49 = {
			["tag"] = ("text-%*"):format(v44)
		}
		local v50 = {}
		local v51
		if p42 then
			v51 = nil
		else
			v51 = ("$Font%*"):format(v46)
		end
		v50.Font = v51
		local v52
		if p42 then
			v52 = ("$Font%*"):format(v46)
		else
			v52 = nil
		end
		v50.FontFace = v52
		v50.TextSize = ("$TextSize%*"):format(v46)
		v50.LineHeight = v45.LineHeight
		v49.properties = v50
		v49.attributes = {
			{
				["name"] = ("Font%*"):format(v46),
				["value"] = v45.Font
			},
			{
				["name"] = ("TextSize%*"):format(v46),
				["value"] = v45.TextSize
			}
		}
		v49.children = {
			{
				["tag"] = nil,
				["pseudo"] = "UIPadding",
				["priority"] = 0,
				["properties"] = nil,
				["attributes"] = nil,
				["tag"] = ("text-%*"):format(v44),
				["properties"] = {
					["PaddingTop"] = ("$TextPadding%*"):format(v46),
					["PaddingBottom"] = ("$TextPadding%*"):format(v46)
				},
				["attributes"] = {
					{
						["name"] = ("TextPadding%*"):format(v46),
						["value"] = v48
					}
				}
			}
		}
		table.insert(v43, v49)
	end
	return v43
end
local function v_u_76(p54, p55) -- name: PaddingRules
	-- upvalues: (copy) v_u_10
	local v56 = {}
	local v57 = {
		["x"] = { "PaddingLeft", "PaddingRight" },
		["y"] = { "PaddingTop", "PaddingBottom" },
		["top"] = { "PaddingTop" },
		["bottom"] = { "PaddingBottom" },
		["left"] = { "PaddingLeft" },
		["right"] = { "PaddingRight" }
	}
	for _, v58 in p54 do
		local v59 = v_u_10(v58.name)
		local v60 = {
			["tag"] = nil,
			["pseudo"] = "UIPadding",
			["properties"] = nil,
			["attributes"] = nil,
			["tag"] = ("padding-%*"):format(v58.name),
			["properties"] = {
				["PaddingTop"] = ("$Padding%*"):format(v59),
				["PaddingBottom"] = ("$Padding%*"):format(v59),
				["PaddingLeft"] = ("$Padding%*"):format(v59),
				["PaddingRight"] = ("$Padding%*"):format(v59)
			},
			["attributes"] = {
				{
					["name"] = ("Padding%*"):format(v59),
					["value"] = v58.size
				}
			}
		}
		table.insert(v56, v60)
	end
	for _, v61 in p55 do
		local v62 = v_u_10(v61.name)
		local v63 = {
			["tag"] = nil,
			["pseudo"] = "UIPadding",
			["properties"] = nil,
			["attributes"] = nil,
			["tag"] = ("margin-%*"):format(v61.name),
			["properties"] = {
				["PaddingTop"] = ("$Margin%*"):format(v62),
				["PaddingBottom"] = ("$Margin%*"):format(v62),
				["PaddingLeft"] = ("$Margin%*"):format(v62),
				["PaddingRight"] = ("$Margin%*"):format(v62)
			},
			["attributes"] = {
				{
					["name"] = ("Margin%*"):format(v62),
					["value"] = v61.size
				}
			}
		}
		table.insert(v56, v63)
	end
	for v64, v65 in v57 do
		for _, v66 in p54 do
			local v67 = v_u_10(v66.name)
			local v68 = {}
			for _, v69 in v65 do
				v68[v69] = ("$Padding%*"):format(v67)
			end
			local v70 = {
				["tag"] = nil,
				["pseudo"] = "UIPadding",
				["properties"] = nil,
				["attributes"] = nil,
				["tag"] = ("padding-%*-%*"):format(v64, v66.name),
				["properties"] = v68,
				["attributes"] = {
					{
						["name"] = ("Padding%*"):format(v67),
						["value"] = v66.size
					}
				}
			}
			table.insert(v56, v70)
		end
		for _, v71 in p55 do
			local v72 = v_u_10(v71.name)
			local v73 = {}
			for _, v74 in v65 do
				v73[v74] = ("$Margin%*"):format(v72)
			end
			local v75 = {
				["tag"] = nil,
				["pseudo"] = "UIPadding",
				["properties"] = nil,
				["attributes"] = nil,
				["tag"] = ("margin-%*-%*"):format(v64, v71.name),
				["properties"] = v73,
				["attributes"] = {
					{
						["name"] = ("Margin%*"):format(v72),
						["value"] = v71.size
					}
				}
			}
			table.insert(v56, v75)
		end
	end
	return v56
end
local v_u_77 = {
	["Content"] = { "content" },
	["Stroke"] = { "stroke" },
	["Shift"] = { "bg" },
	["Surface"] = { "bg" },
	["OverMedia"] = { "bg" },
	["System"] = { "bg", "content", "stroke" },
	["Extended"] = {},
	["Common"] = {},
	["Selection"] = {},
	["State"] = {},
	["None"] = {}
}
local function v_u_78() -- name: GuiObjectDefaultRules
	return {
		{
			["tag"] = "gui-object-defaults",
			["priority"] = -1,
			["properties"] = nil,
			["properties"] = {
				["BackgroundTransparency"] = 1
			}
		}
	}
end
local function v_u_83(p79, p80) -- name: DefaultFontRules
	local v81 = {}
	local v82 = {
		["tag"] = "text-defaults",
		["priority"] = -1,
		["properties"] = nil,
		["attributes"] = nil,
		["properties"] = {
			["Font"] = not p80 and "$FontBodyLarge" or nil,
			["FontFace"] = p80 and "$FontBodyLarge" or nil
		},
		["attributes"] = {
			{
				["name"] = "FontBodyLarge",
				["value"] = nil,
				["value"] = p79.Typography.BodyLarge.Font
			}
		}
	}
	__set_list(v81, 1, {v82})
	return v81
end
local function v_u_87(p84) -- name: DefaultColorRules
	local v85 = {}
	local v86 = {
		["tag"] = "text-color-defaults",
		["priority"] = -1,
		["properties"] = nil,
		["attributes"] = nil,
		["properties"] = {
			["TextColor3"] = "$ColorContentDefaultColor3",
			["TextTransparency"] = "$ColorContentDefaultTransparency"
		},
		["attributes"] = {
			{
				["name"] = "ColorContentDefaultColor3",
				["value"] = nil,
				["value"] = p84.Color.Content.Default.Color3
			},
			{
				["name"] = "ColorContentDefaultTransparency",
				["value"] = nil,
				["value"] = p84.Color.Content.Default.Transparency
			}
		}
	}
	__set_list(v85, 1, {v86})
	return v85
end
local function v_u_101(p88, p89) -- name: BackgroundRules
	-- upvalues: (copy) v_u_77, (copy) v_u_6, (copy) v_u_10
	local v90 = {}
	for v91, v92 in p88 do
		if not table.find(v_u_77[v91], "bg") then
			continue
		end
		for v93, v94 in v92 do
			local v95 = v_u_6(v91, v93)
			local v96 = {
				["tag"] = ("bg-%*"):format(v93),
				["properties"] = {
					["BackgroundColor3"] = ("$Color%*%*Color3"):format(v91, v95),
					["BackgroundTransparency"] = ("$Color%*%*Transparency"):format(v91, v95)
				},
				["attributes"] = {
					{
						["name"] = ("Color%*%*Color3"):format(v91, v95),
						["value"] = v94.Color3
					},
					{
						["name"] = ("Color%*%*Transparency"):format(v91, v95),
						["value"] = v94.Transparency
					}
				}
			}
			table.insert(v90, v96)
		end
	end
	for v97, v98 in p89 do
		local v99 = v_u_10(v97)
		local v100 = {
			["tag"] = ("bg-%*"):format(v97),
			["properties"] = {
				["BackgroundColor3"] = ("$Color%*BackgroundColor3"):format(v99),
				["BackgroundTransparency"] = ("$Color%*BackgroundTransparency"):format(v99)
			},
			["attributes"] = {
				{
					["name"] = ("Color%*BackgroundColor3"):format(v99),
					["value"] = v98.Background.Color3
				},
				{
					["name"] = ("Color%*BackgroundTransparency"):format(v99),
					["value"] = v98.Background.Transparency
				}
			}
		}
		table.insert(v90, v100)
	end
	return v90
end
local function v_u_107(p102) -- name: StrokeSizeRules
	-- upvalues: (copy) v_u_10
	local v103 = {}
	for _, v104 in p102 do
		if v104.name == "none" then
			continue
		end
		local v105 = v_u_10(v104.name)
		local v106 = {
			["tag"] = nil,
			["pseudo"] = "UIStroke",
			["properties"] = nil,
			["attributes"] = nil,
			["tag"] = ("stroke-%*"):format(v104.name),
			["properties"] = {
				["Thickness"] = ("$StrokeThickness%*"):format(v105)
			},
			["attributes"] = {
				{
					["name"] = ("StrokeThickness%*"):format(v105),
					["value"] = v104.size
				}
			}
		}
		table.insert(v103, v106)
	end
	return v103
end
local function v_u_124(p108, p109) -- name: StrokeRules
	-- upvalues: (copy) v_u_77, (copy) v_u_6, (copy) v_u_10
	local v110 = {}
	for v111, v112 in p108 do
		if not table.find(v_u_77[v111], "stroke") then
			continue
		end
		for v113, v114 in v112 do
			local v115 = v_u_6(v111, v113)
			local v116 = {
				["tag"] = nil,
				["pseudo"] = "UIStroke",
				["properties"] = nil,
				["attributes"] = nil,
				["tag"] = ("stroke-%*"):format(v113),
				["properties"] = {
					["Color"] = ("$Color%*%*Color3"):format(v111, v115),
					["Transparency"] = ("$Color%*%*Transparency"):format(v111, v115)
				},
				["attributes"] = {
					{
						["name"] = ("Color%*%*Color3"):format(v111, v115),
						["value"] = v114.Color3
					},
					{
						["name"] = ("Color%*%*Transparency"):format(v111, v115),
						["value"] = v114.Transparency
					}
				}
			}
			table.insert(v110, v116)
		end
	end
	for v117, v118 in p109 do
		local v119 = v_u_10(v117)
		local v120 = {
			["tag"] = nil,
			["pseudo"] = "UIStroke",
			["properties"] = nil,
			["attributes"] = nil,
			["tag"] = ("stroke-%*"):format(v117),
			["properties"] = {
				["Color"] = ("$Color%*BorderColor3"):format(v119),
				["Transparency"] = ("$Color%*BorderTransparency"):format(v119)
			},
			["attributes"] = {
				{
					["name"] = ("Color%*BorderColor3"):format(v119),
					["value"] = v118.Border.Color3
				},
				{
					["name"] = ("Color%*BorderTransparency"):format(v119),
					["value"] = v118.Border.Transparency
				}
			}
		}
		table.insert(v110, v120)
	end
	for v121, v122 in {
		["center"] = Enum.BorderStrokePosition.Center,
		["inner"] = Enum.BorderStrokePosition.Inner,
		["outer"] = Enum.BorderStrokePosition.Outer
	} do
		local v123 = {
			["tag"] = nil,
			["pseudo"] = "UIStroke",
			["properties"] = nil,
			["tag"] = ("stroke-position-%*"):format(v121),
			["properties"] = {
				["BorderStrokePosition"] = v122
			}
		}
		table.insert(v110, v123)
	end
	return v110
end
local function v_u_138(p125, p126) -- name: ContentRules
	-- upvalues: (copy) v_u_77, (copy) v_u_6, (copy) v_u_10
	local v127 = {}
	for v128, v129 in p125 do
		if not table.find(v_u_77[v128], "content") then
			continue
		end
		for v130, v131 in v129 do
			local v132 = v_u_6(v128, v130)
			local v133 = {
				["tag"] = ("content-%*"):format(v130),
				["properties"] = {
					["ImageColor3"] = ("$Color%*%*Color3"):format(v128, v132),
					["ImageTransparency"] = ("$Color%*%*Transparency"):format(v128, v132),
					["TextColor3"] = ("$Color%*%*Color3"):format(v128, v132),
					["TextTransparency"] = ("$Color%*%*Transparency"):format(v128, v132)
				},
				["attributes"] = {
					{
						["name"] = ("Color%*%*Color3"):format(v128, v132),
						["value"] = v131.Color3
					},
					{
						["name"] = ("Color%*%*Transparency"):format(v128, v132),
						["value"] = v131.Transparency
					}
				}
			}
			table.insert(v127, v133)
		end
	end
	for v134, v135 in p126 do
		local v136 = v_u_10(v134)
		local v137 = {
			["tag"] = ("content-%*"):format(v134),
			["properties"] = {
				["ImageColor3"] = ("$Color%*ForegroundColor3"):format(v136),
				["ImageTransparency"] = ("$Color%*ForegroundTransparency"):format(v136),
				["TextColor3"] = ("$Color%*ForegroundColor3"):format(v136),
				["TextTransparency"] = ("$Color%*ForegroundTransparency"):format(v136)
			},
			["attributes"] = {
				{
					["name"] = ("Color%*ForegroundColor3"):format(v136),
					["value"] = v135.Foreground.Color3
				},
				{
					["name"] = ("Color%*ForegroundTransparency"):format(v136),
					["value"] = v135.Foreground.Transparency
				}
			}
		}
		table.insert(v127, v137)
	end
	return v127
end
local function v_u_148(p139) -- name: DeprecatedColorRules
	-- upvalues: (copy) v_u_6
	local v140 = {}
	for v141, v142 in p139.System do
		local v143 = v141:sub(8)
		local v144 = v_u_6("System", v141)
		local v145 = {
			["tag"] = ("bg-%*"):format(v143),
			["properties"] = {
				["BackgroundColor3"] = ("$ColorSystem%*Color3"):format(v144),
				["BackgroundTransparency"] = ("$ColorSystem%*Transparency"):format(v144)
			},
			["attributes"] = {
				{
					["name"] = ("ColorSystem%*Color3"):format(v144),
					["value"] = v142.Color3
				},
				{
					["name"] = ("ColorSystem%*Transparency"):format(v144),
					["value"] = v142.Transparency
				}
			},
			["deprecatedFor"] = ("bg-%*"):format(v141)
		}
		table.insert(v140, v145)
		if v143 == "emphasis" then
			continue
		end
		local v146 = {
			["tag"] = ("content-%*"):format(v143),
			["properties"] = {
				["ImageColor3"] = ("$ColorSystem%*Color3"):format(v144),
				["ImageTransparency"] = ("$ColorSystem%*Transparency"):format(v144),
				["TextColor3"] = ("$ColorSystem%*Color3"):format(v144),
				["TextTransparency"] = ("$ColorSystem%*Transparency"):format(v144)
			},
			["attributes"] = {
				{
					["name"] = ("ColorSystem%*Color3"):format(v144),
					["value"] = v142.Color3
				},
				{
					["name"] = ("ColorSystem%*Transparency"):format(v144),
					["value"] = v142.Transparency
				}
			},
			["deprecatedFor"] = ("content-%*"):format(v141)
		}
		table.insert(v140, v146)
		local v147 = {
			["tag"] = nil,
			["pseudo"] = "UIStroke",
			["properties"] = nil,
			["attributes"] = nil,
			["deprecatedFor"] = nil,
			["tag"] = ("stroke-%*"):format(v143),
			["properties"] = {
				["Color"] = ("$ColorSystem%*Color3"):format(v144),
				["Transparency"] = ("$ColorSystem%*Transparency"):format(v144)
			},
			["attributes"] = {
				{
					["name"] = ("ColorSystem%*Color3"):format(v144),
					["value"] = v142.Color3
				},
				{
					["name"] = ("ColorSystem%*Transparency"):format(v144),
					["value"] = v142.Transparency
				}
			},
			["deprecatedFor"] = ("stroke-%*"):format(v141)
		}
		table.insert(v140, v147)
	end
	return v140
end
local function v_u_149() -- name: EngineDefaultBypassRules
	return {
		{
			["tag"] = "x-default-transparency",
			["properties"] = nil,
			["properties"] = {
				["BackgroundTransparency"] = 0
			}
		},
		{
			["tag"] = "x-default-text-size",
			["properties"] = nil,
			["properties"] = {
				["TextSize"] = 8
			}
		}
	}
end
local function v_u_171() -- name: ListLayoutRules
	-- upvalues: (copy) v_u_3
	local v150 = {}
	local v151 = {
		["tag"] = "row",
		["pseudo"] = "UIListLayout",
		["properties"] = nil,
		["properties"] = {
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}
	}
	local v152 = {
		["tag"] = "col",
		["pseudo"] = "UIListLayout",
		["properties"] = nil,
		["properties"] = {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}
	}
	__set_list(v150, 1, {v151, v152})
	local v153 = {}
	local v154 = {
		["tag"] = "align-x-left",
		["pseudo"] = "UIListLayout",
		["properties"] = nil,
		["properties"] = {
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left
		}
	}
	local v155 = {
		["tag"] = "align-x-center",
		["pseudo"] = "UIListLayout",
		["properties"] = nil,
		["properties"] = {
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
		}
	}
	local v156 = {
		["tag"] = "align-x-right",
		["pseudo"] = "UIListLayout",
		["properties"] = nil,
		["properties"] = {
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Right
		}
	}
	local v157 = {
		["tag"] = "align-y-top",
		["pseudo"] = "UIListLayout",
		["properties"] = nil,
		["properties"] = {
			["VerticalAlignment"] = Enum.VerticalAlignment.Top
		}
	}
	local v158 = {
		["tag"] = "align-y-center",
		["pseudo"] = "UIListLayout",
		["properties"] = nil,
		["properties"] = {
			["VerticalAlignment"] = Enum.VerticalAlignment.Center
		}
	}
	local v159 = {
		["tag"] = "align-y-bottom",
		["pseudo"] = "UIListLayout",
		["properties"] = nil,
		["properties"] = {
			["VerticalAlignment"] = Enum.VerticalAlignment.Bottom
		}
	}
	__set_list(v153, 1, {v154, v155, v156, v157, v158, v159})
	local v160 = {}
	local v161 = {
		{
			["tag"] = "wrap",
			["pseudo"] = "UIListLayout",
			["properties"] = nil,
			["properties"] = {
				["Wraps"] = true
			}
		},
		{
			["tag"] = "no-wrap",
			["pseudo"] = "UIListLayout",
			["properties"] = nil,
			["properties"] = {
				["Wraps"] = false
			}
		}
	}
	for v162, v163 in {
		["none"] = Enum.UIFlexAlignment.None,
		["fill"] = Enum.UIFlexAlignment.Fill,
		["around"] = Enum.UIFlexAlignment.SpaceAround,
		["between"] = Enum.UIFlexAlignment.SpaceBetween,
		["evenly"] = Enum.UIFlexAlignment.SpaceEvenly
	} do
		local v164 = {
			["tag"] = nil,
			["pseudo"] = "UIListLayout",
			["properties"] = nil,
			["tag"] = ("flex-%*"):format(v162),
			["properties"] = {
				["HorizontalFlex"] = v163,
				["VerticalFlex"] = v163
			}
		}
		table.insert(v160, v164)
		local v165 = {
			["tag"] = nil,
			["pseudo"] = "UIListLayout",
			["properties"] = nil,
			["tag"] = ("flex-x-%*"):format(v162),
			["properties"] = {
				["HorizontalFlex"] = v163
			}
		}
		table.insert(v160, v165)
		local v166 = {
			["tag"] = nil,
			["pseudo"] = "UIListLayout",
			["properties"] = nil,
			["tag"] = ("flex-y-%*"):format(v162),
			["properties"] = {
				["VerticalFlex"] = v163
			}
		}
		table.insert(v160, v166)
	end
	local v167 = {}
	for v168, v169 in {
		["auto"] = Enum.ItemLineAlignment.Automatic,
		["start"] = Enum.ItemLineAlignment.Start,
		["center"] = Enum.ItemLineAlignment.Center,
		["end"] = Enum.ItemLineAlignment.End,
		["stretch"] = Enum.ItemLineAlignment.Stretch
	} do
		local v170 = {
			["tag"] = nil,
			["pseudo"] = "UIListLayout",
			["properties"] = nil,
			["tag"] = ("items-%*"):format(v168),
			["properties"] = {
				["ItemLineAlignment"] = v169
			}
		}
		table.insert(v167, v170)
	end
	return v_u_3.joinArrays(v150, v153, v161, v160, v167)
end
local function v_u_186() -- name: FlexItemRules
	-- upvalues: (copy) v_u_3
	local v172 = {}
	local v173 = {
		["tag"] = "grow",
		["pseudo"] = "UIFlexItem",
		["properties"] = nil,
		["properties"] = {
			["FlexMode"] = Enum.UIFlexMode.Grow
		}
	}
	local v174 = {
		["tag"] = "shrink",
		["pseudo"] = "UIFlexItem",
		["properties"] = nil,
		["properties"] = {
			["FlexMode"] = Enum.UIFlexMode.Shrink
		}
	}
	local v175 = {
		["tag"] = "fill",
		["pseudo"] = "UIFlexItem",
		["properties"] = nil,
		["properties"] = {
			["FlexMode"] = Enum.UIFlexMode.Fill
		}
	}
	local v176 = {
		["tag"] = "no-flex",
		["pseudo"] = "UIFlexItem",
		["properties"] = nil,
		["properties"] = {
			["FlexMode"] = Enum.UIFlexMode.None
		}
	}
	__set_list(v172, 1, {v173, v174, v175, v176})
	local v177 = {}
	local v178 = {}
	for v179 in {
		1,
		2,
		3,
		4,
		5
	} do
		local v180 = {
			["tag"] = nil,
			["pseudo"] = "UIFlexItem",
			["properties"] = nil,
			["tag"] = ("grow-%*"):format(v179),
			["properties"] = {
				["FlexMode"] = Enum.UIFlexMode.Custom,
				["GrowRatio"] = v179
			}
		}
		table.insert(v177, v180)
		local v181 = {
			["tag"] = nil,
			["pseudo"] = "UIFlexItem",
			["properties"] = nil,
			["tag"] = ("shrink-%*"):format(v179),
			["properties"] = {
				["FlexMode"] = Enum.UIFlexMode.Custom,
				["ShrinkRatio"] = v179
			}
		}
		table.insert(v178, v181)
	end
	local v182 = {}
	for v183, v184 in {
		["auto"] = Enum.ItemLineAlignment.Automatic,
		["start"] = Enum.ItemLineAlignment.Start,
		["center"] = Enum.ItemLineAlignment.Center,
		["end"] = Enum.ItemLineAlignment.End,
		["stretch"] = Enum.ItemLineAlignment.Stretch
	} do
		local v185 = {
			["tag"] = nil,
			["pseudo"] = "UIFlexItem",
			["properties"] = nil,
			["tag"] = ("self-%*"):format(v183),
			["properties"] = {
				["ItemLineAlignment"] = v184
			}
		}
		table.insert(v182, v185)
	end
	return v_u_3.joinArrays(v172, v177, v178, v182)
end
local function v_u_197() -- name: TextRules
	local v187 = {}
	for v188, v189 in {
		["left"] = Enum.TextXAlignment.Left,
		["center"] = Enum.TextXAlignment.Center,
		["right"] = Enum.TextXAlignment.Right
	} do
		local v190 = {
			["tag"] = ("text-align-x-%*"):format(v188),
			["properties"] = {
				["TextXAlignment"] = v189
			}
		}
		table.insert(v187, v190)
	end
	for v191, v192 in {
		["top"] = Enum.TextYAlignment.Top,
		["center"] = Enum.TextYAlignment.Center,
		["bottom"] = Enum.TextYAlignment.Bottom
	} do
		local v193 = {
			["tag"] = ("text-align-y-%*"):format(v191),
			["properties"] = {
				["TextYAlignment"] = v192
			}
		}
		table.insert(v187, v193)
	end
	for v194, v195 in {
		["none"] = Enum.TextTruncate.None,
		["end"] = Enum.TextTruncate.AtEnd,
		["split"] = Enum.TextTruncate.SplitWord
	} do
		local v196 = {
			["tag"] = ("text-truncate-%*"):format(v194),
			["properties"] = {
				["TextTruncate"] = v195
			}
		}
		table.insert(v187, v196)
	end
	table.insert(v187, {
		["tag"] = "text-wrap",
		["properties"] = nil,
		["properties"] = {
			["TextWrapped"] = true
		}
	})
	table.insert(v187, {
		["tag"] = "text-no-wrap",
		["properties"] = nil,
		["properties"] = {
			["TextWrapped"] = false
		}
	})
	return v187
end
local function v_u_202() -- name: AutomaticSizeRules
	local v198 = {}
	for v199, v200 in {
		["none"] = Enum.AutomaticSize.None,
		["x"] = Enum.AutomaticSize.X,
		["y"] = Enum.AutomaticSize.Y,
		["xy"] = Enum.AutomaticSize.XY
	} do
		local v201 = {
			["tag"] = ("auto-%*"):format(v199),
			["properties"] = {
				["AutomaticSize"] = v200
			}
		}
		table.insert(v198, v201)
	end
	return v198
end
local function v_u_210() -- name: PositionRules
	local v203 = {
		["top"] = 0,
		["center"] = 0.5,
		["bottom"] = 1
	}
	local v204 = {}
	for v205, v206 in {
		["left"] = 0,
		["center"] = 0.5,
		["right"] = 1
	} do
		for v207, v208 in v203 do
			local v209 = {
				["tag"] = ("position-%*-%*"):format(v207, v205),
				["properties"] = {
					["Position"] = UDim2.fromScale(v206, v208)
				}
			}
			table.insert(v204, v209)
		end
	end
	return v204
end
local function v_u_218() -- name: AnchorPointRules
	local v211 = {
		["top"] = 0,
		["center"] = 0.5,
		["bottom"] = 1
	}
	local v212 = {}
	for v213, v214 in {
		["left"] = 0,
		["center"] = 0.5,
		["right"] = 1
	} do
		for v215, v216 in v211 do
			local v217 = {
				["tag"] = ("anchor-%*-%*"):format(v215, v213),
				["properties"] = {
					["AnchorPoint"] = Vector2.new(v214, v216)
				}
			}
			table.insert(v212, v217)
		end
	end
	return v212
end
local function v_u_219() -- name: ClipsDescendantRules
	return {
		{
			["tag"] = "clip",
			["properties"] = nil,
			["properties"] = {
				["ClipsDescendants"] = true
			}
		},
		{
			["tag"] = "no-clip",
			["properties"] = nil,
			["properties"] = {
				["ClipsDescendants"] = false
			}
		}
	}
end
local function v_u_228() -- name: AspectRatioRules
	local v220 = {}
	for _, v221 in {
		{ 1, 1 },
		{ 5, 4 },
		{ 4, 3 },
		{ 3, 2 },
		{ 16, 9 },
		{ 2, 1 }
	} do
		local v222 = {
			["tag"] = nil,
			["pseudo"] = "UIAspectRatioConstraint",
			["properties"] = nil,
			["tag"] = ("aspect-%*-%*"):format(v221[1], v221[2])
		}
		local v223 = {}
		local v224 = v221[1] / v221[2] * 1000
		v223.AspectRatio = math.round(v224) / 1000
		v222.properties = v223
		table.insert(v220, v222)
		if v221[1] == v221[2] then
			continue
		end
		local v225 = {
			["tag"] = nil,
			["pseudo"] = "UIAspectRatioConstraint",
			["properties"] = nil,
			["tag"] = ("aspect-%*-%*"):format(v221[2], v221[1])
		}
		local v226 = {}
		local v227 = v221[2] / v221[1] * 1000
		v226.AspectRatio = math.round(v227) / 1000
		v225.properties = v226
		table.insert(v220, v225)
	end
	return v220
end
return {
	["rulesGenerator"] = function(p229, p230, p231) -- name: rulesGenerator
		-- upvalues: (copy) v_u_3, (copy) v_u_78, (copy) v_u_149, (copy) v_u_186, (copy) v_u_197, (copy) v_u_202, (copy) v_u_210, (copy) v_u_218, (copy) v_u_219, (copy) v_u_228, (copy) v_u_171, (copy) v_u_30, (copy) v_u_4, (copy) v_u_10, (copy) v_u_5, (copy) v_u_39, (copy) v_u_107, (copy) v_u_76, (copy) v_u_87, (copy) v_u_148, (copy) v_u_101, (copy) v_u_124, (copy) v_u_138, (copy) v_u_83, (copy) v_u_19, (copy) v_u_53
		local v232 = p230.colors
		local v233 = p230.variants
		local v234 = p230.gaps
		local v235 = p230.gutters
		local v236 = p230.radii
		local v237 = p230.sizes
		local v238 = p230.strokes
		local v239 = p230.typography
		local v240 = p230.paddings
		local v241 = p230.margins
		return v_u_3.joinArrays(v_u_78(), v_u_149(), v_u_186(), v_u_197(), v_u_202(), v_u_210(), v_u_218(), v_u_219(), (v_u_228())), v_u_3.joinArrays(v_u_171(), v_u_30(v234, v235), v_u_4(v236, function(p242)
			-- upvalues: (ref) v_u_10
			local v243 = v_u_10(p242.name)
			local v244 = {
				["cornerValue"] = ("$Radius%*"):format(v243),
				["attributes"] = {
					{
						["name"] = ("Radius%*"):format(v243),
						["value"] = p242.size
					}
				}
			}
			return v244
		end), v_u_5(p229), v_u_39(v237), v_u_107(v238), (v_u_76(v240, v241))), v_u_3.joinArrays(v_u_87(p229), v_u_148(v232), v_u_101(v232, v233), v_u_124(v232, v233), (v_u_138(v232, v233))), v_u_3.joinArrays(v_u_83(p229, p231), v_u_19(v239["body-large"], p229.Config.Text.NominalScale), (v_u_53(v239, p229.Config.Text.NominalScale, p231)))
	end
}