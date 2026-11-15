-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.MicroProfiler.RecordAndDumpView
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("MicroProfilerService")
local v_u_3 = game:GetService("TelemetryService")
local v_u_4 = require(script.Parent.Parent.BoxButton)
local v_u_5 = require(script.Parent.Parent.Parent.Constants)
local v_u_6 = require(script.Parent.MicroProfilerPanel)
local v_u_7 = require(script.Parent.Parent.NumberInput)
local v_u_8 = require(v1.Packages.Roact)
local v9 = require(v1.Packages.RoactRodux)
local v_u_10 = UserSettings().GameSettings
local v11 = script.Parent.Parent.Parent.Actions
local v_u_12 = require(v11.AppendRecentDumpPath)
local v_u_13 = require(v11.SetRCCProfilerState)
local v_u_14 = require(script.Parent.Parent.Parent.Util.getClientReplicator)
local v15 = v_u_8.Component:extend("RecordAndDumpView")
local v_u_16 = {
	["eventName"] = "DevConsoleMpRecordAndDumpCounter",
	["backends"] = nil,
	["lastUpdated"] = nil,
	["description"] = "\t\tCounter to track the action of using the Developer Console to record and save MicroProfiler\n\t\tdumps for either the client or server.\n\t",
	["backends"] = { "RobloxTelemetryCounter" },
	["lastUpdated"] = { 2025, 11, 24 }
}
function v15.logRecordAndDumpAction(p17, p18) -- name: logRecordAndDumpAction
	-- upvalues: (copy) v_u_3, (copy) v_u_16
	local v19 = v_u_3
	local v20 = v_u_16
	local v21 = {
		["customFields"] = {
			["context"] = p18,
			["secondsToDelay"] = p17.state[("%*SecondsToDelay"):format(p18)],
			["framesToRecord"] = p17.state[("%*FramesToRecord"):format(p18)]
		}
	}
	v19:LogCounter(v20, v21, 1)
end
function v15.numericInputRow(_, p22) -- name: numericInputRow
	-- upvalues: (copy) v_u_8, (copy) v_u_5, (copy) v_u_7
	local v23 = {
		["UIListLayout"] = v_u_8.createElement("UIListLayout", {
			["Padding"] = UDim.new(0, 8),
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["UIPadding"] = v_u_8.createElement("UIPadding", {
			["PaddingBottom"] = UDim.new(0, 4),
			["PaddingLeft"] = UDim.new(0, v_u_5.MicroProfilerFormatting.OptionTextPadding),
			["PaddingRight"] = UDim.new(0, 4),
			["PaddingTop"] = UDim.new(0, 4)
		})
	}
	local v24 = v_u_8.createElement
	local v25 = {
		["Font"] = nil,
		["Text"] = nil,
		["TextColor3"] = nil,
		["TextSize"] = nil,
		["TextXAlignment"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 1,
		["Position"] = nil,
		["Size"] = nil,
		["Font"] = v_u_5.Font.MainWindow,
		["Text"] = p22.Text,
		["TextColor3"] = Color3.fromRGB(255, 255, 255),
		["TextSize"] = v_u_5.MicroProfilerFormatting.OptionTextSize,
		["TextXAlignment"] = Enum.TextXAlignment.Left,
		["Position"] = UDim2.fromOffset(8, 0),
		["Size"] = UDim2.fromScale(0, 1)
	}
	local v26 = {
		["UIFlexItem"] = v_u_8.createElement("UIFlexItem", {
			["FlexMode"] = Enum.UIFlexMode.Fill
		})
	}
	v23.OptionLabel = v24("TextLabel", v25, v26)
	v23.NumberInput = v_u_8.createElement(v_u_7, {
		["Size"] = nil,
		["LayoutOrder"] = 3,
		["OnNumberInputChanged"] = nil,
		["Range"] = nil,
		["DefaultValue"] = nil,
		["IntegerOnly"] = nil,
		["Size"] = UDim2.new(0, 72, 1, 0),
		["OnNumberInputChanged"] = p22.OnNumberInputChanged,
		["Range"] = p22.Range,
		["DefaultValue"] = p22.DefaultValue,
		["IntegerOnly"] = p22.IntegerOnly
	})
	v23.NumberLimitsHint = v_u_8.createElement("TextLabel", {
		["Font"] = nil,
		["Text"] = nil,
		["TextColor3"] = nil,
		["TextSize"] = 12,
		["TextTransparency"] = 0.5,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 1,
		["BorderColor3"] = nil,
		["BorderSizePixel"] = 0,
		["LayoutOrder"] = 2,
		["Size"] = nil,
		["TextXAlignment"] = nil,
		["Font"] = v_u_5.Font.Log,
		["Text"] = ("(%*-%*)"):format(p22.Range.Min, p22.Range.Max),
		["TextColor3"] = Color3.fromRGB(255, 255, 255),
		["BackgroundColor3"] = Color3.fromRGB(255, 255, 255),
		["BorderColor3"] = Color3.fromRGB(0, 0, 0),
		["Size"] = UDim2.new(0, 32, 1, 0),
		["TextXAlignment"] = Enum.TextXAlignment.Right
	})
	return v23
end
function v15.recordAndDumpRows(p_u_27, p28) -- name: recordAndDumpRows
	-- upvalues: (copy) v_u_10, (copy) v_u_8, (copy) v_u_4
	local v_u_29 = p28.Context == "Client"
	local v30 = {}
	local v31 = {
		["Context"] = nil,
		["Text"] = "Number of frames to record",
		["DefaultValue"] = nil,
		["Range"] = nil,
		["IntegerOnly"] = true,
		["OnNumberInputChanged"] = nil,
		["Context"] = p28.Context
	}
	local v32
	if v_u_29 then
		v32 = p_u_27.state.ClientFramesToRecord
	else
		v32 = p_u_27.state.ServerFramesToRecord
	end
	v31.DefaultValue = v32
	v31.Range = NumberRange.new(1, 60)
	function v31.OnNumberInputChanged(p33) -- name: OnNumberInputChanged
		-- upvalues: (copy) v_u_29, (copy) p_u_27, (ref) v_u_10
		if v_u_29 then
			p_u_27:setState({
				["ClientFramesToRecord"] = p33
			})
		else
			v_u_10.RCCProfilerRecordFrameRate = p33
			p_u_27:setState({
				["ServerFramesToRecord"] = p33
			})
		end
	end
	local v34 = p_u_27:numericInputRow(v31)
	local v35 = {
		["Context"] = nil,
		["Text"] = "Seconds to delay",
		["DefaultValue"] = nil,
		["Range"] = nil,
		["IntegerOnly"] = true,
		["OnNumberInputChanged"] = nil,
		["Context"] = p28.Context
	}
	local v36
	if v_u_29 then
		v36 = p_u_27.state.ClientSecondsToDelay
	else
		v36 = p_u_27.state.ServerSecondsToDelay
	end
	v35.DefaultValue = v36
	v35.Range = NumberRange.new(1, 4)
	function v35.OnNumberInputChanged(p37) -- name: OnNumberInputChanged
		-- upvalues: (copy) v_u_29, (copy) p_u_27, (ref) v_u_10
		if v_u_29 then
			p_u_27:setState({
				["ClientSecondsToDelay"] = p37
			})
		else
			v_u_10.RCCProfilerRecordTimeFrame = p37
			p_u_27:setState({
				["ServerSecondsToDelay"] = p37
			})
		end
	end
	local v38 = p_u_27:numericInputRow(v35)
	local v39 = {
		["UIPadding"] = v_u_8.createElement("UIPadding", {
			["PaddingBottom"] = UDim.new(0, 2),
			["PaddingLeft"] = UDim.new(0, 2),
			["PaddingRight"] = UDim.new(0, 2),
			["PaddingTop"] = UDim.new(0, 2)
		})
	}
	local v40 = v_u_8.createElement
	local v41 = v_u_4
	local v42 = {}
	local v43
	if v_u_29 then
		if p_u_27.state.IsClientRecording then
			v43 = p28.RecordButtonText.Recording
		else
			v43 = p28.RecordButtonText.Idle
		end
	elseif p_u_27.props.IsServerRecording then
		v43 = p28.RecordButtonText.Recording
	else
		v43 = p28.RecordButtonText.Idle
	end
	v42.text = v43
	v42.size = UDim2.fromScale(1, 1)
	v42.pos = UDim2.new(0, 0, 0, 0)
	v42.onClicked = p28.OnRecordButtonClicked
	local v44
	if v_u_29 then
		v44 = not p_u_27.state.IsClientRecording
	else
		v44 = not p_u_27.props.IsServerRecording
	end
	v42.enabled = v44
	v39.Button = v40(v41, v42)
	__set_list(v30, 1, {v34, v38, v39})
	return v30
end
function v15.init(p45) -- name: init
	-- upvalues: (copy) v_u_10
	p45.state = {
		["IsClientRecording"] = false,
		["ClientFramesToRecord"] = 32,
		["ClientSecondsToDelay"] = 1,
		["ServerFramesToRecord"] = nil,
		["ServerSecondsToDelay"] = nil,
		["ServerFramesToRecord"] = v_u_10.RCCProfilerRecordFrameRate,
		["ServerSecondsToDelay"] = v_u_10.RCCProfilerRecordTimeFrame
	}
	p45.RecordingTasks = {
		["Client"] = nil
	}
end
function v15.willUnmount(p46) -- name: willUnmount
	if p46.RecordingTasks.Client and coroutine.status(p46.RecordingTasks.Client) ~= "dead" then
		task.cancel(p46.RecordingTasks.Client)
	end
end
function v15.render(p_u_47) -- name: render
	-- upvalues: (copy) v_u_8, (copy) v_u_6, (copy) v_u_2, (copy) v_u_14
	local v48 = v_u_8.createElement
	local v49 = v_u_6
	local v50 = {
		["Title"] = "Record and dump",
		["LayoutOrder"] = nil,
		["Sections"] = nil,
		["LayoutOrder"] = p_u_47.props.LayoutOrder
	}
	local v51 = {}
	local v53 = {
		["Name"] = "Client",
		["Rows"] = nil,
		["Rows"] = p_u_47:recordAndDumpRows({
			["Context"] = "Client",
			["RecordButtonText"] = nil,
			["OnRecordButtonClicked"] = nil,
			["RecordButtonText"] = {
				["Idle"] = "Begin client recording",
				["Recording"] = "Recording client..."
			},
			["OnRecordButtonClicked"] = function() -- name: OnRecordButtonClicked
				-- upvalues: (copy) p_u_47, (ref) v_u_2
				if not p_u_47.state.IsClientRecording then
					p_u_47:logRecordAndDumpAction("Client")
					p_u_47:setState({
						["IsClientRecording"] = true
					})
					p_u_47.RecordingTasks.Client = task.spawn(function()
						-- upvalues: (ref) v_u_2, (ref) p_u_47
						local v52 = v_u_2:DumpToFileAsync(p_u_47.state.ClientSecondsToDelay, p_u_47.state.ClientFramesToRecord)
						p_u_47.props.dispatchAppendRecentDumpPath(v52)
						p_u_47:setState(function(_)
							return {
								["IsClientRecording"] = false
							}
						end)
						p_u_47.RecordingTasks.Client = nil
					end)
				end
			end
		})
	}
	local v55 = {
		["Name"] = "Server",
		["Rows"] = nil,
		["Rows"] = p_u_47:recordAndDumpRows({
			["Context"] = "Server",
			["RecordButtonText"] = nil,
			["OnRecordButtonClicked"] = nil,
			["RecordButtonText"] = {
				["Idle"] = "Begin server recording",
				["Recording"] = "Recording server..."
			},
			["OnRecordButtonClicked"] = function() -- name: OnRecordButtonClicked
				-- upvalues: (copy) p_u_47, (ref) v_u_14
				if p_u_47.props.IsServerRecording then
					return
				else
					local v54 = v_u_14()
					if v54 then
						p_u_47:logRecordAndDumpAction("Server")
						v54:RequestRCCProfilerData(p_u_47.state.ServerFramesToRecord, p_u_47.state.ServerSecondsToDelay)
						p_u_47.props.dispatchSetRCCProfilerState(true)
					end
				end
			end
		})
	}
	__set_list(v51, 1, {v53, v55})
	v50.Sections = v51
	return v48(v49, v50)
end
return v9.connect(function(p56, _) -- name: mapStateToProps
	return {
		["IsServerRecording"] = p56.MicroProfiler.waitingForRecording
	}
end, function(p_u_57) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_12, (copy) v_u_13
	return {
		["dispatchAppendRecentDumpPath"] = function(p58) -- name: dispatchAppendRecentDumpPath
			-- upvalues: (copy) p_u_57, (ref) v_u_12
			p_u_57(v_u_12(p58))
		end,
		["dispatchSetRCCProfilerState"] = function(p59, p60) -- name: dispatchSetRCCProfilerState
			-- upvalues: (copy) p_u_57, (ref) v_u_13
			p_u_57(v_u_13(p59, p60))
		end
	}
end)(v15)