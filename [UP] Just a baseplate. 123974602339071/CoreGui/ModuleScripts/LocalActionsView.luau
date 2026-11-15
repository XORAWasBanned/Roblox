-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.MicroProfiler.LocalActionsView
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("TelemetryService")
local v_u_4 = UserSettings().GameSettings
local v_u_5 = require(script.Parent.Parent.BoxButton)
local v_u_6 = require(script.Parent.Parent.Parent.Constants)
local v_u_7 = require(script.Parent.Parent.Checkbox)
local v_u_8 = require(script.Parent.MicroProfilerPanel)
local v_u_9 = require(v1.Packages.Roact)
local v10 = v_u_9.Component:extend("LocalActionsView")
local v_u_11 = game:DefineFastFlag("DevConsoleMpEnableOpenDumpsFolderButton", false)
local v_u_12 = {
	["eventName"] = "DevConsoleMpToggleOnScreenMpCounter",
	["backends"] = nil,
	["lastUpdated"] = nil,
	["description"] = "\t\tCounter to track toggling the on-screen MicroProfiler on or off via the Developer Console.\n\t",
	["backends"] = { "RobloxTelemetryCounter" },
	["lastUpdated"] = { 2025, 11, 17 }
}
function v10.init(p_u_13) -- name: init
	-- upvalues: (copy) v_u_4
	p_u_13:setState({
		["OnScreenMicroProfilerVisible"] = v_u_4.OnScreenProfilerEnabled
	})
	p_u_13.onScreenMpToggledConn = v_u_4:GetPropertyChangedSignal("OnScreenProfilerEnabled"):Connect(function()
		-- upvalues: (copy) p_u_13, (ref) v_u_4
		p_u_13:setState({
			["OnScreenMicroProfilerVisible"] = v_u_4.OnScreenProfilerEnabled
		})
	end)
end
function v10.willUnmount(p14) -- name: willUnmount
	if p14.onScreenMpToggledConn then
		if p14.onScreenMpToggledConn.Connected then
			p14.onScreenMpToggledConn:Disconnect()
		end
		p14.onScreenMpToggledConn = nil
	end
end
function v10.toggleOnScreenMicroProfiler(_, p15) -- name: toggleOnScreenMicroProfiler
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_12
	v_u_4.OnScreenProfilerEnabled = p15
	local v16 = v_u_3
	local v17 = v_u_12
	local v18 = {
		["customFields"] = {
			["visible"] = ("%*"):format(p15)
		}
	}
	v16:LogCounter(v17, v18, 1)
end
function v10.render(p_u_19) -- name: render
	-- upvalues: (copy) v_u_9, (copy) v_u_8, (copy) v_u_6, (copy) v_u_7, (copy) v_u_11, (copy) v_u_2, (copy) v_u_5
	local v20 = v_u_9.createElement
	local v21 = v_u_8
	local v22 = {
		["Title"] = "Local actions",
		["LayoutOrder"] = nil,
		["Sections"] = nil,
		["LayoutOrder"] = p_u_19.props.LayoutOrder
	}
	local v23 = {}
	local v25 = {
		["Name"] = "LocalActions",
		["Rows"] = nil,
		["Rows"] = {
			{
				["UIListLayout"] = v_u_9.createElement("UIListLayout", {
					["FillDirection"] = Enum.FillDirection.Horizontal,
					["SortOrder"] = Enum.SortOrder.LayoutOrder
				}),
				["UIPadding"] = v_u_9.createElement("UIPadding", {
					["PaddingLeft"] = UDim.new(0, v_u_6.MicroProfilerFormatting.OptionTextPadding)
				}),
				["OptionLabel"] = v_u_9.createElement("TextLabel", {
					["Size"] = nil,
					["Position"] = nil,
					["BackgroundTransparency"] = 1,
					["Text"] = "On-screen MicroProfiler visible",
					["TextXAlignment"] = nil,
					["Font"] = nil,
					["TextSize"] = nil,
					["TextColor3"] = nil,
					["LayoutOrder"] = 1,
					["Size"] = UDim2.fromScale(0, 1),
					["Position"] = UDim2.new(0, 8, 0, 0),
					["TextXAlignment"] = Enum.TextXAlignment.Left,
					["Font"] = v_u_6.Font.MainWindow,
					["TextSize"] = v_u_6.MicroProfilerFormatting.OptionTextSize,
					["TextColor3"] = Color3.new(1, 1, 1)
				}, { v_u_9.createElement("UIFlexItem", {
						["FlexMode"] = Enum.UIFlexMode.Grow
					}) }),
				["CheckboxFrame"] = v_u_9.createElement("Frame", {
					["Size"] = nil,
					["BackgroundTransparency"] = 1,
					["LayoutOrder"] = 2,
					["Size"] = UDim2.fromOffset(v_u_6.MicroProfilerFormatting.OptionRowHeight, v_u_6.MicroProfilerFormatting.OptionRowHeight)
				}, {
					["OnScreenMicroProfilerVisibleCheckbox"] = v_u_9.createElement(v_u_7, {
						["Name"] = "OnScreenMicroProfilerVisibleCheckbox",
						["IsSelected"] = nil,
						["Size"] = nil,
						["Position"] = nil,
						["OnSelectedStateChanged"] = nil,
						["IsSelected"] = p_u_19.state.OnScreenMicroProfilerVisible,
						["Size"] = UDim2.fromOffset(v_u_6.MicroProfilerFormatting.OptionCheckboxSize, v_u_6.MicroProfilerFormatting.OptionCheckboxSize),
						["Position"] = UDim2.fromOffset((v_u_6.MicroProfilerFormatting.OptionRowHeight - v_u_6.MicroProfilerFormatting.OptionCheckboxSize) / 2, (v_u_6.MicroProfilerFormatting.OptionRowHeight - v_u_6.MicroProfilerFormatting.OptionCheckboxSize) / 2),
						["OnSelectedStateChanged"] = function(_, p24) -- name: OnSelectedStateChanged
							-- upvalues: (copy) p_u_19
							p_u_19:toggleOnScreenMicroProfiler(p24)
						end
					})
				})
			},
			v_u_11 and (game:GetEngineFeature("OpenLogsFolderApi") and not v_u_2:IsStudio()) and {
				["UIPadding"] = v_u_9.createElement("UIPadding", {
					["PaddingBottom"] = UDim.new(0, 2),
					["PaddingLeft"] = UDim.new(0, 2),
					["PaddingRight"] = UDim.new(0, 2),
					["PaddingTop"] = UDim.new(0, 2)
				}),
				["Button"] = v_u_9.createElement(v_u_5, {
					["text"] = "Open dump folder",
					["size"] = nil,
					["pos"] = nil,
					["onClicked"] = nil,
					["size"] = UDim2.fromScale(1, 1),
					["pos"] = UDim2.new(0, 0, 0, 0),
					["onClicked"] = function() -- name: onClicked
						game:OpenLogsFolder()
					end
				})
			} or nil
		}
	}
	__set_list(v23, 1, {v25})
	v22.Sections = v23
	return v20(v21, v22)
end
return v10