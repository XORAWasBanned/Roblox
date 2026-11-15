-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.VoiceDebug.MainViewConnectivityPanel
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = script.Parent.Parent.Parent.Components
local v_u_4 = require(v3.CellLabel)
local v_u_5 = require(v3.BannerButton)
local v_u_6 = require(script.Parent.Parent.Parent.Constants)
local v_u_7 = require(script.Parent.IceCandidateParser)
local v_u_8 = require(script.Parent.CollapsibleSection)
require(script.Parent.VoiceDebugData)
local v_u_9 = require(script.Parent.GetFFlagVoiceDebugConsoleV2)
local v_u_10 = v_u_6.GeneralFormatting.MainRowPadding
local v_u_11 = UDim.new(0.55, 0)
local v_u_12 = UDim.new(0.25, 0)
local v_u_13 = UDim.new(0.2, 0)
local v_u_14 = UDim.new(0.4, 0)
local v_u_15 = UDim.new(0.3, 0)
local v_u_16 = v_u_6.Color.HoverGreen
local v_u_17 = v_u_6.Color.WarningYellow
local v_u_18 = v_u_6.Color.ErrorRed
local v_u_19 = v_u_6.Color.UnselectedGray
local v_u_20 = {
	["complete"] = true,
	["completed"] = true,
	["connected"] = true,
	["stable"] = true
}
local v_u_21 = {
	["checking"] = true,
	["connecting"] = true,
	["new"] = true
}
local v_u_22 = {
	["failed"] = true,
	["disconnected"] = true,
	["closed"] = true
}
local v_u_23 = {
	["host"] = {
		["background"] = Color3.fromRGB(13, 39, 64),
		["text"] = Color3.fromRGB(95, 184, 255)
	},
	["srflx"] = {
		["background"] = Color3.fromRGB(42, 26, 48),
		["text"] = Color3.fromRGB(176, 122, 240)
	},
	["relay"] = {
		["background"] = Color3.fromRGB(42, 32, 16),
		["text"] = Color3.fromRGB(224, 176, 64)
	},
	["prflx"] = {
		["background"] = Color3.fromRGB(16, 42, 32),
		["text"] = Color3.fromRGB(96, 200, 160)
	}
}
local v_u_24 = {
	["background"] = Color3.fromRGB(28, 28, 28),
	["text"] = Color3.fromRGB(107, 111, 117)
}
local v_u_25 = UDim.new(0.17, 0)
local v_u_26 = UDim.new(0.14, 0)
local v_u_27 = UDim.new(0.25, 0)
local v_u_28 = UDim.new(0.14, 0)
local v_u_29 = UDim.new(0.17, 0)
local v_u_30 = UDim.new(0.13, 0)
local function v_u_36(p31) -- name: GroupHeader
	-- upvalues: (copy) v_u_2, (copy) v_u_4
	local v32 = p31.title
	local v33 = string.gsub(v32, "[<>&\"\']", {
		["<"] = "&lt;",
		[">"] = "&gt;",
		["&"] = "&amp;",
		["\""] = "&quot;",
		["\'"] = "&apos;"
	})
	local v34 = p31.subtitle
	local v35 = string.format("<b>%s</b>", v33)
	if v34 then
		v35 = v35 .. string.format("  <font color=\"#%s\">%s</font>", "B8B8B8", (string.gsub(v34, "[<>&\"\']", {
			["<"] = "&lt;",
			[">"] = "&gt;",
			["&"] = "&amp;",
			["\""] = "&quot;",
			["\'"] = "&apos;"
		})))
	end
	return v_u_2.createElement(v_u_4, {
		["text"] = nil,
		["richText"] = true,
		["layoutOrder"] = nil,
		["size"] = nil,
		["pos"] = nil,
		["text"] = v35,
		["layoutOrder"] = p31.layoutOrder,
		["size"] = UDim2.new(1, 0, 0, 20),
		["pos"] = UDim2.new()
	})
end
local function v_u_38(p37) -- name: HeaderCell
	-- upvalues: (copy) v_u_2, (copy) v_u_6
	return v_u_2.createElement("TextLabel", {
		["Text"] = nil,
		["Size"] = nil,
		["Position"] = nil,
		["Font"] = nil,
		["TextSize"] = nil,
		["TextColor3"] = nil,
		["TextXAlignment"] = nil,
		["BackgroundTransparency"] = 1,
		["Text"] = string.upper(p37.text),
		["Size"] = p37.size,
		["Position"] = p37.pos,
		["Font"] = v_u_6.Font.MainWindowHeader,
		["TextSize"] = v_u_6.DefaultFontSize.MainWindowHeader,
		["TextColor3"] = v_u_6.Color.BorderGray,
		["TextXAlignment"] = Enum.TextXAlignment.Left
	})
end
local function v_u_50(p39) -- name: LegCell
	-- upvalues: (copy) v_u_2, (copy) v_u_4
	local v40 = p39.color
	local v41 = p39.text
	local v42 = p39.size
	local v43 = p39.pos
	local v44 = v40 and 12 or 0
	local v45 = v_u_2.createElement
	local v46 = "Frame"
	local v47 = {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = v42,
		["Position"] = v43
	}
	local v48 = {}
	local v49
	if v40 then
		v49 = v_u_2.createElement("Frame", {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["AnchorPoint"] = Vector2.new(0, 0.5),
			["Position"] = UDim2.new(0, 0, 0.5, 0),
			["Size"] = UDim2.new(0, 7, 0, 7),
			["BackgroundColor3"] = v40
		}, {
			["Corner"] = v_u_2.createElement("UICorner", {
				["CornerRadius"] = UDim.new(1, 0)
			})
		}) or nil
	else
		v49 = nil
	end
	v48.Dot = v49
	v48.Value = v_u_2.createElement(v_u_4, {
		["text"] = v41,
		["size"] = UDim2.new(1, -v44, 1, 0),
		["pos"] = UDim2.new(0, v44, 0, 0)
	})
	return v45(v46, v47, v48)
end
local function v_u_54(p51, p52, p53) -- name: formatSelectedCandidatePair
	if p51 == nil or (p51 == "" or (p52 == nil or p52 == "")) then
		return nil
	elseif p53 and p53 ~= "" then
		return string.format("%s \226\134\148 %s (%s)", p51, p52, p53)
	else
		return string.format("%s \226\134\148 %s", p51, p52)
	end
end
local function v_u_100(p55) -- name: TransportStateTable
	-- upvalues: (copy) v_u_9, (copy) v_u_20, (copy) v_u_16, (copy) v_u_21, (copy) v_u_17, (copy) v_u_22, (copy) v_u_18, (copy) v_u_19, (copy) v_u_2, (copy) v_u_6, (copy) v_u_4, (copy) v_u_14, (copy) v_u_50, (copy) v_u_15, (copy) v_u_54, (copy) v_u_36, (copy) v_u_38
	local v56 = p55.connectivity or {}
	local v57 = p55.layoutOrder
	local v58 = v_u_9()
	local v59 = {
		{
			["label"] = "ICE gathering",
			["publish"] = nil,
			["subscribe"] = nil,
			["publish"] = v56.iceGatheringStatePublish,
			["subscribe"] = v56.iceGatheringStateSubscribe
		},
		{
			["label"] = "ICE connection",
			["publish"] = nil,
			["subscribe"] = nil,
			["publish"] = v56.iceConnectionStatePublish,
			["subscribe"] = v56.iceConnectionStateSubscribe
		},
		{
			["label"] = "Signaling",
			["publish"] = nil,
			["subscribe"] = nil,
			["publish"] = v56.signalingStatePublish,
			["subscribe"] = v56.signalingStateSubscribe
		}
	}
	local v60 = {}
	for v61, v62 in v59 do
		local v63, v64, v65, v66
		if v58 then
			local v67 = v62.publish
			local v68
			if v67 == nil then
				v68 = v_u_19
				v63 = v68 or nil
				if v58 then
					v64 = v62.subscribe
					if v64 == nil then
						v65 = v_u_19
						v66 = v65 or nil
					elseif v_u_20[v64] then
						v65 = v_u_16
						v66 = v65 or nil
					elseif v_u_21[v64] then
						v65 = v_u_17
						v66 = v65 or nil
					elseif v_u_22[v64] then
						v65 = v_u_18
						v66 = v65 or nil
					else
						v65 = v_u_19
						v66 = v65 or nil
					end
				else
					v66 = nil
				end
			elseif v_u_20[v67] then
				v68 = v_u_16
				v63 = v68 or nil
				if v58 then
					v64 = v62.subscribe
					if v64 == nil then
						v65 = v_u_19
						v66 = v65 or nil
					elseif v_u_20[v64] then
						v65 = v_u_16
						v66 = v65 or nil
					elseif v_u_21[v64] then
						v65 = v_u_17
						v66 = v65 or nil
					elseif v_u_22[v64] then
						v65 = v_u_18
						v66 = v65 or nil
					else
						v65 = v_u_19
						v66 = v65 or nil
					end
				else
					v66 = nil
				end
			elseif v_u_21[v67] then
				v68 = v_u_17
				v63 = v68 or nil
				if v58 then
					v64 = v62.subscribe
					if v64 == nil then
						v65 = v_u_19
						v66 = v65 or nil
					elseif v_u_20[v64] then
						v65 = v_u_16
						v66 = v65 or nil
					elseif v_u_21[v64] then
						v65 = v_u_17
						v66 = v65 or nil
					elseif v_u_22[v64] then
						v65 = v_u_18
						v66 = v65 or nil
					else
						v65 = v_u_19
						v66 = v65 or nil
					end
				else
					v66 = nil
				end
			elseif v_u_22[v67] then
				v68 = v_u_18
				v63 = v68 or nil
				if v58 then
					v64 = v62.subscribe
					if v64 == nil then
						v65 = v_u_19
						v66 = v65 or nil
					elseif v_u_20[v64] then
						v65 = v_u_16
						v66 = v65 or nil
					elseif v_u_21[v64] then
						v65 = v_u_17
						v66 = v65 or nil
					elseif v_u_22[v64] then
						v65 = v_u_18
						v66 = v65 or nil
					else
						v65 = v_u_19
						v66 = v65 or nil
					end
				else
					v66 = nil
				end
			else
				v68 = v_u_19
				v63 = v68 or nil
				if v58 then
					v64 = v62.subscribe
					if v64 == nil then
						v65 = v_u_19
						v66 = v65 or nil
					elseif v_u_20[v64] then
						v65 = v_u_16
						v66 = v65 or nil
					elseif v_u_21[v64] then
						v65 = v_u_17
						v66 = v65 or nil
					elseif v_u_22[v64] then
						v65 = v_u_18
						v66 = v65 or nil
					else
						v65 = v_u_19
						v66 = v65 or nil
					end
				else
					v66 = nil
				end
			end
		else
			v63 = nil
			if v58 then
				v64 = v62.subscribe
				if v64 == nil then
					v65 = v_u_19
					v66 = v65 or nil
				elseif v_u_20[v64] then
					v65 = v_u_16
					v66 = v65 or nil
				elseif v_u_21[v64] then
					v65 = v_u_17
					v66 = v65 or nil
				elseif v_u_22[v64] then
					v65 = v_u_18
					v66 = v65 or nil
				else
					v65 = v_u_19
					v66 = v65 or nil
				end
			else
				v66 = nil
			end
		end
		local v69
		if v58 then
			v69 = v63 == v_u_17 and true or v63 == v_u_18 or (v66 == v_u_17 and true or v66 == v_u_18)
		else
			v69 = v58
		end
		local v70 = "row" .. v61
		local v71 = v_u_2.createElement
		local v72 = "Frame"
		local v73 = {
			["Size"] = nil,
			["LayoutOrder"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 0, 20),
			["LayoutOrder"] = v61
		}
		local v74 = {}
		local v75
		if v58 then
			v75 = v_u_2.createElement("Frame", {
				["Position"] = nil,
				["Size"] = nil,
				["BackgroundColor3"] = nil,
				["BackgroundTransparency"] = nil,
				["BorderSizePixel"] = 0,
				["Position"] = UDim2.new(0, 0, 0, 0),
				["Size"] = UDim2.new(0, 2, 1, 0),
				["BackgroundColor3"] = v_u_6.Color.WarningYellow,
				["BackgroundTransparency"] = v69 and 0 or 1
			}) or nil
		else
			v75 = nil
		end
		v74.Accent = v75
		v74.Label = v_u_2.createElement(v_u_4, {
			["text"] = v62.label,
			["size"] = UDim2.new(v_u_14, UDim.new(1, 0)),
			["pos"] = UDim2.new(0, 0, 0, 0),
			["textTruncate"] = Enum.TextTruncate.AtEnd
		})
		local v76 = v_u_2.createElement
		local v77 = v_u_50
		local v78 = {}
		local v79 = v62.publish
		v78.text = (v79 == nil or v79 == "") and "\226\128\148" or v79
		v78.color = v63
		v78.size = UDim2.new(v_u_15, UDim.new(1, 0))
		v78.pos = UDim2.new(v_u_14, UDim.new(0, 0))
		v74.Publish = v76(v77, v78)
		local v80 = v_u_2.createElement
		local v81 = v_u_50
		local v82 = {}
		local v83 = v62.subscribe
		v82.text = (v83 == nil or v83 == "") and "\226\128\148" or v83
		v82.color = v66
		v82.size = UDim2.new(v_u_15, UDim.new(1, 0))
		v82.pos = UDim2.new(v_u_14 + v_u_15, UDim.new(0, 0))
		v74.Subscribe = v80(v81, v82)
		v60[v70] = v71(v72, v73, v74)
	end
	local v84
	if v56.rebootCount then
		local v85 = v56.rebootCount
		v84 = tostring(v85) or nil
	else
		v84 = nil
	end
	v60.restartRow = v_u_2.createElement("Frame", {
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 0, 20),
		["LayoutOrder"] = #v59 + 1
	}, {
		["Label"] = v_u_2.createElement(v_u_4, {
			["text"] = "ICE restarts (this session)",
			["size"] = nil,
			["pos"] = nil,
			["textTruncate"] = nil,
			["size"] = UDim2.new(v_u_14, UDim.new(1, 0)),
			["pos"] = UDim2.new(0, 0, 0, 0),
			["textTruncate"] = Enum.TextTruncate.AtEnd
		}),
		["Publish"] = v_u_2.createElement(v_u_50, {
			["text"] = (v84 == nil or v84 == "") and "\226\128\148" or v84,
			["size"] = UDim2.new(v_u_15, UDim.new(1, 0)),
			["pos"] = UDim2.new(v_u_14, UDim.new(0, 0))
		}),
		["Subscribe"] = v_u_2.createElement(v_u_50, {
			["text"] = (v84 == nil or v84 == "") and "\226\128\148" or v84,
			["size"] = UDim2.new(v_u_15, UDim.new(1, 0)),
			["pos"] = UDim2.new(v_u_14 + v_u_15, UDim.new(0, 0))
		})
	})
	local v86
	if v56.timeToConnectedMs and v56.timeToConnectedMs > 0 then
		v86 = string.format("%.0f ms", v56.timeToConnectedMs)
	else
		v86 = nil
	end
	v60.timeToConnectedRow = v_u_2.createElement("Frame", {
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 0, 20),
		["LayoutOrder"] = #v59 + 2
	}, {
		["Label"] = v_u_2.createElement(v_u_4, {
			["text"] = "Time to connected",
			["size"] = nil,
			["pos"] = nil,
			["textTruncate"] = nil,
			["size"] = UDim2.new(v_u_14, UDim.new(1, 0)),
			["pos"] = UDim2.new(0, 0, 0, 0),
			["textTruncate"] = Enum.TextTruncate.AtEnd
		}),
		["Publish"] = v_u_2.createElement(v_u_50, {
			["text"] = (v86 == nil or v86 == "") and "\226\128\148" or v86,
			["size"] = UDim2.new(v_u_15, UDim.new(1, 0)),
			["pos"] = UDim2.new(v_u_14, UDim.new(0, 0))
		}),
		["Subscribe"] = v_u_2.createElement(v_u_50, {
			["text"] = (v86 == nil or v86 == "") and "\226\128\148" or v86,
			["size"] = UDim2.new(v_u_15, UDim.new(1, 0)),
			["pos"] = UDim2.new(v_u_14 + v_u_15, UDim.new(0, 0))
		})
	})
	local v87 = v_u_54(v56.selectedCandidatePairLocalTypePublish, v56.selectedCandidatePairRemoteTypePublish, v56.selectedCandidatePairLocalProtocolPublish)
	local v88 = v_u_54(v56.selectedCandidatePairLocalTypeSubscribe, v56.selectedCandidatePairRemoteTypeSubscribe, v56.selectedCandidatePairLocalProtocolSubscribe)
	local v89 = v_u_2.createElement
	local v90 = {
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 0, 20),
		["LayoutOrder"] = #v59 + 3
	}
	local v91 = {
		["Label"] = v_u_2.createElement(v_u_4, {
			["text"] = "Selected candidate pair",
			["size"] = nil,
			["pos"] = nil,
			["textTruncate"] = nil,
			["size"] = UDim2.new(v_u_14, UDim.new(1, 0)),
			["pos"] = UDim2.new(0, 0, 0, 0),
			["textTruncate"] = Enum.TextTruncate.AtEnd
		}),
		["Publish"] = v_u_2.createElement(v_u_50, {
			["text"] = (v87 == nil or v87 == "") and "\226\128\148" or v87,
			["size"] = UDim2.new(v_u_15, UDim.new(1, 0)),
			["pos"] = UDim2.new(v_u_14, UDim.new(0, 0))
		}),
		["Subscribe"] = v_u_2.createElement(v_u_50, {
			["text"] = (v88 == nil or v88 == "") and "\226\128\148" or v88,
			["size"] = UDim2.new(v_u_15, UDim.new(1, 0)),
			["pos"] = UDim2.new(v_u_14 + v_u_15, UDim.new(0, 0))
		})
	}
	v60.selectedCandidatePairRow = v89("Frame", v90, v91)
	local v92 = v_u_2.createElement
	local v93 = "Frame"
	local v94 = {
		["Size"] = nil,
		["AutomaticSize"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = UDim2.new(1, 0, 0, 0),
		["AutomaticSize"] = Enum.AutomaticSize.Y,
		["LayoutOrder"] = v57
	}
	local v95 = {
		["UIListLayout"] = v_u_2.createElement("UIListLayout", {
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["Title"] = v58 and v_u_2.createElement(v_u_36, {
			["title"] = "Transport state",
			["subtitle"] = "publish / subscribe compared",
			["layoutOrder"] = 1
		}) or v_u_2.createElement(v_u_4, {
			["text"] = "Transport state",
			["bold"] = true,
			["layoutOrder"] = 1,
			["size"] = nil,
			["pos"] = nil,
			["size"] = UDim2.new(1, 0, 0, 20),
			["pos"] = UDim2.new()
		})
	}
	local v96 = v_u_2.createElement
	local v97 = "Frame"
	local v98 = {
		["Size"] = nil,
		["LayoutOrder"] = 2,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 0, 20)
	}
	local v99
	if v58 then
		v99 = {
			["Label"] = v_u_2.createElement(v_u_4, {
				["text"] = "",
				["size"] = nil,
				["pos"] = nil,
				["size"] = UDim2.new(v_u_14, UDim.new(1, 0)),
				["pos"] = UDim2.new(0, 0, 0, 0)
			}),
			["Publish"] = v_u_2.createElement(v_u_38, {
				["text"] = "Publish",
				["size"] = nil,
				["pos"] = nil,
				["size"] = UDim2.new(v_u_15, UDim.new(1, 0)),
				["pos"] = UDim2.new(v_u_14, UDim.new(0, 0))
			}),
			["Subscribe"] = v_u_2.createElement(v_u_38, {
				["text"] = "Subscribe",
				["size"] = nil,
				["pos"] = nil,
				["size"] = UDim2.new(v_u_15, UDim.new(1, 0)),
				["pos"] = UDim2.new(v_u_14 + v_u_15, UDim.new(0, 0))
			})
		}
	else
		v99 = {
			["Label"] = v_u_2.createElement(v_u_4, {
				["text"] = "",
				["size"] = nil,
				["pos"] = nil,
				["size"] = UDim2.new(v_u_14, UDim.new(1, 0)),
				["pos"] = UDim2.new(0, 0, 0, 0)
			}),
			["Publish"] = v_u_2.createElement(v_u_4, {
				["text"] = "PUBLISH",
				["bold"] = true,
				["size"] = nil,
				["pos"] = nil,
				["size"] = UDim2.new(v_u_15, UDim.new(1, 0)),
				["pos"] = UDim2.new(v_u_14, UDim.new(0, 0))
			}),
			["Subscribe"] = v_u_2.createElement(v_u_4, {
				["text"] = "SUBSCRIBE",
				["bold"] = true,
				["size"] = nil,
				["pos"] = nil,
				["size"] = UDim2.new(v_u_15, UDim.new(1, 0)),
				["pos"] = UDim2.new(v_u_14 + v_u_15, UDim.new(0, 0))
			})
		}
	end
	v95.Header = v96(v97, v98, v99)
	v95.Rows = v_u_2.createElement("Frame", {
		["Size"] = nil,
		["AutomaticSize"] = nil,
		["LayoutOrder"] = 3,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 0, 0),
		["AutomaticSize"] = Enum.AutomaticSize.Y
	}, {
		["UIListLayout"] = v_u_2.createElement("UIListLayout", {
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["Rows"] = v_u_2.createFragment(v60)
	})
	return v92(v93, v94, v95)
end
local function v_u_107(p101) -- name: TypePill
	-- upvalues: (copy) v_u_23, (copy) v_u_24, (copy) v_u_2, (copy) v_u_6
	local v102 = p101.candidateType
	local v103 = v102 and v_u_23[v102] or v_u_24
	local v104 = v_u_2.createElement
	local v105 = {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = p101.size,
		["Position"] = p101.pos
	}
	local v106 = {
		["Pill"] = v_u_2.createElement("Frame", {
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["Size"] = nil,
			["AutomaticSize"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["AnchorPoint"] = Vector2.new(0, 0.5),
			["Position"] = UDim2.new(0, 0, 0.5, 0),
			["Size"] = UDim2.new(0, 0, 0, 16),
			["AutomaticSize"] = Enum.AutomaticSize.X,
			["BackgroundColor3"] = v103.background
		}, {
			["Corner"] = v_u_2.createElement("UICorner", {
				["CornerRadius"] = UDim.new(0, 8)
			}),
			["Padding"] = v_u_2.createElement("UIPadding", {
				["PaddingLeft"] = UDim.new(0, 7),
				["PaddingRight"] = UDim.new(0, 7)
			}),
			["Label"] = v_u_2.createElement("TextLabel", {
				["Text"] = nil,
				["Size"] = nil,
				["AutomaticSize"] = nil,
				["Font"] = nil,
				["TextSize"] = nil,
				["TextColor3"] = nil,
				["TextXAlignment"] = nil,
				["BackgroundTransparency"] = 1,
				["Text"] = (v102 == nil or v102 == "") and "\226\128\148" or v102,
				["Size"] = UDim2.new(0, 0, 1, 0),
				["AutomaticSize"] = Enum.AutomaticSize.X,
				["Font"] = v_u_6.Font.MainWindow,
				["TextSize"] = v_u_6.DefaultFontSize.MainWindow - 2,
				["TextColor3"] = v103.text,
				["TextXAlignment"] = Enum.TextXAlignment.Center
			})
		})
	}
	return v104("Frame", v105, v106)
end
local v_u_108 = {}
local function v_u_152(p109) -- name: CandidateTable
	-- upvalues: (copy) v_u_9, (copy) v_u_7, (copy) v_u_108, (copy) v_u_2, (copy) v_u_107, (copy) v_u_25, (copy) v_u_4, (copy) v_u_26, (copy) v_u_27, (copy) v_u_28, (copy) v_u_29, (copy) v_u_30, (copy) v_u_11, (copy) v_u_12, (copy) v_u_13, (copy) v_u_38, (copy) v_u_36
	local v110 = p109.title
	local v111 = p109.candidates or {}
	local v112 = p109.layoutOrder
	local v113 = v_u_9()
	local v114 = {}
	for v115, v116 in v111 do
		if v113 then
			local v117 = v116.candidate
			local v118
			if v117 then
				v118 = v_u_108[v117]
				if v118 == nil then
					v118 = v_u_7(v117)
					v_u_108[v117] = v118
				end
			else
				v118 = v_u_7(v117)
			end
			local v119 = "candidate" .. v115
			local v120 = v_u_2.createElement
			local v121 = {
				["Size"] = nil,
				["LayoutOrder"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.new(1, 0, 0, 20),
				["LayoutOrder"] = v115
			}
			local v122 = {
				["Type"] = v_u_2.createElement(v_u_107, {
					["candidateType"] = v118.candidateType,
					["size"] = UDim2.new(v_u_25, UDim.new(1, 0)),
					["pos"] = UDim2.new(0, 0, 0, 0)
				})
			}
			local v123 = v_u_2.createElement
			local v124 = v_u_4
			local v125 = {}
			local v126 = v118.protocol
			v125.text = (v126 == nil or v126 == "") and "\226\128\148" or v126
			v125.size = UDim2.new(v_u_26, UDim.new(1, 0))
			v125.pos = UDim2.new(v_u_25, UDim.new(0, 0))
			v122.Proto = v123(v124, v125)
			local v127 = v_u_2.createElement
			local v128 = v_u_4
			local v129 = {}
			local v130 = v118.priority
			v129.text = (v130 == nil or v130 == "") and "\226\128\148" or v130
			v129.size = UDim2.new(v_u_27, UDim.new(1, 0))
			v129.pos = UDim2.new(v_u_25 + v_u_26, UDim.new(0, 0))
			v122.Priority = v127(v128, v129)
			local v131 = v_u_2.createElement
			local v132 = v_u_4
			local v133 = {}
			local v134 = v118.component
			v133.text = (v134 == nil or v134 == "") and "\226\128\148" or v134
			v133.size = UDim2.new(v_u_28, UDim.new(1, 0))
			v133.pos = UDim2.new(v_u_25 + v_u_26 + v_u_27, UDim.new(0, 0))
			v122.Comp = v131(v132, v133)
			local v135 = v_u_2.createElement
			local v136 = v_u_4
			local v137 = {}
			local v138 = v116.sdpMid
			v137.text = (v138 == nil or v138 == "") and "\226\128\148" or v138
			v137.size = UDim2.new(v_u_29, UDim.new(1, 0))
			v137.pos = UDim2.new(v_u_25 + v_u_26 + v_u_27 + v_u_28, UDim.new(0, 0))
			v137.textTruncate = Enum.TextTruncate.AtEnd
			v122.Mid = v135(v136, v137)
			local v139 = v_u_2.createElement
			local v140 = v_u_4
			local v141 = {}
			local v142 = v116.sdpMLineIndex
			v141.text = v142 == nil and "\226\128\148" or tostring(v142)
			v141.size = UDim2.new(v_u_30, UDim.new(1, 0))
			v141.pos = UDim2.new(v_u_25 + v_u_26 + v_u_27 + v_u_28 + v_u_29, UDim.new(0, 0))
			v122.Idx = v139(v140, v141)
			v114[v119] = v120("Frame", v121, v122)
		else
			local v143 = "candidate" .. v115
			local v144 = v_u_2.createElement
			local v145 = {
				["Size"] = nil,
				["LayoutOrder"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.new(1, 0, 0, 20),
				["LayoutOrder"] = v115
			}
			local v146 = {
				["Candidate"] = v_u_2.createElement(v_u_4, {
					["text"] = v116.candidate,
					["size"] = UDim2.new(v_u_11, UDim.new(1, 0)),
					["pos"] = UDim2.new(0, 0, 0, 0),
					["textTruncate"] = Enum.TextTruncate.AtEnd
				}),
				["SdpMid"] = v_u_2.createElement(v_u_4, {
					["text"] = v116.sdpMid,
					["size"] = UDim2.new(v_u_12, UDim.new(1, 0)),
					["pos"] = UDim2.new(v_u_11, UDim.new(0, 0)),
					["textTruncate"] = Enum.TextTruncate.AtEnd
				})
			}
			local v147 = v_u_2.createElement
			local v148 = v_u_4
			local v149 = {}
			local v150 = v116.sdpMLineIndex
			v149.text = v150 == nil and "\226\128\148" or tostring(v150)
			v149.size = UDim2.new(v_u_13, UDim.new(1, 0))
			v149.pos = UDim2.new(v_u_11 + v_u_12, UDim.new(0, 0))
			v146.SdpMLineIndex = v147(v148, v149)
			v114[v143] = v144("Frame", v145, v146)
		end
	end
	if next(v114) == nil then
		v114.placeholder = v_u_2.createElement(v_u_4, {
			["text"] = "\226\128\148",
			["layoutOrder"] = 1,
			["size"] = nil,
			["pos"] = nil,
			["size"] = UDim2.new(1, 0, 0, 20),
			["pos"] = UDim2.new()
		})
	end
	local v151
	if v113 then
		v151 = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["LayoutOrder"] = 2,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 0, 20)
		}, {
			["Type"] = v_u_2.createElement(v_u_38, {
				["text"] = "Type",
				["size"] = nil,
				["pos"] = nil,
				["size"] = UDim2.new(v_u_25, UDim.new(1, 0)),
				["pos"] = UDim2.new(0, 0, 0, 0)
			}),
			["Proto"] = v_u_2.createElement(v_u_38, {
				["text"] = "Proto",
				["size"] = nil,
				["pos"] = nil,
				["size"] = UDim2.new(v_u_26, UDim.new(1, 0)),
				["pos"] = UDim2.new(v_u_25, UDim.new(0, 0))
			}),
			["Priority"] = v_u_2.createElement(v_u_38, {
				["text"] = "Priority",
				["size"] = nil,
				["pos"] = nil,
				["size"] = UDim2.new(v_u_27, UDim.new(1, 0)),
				["pos"] = UDim2.new(v_u_25 + v_u_26, UDim.new(0, 0))
			}),
			["Comp"] = v_u_2.createElement(v_u_38, {
				["text"] = "Comp",
				["size"] = nil,
				["pos"] = nil,
				["size"] = UDim2.new(v_u_28, UDim.new(1, 0)),
				["pos"] = UDim2.new(v_u_25 + v_u_26 + v_u_27, UDim.new(0, 0))
			}),
			["Mid"] = v_u_2.createElement(v_u_38, {
				["text"] = "Mid",
				["size"] = nil,
				["pos"] = nil,
				["size"] = UDim2.new(v_u_29, UDim.new(1, 0)),
				["pos"] = UDim2.new(v_u_25 + v_u_26 + v_u_27 + v_u_28, UDim.new(0, 0))
			}),
			["Idx"] = v_u_2.createElement(v_u_38, {
				["text"] = "Idx",
				["size"] = nil,
				["pos"] = nil,
				["size"] = UDim2.new(v_u_30, UDim.new(1, 0)),
				["pos"] = UDim2.new(v_u_25 + v_u_26 + v_u_27 + v_u_28 + v_u_29, UDim.new(0, 0))
			})
		})
	else
		v151 = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["LayoutOrder"] = 2,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 0, 20)
		}, {
			["Candidate"] = v_u_2.createElement(v_u_4, {
				["text"] = "CANDIDATE",
				["bold"] = true,
				["size"] = nil,
				["pos"] = nil,
				["size"] = UDim2.new(v_u_11, UDim.new(1, 0)),
				["pos"] = UDim2.new(0, 0, 0, 0)
			}),
			["SdpMid"] = v_u_2.createElement(v_u_4, {
				["text"] = "SDP MID",
				["bold"] = true,
				["size"] = nil,
				["pos"] = nil,
				["size"] = UDim2.new(v_u_12, UDim.new(1, 0)),
				["pos"] = UDim2.new(v_u_11, UDim.new(0, 0))
			}),
			["SdpMLineIndex"] = v_u_2.createElement(v_u_4, {
				["text"] = "SDP MLINE INDEX",
				["bold"] = true,
				["size"] = nil,
				["pos"] = nil,
				["size"] = UDim2.new(v_u_13, UDim.new(1, 0)),
				["pos"] = UDim2.new(v_u_11 + v_u_12, UDim.new(0, 0))
			})
		})
	end
	return v_u_2.createElement("Frame", {
		["Size"] = nil,
		["AutomaticSize"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = UDim2.new(1, 0, 0, 0),
		["AutomaticSize"] = Enum.AutomaticSize.Y,
		["LayoutOrder"] = v112
	}, {
		["UIListLayout"] = v_u_2.createElement("UIListLayout", {
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["Title"] = v113 and v_u_2.createElement(v_u_36, {
			["title"] = nil,
			["subtitle"] = nil,
			["layoutOrder"] = 1,
			["title"] = v110,
			["subtitle"] = string.format("%d local", #v111)
		}) or v_u_2.createElement(v_u_4, {
			["text"] = nil,
			["bold"] = true,
			["layoutOrder"] = 1,
			["size"] = nil,
			["pos"] = nil,
			["text"] = v110,
			["size"] = UDim2.new(1, 0, 0, 20),
			["pos"] = UDim2.new()
		}),
		["Header"] = v151,
		["Rows"] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["AutomaticSize"] = nil,
			["LayoutOrder"] = 3,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 0, 0),
			["AutomaticSize"] = Enum.AutomaticSize.Y
		}, {
			["UIListLayout"] = v_u_2.createElement("UIListLayout", {
				["SortOrder"] = Enum.SortOrder.LayoutOrder
			}),
			["Rows"] = v_u_2.createFragment(v114)
		})
	})
end
local v_u_153 = v_u_2.PureComponent:extend("SdpSection")
function v_u_153.init(p_u_154) -- name: init
	p_u_154.state = {
		["expanded"] = false
	}
	function p_u_154.onButtonPress()
		-- upvalues: (copy) p_u_154
		p_u_154:setState(function(p155)
			return {
				["expanded"] = not p155.expanded
			}
		end)
	end
end
function v_u_153.render(p156) -- name: render
	-- upvalues: (copy) v_u_9, (copy) v_u_2, (copy) v_u_5, (copy) v_u_4, (copy) v_u_6
	local v157 = p156.props.label
	local v158 = p156.props.sdp
	local v159 = p156.props.layoutOrder
	local v160 = v_u_9()
	local v161
	if v158 == nil then
		v161 = false
	else
		v161 = v158 ~= ""
	end
	if v160 and v161 then
		local v162
		if v158 == nil then
			v162 = nil
		else
			v162 = string.gsub(string.gsub(v158, "[<>&\"\']", {
				["<"] = "&lt;",
				[">"] = "&gt;",
				["&"] = "&amp;",
				["\""] = "&quot;",
				["\'"] = "&apos;"
			}), "redacted", string.format("<font color=\"#%s\">redacted</font>", "6B6F75"))
		end
		v158 = v162 or v158
	end
	local v163 = v_u_2.createElement
	local v164 = "Frame"
	local v165 = {
		["Size"] = nil,
		["AutomaticSize"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = UDim2.new(1, 0, 0, 0),
		["AutomaticSize"] = Enum.AutomaticSize.Y,
		["LayoutOrder"] = v159
	}
	local v166 = {
		["UIListLayout"] = v_u_2.createElement("UIListLayout", {
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
	}
	local v167 = v_u_2.createElement
	local v168 = v_u_5
	local v169 = {
		["size"] = nil,
		["isExpanded"] = nil,
		["isExpandable"] = nil,
		["hideLines"] = true,
		["onButtonPress"] = nil,
		["layoutOrder"] = 1,
		["size"] = UDim2.new(1, 0, 0, 20),
		["isExpanded"] = p156.state.expanded,
		["isExpandable"] = v161
	}
	local v170
	if v161 then
		v170 = p156.onButtonPress or nil
	else
		v170 = nil
	end
	v169.onButtonPress = v170
	v166.Button = v167(v168, v169, {
		["Label"] = v_u_2.createElement(v_u_4, {
			["text"] = v161 and v157 and v157 or string.format("%s: \226\128\148", v157),
			["size"] = UDim2.new(1, -20, 1, 0),
			["pos"] = UDim2.new(0, 20, 0, 0)
		})
	})
	local v171
	if v161 and p156.state.expanded then
		v171 = v_u_2.createElement("TextLabel", {
			["Text"] = nil,
			["RichText"] = nil,
			["TextSize"] = nil,
			["TextColor3"] = nil,
			["TextXAlignment"] = nil,
			["TextYAlignment"] = nil,
			["TextWrapped"] = true,
			["Font"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 2,
			["Size"] = nil,
			["Position"] = nil,
			["AutomaticSize"] = nil,
			["Text"] = v158,
			["RichText"] = v160,
			["TextSize"] = v160 and v_u_6.DefaultFontSize.MainWindow - 3 or v_u_6.DefaultFontSize.MainWindow,
			["TextColor3"] = v_u_6.Color.Text,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextYAlignment"] = Enum.TextYAlignment.Top,
			["Font"] = v_u_6.Font.MainWindow,
			["Size"] = UDim2.new(1, -20, 0, 0),
			["Position"] = UDim2.new(0, 20, 0, 0),
			["AutomaticSize"] = Enum.AutomaticSize.Y
		}) or nil
	else
		v171 = nil
	end
	v166.Content = v171
	return v163(v164, v165, v166)
end
return function(p172) -- name: ConnectivityPanel
	-- upvalues: (copy) v_u_9, (copy) v_u_2, (copy) v_u_100, (copy) v_u_152, (copy) v_u_36, (copy) v_u_153, (copy) v_u_8, (copy) v_u_10, (copy) v_u_4
	local v173 = p172.connectivity or {}
	local v174 = p172.layoutOrder
	local v175 = v_u_9()
	local v176 = {}
	local v177
	if v175 then
		v177 = v_u_2.createElement(v_u_100, {
			["connectivity"] = nil,
			["layoutOrder"] = 1,
			["connectivity"] = v173
		}) or nil
	else
		v177 = nil
	end
	v176.TransportState = v177
	v176.PublishCandidates = v_u_2.createElement(v_u_152, {
		["title"] = "Publish ICE candidates",
		["candidates"] = nil,
		["layoutOrder"] = 2,
		["candidates"] = v173.icePublishCandidates
	})
	v176.SubscribeCandidates = v_u_2.createElement(v_u_152, {
		["title"] = "Subscribe ICE candidates",
		["candidates"] = nil,
		["layoutOrder"] = 3,
		["candidates"] = v173.iceSubscribeCandidates
	})
	v176.SessionDescriptionsHeader = v175 and v_u_2.createElement(v_u_36, {
		["title"] = "Session descriptions",
		["subtitle"] = "addresses redacted",
		["layoutOrder"] = 4
	}) or nil
	v176.PublishOffer = v_u_2.createElement(v_u_153, {
		["label"] = "Publish offer",
		["sdp"] = nil,
		["layoutOrder"] = 5,
		["sdp"] = v173.sdpPublishOffer
	})
	v176.PublishRemoteAnswer = v_u_2.createElement(v_u_153, {
		["label"] = "Publish remote answer",
		["sdp"] = nil,
		["layoutOrder"] = 6,
		["sdp"] = v173.sdpPublishRemoteAnswer
	})
	v176.SubscribeRemoteOffer = v_u_2.createElement(v_u_153, {
		["label"] = "Subscribe remote offer",
		["sdp"] = nil,
		["layoutOrder"] = 7,
		["sdp"] = v173.sdpSubscribeRemoteOffer
	})
	v176.SubscribeAnswer = v_u_2.createElement(v_u_153, {
		["label"] = "Subscribe answer",
		["sdp"] = nil,
		["layoutOrder"] = 8,
		["sdp"] = v173.sdpSubscribeAnswer
	})
	if v175 then
		return v_u_2.createElement(v_u_8, {
			["title"] = "Connectivity",
			["layoutOrder"] = nil,
			["layoutOrder"] = v174
		}, v176)
	end
	v176.UIListLayout = v_u_2.createElement("UIListLayout", {
		["SortOrder"] = Enum.SortOrder.LayoutOrder,
		["Padding"] = UDim.new(0, v_u_10)
	})
	v176.SectionHeader = v_u_2.createElement(v_u_4, {
		["text"] = "CONNECTIVITY",
		["bold"] = true,
		["layoutOrder"] = 0,
		["size"] = nil,
		["pos"] = nil,
		["size"] = UDim2.new(1, 0, 0, 20),
		["pos"] = UDim2.new()
	})
	return v_u_2.createElement("Frame", {
		["Size"] = nil,
		["AutomaticSize"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = UDim2.new(1, 0, 0, 0),
		["AutomaticSize"] = Enum.AutomaticSize.Y,
		["LayoutOrder"] = v174
	}, v176)
end