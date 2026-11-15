-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.ScriptProfiler.MobileSettingsView
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.RoactRodux)
game:GetService("ScriptContext")
local v_u_4 = require(script.Parent.ProfilerUtil)
local v5 = script.Parent.Parent.Parent.Components
local v_u_6 = require(v5.DropDown)
local v7 = script.Parent.Parent.Parent.Actions
local v_u_8 = require(v7.SetScriptProfilerState)
local v_u_9 = require(script.Parent.Parent.Parent.Constants)
local v_u_10 = v_u_9.GeneralFormatting.MainRowPadding * 2
local v_u_11 = v_u_9.UtilityBarFormatting.SmallFrameHeight
local v_u_12 = v_u_9.Font.MainWindowHeader
local v_u_13 = v_u_9.Font.MainWindow
local v_u_14 = v_u_9.MicroProfilerFormatting.ButtonTextSize
local v_u_15 = v_u_9.Color.Text
local _ = v_u_9.Color.UnselectedGray
local v_u_16 = v_u_9.Color.UnselectedGray
local v_u_17 = v_u_9.Color.SelectedBlue
local v_u_18 = v_u_9.Color.UnselectedGray
local v_u_19 = v_u_9.MicroProfilerFormatting.ButtonWidth
local v_u_20 = v_u_9.GeneralFormatting.DropDownArrowHeight
local v_u_21 = v_u_20 / 2
local v_u_22 = v_u_9.Image.DownArrow
local v_u_23 = game:DefineFastFlag("ScriptProfilerShowPlugins2", false)
local v_u_24 = {
	0,
	1,
	60,
	300,
	600
}
local v_u_25 = table.create(#v_u_24)
local function v27(p26) -- name: formatTimeSelection
	-- upvalues: (copy) v_u_4
	return p26 == 0 and "Off" or v_u_4.formatTimer(p26)
end
local v_u_28 = { "Callgraph", "Functions" }
for _, v29 in v_u_24 do
	table.insert(v_u_25, v27(v29))
end
local v_u_30 = { 1000, 10000 }
local v31 = v_u_4.formatFrequency
local v_u_32 = table.create(#v_u_30)
for _, v33 in v_u_30 do
	table.insert(v_u_32, v31(v33))
end
local v_u_34 = {
	0,
	60,
	300,
	600
}
local v_u_35 = table.create(#v_u_34)
for _, v36 in v_u_34 do
	table.insert(v_u_35, v27(v36))
end
local v37 = v_u_2.PureComponent:extend("MobileSettingsView")
function v37.init(_) -- name: init end
function v37.didMount(_) -- name: didMount end
function v37.didUpdate(_) -- name: didUpdate end
function v37.GetState(p38, p39) -- name: GetState
	local v40
	if p38.props.isClientView then
		v40 = p38.props.client
	else
		v40 = p38.props.server
	end
	return v40[p39]
end
function v37.UpdateState(p41, p42, p43) -- name: UpdateState
	local v44
	if p41.props.isClientView then
		v44 = p41.props.client
	else
		v44 = p41.props.server
	end
	local v45 = table.clone(v44)
	v45[p42] = p43
	p41.props.dispatchSetScriptProfilerState(p41.props.isClientView, v45)
end
function v37.renderToggle(_, p46, p47, p_u_48) -- name: renderToggle
	-- upvalues: (copy) v_u_2, (copy) v_u_11, (copy) v_u_19, (copy) v_u_12, (copy) v_u_14, (copy) v_u_9, (copy) v_u_18, (copy) v_u_16, (copy) v_u_17
	local v49 = v_u_2.createElement
	local v50 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 2,
		["Size"] = UDim2.new(1, 0, 0, v_u_11)
	}
	local v51 = {
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
			["Size"] = UDim2.new(0, v_u_19, 0, v_u_11),
			["Position"] = UDim2.new(0.1, 0, 0, 0),
			["Text"] = p46,
			["Font"] = v_u_12,
			["TextSize"] = v_u_14,
			["TextColor3"] = v_u_9.Color.Text,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextYAlignment"] = Enum.TextYAlignment.Center,
			["BackgroundColor3"] = v_u_18
		})
	}
	local v52 = v_u_2.createElement
	local v53 = {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(0, v_u_19 * 2, 0, v_u_11),
		["Position"] = UDim2.new(0.9, -v_u_19 * 2, 0, 0)
	}
	local v54 = {
		["OffButton"] = v_u_2.createElement("TextButton", {
			["Size"] = UDim2.new(0.5, 0, 1, 0),
			["Text"] = "Off",
			["Font"] = v_u_12,
			["TextSize"] = v_u_14,
			["TextColor3"] = v_u_9.Color.Text,
			["TextXAlignment"] = Enum.TextXAlignment.Center,
			["TextYAlignment"] = Enum.TextYAlignment.Center,
			["BackgroundColor3"] = p47 and v_u_16 or v_u_17,
			[v_u_2.Event.Activated] = function()
				-- upvalues: (copy) p_u_48
				p_u_48(false)
			end
		}),
		["OnButton"] = v_u_2.createElement("TextButton", {
			["Size"] = UDim2.new(0.5, 0, 1, 0),
			["Position"] = UDim2.new(0.5, 0, 0, 0),
			["Text"] = "On",
			["Font"] = v_u_12,
			["TextSize"] = v_u_14,
			["TextColor3"] = v_u_9.Color.Text,
			["TextXAlignment"] = Enum.TextXAlignment.Center,
			["TextYAlignment"] = Enum.TextYAlignment.Center,
			["BackgroundColor3"] = p47 and v_u_17 or v_u_16,
			[v_u_2.Event.Activated] = function()
				-- upvalues: (copy) p_u_48
				p_u_48(true)
			end
		})
	}
	v51.ToggleButton = v52("TextLabel", v53, v54)
	return v49("Frame", v50, v51)
end
function v37.renderStateToggle(p_u_55, p56, p_u_57, _) -- name: renderStateToggle
	return p_u_55:renderToggle(p56, p_u_55:GetState(p_u_57), function(p58)
		-- upvalues: (copy) p_u_55, (copy) p_u_57
		p_u_55:UpdateState(p_u_57, p58)
	end)
end
function v37.renderDropDown(p_u_59, p60, p_u_61, p62, p_u_63, p64, p65) -- name: renderDropDown
	-- upvalues: (copy) v_u_2, (copy) v_u_19, (copy) v_u_11, (copy) v_u_14, (copy) v_u_15, (copy) v_u_13, (copy) v_u_9, (copy) v_u_22, (copy) v_u_20, (copy) v_u_21, (copy) v_u_6, (copy) v_u_12, (copy) v_u_18
	local v66
	if p65 then
		local v67 = v_u_2.createElement
		local v68 = {
			["Position"] = nil,
			["Size"] = nil,
			["Text"] = nil,
			["TextSize"] = nil,
			["TextColor3"] = nil,
			["Font"] = nil,
			["AutoButtonColor"] = true,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 0,
			["Position"] = UDim2.new(0.9, -v_u_19, 0, 0),
			["Size"] = UDim2.new(0, v_u_19, 0, v_u_11),
			["Text"] = p62[p64],
			["TextSize"] = v_u_14,
			["TextColor3"] = v_u_15,
			["Font"] = v_u_13,
			["BackgroundColor3"] = v_u_9.Color.InactiveBox
		}
		local v69 = {
			["arrow"] = v_u_2.createElement("ImageLabel", {
				["Image"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["Position"] = nil,
				["Image"] = v_u_22,
				["Size"] = UDim2.new(0, v_u_20, 0, v_u_20),
				["Position"] = UDim2.new(1, -v_u_20 - v_u_21, 0.5, -v_u_21)
			})
		}
		v66 = v67("TextButton", v68, v69)
	else
		local v70 = v_u_2.createElement
		local v71 = {
			["Position"] = UDim2.new(0.9, -v_u_19, 0, 0),
			["Size"] = UDim2.new(0, v_u_19, 0, v_u_11)
		}
		local v74 = {
			["Selection"] = v_u_2.createElement(v_u_6, {
				["buttonSize"] = UDim2.new(1, 0, 0, v_u_11),
				["dropDownList"] = p62,
				["selectedIndex"] = p64,
				["onSelection"] = function(p72) -- name: onSelection
					-- upvalues: (copy) p_u_59, (copy) p_u_61, (copy) p_u_63
					local v73 = p_u_59:GetState(p_u_61)
					if typeof(v73) == "boolean" then
						v73 = p72 == 2
					elseif typeof(v73) == "number" then
						v73 = p_u_63[p72]
					end
					p_u_59:UpdateState(p_u_61, v73)
				end
			})
		}
		v66 = v70("Frame", v71, v74)
	end
	local v75 = v_u_2.createElement
	local v76 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 0, v_u_11)
	}
	local v77 = {
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
			["Size"] = UDim2.new(0, v_u_19, 0, v_u_11),
			["Position"] = UDim2.new(0.1, 0, 0, 0),
			["Text"] = p60,
			["Font"] = v_u_12,
			["TextSize"] = v_u_14,
			["TextColor3"] = v_u_9.Color.Text,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["TextYAlignment"] = Enum.TextYAlignment.Center,
			["BackgroundColor3"] = v_u_18
		}),
		["DropDown"] = v66
	}
	return v75("Frame", v76, v77)
end
function v37.render(p_u_78) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_9, (copy) v_u_10, (copy) v_u_23, (copy) v_u_25, (copy) v_u_24, (copy) v_u_32, (copy) v_u_30, (copy) v_u_4, (copy) v_u_35, (copy) v_u_34, (copy) v_u_28
	local v79 = p_u_78:GetState("isProfiling")
	local v80 = v_u_2.createElement
	local v81 = "ScrollingFrame"
	local v82 = {
		["Size"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 2,
		["AutomaticCanvasSize"] = nil,
		["Size"] = p_u_78.props.size,
		["BackgroundColor3"] = v_u_9.Color.BaseGray,
		["AutomaticCanvasSize"] = Enum.AutomaticSize.Y
	}
	local v84 = {
		["UIListLayout"] = v_u_2.createElement("UIListLayout", {
			["Padding"] = UDim.new(0, v_u_10),
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["Percentages"] = p_u_78:renderToggle("Percentages", p_u_78.props.usePercentages, function(p83)
			-- upvalues: (copy) p_u_78
			p_u_78.props.dispatchSetScriptProfilerUsePercentages(p83)
		end),
		["LiveToggle"] = p_u_78:renderStateToggle("Live Update", "liveUpdate")
	}
	local v85
	if v_u_23 then
		v85 = p_u_78:renderStateToggle("Show Plugins", "showPlugins")
	else
		v85 = nil
	end
	v84.PluginsToggle = v85
	v84.GCToggle = p_u_78:renderStateToggle("GC Overhead", "showGc")
	v84.AverageDropDown = p_u_78:renderDropDown("Average", "average", v_u_25, v_u_24, table.find(v_u_24, p_u_78:GetState("average")) or 1)
	v84.FrequencyDropDown = p_u_78:renderDropDown("Frequency", "frequency", v_u_32, v_u_30, table.find(v_u_30, p_u_78:GetState("frequency")) or 1, v79)
	v84.TimerDropDown = p_u_78:renderDropDown("Timer" .. (not v79 and "" or ": " .. v_u_4.formatTimer(p_u_78:GetState("timedProfilingCountdown"))), "timedProfilingDuration", v_u_35, v_u_34, table.find(v_u_34, p_u_78:GetState("timedProfilingDuration")) or 1, v79)
	v84.ViewDropDown = p_u_78:renderDropDown("View", "isFunctionsView", v_u_28, nil, p_u_78:GetState("isFunctionsView") and 2 or 1)
	return v80(v81, v82, v84)
end
return v3.UNSTABLE_connect2(function(p86, _) -- name: mapStateToProps
	return {
		["usePercentages"] = p86.ScriptProfiler.usePercentages,
		["isClientView"] = p86.ScriptProfiler.isClientView,
		["client"] = p86.ScriptProfiler.client,
		["server"] = p86.ScriptProfiler.server
	}
end, function(p_u_87) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_8
	return {
		["dispatchSetScriptProfilerState"] = function(p88, p89) -- name: dispatchSetScriptProfilerState
			-- upvalues: (copy) p_u_87, (ref) v_u_8
			if p88 then
				p_u_87(v_u_8(p88, nil, p89, nil))
			else
				p_u_87(v_u_8(p88, nil, nil, p89))
			end
		end,
		["dispatchSetScriptProfilerUsePercentages"] = function(p90) -- name: dispatchSetScriptProfilerUsePercentages
			-- upvalues: (copy) p_u_87, (ref) v_u_8
			p_u_87(v_u_8(nil, p90))
		end
	}
end)(v37)