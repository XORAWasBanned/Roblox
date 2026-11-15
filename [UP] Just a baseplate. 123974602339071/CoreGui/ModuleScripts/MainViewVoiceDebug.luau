-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.VoiceDebug.MainViewVoiceDebug
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local _ = script.Parent.Parent.Parent.Actions
local v3 = script.Parent.Parent.Parent.Components
local v4 = require(v3.DataConsumer)
local v_u_5 = require(v3.LineGraph)
local v_u_6 = require(v3.Sparkline)
local v_u_7 = require(script.Parent.MainViewConnectivityPanel)
local v_u_8 = require(script.Parent.MainViewSubscriptionsPanel)
local v_u_9 = require(script.Parent.MainViewRemoteOperationsPanel)
local v_u_10 = require(script.Parent.MainViewClientOperationQueuePanel)
local v_u_11 = require(script.Parent.CollapsibleSection)
local v_u_12 = require(script.Parent.Parent.Parent.Constants)
local v_u_13 = v_u_12.GeneralFormatting.MainRowPadding
local v_u_14 = v_u_12.GeneralFormatting.LineGraphHeight
local v_u_15 = require(v3.UtilAndTab)
local v_u_16 = require(script.Parent.Parent.Parent.Util.convertTimeStamp)
local v_u_17 = require(script.Parent.VoiceDebugFieldMeta)
local v_u_18 = require(script.Parent.VoiceDebugFieldDisplayOrder)
local v_u_19 = require(script.Parent.GetFFlagVoiceDebugConsoleV2)
local v_u_20 = require(script.Parent.FreezeToggle)
local v_u_21 = require(script.Parent.VoiceSourceToggle)
local v_u_22 = table.clone(v_u_18)
local v_u_23 = {
	["totalConcealmentEvents"] = true,
	["lastPublisherAudioLevelDbov"] = true,
	["lastSubscriberAudioLevelDbov"] = true
}
local v_u_24 = { "Connection", "Incoming", "Outgoing" }
local v_u_25 = {
	["rttMs"] = true,
	["incomingBitrateKbps"] = true,
	["outgoingBitrateKbps"] = true,
	["incomingJitterMs"] = true,
	["outgoingJitterMs"] = true,
	["jitterBufferDelayMs"] = true,
	["incomingLossPercent"] = true
}
for _, v26 in {
	"incomingBitrateKbps",
	"outgoingBitrateKbps",
	"outgoingCodec",
	"incomingLossPercent",
	"totalConcealmentEvents",
	"lastPublisherAudioLevelDbov",
	"lastSubscriberAudioLevelDbov"
} do
	table.insert(v_u_22, v26)
end
local function v_u_28(p27) -- name: getX
	return p27.time
end
local function v_u_30(p29) -- name: getY
	return p29.value
end
local function v_u_35(p31, p32) -- name: formatValue
	-- upvalues: (copy) v_u_17, (copy) v_u_25
	if p32 == nil then
		return "\226\128\148"
	else
		local v33 = v_u_17[p31]
		if v33 then
			v33 = v33.unit
		end
		local v34
		if v_u_25[p31] then
			v34 = string.format("%.2f", p32)
		else
			v34 = tostring(p32)
		end
		if v33 then
			return string.format("%s %s", v34, v33)
		else
			return v34
		end
	end
end
local function v_u_42(p36) -- name: HealthCard
	-- upvalues: (copy) v_u_12, (copy) v_u_2
	local v37 = p36.severity
	local v38 = v_u_12.Color.Text
	if v37 == "error" then
		v38 = v_u_12.Color.ErrorRed
	elseif v37 == "warn" then
		v38 = v_u_12.Color.WarningYellow
	elseif v37 == "ok" then
		v38 = v_u_12.Color.HoverGreen
	end
	local v39 = v_u_2.createElement
	local v40 = {
		["LayoutOrder"] = nil,
		["Size"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["LayoutOrder"] = p36.layoutOrder,
		["Size"] = UDim2.new(0, 110, 0, 56),
		["BackgroundColor3"] = v_u_12.Color.TextBoxGray
	}
	local v41 = {
		["Stroke"] = v_u_2.createElement("UIStroke", {
			["Color"] = nil,
			["Thickness"] = 1,
			["Transparency"] = 0.5,
			["Color"] = v_u_12.Color.BorderGray
		}),
		["Padding"] = v_u_2.createElement("UIPadding", {
			["PaddingLeft"] = UDim.new(0, 8),
			["PaddingRight"] = UDim.new(0, 8),
			["PaddingTop"] = UDim.new(0, 6),
			["PaddingBottom"] = UDim.new(0, 6)
		}),
		["Layout"] = v_u_2.createElement("UIListLayout", {
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["Caption"] = v_u_2.createElement("TextLabel", {
			["LayoutOrder"] = 1,
			["Size"] = nil,
			["Text"] = nil,
			["Font"] = nil,
			["TextSize"] = nil,
			["TextColor3"] = nil,
			["TextXAlignment"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 0, 14),
			["Text"] = p36.caption,
			["Font"] = v_u_12.Font.MainWindowHeader,
			["TextSize"] = v_u_12.DefaultFontSize.MainWindowHeader,
			["TextColor3"] = v_u_12.Color.Text,
			["TextXAlignment"] = Enum.TextXAlignment.Left
		}),
		["Value"] = v_u_2.createElement("TextLabel", {
			["LayoutOrder"] = 2,
			["Size"] = nil,
			["Text"] = nil,
			["Font"] = nil,
			["TextSize"] = 18,
			["TextColor3"] = nil,
			["TextXAlignment"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 0, 20),
			["Text"] = p36.value,
			["Font"] = v_u_12.Font.MainWindowBold,
			["TextColor3"] = v38,
			["TextXAlignment"] = Enum.TextXAlignment.Left
		}),
		["SubCaption"] = v_u_2.createElement("TextLabel", {
			["LayoutOrder"] = 3,
			["Size"] = nil,
			["Text"] = nil,
			["Font"] = nil,
			["TextSize"] = 11,
			["TextColor3"] = nil,
			["TextXAlignment"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 0, 12),
			["Text"] = p36.subCaption or "",
			["Font"] = v_u_12.Font.MainWindow,
			["TextColor3"] = v_u_12.Color.BorderGray,
			["TextXAlignment"] = Enum.TextXAlignment.Left
		})
	}
	return v39("Frame", v40, v41)
end
local v43 = v_u_2.PureComponent:extend("MainViewVoiceDebug")
function v43.init(p_u_44) -- name: init
	-- upvalues: (copy) v_u_2
	function p_u_44.onUtilTabHeightChanged(p45)
		-- upvalues: (copy) p_u_44
		p_u_44:setState({
			["utilTabHeight"] = p45
		})
	end
	function p_u_44.onStatsUpdated(p46)
		-- upvalues: (copy) p_u_44
		if not p_u_44.state.frozen then
			p_u_44:setState({
				["stats"] = p46,
				["series"] = p_u_44.props.VoiceDebugData:getSeries(),
				["connectivity"] = p_u_44.props.VoiceDebugData:getConnectivity(),
				["subscriptions"] = p_u_44.props.VoiceDebugData:getSubscriptions(),
				["remoteOperations"] = p_u_44.props.VoiceDebugData:getRemoteOperations(),
				["source"] = p_u_44.props.VoiceDebugData:getSource()
			})
		end
	end
	function p_u_44.onSourceChanged(p47)
		-- upvalues: (copy) p_u_44
		p_u_44.props.VoiceDebugData:setSource(p47)
		p_u_44:setState({
			["source"] = p47,
			["stats"] = p_u_44.props.VoiceDebugData:getCurrentData(),
			["series"] = p_u_44.state.frozen and p_u_44.props.VoiceDebugData:getSeriesSnapshot() or p_u_44.props.VoiceDebugData:getSeries(),
			["connectivity"] = p_u_44.props.VoiceDebugData:getConnectivity(),
			["subscriptions"] = p_u_44.props.VoiceDebugData:getSubscriptions(),
			["remoteOperations"] = p_u_44.props.VoiceDebugData:getRemoteOperations()
		})
	end
	function p_u_44.onFreezeToggled()
		-- upvalues: (copy) p_u_44
		if p_u_44.state.frozen then
			p_u_44:setState({
				["frozen"] = false,
				["stats"] = nil,
				["series"] = nil,
				["connectivity"] = nil,
				["subscriptions"] = nil,
				["remoteOperations"] = nil,
				["stats"] = p_u_44.props.VoiceDebugData:getCurrentData(),
				["series"] = p_u_44.props.VoiceDebugData:getSeries(),
				["connectivity"] = p_u_44.props.VoiceDebugData:getConnectivity(),
				["subscriptions"] = p_u_44.props.VoiceDebugData:getSubscriptions(),
				["remoteOperations"] = p_u_44.props.VoiceDebugData:getRemoteOperations()
			})
		else
			p_u_44:setState({
				["frozen"] = true,
				["series"] = nil,
				["series"] = p_u_44.props.VoiceDebugData:getSeriesSnapshot()
			})
		end
	end
	p_u_44._statsUpdatedConnection = p_u_44.props.VoiceDebugData:Signal():Connect(p_u_44.onStatsUpdated)
	p_u_44.utilRef = v_u_2.createRef()
	p_u_44.state = {
		["utilTabHeight"] = 0,
		["stats"] = nil,
		["series"] = nil,
		["connectivity"] = nil,
		["subscriptions"] = nil,
		["remoteOperations"] = nil,
		["source"] = nil,
		["selectedGraphKeyByGroup"] = nil,
		["frozen"] = false,
		["stats"] = {},
		["series"] = {},
		["connectivity"] = {},
		["subscriptions"] = {},
		["remoteOperations"] = {},
		["source"] = p_u_44.props.VoiceDebugData:getSource(),
		["selectedGraphKeyByGroup"] = {}
	}
end
function v43.didMount(p48) -- name: didMount
	p48:setState({
		["utilTabHeight"] = p48.utilRef.current.Size.Y.Offset
	})
end
function v43.didUpdate(p49) -- name: didUpdate
	local v50 = p49.utilRef.current.Size
	if v50.Y.Offset ~= p49.state.utilTabHeight then
		p49:setState({
			["utilTabHeight"] = v50.Y.Offset
		})
	end
end
function v43.willUnmount(p51) -- name: willUnmount
	if p51._statsUpdatedConnection then
		p51._statsUpdatedConnection:Disconnect()
		p51._statsUpdatedConnection = nil
	end
end
function v43.onGraphRowClicked(p52, p53) -- name: onGraphRowClicked
	-- upvalues: (copy) v_u_17
	local v54 = v_u_17[p53]
	local v55
	if v54 then
		v55 = v54.group or p53
	else
		v55 = p53
	end
	local v56 = table.clone(p52.state.selectedGraphKeyByGroup)
	if v56[v55] == p53 then
		v56[v55] = nil
	else
		v56[v55] = p53
	end
	p52:setState({
		["selectedGraphKeyByGroup"] = v56
	})
end
function v43.renderHealthStrip(p57) -- name: renderHealthStrip
	-- upvalues: (copy) v_u_2, (copy) v_u_13, (copy) v_u_42, (copy) v_u_17
	local v58 = p57.state.stats
	local v59 = p57.state.series
	local v60 = v_u_2.createElement
	local v61 = {
		["LayoutOrder"] = 0,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 0, 56)
	}
	local v62 = {
		["Layout"] = v_u_2.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["Padding"] = UDim.new(0, v_u_13)
		})
	}
	local v63 = v_u_2.createElement
	local v64 = v_u_42
	local v65 = {
		["layoutOrder"] = 1,
		["caption"] = "Round-trip",
		["value"] = nil,
		["severity"] = nil,
		["subCaption"] = nil
	}
	local v66 = v58.rttMs
	v65.value = type(v66) ~= "number" and "\226\128\148" or string.format("%." .. tostring(2) .. "f", v66)
	local v67 = v58.rttMs
	v65.severity = v_u_17.getFieldSeverity("rttMs", v67)
	local v68 = v59.rttMs
	local v69 = v68 and string.format("%.1f", v68.max) or "\226\128\148"
	v65.subCaption = string.format("%s \194\183 peak %s%s", "ms", v69, "ms")
	v62.RoundTrip = v63(v64, v65)
	local v70 = v_u_2.createElement
	local v71 = v_u_42
	local v72 = {
		["layoutOrder"] = 2,
		["caption"] = "Loss in",
		["value"] = nil,
		["severity"] = nil,
		["subCaption"] = nil
	}
	local v73 = v58.incomingLossPercent
	v72.value = type(v73) ~= "number" and "\226\128\148" or string.format("%." .. tostring(1) .. "f", v73)
	local v74 = v58.incomingLossPercent
	v72.severity = v_u_17.getFieldSeverity("incomingLossPercent", v74)
	local v75 = v59.incomingLossPercent
	local v76 = v75 and string.format("%.1f", v75.max) or "\226\128\148"
	v72.subCaption = string.format("%s \194\183 peak %s%s", "%", v76, "%")
	v62.LossIn = v70(v71, v72)
	local v77 = v_u_2.createElement
	local v78 = v_u_42
	local v79 = {
		["layoutOrder"] = 3,
		["caption"] = "Jitter in",
		["value"] = nil,
		["severity"] = nil,
		["subCaption"] = nil
	}
	local v80 = v58.incomingJitterMs
	v79.value = type(v80) ~= "number" and "\226\128\148" or string.format("%." .. tostring(2) .. "f", v80)
	local v81 = v58.incomingJitterMs
	v79.severity = v_u_17.getFieldSeverity("incomingJitterMs", v81)
	local v82 = v59.incomingJitterMs
	local v83 = v82 and string.format("%.1f", v82.max) or "\226\128\148"
	v79.subCaption = string.format("%s \194\183 peak %s%s", "ms", v83, "ms")
	v62.JitterIn = v77(v78, v79)
	local v84 = v_u_2.createElement
	local v85 = v_u_42
	local v86 = {
		["layoutOrder"] = 4,
		["caption"] = "Streams",
		["value"] = nil,
		["severity"] = nil,
		["subCaption"] = "in / out"
	}
	local v87 = string.format
	local v88 = v58.incomingStreams or "\226\128\148"
	local v89 = tostring(v88)
	local v90 = v58.outgoingStreams or "\226\128\148"
	v86.value = v87("%s / %s", v89, (tostring(v90)))
	v62.Streams = v84(v85, v86)
	return v60("Frame", v61, v62)
end
local function v_u_114(p_u_91, p_u_92, p93, p94) -- name: buildStatRow
	-- upvalues: (copy) v_u_17, (copy) v_u_19, (copy) v_u_12, (copy) v_u_2, (copy) v_u_25, (copy) v_u_6, (copy) v_u_30, (copy) v_u_35
	local v95 = v_u_17[p_u_92]
	local v96
	if v95 then
		v96 = v95.label or p_u_92
	else
		v96 = p_u_92
	end
	if not v_u_19() then
		local v97 = string.format("%s: %s", v96, v_u_35(p_u_92, p93))
		return v_u_2.createElement("TextLabel", {
			["LayoutOrder"] = nil,
			["Size"] = nil,
			["Text"] = nil,
			["TextColor3"] = nil,
			["TextXAlignment"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = p94,
			["Size"] = UDim2.new(1, 0, 0, 20),
			["Text"] = v97,
			["TextColor3"] = v_u_12.Color.Text,
			["TextXAlignment"] = Enum.TextXAlignment.Left
		})
	end
	local v98 = v95 and (v95.unit or "") or ""
	local v99 = p_u_91.state.series[p_u_92]
	local v100
	if v95 == nil or v95.plottable ~= true then
		v100 = false
	else
		v100 = v99 ~= nil
	end
	local v101 = v_u_17.getFieldSeverity(p_u_92, p93)
	local v102 = v_u_12.Color.Text
	if v101 == "error" then
		v102 = v_u_12.Color.ErrorRed
	elseif v101 == "warn" then
		v102 = v_u_12.Color.WarningYellow
	elseif v101 == "ok" then
		v102 = v_u_12.Color.HoverGreen
	end
	local v103 = v101 == "warn" and true or v101 == "error"
	local v104 = {}
	local v105 = v_u_2.createElement
	local v106 = "Frame"
	local v107 = {
		["Position"] = nil,
		["Size"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = nil,
		["BorderSizePixel"] = 0,
		["Position"] = UDim2.new(0, 0, 0, 0),
		["Size"] = UDim2.new(0, 3, 1, 0)
	}
	local v108 = v_u_12.Color.WarningYellow
	if v101 == "error" then
		v108 = v_u_12.Color.ErrorRed
	elseif v101 == "warn" then
		v108 = v_u_12.Color.WarningYellow
	elseif v101 == "ok" then
		v108 = v_u_12.Color.HoverGreen
	end
	v107.BackgroundColor3 = v108
	v107.BackgroundTransparency = v103 and 0 or 1
	v104.Accent = v105(v106, v107)
	v104.Label = v_u_2.createElement("TextLabel", {
		["Position"] = nil,
		["Size"] = nil,
		["Text"] = nil,
		["Font"] = nil,
		["TextSize"] = nil,
		["TextColor3"] = nil,
		["TextXAlignment"] = nil,
		["TextTruncate"] = nil,
		["BackgroundTransparency"] = 1,
		["Position"] = UDim2.new(0, 11, 0, 0),
		["Size"] = UDim2.new(1, -251, 1, 0),
		["Text"] = v96,
		["Font"] = v_u_12.Font.MainWindow,
		["TextSize"] = v_u_12.DefaultFontSize.MainWindow,
		["TextColor3"] = v_u_12.Color.Text,
		["TextXAlignment"] = Enum.TextXAlignment.Left,
		["TextTruncate"] = Enum.TextTruncate.AtEnd
	})
	local v109 = v_u_2.createElement
	local v110 = "TextLabel"
	local v111 = {
		["Position"] = nil,
		["Size"] = nil,
		["Text"] = nil,
		["Font"] = nil,
		["TextSize"] = nil,
		["TextColor3"] = nil,
		["TextXAlignment"] = nil,
		["BackgroundTransparency"] = 1,
		["Position"] = UDim2.new(1, -180, 0, 0),
		["Size"] = UDim2.new(0, 56, 1, 0)
	}
	local v112
	if p93 == nil then
		v112 = "\226\128\148"
	else
		local v113
		if v_u_25[p_u_92] then
			v113 = string.format("%.2f", p93)
		else
			v113 = tostring(p93)
		end
		v112 = v113 or "\226\128\148"
	end
	v111.Text = v112
	v111.Font = v_u_12.Font.MainWindowBold
	v111.TextSize = v_u_12.DefaultFontSize.MainWindow
	v111.TextColor3 = v102
	v111.TextXAlignment = Enum.TextXAlignment.Right
	v104.Value = v109(v110, v111)
	v104.Unit = v_u_2.createElement("TextLabel", {
		["Position"] = nil,
		["Size"] = nil,
		["Text"] = nil,
		["Font"] = nil,
		["TextSize"] = nil,
		["TextColor3"] = nil,
		["TextXAlignment"] = nil,
		["BackgroundTransparency"] = 1,
		["Position"] = UDim2.new(1, -116, 0, 0),
		["Size"] = UDim2.new(0, 36, 1, 0),
		["Text"] = v98,
		["Font"] = v_u_12.Font.MainWindow,
		["TextSize"] = v_u_12.DefaultFontSize.MainWindow,
		["TextColor3"] = v_u_12.Color.BorderGray,
		["TextXAlignment"] = Enum.TextXAlignment.Left
	})
	v104.Delta = v_u_2.createElement("TextLabel", {
		["Position"] = nil,
		["Size"] = nil,
		["Text"] = nil,
		["Font"] = nil,
		["TextSize"] = nil,
		["TextColor3"] = nil,
		["TextXAlignment"] = nil,
		["BackgroundTransparency"] = 1,
		["Position"] = UDim2.new(1, -72, 0, 0),
		["Size"] = UDim2.new(0, 72, 1, 0),
		["Text"] = v100 and (string.format("peak %.1f", v99.max) or "\226\128\148") or "\226\128\148",
		["Font"] = v_u_12.Font.MainWindow,
		["TextSize"] = v_u_12.DefaultFontSize.MainWindow,
		["TextColor3"] = v_u_12.Color.BorderGray,
		["TextXAlignment"] = Enum.TextXAlignment.Right
	})
	if v100 then
		v104.SparklineButton = v_u_2.createElement("TextButton", {
			["AnchorPoint"] = Vector2.new(0, 0.5),
			["Position"] = UDim2.new(1, -240, 0.5, 0),
			["Size"] = UDim2.new(0, 52, 0, 13),
			["Text"] = "",
			["AutoButtonColor"] = false,
			["BackgroundTransparency"] = 1,
			[v_u_2.Event.Activated] = function()
				-- upvalues: (copy) p_u_91, (copy) p_u_92
				p_u_91:onGraphRowClicked(p_u_92)
			end
		}, {
			["Sparkline"] = v_u_2.createElement(v_u_6, {
				["dataSet"] = v99.dataSet,
				["getY"] = v_u_30,
				["minY"] = v99.min,
				["maxY"] = v99.max,
				["color"] = v103 and v_u_12.Color.WarningYellow or v_u_12.Color.HighlightBlue,
				["size"] = UDim2.new(1, 0, 1, 0)
			})
		})
	end
	return v_u_2.createElement("Frame", {
		["LayoutOrder"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = p94,
		["Size"] = UDim2.new(1, 0, 0, 20)
	}, v104)
end
local function v_u_124(p115, p116, p117, p118) -- name: buildGraphElement
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_13, (copy) v_u_14, (copy) v_u_28, (copy) v_u_30, (copy) v_u_16, (copy) v_u_17
	local v119 = v_u_2.createElement
	local v120 = v_u_5
	local v121 = {
		["pos"] = nil,
		["size"] = nil,
		["layoutOrder"] = nil,
		["graphData"] = nil,
		["minY"] = nil,
		["maxY"] = nil,
		["getX"] = nil,
		["getY"] = nil,
		["axisLabelX"] = "Time",
		["axisLabelY"] = nil,
		["stringFormatX"] = nil,
		["stringFormatY"] = nil,
		["pos"] = UDim2.new(0, 0, 0, v_u_13),
		["size"] = UDim2.new(1, -32, 0, v_u_14),
		["layoutOrder"] = p118,
		["graphData"] = p115.dataSet,
		["minY"] = p115.min,
		["maxY"] = p115.max,
		["getX"] = v_u_28,
		["getY"] = v_u_30,
		["axisLabelY"] = p116.label,
		["stringFormatX"] = v_u_16
	}
	local v_u_122 = v_u_17[p117]
	if v_u_122 then
		v_u_122 = v_u_17[p117].unit
	end
	function v121.stringFormatY(p123)
		-- upvalues: (copy) v_u_122
		if v_u_122 then
			return string.format("%.1f %s", p123, v_u_122)
		else
			return string.format("%.1f", p123)
		end
	end
	return v119(v120, v121)
end
function v43.renderStatLabels(p125, p126) -- name: renderStatLabels
	-- upvalues: (copy) v_u_114, (copy) v_u_14, (copy) v_u_13, (copy) v_u_124, (copy) v_u_19, (copy) v_u_24, (copy) v_u_17, (copy) v_u_2, (copy) v_u_12, (copy) v_u_23
	local v127 = {}
	local v128 = 0
	local v129 = 0
	local v130, v131
	if v_u_19() then
		v130 = v129
		v131 = v128
		local v132 = {}
		for _, v133 in v_u_24 do
			v132[v133] = {}
		end
		local v134 = {}
		for _, v135 in p126 do
			local v136 = v_u_17[v135]
			if v136 then
				v136 = v136.group
			end
			if v136 and v132[v136] then
				local v137 = v132[v136]
				table.insert(v137, v135)
			else
				table.insert(v134, v135)
			end
		end
		for _, v138 in v_u_24 do
			local v139 = v132[v138]
			if #v139 <= 0 then
				continue
			end
			v128 = v131 + 1
			v129 = v130 + 18
			v127["__group_header_" .. v138] = v_u_2.createElement("TextLabel", {
				["LayoutOrder"] = nil,
				["Size"] = nil,
				["Text"] = nil,
				["Font"] = nil,
				["TextSize"] = nil,
				["TextColor3"] = nil,
				["TextXAlignment"] = nil,
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = v128,
				["Size"] = UDim2.new(1, 0, 0, 18),
				["Text"] = v138,
				["Font"] = v_u_12.Font.MainWindowHeader,
				["TextSize"] = v_u_12.DefaultFontSize.MainWindowHeader,
				["TextColor3"] = v_u_12.Color.BorderGray,
				["TextXAlignment"] = Enum.TextXAlignment.Left
			})
			v130 = v129
			v131 = v128
			for _, v140 in v139 do
				v128 = v131 + 1
				v129 = v130 + 20
				v127[v140] = v_u_114(p125, v140, p125.state.stats[v140], v128)
				v130 = v129
				v131 = v128
			end
			local v141 = p125.state.selectedGraphKeyByGroup[v138]
			local v142
			if v141 then
				v142 = v_u_17[v141]
			else
				v142 = v141
			end
			if not (v142 and v142.plottable) then
				break
			end
			local v143 = p125.state.series[v141]
			if not v143 then
				break
			end
			v128 = v131 + 1
			v129 = v130 + (v_u_14 + v_u_13)
			v127["__graph_" .. v141] = v_u_124(v143, v142, v141, v128)
			v130 = v129
			v131 = v128
		end
		for _, v144 in v134 do
			v128 = v131 + 1
			v129 = v130 + 20
			v127[v144] = v_u_114(p125, v144, p125.state.stats[v144], v128)
			local v145 = v_u_17[v144]
			if v145 and (v145.plottable and p125.state.selectedGraphKeyByGroup[v144] == v144) then
				local v146 = p125.state.series[v144]
				if v146 then
					v128 = v128 + 1
					v129 = v129 + (v_u_14 + v_u_13)
					v127["__graph_" .. v144] = v_u_124(v146, v145, v144, v128)
					v130 = v129
					v131 = v128
				else
					v130 = v129
					v131 = v128
				end
			else
				v130 = v129
				v131 = v128
			end
		end
	else
		v130 = v129
		v131 = v128
		for _, v147 in p126 do
			v128 = v131 + 1
			v129 = v130 + 20
			v127[v147] = v_u_114(p125, v147, p125.state.stats[v147], v128)
			v130 = v129
			v131 = v128
		end
	end
	local v148 = v_u_19()
	for v149 in p125.state.stats do
		if v127[v149] or not v148 and v_u_23[v149] then
			continue
		end
		v128 = v131 + 1
		v129 = v130 + 20
		v127[v149] = v_u_114(p125, v149, p125.state.stats[v149], v128)
		v130 = v129
		v131 = v128
	end
	return v127, v130
end
function v43.renderGraphs(p150, p151) -- name: renderGraphs
	-- upvalues: (copy) v_u_19, (copy) v_u_17, (copy) v_u_2, (copy) v_u_5, (copy) v_u_14, (copy) v_u_28, (copy) v_u_30, (copy) v_u_16
	local v152 = {}
	local v153 = 0
	if v_u_19() then
		return v152, v153
	end
	for _, v154 in p151 do
		local v155 = v_u_17[v154]
		local v156 = p150.state.series[v154]
		if not (v155 and (v155.plottable and v156)) then
			continue
		end
		v153 = v153 + 1
		local v157 = v_u_2.createElement
		local v158 = v_u_5
		local v159 = {
			["pos"] = nil,
			["size"] = nil,
			["layoutOrder"] = nil,
			["graphData"] = nil,
			["minY"] = nil,
			["maxY"] = nil,
			["getX"] = nil,
			["getY"] = nil,
			["axisLabelX"] = "Time",
			["axisLabelY"] = nil,
			["stringFormatX"] = nil,
			["stringFormatY"] = nil,
			["pos"] = UDim2.new(),
			["size"] = UDim2.new(1, -32, 0, v_u_14),
			["layoutOrder"] = v153,
			["graphData"] = v156.dataSet,
			["minY"] = v156.min,
			["maxY"] = v156.max,
			["getX"] = v_u_28,
			["getY"] = v_u_30,
			["axisLabelY"] = v155.label,
			["stringFormatX"] = v_u_16
		}
		local v_u_160 = v_u_17[v154]
		if v_u_160 then
			v_u_160 = v_u_17[v154].unit
		end
		function v159.stringFormatY(p161)
			-- upvalues: (copy) v_u_160
			if v_u_160 then
				return string.format("%.1f %s", p161, v_u_160)
			else
				return string.format("%.1f", p161)
			end
		end
		v152[v154] = v157(v158, v159)
	end
	return v152, v153
end
function v43.render(p162) -- name: render
	-- upvalues: (copy) v_u_19, (copy) v_u_22, (copy) v_u_18, (copy) v_u_14, (copy) v_u_13, (copy) v_u_2, (copy) v_u_15, (copy) v_u_12, (copy) v_u_21, (copy) v_u_20, (copy) v_u_11, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10
	local v163 = p162.props.size
	local v164 = p162.props.formFactor
	local v165 = p162.props.tabList
	local v166 = v_u_19() and v_u_22 or v_u_18
	local v167, v168 = p162:renderStatLabels(v166)
	local v169, v170 = p162:renderGraphs(v166)
	local v171 = v170 * v_u_14
	local v172 = v170 - 1
	local v173 = v171 + math.max(0, v172) * v_u_13
	local v174 = p162.state.utilTabHeight
	local v175 = v_u_2.createElement
	local v176 = "Frame"
	local v177 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 3,
		["Size"] = v163
	}
	local v178 = {
		["UIListLayout"] = v_u_2.createElement("UIListLayout", {
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top,
			["Padding"] = UDim.new(0, v_u_13)
		}),
		["FramePadding"] = v_u_2.createElement("UIPadding", {
			["PaddingLeft"] = UDim.new(0, 16)
		})
	}
	local v179 = v_u_2.createElement
	local v180 = v_u_15
	local v181 = {
		["windowWidth"] = nil,
		["formFactor"] = nil,
		["tabList"] = nil,
		["layoutOrder"] = 1,
		["refForParent"] = nil,
		["onHeightChanged"] = nil,
		["extraContent"] = nil,
		["windowWidth"] = v163.X.Offset,
		["formFactor"] = v164,
		["tabList"] = v165,
		["refForParent"] = p162.utilRef,
		["onHeightChanged"] = p162.onUtilTabHeightChanged
	}
	local v182
	if v_u_19() then
		local v183 = v_u_2.createElement
		local v184 = "Frame"
		local v185 = {
			["AutomaticSize"] = nil,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["AutomaticSize"] = Enum.AutomaticSize.X,
			["Size"] = UDim2.new(0, 0, 1, 0),
			["AnchorPoint"] = Vector2.new(1, 0.5),
			["Position"] = UDim2.new(1, v164 == v_u_12.FormFactor.Small and -24 or -20, 0.5, 0)
		}
		local v186 = {
			["Layout"] = v_u_2.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Horizontal,
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["VerticalAlignment"] = Enum.VerticalAlignment.Center,
				["Padding"] = UDim.new(0, 8)
			})
		}
		local v187
		if v_u_19() then
			v187 = v_u_2.createElement(v_u_21, {
				["source"] = nil,
				["onSourceChanged"] = nil,
				["layoutOrder"] = 1,
				["source"] = p162.state.source,
				["onSourceChanged"] = p162.onSourceChanged
			}) or nil
		else
			v187 = nil
		end
		v186.VoiceSourceToggle = v187
		v186.FreezeToggle = v_u_2.createElement(v_u_20, {
			["frozen"] = nil,
			["onToggle"] = nil,
			["layoutOrder"] = 2,
			["frozen"] = p162.state.frozen,
			["onToggle"] = p162.onFreezeToggled
		})
		v182 = v183(v184, v185, v186) or nil
	else
		v182 = nil
	end
	v181.extraContent = v182
	v178.UtilAndTab = v179(v180, v181)
	v178.Content = v_u_2.createElement("ScrollingFrame", {
		["LayoutOrder"] = 2,
		["Size"] = nil,
		["AutomaticCanvasSize"] = nil,
		["BackgroundTransparency"] = 1,
		["BorderSizePixel"] = 0,
		["ScrollBarThickness"] = 5,
		["Size"] = UDim2.new(1, 0, 1, -v174),
		["AutomaticCanvasSize"] = Enum.AutomaticSize.Y
	}, v_u_19() and {
		["UIListLayout"] = v_u_2.createElement("UIListLayout", {
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["Padding"] = UDim.new(0, v_u_13)
		}),
		["ContentPadding"] = v_u_2.createElement("UIPadding", {
			["PaddingRight"] = UDim.new(0, 24)
		}),
		["MetricsSection"] = v_u_2.createElement(v_u_11, {
			["title"] = "Metrics",
			["layoutOrder"] = 1
		}, {
			["HealthStrip"] = p162:renderHealthStrip(),
			["StatsContainer"] = v_u_2.createElement("Frame", {
				["LayoutOrder"] = 2,
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = UDim2.new(1, 0, 0, v168)
			}, {
				["UIListLayout"] = v_u_2.createElement("UIListLayout", {
					["SortOrder"] = Enum.SortOrder.LayoutOrder
				}),
				["Labels"] = v_u_2.createFragment(v167)
			})
		}),
		["ConnectivityContainer"] = v_u_2.createElement(v_u_7, {
			["connectivity"] = nil,
			["layoutOrder"] = 2,
			["connectivity"] = p162.state.connectivity
		}),
		["SubscriptionsContainer"] = v_u_2.createElement(v_u_8, {
			["subscriptions"] = nil,
			["layoutOrder"] = 3,
			["subscriptions"] = p162.state.subscriptions
		}),
		["RemoteOperationsContainer"] = v_u_2.createElement(v_u_9, {
			["remoteOperations"] = nil,
			["layoutOrder"] = 4,
			["remoteOperations"] = p162.state.remoteOperations
		}),
		["ClientOperationQueueContainer"] = v_u_2.createElement(v_u_10, {
			["remoteOperations"] = nil,
			["layoutOrder"] = 5,
			["remoteOperations"] = p162.state.remoteOperations
		}),
		["BottomSpacer"] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["LayoutOrder"] = 6,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 0, 16)
		})
	} or {
		["UIListLayout"] = v_u_2.createElement("UIListLayout", {
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["Padding"] = UDim.new(0, v_u_13)
		}),
		["ContentPadding"] = v_u_2.createElement("UIPadding", {
			["PaddingRight"] = UDim.new(0, 24)
		}),
		["StatsContainer"] = v_u_2.createElement("Frame", {
			["LayoutOrder"] = 1,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 0, v168)
		}, {
			["UIListLayout"] = v_u_2.createElement("UIListLayout", {
				["SortOrder"] = Enum.SortOrder.LayoutOrder
			}),
			["Labels"] = v_u_2.createFragment(v167)
		}),
		["GraphsContainer"] = v_u_2.createElement("Frame", {
			["LayoutOrder"] = 2,
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 0, v173)
		}, {
			["UIListLayout"] = v_u_2.createElement("UIListLayout", {
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
				["Padding"] = UDim.new(0, v_u_13)
			}),
			["Graphs"] = v_u_2.createFragment(v169)
		}),
		["ConnectivityContainer"] = v_u_2.createElement(v_u_7, {
			["connectivity"] = nil,
			["layoutOrder"] = 3,
			["connectivity"] = p162.state.connectivity
		})
	})
	return v175(v176, v177, v178)
end
return v4(v43, "VoiceDebugData")