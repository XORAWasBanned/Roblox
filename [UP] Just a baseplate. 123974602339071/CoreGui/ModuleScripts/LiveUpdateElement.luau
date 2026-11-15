-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.LiveUpdateElement
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("TextService")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = require(script.Parent.Parent.Components.DataConsumer)
local v6 = script.Parent.Parent.Actions
local v_u_7 = require(v6.SetActiveTab)
local v_u_8 = require(script.Parent.Parent.Constants)
local v_u_9 = v_u_8.MsgTypeNamesOrdered
local v_u_10 = v_u_8.DefaultFontSize.TopBar
local v_u_11 = v_u_8.Color.Text
local v_u_12 = v_u_8.Font.TopBar
local v_u_13 = UDim2.new(0, v_u_10, 0, v_u_10)
local v_u_14 = v_u_2:GetTextSize("Client Mem:", v_u_10, v_u_12, Vector2.new(0, 0))
local v_u_15 = v_u_2:GetTextSize("Client Memory Usage:", v_u_10, v_u_12, Vector2.new(0, 0))
local v_u_16 = v_u_2:GetTextSize("Avg. Data Ping:", v_u_10, v_u_12, Vector2.new(0, 0))
local v17 = v_u_3.PureComponent:extend("LiveUpdateElement")
function v17.didMount(p_u_18) -- name: didMount
	p_u_18.totalMemConnector = p_u_18.props.ClientMemoryData:totalMemSignal():Connect(function(p19)
		-- upvalues: (copy) p_u_18
		p_u_18:setState({
			["totalClientMemory"] = p19
		})
	end)
	p_u_18.avgPingConnector = p_u_18.props.ServerStatsData:avgPing():Connect(function(p20)
		-- upvalues: (copy) p_u_18
		p_u_18:setState({
			["averagePing"] = p20
		})
	end)
	p_u_18.logWarningErrorConnector = p_u_18.props.ClientLogData:errorWarningSignal():Connect(function(p21, p22)
		-- upvalues: (copy) p_u_18
		p_u_18:setState({
			["numErrors"] = p21,
			["numWarnings"] = p22
		})
	end)
	p_u_18:doSizeCheck()
end
function v17.didUpdate(p23) -- name: didUpdate
	p23:doSizeCheck()
end
function v17.doSizeCheck(p24) -- name: doSizeCheck
	if p24.ref.current then
		local v25 = p24.state.formFactorThreshold > p24.ref.current.AbsoluteSize.X
		if v25 ~= p24.state.isSmallerThanFormFactorThreshold then
			p24:setState({
				["isSmallerThanFormFactorThreshold"] = v25
			})
		end
	end
end
function v17.willUnmount(p26) -- name: willUnmount
	p26.totalMemConnector:Disconnect()
	p26.totalMemConnector = nil
	p26.avgPingConnector:Disconnect()
	p26.avgPingConnector = nil
	p26.logWarningErrorConnector:Disconnect()
	p26.logWarningErrorConnector = nil
end
function v17.init(p_u_27) -- name: init
	-- upvalues: (copy) v_u_9, (copy) v_u_3
	local v28, v29 = p_u_27.props.ClientLogData:getErrorWarningCount()
	function p_u_27.onLogWarningButton()
		-- upvalues: (ref) v_u_9, (copy) p_u_27
		local v30 = {}
		for _, v31 in pairs(v_u_9) do
			v30[v31] = false
		end
		v30.Warning = true
		p_u_27.props.ClientLogData:setFilters(v30)
		p_u_27.props.dispatchChangeTabClientLog()
	end
	function p_u_27.onLogErrorButton()
		-- upvalues: (ref) v_u_9, (copy) p_u_27
		local v32 = {}
		for _, v33 in pairs(v_u_9) do
			v32[v33] = false
		end
		v32.Error = true
		p_u_27.props.ClientLogData:setFilters(v32)
		p_u_27.props.dispatchChangeTabClientLog()
	end
	p_u_27.ref = v_u_3.createRef()
	p_u_27.state = {
		["numErrors"] = nil,
		["numWarnings"] = nil,
		["totalClientMemory"] = 0,
		["averagePing"] = 0,
		["formFactorThreshold"] = 380,
		["isSmallerThanFormFactorThreshold"] = false,
		["numErrors"] = v28,
		["numWarnings"] = v29
	}
end
function v17.render(p34) -- name: render
	-- upvalues: (copy) v_u_15, (copy) v_u_8, (copy) v_u_14, (copy) v_u_2, (copy) v_u_10, (copy) v_u_12, (copy) v_u_16, (copy) v_u_3, (copy) v_u_13, (copy) v_u_11
	local v35 = p34.props.size
	local v36 = p34.props.position
	local v37 = p34.props.formFactor
	local v38 = p34.state.numErrors
	local v39 = p34.state.numWarnings
	local v40 = p34.state.totalClientMemory
	local v41 = p34.state.averagePing
	local v42 = p34.state.isSmallerThanFormFactorThreshold
	local v43 = v_u_15.X
	local v44 = Enum.HorizontalAlignment.Center
	local v45
	if v37 == v_u_8.FormFactor.Small or v42 then
		v36 = v36 + UDim2.new(0, 12, 0, 0)
		v43 = v_u_14.X
		v44 = Enum.HorizontalAlignment.Left
		v45 = true
	else
		v45 = false
	end
	local v46 = string.format("%d", v38)
	local v47 = v_u_2:GetTextSize(v46, v_u_10, v_u_12, Vector2.new(0, 0))
	local v48 = string.format("%d", v39)
	local v49 = v_u_2:GetTextSize(v48, v_u_10, v_u_12, Vector2.new(0, 0))
	local v50 = string.format("%d MB", v40)
	local v51 = v_u_2:GetTextSize(v50, v_u_10, v_u_12, Vector2.new(0, 0))
	local v52 = string.format("%d ms", v41)
	local v53 = v_u_2:GetTextSize(v52, v_u_10, v_u_12, Vector2.new(0, 0))
	if v37 == v_u_8.FormFactor.Small or v42 then
		v36 = v36 + UDim2.new(0, 12, 0, 0)
		v43 = v_u_14.X
		v44 = Enum.HorizontalAlignment.Left
		v45 = true
	end
	local v54 = v41 > 0
	local v55 = v_u_16
	local v56 = v_u_3.createElement
	local v57 = "Frame"
	local v58 = {
		["Position"] = v36,
		["Size"] = v35,
		["BackgroundTransparency"] = 1,
		[v_u_3.Ref] = p34.ref
	}
	local v59 = {
		["UIListLayout"] = v_u_3.createElement("UIListLayout", {
			["Padding"] = UDim.new(0, 6),
			["HorizontalAlignment"] = v44,
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center
		}),
		["LogErrorIcon"] = v_u_3.createElement("ImageButton", {
			["Image"] = v_u_8.Image.Error,
			["Size"] = v_u_13,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 1,
			[v_u_3.Event.Activated] = p34.onLogErrorButton
		}),
		["LogErrorCount"] = v_u_3.createElement("TextButton", {
			["Text"] = v46,
			["TextSize"] = v_u_10,
			["TextColor3"] = v_u_11,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["Font"] = v_u_12,
			["Size"] = UDim2.new(0, v47.X, 1, 0),
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 2,
			[v_u_3.Event.Activated] = p34.onLogErrorButton
		}),
		["ErrorWarningPad"] = v_u_3.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 3
		}),
		["LogWarningIcon"] = v_u_3.createElement("ImageButton", {
			["Image"] = v_u_8.Image.Warning,
			["Size"] = v_u_13,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 4,
			[v_u_3.Event.Activated] = p34.onLogWarningButton
		}),
		["LogWarningCount"] = v_u_3.createElement("TextButton", {
			["Text"] = v48,
			["TextSize"] = v_u_10,
			["TextColor3"] = v_u_11,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["Font"] = v_u_12,
			["Size"] = UDim2.new(0, v49.X, 1, 0),
			["BackgroundTransparency"] = 9,
			["LayoutOrder"] = 5,
			[v_u_3.Event.Activated] = p34.onLogWarningButton
		}),
		["WarningMemoryPad"] = v_u_3.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 6
		}),
		["MemoryUsage"] = v_u_3.createElement("TextButton", {
			["Text"] = v45 and "Client Mem:" or "Client Memory Usage:",
			["TextSize"] = v_u_10,
			["TextColor3"] = v_u_8.Color.WarningYellow,
			["TextXAlignment"] = Enum.TextXAlignment.Right,
			["Font"] = v_u_12,
			["Size"] = UDim2.new(0, v43, 1, 0),
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 7,
			[v_u_3.Event.Activated] = p34.props.dispatchChangeTabClientMemory
		}),
		["MemoryUsage_MB"] = v_u_3.createElement("TextButton", {
			["Text"] = v50,
			["TextSize"] = v_u_10,
			["TextColor3"] = v_u_11,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["Font"] = v_u_12,
			["Size"] = UDim2.new(0, v51.X, 1, 0),
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 8,
			[v_u_3.Event.Activated] = p34.props.dispatchChangeTabClientMemory
		}),
		["MemoryPingPad"] = v_u_3.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 9
		})
	}
	local v60 = not v45
	if v60 then
		if v54 then
			v60 = v_u_3.createElement("TextButton", {
				["Text"] = "Avg. Data Ping:",
				["TextSize"] = v_u_10,
				["TextColor3"] = v_u_8.Color.WarningYellow,
				["TextXAlignment"] = Enum.TextXAlignment.Right,
				["Font"] = v_u_12,
				["Size"] = UDim2.new(0, v55.X, 1, 0),
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 10,
				[v_u_3.Event.Activated] = p34.props.dispatchChangeTabNetworkPing
			})
		else
			v60 = v54
		end
	end
	v59.AvgPing = v60
	local v61 = not v45
	if v61 then
		if v54 then
			v54 = v_u_3.createElement("TextButton", {
				["Text"] = v52,
				["TextSize"] = v_u_10,
				["TextColor3"] = v_u_11,
				["TextXAlignment"] = Enum.TextXAlignment.Left,
				["Font"] = v_u_12,
				["Size"] = UDim2.new(0, v53.X, 1, 0),
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = 11,
				[v_u_3.Event.Activated] = p34.props.dispatchChangeTabNetworkPing
			})
		end
	else
		v54 = v61
	end
	v59.AvgPing_ms = v54
	return v56(v57, v58, v59)
end
return v4.UNSTABLE_connect2(nil, function(p_u_62) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_7
	return {
		["dispatchChangeTabClientLog"] = function() -- name: dispatchChangeTabClientLog
			-- upvalues: (copy) p_u_62, (ref) v_u_7
			p_u_62(v_u_7("Log", true))
		end,
		["dispatchChangeTabClientMemory"] = function() -- name: dispatchChangeTabClientMemory
			-- upvalues: (copy) p_u_62, (ref) v_u_7
			p_u_62(v_u_7("Memory", true))
		end,
		["dispatchChangeTabNetworkPing"] = function() -- name: dispatchChangeTabNetworkPing
			-- upvalues: (copy) p_u_62, (ref) v_u_7
			p_u_62(v_u_7("ServerStats", true))
		end
	}
end)(v5(v17, "ServerStatsData", "ClientMemoryData", "ClientLogData"))