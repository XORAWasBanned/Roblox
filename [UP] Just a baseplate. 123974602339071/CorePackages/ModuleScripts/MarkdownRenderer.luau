-- Path: CorePackages.Packages._Index.Markdown.Markdown.Components.MarkdownViewer.MarkdownRenderer
local v_u_1 = game:GetService("MessageBusService")
local v2 = script:FindFirstAncestor("Components").Parent
local v3 = v2.Parent
local v_u_4 = require(v3.React)
local v_u_5 = require(v3.Dash)
local v_u_6 = require(v3.Foundation)
local v7 = require(v3.InlineLayout)
local v8 = require(v3.MarkdownCore)
local v_u_9 = v_u_6.View
local v_u_10 = v_u_6.Text
local v_u_11 = v_u_6.Divider
local v12 = v2.Utils
local v_u_13 = v7.Components.InlineLayoutElements.TextElement
local v_u_14 = v7.Components.InlineLayoutElements.SelectableTextElement
local v_u_15 = v7.Components.InlineLayoutElements.LinkElement
local v_u_16 = v7.Components.InlineLayoutElements.ImageElement
local v_u_17 = v7.Components.InlineLayoutElements.HardBreakElement
local v_u_18 = require(v12.mergeContexts)
local v_u_19 = require(v12.processSoftBreaks)
local v_u_20 = require(v12.shouldUseTopPadding)
local v21 = require(v12.TextStyle)
local v22 = require(script.Parent.Parent.NodeRenderers.MarkdownTable)
local v_u_23 = require(script.Parent.Parent.NodeRenderers.renderInline)
local v24 = require(script.Parent.Parent.NodeRenderers.renderTag)
local v_u_25 = v8.Components.BulletList
local v_u_26 = v21.getBaseTextElementEngineTags
local v_u_27 = v21.getCodeTextStyles
local v_u_28 = v21.normalizeStyleFont
require(v2.Types)
local v_u_29 = v8.Utils.Highlighter
local v_u_30 = require(v2.Utils.getNodeTypeConfig)
local v_u_31 = v7.Utils.isInlineElement
local v_u_32 = v8.Flags
local v_u_33 = v_u_6.Utility.Flags
local v_u_34 = v_u_32.FFlagMarkdownTables or v_u_32.FFlagMarkdownTagFallbacks
local v_u_35 = Enum.Font.BuilderSans
local v_u_36 = UDim2.fromOffset(16, 16)
local v_u_37 = Enum.Font.Code
local v_u_38 = Font.new("rbxasset://fonts/families/BuilderMono.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
local function v_u_40(p39)
	print((("[Default link callback]: URL [%*] is clicked"):format(p39)))
end
local v_u_41 = {
	["renderers"] = {}
}
local function v_u_48(p42, p43) -- name: render
	-- upvalues: (copy) v_u_34, (copy) v_u_41, (copy) v_u_30
	if not p42 then
		return nil
	end
	local v44
	if v_u_34 and p43.renderers then
		v44 = p43.renderers
	else
		v44 = v_u_41.renderers
	end
	local v45 = v44[p42.name]
	if not v45 then
		warn((("No renderer found for node: %*"):format(p42.name)))
		return nil
	end
	local v46 = v45(p42, p43)
	local v47 = v_u_30(p42)
	if v47 and not v47.validateRenderResult(v46) then
		warn((("Invalid render result for node: %* %* of type: %*"):format(p42.name, p42.text, p42.type)))
	end
	return v46
end
local function v_u_59(p49, p50) -- name: processChildren
	-- upvalues: (copy) v_u_30, (copy) v_u_48
	local v51 = p49.children
	if not v51 then
		return {}
	end
	local v52 = v_u_30(p49)
	local v53 = v52 and v52.children or {}
	local v54 = {}
	for _, v55 in v51 do
		local v56 = v55.type
		if not v53[v56] then
			warn((("Invalid child node type. Parent node: %* %* of type: %* has invalid child node: %* %* of type: %*"):format(p49.name, p49.text, p49.type, v55.name, v55.text, v56)))
		end
		local v57 = v_u_48(v55, p50)
		if not v57 then
			continue
		end
		if #v57 > 0 then
			for _, v58 in v57 do
				table.insert(v54, v58)
			end
		else
			table.insert(v54, v57)
		end
	end
	return v54
end
local function v_u_66(p60) -- name: computeLineNumbers
	local v61 = #p60
	local v62 = 0
	local v63 = 1
	local v64 = {}
	while true do
		local v65 = v62 <= v61 and string.find(p60, "\n", v62, true)
		if not v65 then
			break
		end
		v64[v63] = tostring(v63)
		v63 = v63 + 1
		v62 = v65 + 1
	end
	v64[v63] = tostring(v63)
	return table.concat(v64, "\n")
end
local v_u_71 = v_u_5.memoize(function(p_u_67)
	-- upvalues: (copy) v_u_1
	return function()
		-- upvalues: (copy) p_u_67, (ref) v_u_1
		local v_u_68 = p_u_67
		local function v70()
			-- upvalues: (ref) v_u_1, (copy) v_u_68
			local v69 = {
				["text"] = v_u_68
			}
			return v_u_1:Publish(v_u_1:GetMessageId("ExternalContentSharing", "setClipboardText"), v69)
		end
		pcall(v70)
	end
end)
local function v83(p72, p73) -- name: renderText
	-- upvalues: (copy) v_u_19, (copy) v_u_26, (copy) v_u_32, (copy) v_u_35, (copy) v_u_14, (copy) v_u_13
	local v74 = {
		["LayoutOrder"] = p72.index,
		["Text"] = v_u_19(p72.text),
		["EngineTags"] = v_u_26(p73.textStyles)
	}
	local v75 = {}
	local v76
	if v_u_32.FFlagMarkdownAssistantParity then
		v76 = p73.textStyles.fontFace
	else
		local v77 = p73.textStyles
		local v78 = v_u_35
		v76 = v77.fontFace or v77.font
		if typeof(v76) ~= "Font" then
			if v76 then
				v76 = Font.fromEnum(v76)
			else
				v76 = Font.fromEnum(v78)
			end
		end
	end
	v75.Font = v76
	v75.FontSize = p73.textStyles.textSize
	v74.fontStyle = v75
	local v79 = {}
	local v80 = p73.textStyles.color
	local v81
	if typeof(v80) == "string" then
		v81 = Color3.fromHex(p73.textStyles.color)
	else
		v81 = p73.textStyles.color
	end
	v79.Color3 = v81
	v79.Transparency = p73.textStyles.transparency
	v74.textStyle = v79
	v74.viewTags = p73.textStyles.viewTags
	local v82
	if v_u_32.FFlagMarkdownTables then
		v82 = p73.textStyles.textTags
	else
		v82 = nil
	end
	v74.tag = v82
	if p73.textStyles.selectable then
		return v_u_14.new(v74)
	else
		return v_u_13.new(v74)
	end
end
local function v84() -- name: renderHardBreak
	-- upvalues: (copy) v_u_17
	return v_u_17
end
v_u_41.defaultRenderers = {
	["ROOT"] = function(p85, p86) -- name: renderRoot
		-- upvalues: (copy) v_u_4, (copy) v_u_9
		return v_u_4.createElement(v_u_9, {
			["tag"] = "size-full-0 auto-y col",
			["BorderSizePixel"] = 0,
			["backgroundStyle"] = nil,
			["backgroundStyle"] = {
				["Transparency"] = 1
			}
		}, (p86.processChildren(p85, p86)))
	end,
	["HEADING"] = function(p87, p88) -- name: renderHeading
		-- upvalues: (copy) v_u_4, (copy) v_u_9, (copy) v_u_20, (copy) v_u_23, (copy) v_u_18
		local v89
		if p87.attributes then
			local v90 = p87.attributes.depth
			v89 = type(v90) ~= "number" and 1 or p87.attributes.depth
		else
			v89 = 1
		end
		local v91 = #p88.headerStyles
		local v92 = math.clamp(v89, 1, v91)
		local v93 = v_u_4.createElement
		local v94 = v_u_9
		local v95 = {
			["key"] = nil,
			["LayoutOrder"] = nil,
			["tag"] = "size-full-0 auto-y"
		}
		local v96 = p87.index
		v95.key = tostring(v96)
		v95.LayoutOrder = p87.index
		local v97 = {}
		local v98 = v_u_20(p87)
		if v98 then
			v98 = v_u_4.createElement("UIPadding", {
				["PaddingTop"] = UDim.new(0, 20)
			})
		end
		v97.UIPadding = v98
		v97.InlineLayout = v_u_23(p87, v_u_18(p88, {
			["textStyles"] = p88.headerStyles[v92]
		}))
		return v93(v94, v95, v97)
	end,
	["PARAGRAPH"] = function(p99, p100) -- name: renderParagraph
		-- upvalues: (copy) v_u_4, (copy) v_u_9, (copy) v_u_20, (copy) v_u_23
		local v101 = v_u_4.createElement
		local v102 = v_u_9
		local v103 = {
			["key"] = nil,
			["LayoutOrder"] = nil,
			["tag"] = "size-full-0 auto-y"
		}
		local v104 = p99.index
		v103.key = tostring(v104)
		v103.LayoutOrder = p99.index
		local v105 = {}
		local v106 = v_u_20(p99)
		if v106 then
			v106 = v_u_4.createElement("UIPadding", {
				["PaddingTop"] = UDim.new(0, 10)
			})
		end
		v105.UIPadding = v106
		v105.InlineLayout = v_u_23(p99, p100)
		return v101(v102, v103, v105)
	end,
	["CODE_BLOCK"] = function(p107, p108) -- name: renderCodeBlock
		-- upvalues: (copy) v_u_29, (copy) v_u_27, (copy) v_u_32, (copy) v_u_38, (copy) v_u_37, (copy) v_u_66, (copy) v_u_4, (copy) v_u_9, (copy) v_u_20, (copy) v_u_6, (copy) v_u_71, (copy) v_u_10, (copy) v_u_5
		local v109
		if p107.attributes then
			v109 = p107.attributes.language
		else
			v109 = nil
		end
		local v110 = p107.text
		local v111
		if v109 == "lua" then
			v111 = v_u_29.highlight(v110, p108.colorScheme)
		else
			v111 = v110
		end
		local v112 = v_u_27(p108)
		local v113 = {
			["TextWrapped"] = false,
			["fontStyle"] = nil,
			["TextXAlignment"] = nil,
			["tag"] = "auto-xy padding-small align-y-top"
		}
		local v114 = {
			["FontSize"] = v112.textSize
		}
		local v115
		if v_u_32.FFlagMarkdownAssistantParity then
			v115 = v112.fontFace or v_u_38
		else
			local v116 = v_u_37
			v115 = v112.fontFace or v112.font
			if typeof(v115) ~= "Font" then
				if v115 then
					v115 = Font.fromEnum(v115)
				else
					v115 = Font.fromEnum(v116)
				end
			end
		end
		v114.Font = v115
		v114.LineHeight = v112.lineHeight
		v113.fontStyle = v114
		v113.TextXAlignment = Enum.TextXAlignment.Left
		local v117 = {
			["Text"] = nil,
			["textStyle"] = nil,
			["RichText"] = true,
			["ZIndex"] = 1,
			["Text"] = v111,
			["textStyle"] = {
				["Color3"] = v_u_29.getTokenColor("iden")
			}
		}
		local v118 = {
			["Text"] = nil,
			["textStyle"] = nil,
			["ZIndex"] = 0,
			["TextSelectable"] = true,
			["Text"] = v110,
			["textStyle"] = {
				["Color3"] = nil,
				["Transparency"] = 0.4,
				["Color3"] = v_u_29.getTokenColor("iden")
			}
		}
		local v119 = p108.codeBackgroundStyles or {}
		local v120 = v119.backgroundColor3 or v_u_29.getTokenColor("background")
		local v121 = v119.backgroundTransparency or 0
		local v122 = nil
		local v123 = p108.codeSettings
		if v123 then
			v123 = p108.codeSettings.showLineNumbers
		end
		if v123 then
			v122 = v_u_66(v110)
		end
		local v124 = p108.codeSettings
		if v124 then
			v124 = p108.codeSettings.showCopyButton
		end
		local v125 = v_u_4.createElement
		local v126 = v_u_9
		local v127 = {
			["key"] = nil,
			["LayoutOrder"] = nil,
			["tag"] = "size-full-0 auto-y col",
			["backgroundStyle"] = nil,
			["BorderSizePixel"] = 0
		}
		local v128 = p107.index
		v127.key = tostring(v128)
		v127.LayoutOrder = p107.index
		v127.backgroundStyle = {
			["Transparency"] = 1
		}
		local v129 = {}
		local v130 = v_u_4.createElement
		local v131 = "UIPadding"
		local v132 = {}
		local v133
		if v_u_20(p107) then
			v133 = UDim.new(0, 10)
		else
			v133 = nil
		end
		v132.PaddingTop = v133
		v132.PaddingBottom = UDim.new(0, 10)
		v129.UIPadding = v130(v131, v132)
		local v134
		if v124 then
			v134 = v_u_4.createElement(v_u_6.View, {
				["tag"] = "size-full-0 auto-y row align-x-right bg-shift-300 radius-small",
				["LayoutOrder"] = 1
			}, {
				["CopyToClipboardButton"] = v_u_4.createElement(v_u_6.IconButton, {
					["size"] = v_u_6.Enums.InputSize.Small,
					["icon"] = {
						["name"] = v_u_6.Enums.IconName.TwoStackedSquares
					},
					["onActivated"] = v_u_71(v110)
				})
			})
		else
			v134 = nil
		end
		v129.TitleBar = v134
		local v135 = v_u_4.createElement
		local v136 = v_u_6.View
		local v137 = {
			["LayoutOrder"] = 2,
			["tag"] = nil,
			["tag"] = {
				["size-full-0 auto-y"] = true,
				["row align-y-center"] = v123
			}
		}
		local v138 = {}
		local v139
		if v123 then
			v139 = v_u_4.createElement(v_u_6.Text, {
				["Text"] = nil,
				["fontStyle"] = nil,
				["LayoutOrder"] = 1,
				["tag"] = "size-0-0 auto-xy text-align-x-right text-align-y-center padding-small bg-shift-100 content-emphasis",
				["Text"] = v122,
				["fontStyle"] = v113.fontStyle
			})
		else
			v139 = nil
		end
		v138.LineNumbers = v139
		v138.ScrollFrameWrapper = v_u_4.createElement(v_u_6.View, {
			["tag"] = "size-full-0 auto-y fill",
			["Size"] = nil,
			["LayoutOrder"] = 2,
			["Size"] = UDim2.fromScale(1, 0)
		}, {
			["ScrollFrame"] = v_u_4.createElement("ScrollingFrame", {
				["BackgroundColor3"] = nil,
				["BackgroundTransparency"] = nil,
				["BorderSizePixel"] = 0,
				["ScrollingDirection"] = nil,
				["Size"] = nil,
				["AutomaticSize"] = nil,
				["AutomaticCanvasSize"] = nil,
				["BackgroundColor3"] = v120,
				["BackgroundTransparency"] = v121,
				["ScrollingDirection"] = Enum.ScrollingDirection.X,
				["Size"] = UDim2.fromScale(1, 0),
				["AutomaticSize"] = Enum.AutomaticSize.Y,
				["AutomaticCanvasSize"] = Enum.AutomaticSize.X
			}, {
				["HighlightedCode"] = v_u_4.createElement(v_u_10, v_u_5.join(v113, v117)),
				["SelectableCodeWrapper"] = v_u_4.createElement(v_u_6.View, {
					["tag"] = v113.tag
				}, {
					["SelectableCode"] = v_u_4.createElement("TextBox", {
						["Text"] = nil,
						["FontFace"] = nil,
						["TextSize"] = nil,
						["TextColor3"] = nil,
						["TextTransparency"] = nil,
						["BackgroundTransparency"] = 1,
						["TextXAlignment"] = nil,
						["TextYAlignment"] = nil,
						["TextEditable"] = false,
						["ZIndex"] = nil,
						["Size"] = nil,
						["AutomaticSize"] = nil,
						["TextWrapped"] = false,
						["ClearTextOnFocus"] = false,
						["LineHeight"] = nil,
						["Text"] = v118.Text,
						["FontFace"] = v113.fontStyle.Font,
						["TextSize"] = v113.fontStyle.FontSize,
						["TextColor3"] = v118.textStyle.Color3,
						["TextTransparency"] = v118.textStyle.Transparency,
						["TextXAlignment"] = Enum.TextXAlignment.Left,
						["TextYAlignment"] = Enum.TextYAlignment.Center,
						["ZIndex"] = v118.ZIndex,
						["Size"] = UDim2.fromScale(0, 0),
						["AutomaticSize"] = Enum.AutomaticSize.XY,
						["LineHeight"] = p108.codeStyles.lineHeight
					})
				})
			})
		})
		v129.CodeWrapper = v135(v136, v137, v138)
		return v125(v126, v127, v129)
	end,
	["STYLED_TEXT"] = function(p140, p141) -- name: renderStyledText
		-- upvalues: (copy) v_u_5, (copy) v_u_18
		local v142
		if p140.attributes and p140.attributes.style then
			v142 = p140.attributes.style
		else
			v142 = nil
		end
		local v143 = {}
		if v142 == "BOLD" or v142 == "BOLD_2" then
			v143.bold = true
		elseif v142 == "ITALIC" or v142 == "ITALIC_2" then
			v143.italic = true
		elseif v142 == "UNDERLINE" then
			v143.underline = true
		elseif v142 == "STRIKE" then
			v143.strike = true
		elseif v142 == "INLINE_CODE" then
			local v144 = p141.codeStyles
			v143 = v_u_5.joinDeep(v144, {
				["selectable"] = true
			})
		end
		return p141.processChildren(p140, v_u_18(p141, {
			["textStyles"] = v143
		}))
	end,
	["TEXT"] = v83,
	["LINK"] = function(p145, p_u_146) -- name: renderLink
		-- upvalues: (copy) v_u_18, (copy) v_u_5, (copy) v_u_31, (copy) v_u_17, (copy) v_u_15
		local v_u_147 = p145.attributes and p145.attributes.url or (p145.url or "")
		local v148 = p_u_146.processChildren(p145, v_u_18(p_u_146, {
			["textStyles"] = {
				["color"] = p_u_146.linkStyles.linkColor
			}
		}))
		local v151 = v_u_5.filter(v148, function(p149)
			-- upvalues: (ref) v_u_31, (ref) v_u_17
			local v150 = v_u_31(p149)
			if v150 then
				v150 = p149 ~= v_u_17
			end
			return v150
		end)
		return v_u_15.new(v151, {
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (copy) p_u_146, (copy) v_u_147
				p_u_146.linkCallback(v_u_147)
			end
		})
	end,
	["LIST"] = function(p152, p153) -- name: renderList
		-- upvalues: (copy) v_u_4, (copy) v_u_9, (copy) v_u_48, (copy) v_u_5, (copy) v_u_25, (copy) v_u_32, (copy) v_u_35, (copy) v_u_20
		local v154 = nil
		local v155 = {}
		for v156 = #p152.children, 1, -1 do
			local v157 = p152.children[v156]
			if v157.name == "LIST" then
				v154 = v157
			elseif v154 then
				local v158 = 1
				local v159 = {}
				local v160
				if v157.attributes then
					v160 = v157.attributes.prefix
				else
					v160 = nil
				end
				v159.Prefix = v160
				v159.Item = v_u_4.createElement(v_u_9, {
					["tag"] = "size-full-0 auto-y col",
					["BorderSizePixel"] = 0,
					["backgroundStyle"] = nil,
					["backgroundStyle"] = {
						["Transparency"] = 1
					}
				}, {
					["Item"] = v_u_48(v_u_5.join(v157, {
						["index"] = 1
					}), p153),
					["List"] = v_u_48(v_u_5.join(v154, {
						["index"] = 2
					}), p153)
				})
				table.insert(v155, v158, v159)
				v154 = nil
			else
				local v161 = 1
				local v162 = {}
				local v163
				if v157.attributes then
					v163 = v157.attributes.prefix
				else
					v163 = nil
				end
				v162.Prefix = v163
				v162.Item = v_u_48(v157, p153)
				table.insert(v155, v161, v162)
			end
		end
		local v164 = v_u_4.createElement
		local v165 = v_u_25
		local v166 = {
			["key"] = nil,
			["LayoutOrder"] = nil,
			["Items"] = nil,
			["TextWrapped"] = true,
			["ListStyle"] = nil,
			["tag"] = "size-full-0 auto-y"
		}
		local v167 = p152.index
		v166.key = tostring(v167)
		v166.LayoutOrder = p152.index
		v166.Items = v155
		local v168 = {}
		local v169
		if v_u_32.FFlagMarkdownAssistantParity then
			v169 = p153.textStyles.fontFace
		else
			local v170 = p153.textStyles
			local v171 = v_u_35
			v169 = v170.fontFace or v170.font
			if typeof(v169) ~= "Font" then
				if v169 then
					v169 = Font.fromEnum(v169)
				else
					v169 = Font.fromEnum(v171)
				end
			end
		end
		v168.Font = v169
		local v172 = p153.textStyles.color
		local v173
		if typeof(v172) == "string" then
			v173 = Color3.fromHex(p153.textStyles.color)
		else
			v173 = p153.textStyles.color
		end
		v168.TextColor = v173
		v168.TextSize = p153.textStyles.textSize
		v168.LineHeight = p153.textStyles.textSize
		v166.ListStyle = v168
		local v174 = {}
		local v175 = v_u_20(p152)
		if v175 then
			v175 = v_u_4.createElement("UIPadding", {
				["PaddingTop"] = UDim.new(0, 10)
			})
		end
		v174.UIPadding = v175
		return v164(v165, v166, v174)
	end,
	["LIST_ITEM"] = function(p176, p177) -- name: renderListItem
		-- upvalues: (copy) v_u_4, (copy) v_u_9, (copy) v_u_23
		local v178 = v_u_4.createElement
		local v179 = v_u_9
		local v180 = {
			["key"] = nil,
			["LayoutOrder"] = nil,
			["tag"] = "size-full-0 auto-y"
		}
		local v181 = p176.index
		v180.key = tostring(v181)
		v180.LayoutOrder = p176.index
		return v178(v179, v180, {
			["InlineLayout"] = v_u_23(p176, p177)
		})
	end,
	["DIVIDER"] = function(p182) -- name: renderThematicBreak
		-- upvalues: (copy) v_u_4, (copy) v_u_9, (copy) v_u_20, (copy) v_u_11
		local v183 = v_u_4.createElement
		local v184 = v_u_9
		local v185 = {
			["key"] = nil,
			["tag"] = "size-full-0 auto-y",
			["LayoutOrder"] = nil
		}
		local v186 = p182.index
		v185.key = tostring(v186)
		v185.LayoutOrder = p182.index
		local v187 = {}
		local v188 = v_u_20(p182)
		if v188 then
			v188 = v_u_4.createElement("UIPadding", {
				["PaddingTop"] = UDim.new(0, 10)
			})
		end
		v187.UIPadding = v188
		v187.Divider = v_u_4.createElement(v_u_11)
		return v183(v184, v185, v187)
	end,
	["QUOTE"] = function(p189, p190) -- name: renderBlockquote
		-- upvalues: (copy) v_u_4, (copy) v_u_9, (copy) v_u_23, (copy) v_u_18
		local v191 = v_u_4.createElement
		local v192 = v_u_9
		local v193 = {
			["key"] = nil,
			["LayoutOrder"] = nil,
			["tag"] = "size-full-0 auto-y padding-small",
			["backgroundStyle"] = nil
		}
		local v194 = p189.index
		v193.key = tostring(v194)
		v193.LayoutOrder = p189.index
		v193.backgroundStyle = {
			["Transparency"] = 1
		}
		local v195 = {}
		local v196 = v_u_4.createElement
		local v197 = v_u_9
		local v198 = {
			["backgroundStyle"] = nil,
			["tag"] = "size-full-0 auto-y",
			["backgroundStyle"] = {
				["Transparency"] = 0.9,
				["Color3"] = nil,
				["Color3"] = Color3.fromRGB(163, 162, 165)
			}
		}
		local v199 = {
			["InlineLayout"] = v_u_23(p189, v_u_18(p190, {
				["textStyles"] = {
					["italic"] = true,
					["transparency"] = 0.5
				}
			}))
		}
		v195.InlineLayoutWrapper = v196(v197, v198, v199)
		return v191(v192, v193, v195)
	end,
	["IMAGE"] = function(p200, p201) -- name: renderImage
		-- upvalues: (copy) v_u_16
		local v202 = p200.attributes and p200.attributes.url or (p200.url or nil)
		return v_u_16.new({
			["LayoutOrder"] = p200.index,
			["Image"] = v202,
			["Size"] = p201.imageStyles.size,
			["backgroundStyle"] = {
				["Transparency"] = p201.imageStyles.backgroundTransparency,
				["Color3"] = p201.imageStyles.backgroundColor3
			},
			["imageStyle"] = {
				["Transparency"] = p201.imageStyles.transparency
			},
			["ScaleType"] = p201.imageStyles.scaleType,
			["ResampleMode"] = p201.imageStyles.resampleMode,
			["tag"] = p201.imageStyles.tags
		})
	end,
	["TAG"] = v24,
	["BREAK"] = v84,
	["LINE_BREAK"] = v84
}
if v_u_32.FFlagMarkdownTables then
	v_u_41.defaultRenderers.TABLE = v22.renderTable
	v_u_41.defaultRenderers.TABLE_ROW = v22.renderTableRow
	v_u_41.defaultRenderers.TABLE_HEADER = v22.renderTableRow
	v_u_41.defaultRenderers.TABLE_CELL = v22.renderTableCell
end
if v_u_32.FFlagMarkdownTagFallbacks then
	v_u_41.defaultRenderers.ACTION = v83
end
function v_u_41.render(p203, p204) -- name: render
	-- upvalues: (copy) v_u_41, (copy) v_u_32, (copy) v_u_28, (copy) v_u_5, (copy) v_u_33, (copy) v_u_38, (copy) v_u_35, (copy) v_u_37, (copy) v_u_36, (copy) v_u_40, (copy) v_u_59, (copy) v_u_34, (copy) v_u_48
	v_u_41.renderers = p204.userRenderers
	local v205 = table.clone(p204.markdownRendererProps or {})
	local v206
	if v_u_32.FFlagMarkdownAssistantParity then
		v205.textStyles = v_u_28(v205.textStyles)
		v205.codeStyles = v_u_28(v205.codeStyles)
		if v205.headerStyles then
			v205.headerStyles = v_u_5.map(v205.headerStyles, v_u_28)
		end
		local v207 = p204.tokens.Typography.BodyMedium
		local v208
		if v_u_33.FoundationFontFaceMigration then
			v208 = v_u_28({
				["font"] = v207.Font
			}).fontFace
		else
			v208 = Font.fromEnum(v207.Font)
		end
		local v209 = v207.FontSize
		v206 = {
			["textStyles"] = {
				["textSize"] = v209,
				["fontFace"] = v208
			},
			["codeStyles"] = {
				["textSize"] = nil,
				["fontFace"] = nil,
				["lineHeight"] = 1.111,
				["textSize"] = v209,
				["fontFace"] = v_u_38
			},
			["headerStyles"] = {
				{
					["textSize"] = v209 * 3,
					["fontFace"] = v208
				},
				{
					["textSize"] = v209 * 2.5,
					["fontFace"] = v208
				},
				{
					["textSize"] = v209 * 2,
					["fontFace"] = v208
				},
				{
					["textSize"] = v209 * 1.5,
					["fontFace"] = v208
				},
				{
					["textSize"] = v209 * 1.5,
					["fontFace"] = v208
				},
				{
					["textSize"] = v209 * 1.5,
					["fontFace"] = v208
				}
			}
		}
	else
		v206 = {
			["textStyles"] = {
				["textSize"] = 18,
				["font"] = nil,
				["font"] = v_u_35
			},
			["codeStyles"] = {
				["textSize"] = 18,
				["font"] = nil,
				["lineHeight"] = 1.111,
				["font"] = v_u_37
			},
			["headerStyles"] = {
				{
					["textSize"] = 54,
					["font"] = nil,
					["font"] = v_u_35
				},
				{
					["textSize"] = 45,
					["font"] = nil,
					["font"] = v_u_35
				},
				{
					["textSize"] = 36,
					["font"] = nil,
					["font"] = v_u_35
				},
				{
					["textSize"] = 27,
					["font"] = nil,
					["font"] = v_u_35
				}
			}
		}
	end
	local v210 = v_u_5.joinDeep({
		["textStyles"] = nil,
		["codeStyles"] = nil,
		["headerStyles"] = nil,
		["imageStyles"] = nil,
		["linkStyles"] = nil,
		["isInline"] = false,
		["linkCallback"] = nil,
		["colorScheme"] = nil,
		["processChildren"] = nil,
		["textStyles"] = v206.textStyles,
		["codeStyles"] = v206.codeStyles,
		["headerStyles"] = v206.headerStyles,
		["imageStyles"] = {
			["size"] = v_u_36
		},
		["linkStyles"] = {
			["linkColor"] = ("#%*"):format((p204.tokens.Color.Content.Link.Color3:ToHex()))
		},
		["linkCallback"] = p204.linkCallback or v_u_40,
		["colorScheme"] = p204.colorScheme,
		["processChildren"] = v_u_59
	}, v205)
	if v_u_34 then
		v210.renderers = p204.userRenderers
	end
	table.freeze(v210)
	return v_u_48(p203, v210)
end
return v_u_41