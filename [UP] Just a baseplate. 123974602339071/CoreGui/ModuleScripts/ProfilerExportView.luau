-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.ScriptProfiler.ProfilerExportView
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.RoactRodux)
game:GetService("ScriptContext")
local v_u_4 = game:GetService("ScriptProfilerService")
require(script.Parent.ProfilerDataFormatV2)
local v5 = script.Parent.Parent.Parent.Components
local v_u_6 = require(v5.ScrollingTextBox)
local _ = script.Parent.Parent.Parent.Actions
local v_u_7 = require(script.Parent.Parent.Parent.Constants)
local v_u_8 = v_u_7.GeneralFormatting.MainRowPadding
local v_u_9 = v_u_7.Font.MainWindowHeader
local v_u_10 = v_u_7.Font.MainWindow
local v_u_11 = v_u_7.MicroProfilerFormatting.ButtonTextSize
local v_u_12 = v_u_7.Color.UnselectedGray
local v_u_13 = v_u_7.MicroProfilerFormatting.ButtonWidth
local v14 = v_u_2.PureComponent:extend("ProfilerExportView")
function v14.init(_) -- name: init end
function v14.didMount(p15) -- name: didMount
	local v16 = {}
	local v17 = p15.props.client.data
	local v18 = ""
	if v17 then
		v17 = v17.SessionStartTime
	end
	v16.exportFilenameClient = "scriptprofiler-" .. (v17 and (os.date("%Y%b%d-%H%M%S-", v17 / 1000) or "") or v18) .. "client.json"
	local v19 = p15.props.server.data
	local v20 = ""
	if v19 then
		v19 = v19.SessionStartTime
	end
	v16.exportFilenameServer = "scriptprofiler-" .. (v19 and (os.date("%Y%b%d-%H%M%S-", v19 / 1000) or "") or v20) .. "server.json"
	p15:setState(v16)
end
function v14.didUpdate(_) -- name: didUpdate end
function v14.renderExportInputAndButton(p_u_21, p_u_22, p_u_23, p_u_24) -- name: renderExportInputAndButton
	-- upvalues: (copy) v_u_2, (copy) v_u_12, (copy) v_u_11, (copy) v_u_10, (copy) v_u_7, (copy) v_u_6, (copy) v_u_9, (copy) v_u_4
	return v_u_2.createElement("TextLabel", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 0,
		["BackgroundColor3"] = nil,
		["Text"] = nil,
		["TextSize"] = nil,
		["Font"] = nil,
		["TextColor3"] = nil,
		["Size"] = UDim2.new(0.9, 0, 0, 30),
		["Position"] = UDim2.new(0.05, 0, 0, 37.5),
		["BackgroundColor3"] = v_u_12,
		["Text"] = p_u_24 and "" or "Complete a profiling session to export data",
		["TextSize"] = v_u_11,
		["Font"] = v_u_10,
		["TextColor3"] = v_u_7.Color.Text
	}, p_u_24 and {
		["InputField"] = v_u_2.createElement(v_u_6, {
			["Text"] = nil,
			["TextSize"] = nil,
			["Font"] = nil,
			["Size"] = nil,
			["Position"] = nil,
			["ShowNativeInput"] = true,
			["TextColor3"] = nil,
			["TextXAlignment"] = nil,
			["ClearTextOnFocus"] = false,
			["PlaceholderText"] = "Filename for export",
			["TextBoxFocusLost"] = nil,
			["Text"] = p_u_23,
			["TextSize"] = v_u_11,
			["Font"] = v_u_10,
			["Size"] = UDim2.new(0.8, 0, 1, 0),
			["Position"] = UDim2.new(0, 0, 0, 0),
			["TextColor3"] = v_u_7.Color.Text,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextBoxFocusLost"] = function(p25, _, _) -- name: TextBoxFocusLost
				-- upvalues: (copy) p_u_22, (copy) p_u_21
				if p_u_22 then
					p_u_21:setState({
						["exportFilenameClient"] = p25.text
					})
				else
					p_u_21:setState({
						["exportFilenameServer"] = p25.text
					})
				end
			end
		}),
		["ExportButton"] = v_u_2.createElement("TextButton", {
			["Size"] = UDim2.new(0.2, 0, 1, 0),
			["Position"] = UDim2.new(0.8, 0, 0, 0),
			["Text"] = "Export",
			["Font"] = v_u_9,
			["TextSize"] = v_u_11,
			["TextColor3"] = v_u_7.Color.Text,
			["TextXAlignment"] = Enum.TextXAlignment.Center,
			["TextYAlignment"] = Enum.TextYAlignment.Center,
			["BackgroundColor3"] = v_u_12,
			[v_u_2.Event.Activated] = function()
				-- upvalues: (ref) v_u_4, (copy) p_u_24, (copy) p_u_23, (copy) p_u_22, (copy) p_u_21
				local v26 = v_u_4:SaveScriptProfilingData(p_u_24, p_u_23)
				if p_u_22 then
					p_u_21:setState({
						["clientSavePath"] = v26
					})
				else
					p_u_21:setState({
						["serverSavePath"] = v26
					})
				end
			end
		})
	} or {})
end
function v14.renderExportSection(p27, p28, p29) -- name: renderExportSection
	-- upvalues: (copy) v_u_2, (copy) v_u_13, (copy) v_u_9, (copy) v_u_11, (copy) v_u_7, (copy) v_u_12
	local v30, v31, v32
	if p28 then
		v30 = p27.state.exportFilenameClient
		v31 = p27.props.client.serializedData
		v32 = p27.state.clientSavePath
	else
		v30 = p27.state.exportFilenameServer
		v31 = p27.props.server.serializedData
		v32 = p27.state.serverSavePath
	end
	local v33 = v_u_2.createElement
	local v34 = "Frame"
	local v35 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 2,
		["Size"] = UDim2.new(1, 0, 0, 90)
	}
	local v36 = {
		["Label"] = v_u_2.createElement("TextLabel", {
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
			["Size"] = UDim2.new(0, v_u_13, 0, 30),
			["Position"] = UDim2.new(0.1, 0, 0, 0),
			["Text"] = p29,
			["Font"] = v_u_9,
			["TextSize"] = v_u_11,
			["TextColor3"] = v_u_7.Color.Text,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextYAlignment"] = Enum.TextYAlignment.Center,
			["BackgroundColor3"] = v_u_12
		}),
		["HorizontalLine"] = v_u_2.createElement("Frame", {
			["Size"] = UDim2.new(1, 0, 0, 1),
			["Position"] = UDim2.new(0, 0, 0, 30)
		}),
		["Export"] = p27:renderExportInputAndButton(p28, v30, v31)
	}
	local v37
	if v32 then
		v37 = v_u_2.createElement("TextBox", {
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
			["TextEditable"] = false,
			["ClearTextOnFocus"] = false,
			["Size"] = UDim2.new(0.95, 0, 0, 30),
			["Position"] = UDim2.new(0.05, 0, 0, 75),
			["Text"] = "Saved to " .. v32,
			["Font"] = v_u_9,
			["TextSize"] = v_u_11,
			["TextColor3"] = v_u_7.Color.Text,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextYAlignment"] = Enum.TextYAlignment.Center,
			["BackgroundColor3"] = v_u_12
		})
	else
		v37 = nil
	end
	v36.SavedPath = v37
	return v33(v34, v35, v36)
end
function v14.render(p38) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_7, (copy) v_u_8
	local v39 = v_u_2.createElement
	local v40 = {
		["Size"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 2,
		["Size"] = p38.props.size,
		["BackgroundColor3"] = v_u_7.Color.BaseGray
	}
	local v41 = {
		["UIListLayout"] = v_u_2.createElement("UIListLayout", {
			["Padding"] = UDim.new(0, v_u_8 * 2),
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["Row"] = p38:renderExportSection(true, "Client"),
		["HorizontalLine"] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 3,
			["Size"] = UDim2.new(1, 0, 0, v_u_8)
		}),
		["Row2"] = p38:renderExportSection(false, "Server")
	}
	return v39("Frame", v40, v41)
end
return v3.UNSTABLE_connect2(function(p42, _) -- name: mapStateToProps
	return {
		["client"] = p42.ScriptProfiler.client,
		["server"] = p42.ScriptProfiler.server
	}
end, nil)(v14)