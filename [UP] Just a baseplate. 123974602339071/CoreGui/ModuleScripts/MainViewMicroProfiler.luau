-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.MicroProfiler.MainViewMicroProfiler
local v1 = game:GetService("CorePackages")
game:GetService("LogService")
local v_u_2 = game:GetService("RbxAnalyticsService")
local v_u_3 = UserSettings().GameSettings
local v_u_4 = require(v1.Packages.Roact)
local v5 = script.Parent.Parent.Parent.Components
local v_u_6 = require(v5.UtilAndTab)
local v_u_7 = require(script.Parent.ServerProfilerInterface)
local v_u_8 = require(script.Parent.MicroProfilerView)
local v_u_9 = require(script.Parent.Parent.Parent.Constants)
local v_u_10 = v_u_9.GeneralFormatting.MainRowPadding
local v_u_11 = v_u_9.MicroProfilerFormatting.ButtonWidth
local v_u_12 = v_u_9.MicroProfilerFormatting.ButtonTextSize
local _ = v_u_9.Font.MainWindow
local v_u_13 = v_u_9.Font.MainWindowHeader
local v_u_14 = v_u_9.Color.UnselectedGray
local v_u_15 = v_u_9.Color.SelectedBlue
local v_u_16 = v_u_9.Color.UnselectedGray
local v_u_17 = require(script.Parent.Flags.FFlagDevConsoleMicroProfilerImproveWording)
local v_u_18 = game:DefineFastFlag("DevConsoleMicroProfilerNewLayout", false)
local v19 = v_u_4.Component:extend("MainViewProfiler")
function v19.init(p_u_20) -- name: init
	-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_4
	function p_u_20.onUtilTabHeightChanged(p21)
		-- upvalues: (copy) p_u_20
		p_u_20:setState({
			["utilTabHeight"] = p21
		})
	end
	function p_u_20.changeProfilerState(p_u_22)
		-- upvalues: (ref) v_u_3, (copy) p_u_20, (ref) v_u_2
		return function()
			-- upvalues: (ref) v_u_3, (copy) p_u_22, (ref) p_u_20, (ref) v_u_2
			v_u_3.OnScreenProfilerEnabled = p_u_22
			p_u_20:setState({
				["clientProfilerEnabled"] = p_u_22
			})
			v_u_2:ReportCounter("MicroprofilerDevConsolePressed")
		end
	end
	p_u_20.microProfilerChangedConnection = v_u_3:GetPropertyChangedSignal("OnScreenProfilerEnabled"):Connect(function()
		-- upvalues: (copy) p_u_20, (ref) v_u_3
		p_u_20:setState({
			["clientProfilerEnabled"] = v_u_3.OnScreenProfilerEnabled
		})
	end)
	p_u_20.utilRef = v_u_4.createRef()
	p_u_20.state = {
		["utilTabHeight"] = 0
	}
end
function v19.didMount(p23) -- name: didMount
	p23:setState({
		["utilTabHeight"] = p23.utilRef.current.Size.Y.Offset
	})
end
function v19.willUnmount(p24) -- name: willUnmount
	if p24.microProfilerChangedConnection then
		p24.microProfilerChangedConnection:Disconnect()
		p24.microProfilerChangedConnection = nil
	end
end
function v19.didUpdate(p25) -- name: didUpdate
	local v26 = p25.utilRef.current.Size
	if v26.Y.Offset ~= p25.state.utilTabHeight then
		p25:setState({
			["utilTabHeight"] = v26.Y.Offset
		})
	end
end
function v19.renderNewLayout(p27) -- name: renderNewLayout
	-- upvalues: (copy) v_u_4, (copy) v_u_9, (copy) v_u_10, (copy) v_u_6, (copy) v_u_8
	local v28 = p27.props.size
	local v29 = p27.props.formFactor
	local v30 = p27.props.tabList
	local v31 = p27.state.utilTabHeight
	local v32 = v_u_4.createElement
	local v33 = {
		["Size"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 3,
		["Size"] = v28,
		["BackgroundColor3"] = v_u_9.Color.BaseGray
	}
	local v34 = {
		["UIListLayout"] = v_u_4.createElement("UIListLayout", {
			["Padding"] = UDim.new(0, v_u_10),
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["UtilAndTab"] = v_u_4.createElement(v_u_6, {
			["windowWidth"] = nil,
			["formFactor"] = nil,
			["tabList"] = nil,
			["layoutOrder"] = 1,
			["refForParent"] = nil,
			["onHeightChanged"] = nil,
			["windowWidth"] = v28.X.Offset,
			["formFactor"] = v29,
			["tabList"] = v30,
			["refForParent"] = p27.utilRef,
			["onHeightChanged"] = p27.onUtilTabHeightChanged
		}),
		["MicroProfilerView"] = v_u_4.createElement(v_u_8, {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 2,
			["Size"] = UDim2.new(1, 0, 1, -v31)
		})
	}
	return v32("Frame", v33, v34)
end
function v19.render(p35) -- name: render
	-- upvalues: (copy) v_u_18, (copy) v_u_11, (copy) v_u_4, (copy) v_u_9, (copy) v_u_10, (copy) v_u_6, (copy) v_u_17, (copy) v_u_13, (copy) v_u_12, (copy) v_u_16, (copy) v_u_14, (copy) v_u_15, (copy) v_u_7
	if v_u_18 then
		return p35:renderNewLayout()
	end
	local v36 = p35.props.size
	local v37 = p35.props.formFactor
	local v38 = p35.props.tabList
	local v39 = p35.state.utilTabHeight
	local _ = p35.state.frameRate
	local _ = p35.state.timeFrame
	local _ = p35.state.waitingForData
	local v40 = p35.state.clientProfilerEnabled
	local _ = p35.state.outputPath
	UDim2.new(0.8, -v_u_11, 0, 30)
	UDim2.new(0.6, v_u_11, 0, 0)
	local v41 = v_u_4.createElement
	local v42 = {
		["Size"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 3,
		["Size"] = v36,
		["BackgroundColor3"] = v_u_9.Color.BaseGray
	}
	local v43 = {
		["UIListLayout"] = v_u_4.createElement("UIListLayout", {
			["Padding"] = UDim.new(0, v_u_10),
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["UtilAndTab"] = v_u_4.createElement(v_u_6, {
			["windowWidth"] = nil,
			["formFactor"] = nil,
			["tabList"] = nil,
			["layoutOrder"] = 1,
			["refForParent"] = nil,
			["onHeightChanged"] = nil,
			["windowWidth"] = v36.X.Offset,
			["formFactor"] = v37,
			["tabList"] = v38,
			["refForParent"] = p35.utilRef,
			["onHeightChanged"] = p35.onUtilTabHeightChanged
		})
	}
	local v44 = v_u_4.createElement
	local v45 = {
		["Size"] = nil,
		["CanvasSize"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 2,
		["Size"] = UDim2.new(1, 0, 1, -v39),
		["CanvasSize"] = UDim2.new(1, 0, 1, -v39)
	}
	local v46 = {
		["UIListLayout"] = v_u_4.createElement("UIListLayout", {
			["Padding"] = UDim.new(0, v_u_10 * 2),
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
	}
	local v47 = v_u_4.createElement
	local v48 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 2,
		["Size"] = UDim2.new(1, 0, 0, 90)
	}
	local v49 = {
		["Label"] = v_u_4.createElement("TextLabel", {
			["Size"] = nil,
			["Position"] = nil,
			["Text"] = nil,
			["Font"] = nil,
			["TextSize"] = nil,
			["TextColor3"] = nil,
			["TextXAlignment"] = nil,
			["TextYAlignment"] = nil,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(0, v_u_11, 0, 30),
			["Position"] = UDim2.new(0.1, 0, 0, 0),
			["Text"] = v_u_17 and "Client MicroProfiler" or "MicroProfiler",
			["Font"] = v_u_13,
			["TextSize"] = v_u_12,
			["TextColor3"] = v_u_9.Color.Text,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextYAlignment"] = Enum.TextYAlignment.Center,
			["BackgroundColor3"] = v_u_16
		}),
		["HorizontalLine"] = v_u_4.createElement("Frame", {
			["Size"] = UDim2.new(1, 0, 0, 1),
			["Position"] = UDim2.new(0, 0, 0, 30)
		})
	}
	local v50 = v_u_4.createElement
	local v51 = {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(0.8, -v_u_11, 0, 30),
		["Position"] = UDim2.new(0.09999999999999998, v_u_11, 0, 37.5)
	}
	local v52 = {
		["OffButton"] = v_u_4.createElement("TextButton", {
			["Size"] = UDim2.new(0.5, 0, 1, 0),
			["Text"] = "Off",
			["Font"] = v_u_13,
			["TextSize"] = v_u_12,
			["TextColor3"] = v_u_9.Color.Text,
			["TextXAlignment"] = Enum.TextXAlignment.Center,
			["TextYAlignment"] = Enum.TextYAlignment.Center,
			["BackgroundColor3"] = v40 and v_u_14 or v_u_15,
			[v_u_4.Event.Activated] = p35.changeProfilerState(false)
		}),
		["ClientButton"] = v_u_4.createElement("TextButton", {
			["Size"] = UDim2.new(0.5, 0, 1, 0),
			["Position"] = UDim2.new(0.5, 0, 0, 0),
			["Text"] = v_u_17 and "On" or "Client",
			["Font"] = v_u_13,
			["TextSize"] = v_u_12,
			["TextColor3"] = v_u_9.Color.Text,
			["TextXAlignment"] = Enum.TextXAlignment.Center,
			["TextYAlignment"] = Enum.TextYAlignment.Center,
			["BackgroundColor3"] = v40 and v_u_15 or v_u_14,
			[v_u_4.Event.Activated] = p35.changeProfilerState(true)
		})
	}
	v49.ToggleButton = v50("TextLabel", v51, v52)
	v46.MicroProfilerRow = v47("Frame", v48, v49)
	v46.HorizontalLine = v_u_4.createElement("Frame", {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 3,
		["Size"] = UDim2.new(1, 0, 0, v_u_10)
	})
	v46.ServerProfiler = v_u_4.createElement(v_u_7, {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 4,
		["Size"] = UDim2.new(1, 0, 0, 135)
	})
	v43.MainFrame = v44("ScrollingFrame", v45, v46)
	return v41("Frame", v42, v43)
end
return v19