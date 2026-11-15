-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.MicroProfiler.ServerProfilerInterface
local v1 = game:GetService("CorePackages")
local v_u_2 = UserSettings().GameSettings
local v_u_3 = require(script.Parent.Flags.FFlagDevConsoleMicroProfilerImproveWording)
local v_u_4 = game:DefineFastFlag("DevConsoleMicroProfilerFixAutoTextClear", false)
local v_u_5 = require(script.Parent.Parent.Parent.Util.getClientReplicator)
local v_u_6 = require(v1.Packages.Roact)
local v7 = require(v1.Packages.RoactRodux)
local _ = script.Parent.Parent.Parent.Components
local v8 = script.Parent.Parent.Parent.Actions
local v_u_9 = require(v8.SetRCCProfilerState)
local v_u_10 = require(script.Parent.Parent.Parent.Constants)
local _ = v_u_10.GeneralFormatting.MainRowPadding
local v_u_11 = v_u_10.MicroProfilerFormatting.ButtonWidth
local v_u_12 = v_u_10.MicroProfilerFormatting.ButtonTextSize
local v_u_13 = v_u_10.Font.MainWindow
local v_u_14 = v_u_10.Font.MainWindowHeader
local v_u_15 = v_u_10.Color.UnselectedGray
local v_u_16 = v_u_10.Color.SelectedBlue
local v_u_17 = v_u_10.Color.UnselectedGray
local v18 = v_u_6.Component:extend("ServerProfilerInteraface")
function v18.init(p_u_19) -- name: init
	-- upvalues: (copy) v_u_2, (copy) v_u_5
	function p_u_19.onUtilTabHeightChanged(p20)
		-- upvalues: (copy) p_u_19
		p_u_19:setState({
			["utilTabHeight"] = p20
		})
	end
	function p_u_19.onFocusLostFrameRate(p21, _, _)
		-- upvalues: (ref) v_u_2
		v_u_2.RCCProfilerRecordFrameRate = p21.Text
		p21.Text = v_u_2.RCCProfilerRecordFrameRate
	end
	function p_u_19.onFocusLostTimeFrame(p22, _, _)
		-- upvalues: (ref) v_u_2
		v_u_2.RCCProfilerRecordTimeFrame = p22.Text
		p22.Text = v_u_2.RCCProfilerRecordTimeFrame
	end
	function p_u_19.requestRCCProfilerData(_)
		-- upvalues: (ref) v_u_5, (ref) v_u_2, (copy) p_u_19
		local v23 = v_u_5()
		if v23 then
			v23:RequestRCCProfilerData(v_u_2.RCCProfilerRecordFrameRate, v_u_2.RCCProfilerRecordTimeFrame)
			p_u_19.props.dispatchSetRCCProfilerState(true)
		end
	end
	function p_u_19.changeProfilerState(p_u_24)
		-- upvalues: (ref) v_u_2, (copy) p_u_19
		return function()
			-- upvalues: (ref) v_u_2, (copy) p_u_24, (ref) p_u_19
			v_u_2.OnScreenProfilerEnabled = p_u_24
			p_u_19:setState({
				["clientProfilerEnabled"] = p_u_24
			})
		end
	end
	p_u_19.state = {
		["frameRate"] = v_u_2.RCCProfilerRecordFrameRate,
		["timeFrame"] = v_u_2.RCCProfilerRecordTimeFrame
	}
end
function v18.render(p25) -- name: render
	-- upvalues: (copy) v_u_11, (copy) v_u_6, (copy) v_u_3, (copy) v_u_14, (copy) v_u_12, (copy) v_u_10, (copy) v_u_17, (copy) v_u_13, (copy) v_u_4, (copy) v_u_15, (copy) v_u_16
	local _ = p25.props.size
	local _ = p25.props.formFactor
	local _ = p25.props.tabList
	local v26 = p25.props.waitingForRecording
	local v27 = p25.props.lastFileOutputLocation
	local _ = p25.state.utilTabHeight
	local v28 = p25.state.frameRate
	local v29 = p25.state.timeFrame
	local _ = p25.state.clientProfilerEnabled
	local v30 = not v26
	if v30 then
		v30 = #v27 > 0
	end
	local v31 = UDim2.new(0.8, -v_u_11, 0, 30)
	UDim2.new(0.6, v_u_11, 0, 0)
	local v32 = v_u_6.createElement
	local v33 = "Frame"
	local v34 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 4,
		["Size"] = UDim2.new(1, 0, 0, 135)
	}
	local v35 = {
		["Label"] = v_u_6.createElement("TextLabel", {
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
			["Text"] = v_u_3 and "Server MicroProfiler" or "ServerProfiler",
			["Font"] = v_u_14,
			["TextSize"] = v_u_12,
			["TextColor3"] = v_u_10.Color.Text,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextYAlignment"] = Enum.TextYAlignment.Center,
			["BackgroundColor3"] = v_u_17
		}),
		["HorizontalLine"] = v_u_6.createElement("Frame", {
			["Size"] = UDim2.new(1, 0, 0, 1),
			["Position"] = UDim2.new(0, 0, 0, 30)
		}),
		["LabelFPS"] = v_u_6.createElement("TextLabel", {
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
			["Position"] = UDim2.new(0.1, 0, 0, 37.5),
			["Text"] = v_u_3 and "Frames to dump" or "Frames Per Second",
			["Font"] = v_u_13,
			["TextSize"] = v_u_12,
			["TextColor3"] = v_u_10.Color.Text,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextYAlignment"] = Enum.TextYAlignment.Center,
			["BackgroundColor3"] = v_u_17
		}),
		["FPSTextBox"] = v_u_6.createElement("TextBox", {
			["Size"] = v31,
			["Position"] = UDim2.new(0.09999999999999998, v_u_11, 0, 37.5),
			["Text"] = v28,
			["Font"] = v_u_13,
			["TextSize"] = v_u_12,
			["TextColor3"] = v_u_10.Color.Text,
			["TextXAlignment"] = Enum.TextXAlignment.Center,
			["TextYAlignment"] = Enum.TextYAlignment.Center,
			["BackgroundColor3"] = v_u_17,
			["BackgroundTransparency"] = 0,
			["ClearTextOnFocus"] = not v_u_4,
			[v_u_6.Event.FocusLost] = p25.onFocusLostFrameRate
		}),
		["LabelTimeFrame"] = v_u_6.createElement("TextLabel", {
			["Size"] = nil,
			["Position"] = nil,
			["Text"] = nil,
			["Font"] = nil,
			["TextSize"] = nil,
			["TextColor3"] = nil,
			["TextXAlignment"] = nil,
			["TextYAlignment"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(0, v_u_11, 0, 30),
			["Position"] = UDim2.new(0.1, 0, 0, 67.5),
			["Text"] = v_u_3 and "Seconds to delay" or "Seconds to Record",
			["Font"] = v_u_13,
			["TextSize"] = v_u_12,
			["TextColor3"] = v_u_10.Color.Text,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextYAlignment"] = Enum.TextYAlignment.Center
		})
	}
	local v36 = v_u_6.createElement
	local v37 = {
		["Size"] = v31,
		["Position"] = UDim2.new(0.09999999999999998, v_u_11, 0, 67.5),
		["Text"] = v29,
		["Font"] = v_u_13,
		["TextSize"] = v_u_12,
		["TextColor3"] = v_u_10.Color.Text,
		["TextXAlignment"] = Enum.TextXAlignment.Center,
		["TextYAlignment"] = Enum.TextYAlignment.Center,
		["BackgroundColor3"] = v_u_17,
		["BackgroundTransparency"] = 0,
		["ClearTextOnFocus"] = not v_u_4,
		[v_u_6.Event.FocusLost] = p25.onFocusLostTimeFrame
	}
	local v38 = {
		["GetDumpButton"] = v_u_6.createElement("TextButton", {
			["Size"] = UDim2.new(0, v_u_11 * 0.7, 0, 30),
			["Position"] = UDim2.new(1, -v_u_11 * 0.7, 1, 30),
			["Text"] = v26 and "Recording" or "Start Recording",
			["Font"] = v_u_13,
			["TextSize"] = v_u_12,
			["TextColor3"] = v_u_10.Color.Text,
			["TextXAlignment"] = Enum.TextXAlignment.Center,
			["TextYAlignment"] = Enum.TextYAlignment.Center,
			["BackgroundColor3"] = v26 and v_u_15 or v_u_16,
			["BackgroundTransparency"] = v26 and 0.3 or 0,
			["AutoButtonColor"] = not v26,
			["Active"] = not v26,
			[v_u_6.Event.Activated] = p25.requestRCCProfilerData
		})
	}
	v35.TimeFrameTextBox = v36("TextBox", v37, v38)
	if v30 then
		v30 = v_u_6.createElement("TextLabel", {
			["Size"] = UDim2.new(1, 0, 0, 30),
			["Position"] = UDim2.new(0, 0, 0, 97.5),
			["Text"] = v27,
			["Font"] = v_u_13,
			["TextSize"] = v_u_12,
			["TextColor3"] = v_u_10.Color.Text,
			["TextXAlignment"] = Enum.TextXAlignment.Center,
			["TextYAlignment"] = Enum.TextYAlignment.Center
		})
	end
	v35.OutputPath = v30
	return v32(v33, v34, v35)
end
return v7.UNSTABLE_connect2(function(p39, _) -- name: mapStateToProps
	return {
		["waitingForRecording"] = p39.MicroProfiler.waitingForRecording,
		["lastFileOutputLocation"] = p39.MicroProfiler.lastFileOutputLocation
	}
end, function(p_u_40) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_9
	return {
		["dispatchSetRCCProfilerState"] = function(p41, p42) -- name: dispatchSetRCCProfilerState
			-- upvalues: (copy) p_u_40, (ref) v_u_9
			p_u_40(v_u_9(p41, p42))
		end
	}
end)(v18)