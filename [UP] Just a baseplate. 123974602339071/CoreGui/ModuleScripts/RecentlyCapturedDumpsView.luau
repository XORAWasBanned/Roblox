-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.MicroProfiler.RecentlyCapturedDumpsView
local v1 = game:GetService("CorePackages")
local v_u_2 = require(script.Parent.Parent.Parent.Constants)
local v_u_3 = require(script.Parent.MicroProfilerPanel)
local v_u_4 = require(v1.Packages.Roact)
local v5 = require(v1.Packages.RoactRodux)
local v6 = v_u_4.Component:extend("RecentlyCapturedDumpsView")
function v6.render(p7) -- name: render
	-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_3
	local _ = p7.props.RecentDumpPaths
	local v8 = {}
	for _, v9 in ipairs(p7.props.RecentDumpPaths) do
		local v10 = {
			["DumpPathLabel"] = v_u_4.createElement("TextBox", {
				["Font"] = nil,
				["Text"] = nil,
				["TextColor3"] = nil,
				["TextSize"] = 14,
				["TextXAlignment"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["TextEditable"] = false,
				["ClearTextOnFocus"] = false,
				["ClipsDescendants"] = true,
				["Font"] = v_u_2.Font.Log,
				["Text"] = v9,
				["TextColor3"] = v_u_2.Color.Text,
				["TextXAlignment"] = Enum.TextXAlignment.Left,
				["Size"] = UDim2.fromScale(1, 1)
			}, {
				["UIPadding"] = v_u_4.createElement("UIPadding", {
					["PaddingLeft"] = UDim.new(0, v_u_2.MicroProfilerFormatting.RecentDumpPathPadding),
					["PaddingRight"] = UDim.new(0, v_u_2.MicroProfilerFormatting.RecentDumpPathPadding)
				})
			})
		}
		table.insert(v8, v10)
	end
	if #v8 == 0 then
		local v11 = {
			["NoDumpsLabel"] = v_u_4.createElement("TextLabel", {
				["Font"] = nil,
				["Text"] = "No recently captured MicroProfiler dumps.",
				["TextColor3"] = nil,
				["TextSize"] = nil,
				["TextXAlignment"] = nil,
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["Font"] = v_u_2.Font.MainWindow,
				["TextColor3"] = v_u_2.Color.Text,
				["TextSize"] = v_u_2.MicroProfilerFormatting.OptionTextSize,
				["TextXAlignment"] = Enum.TextXAlignment.Left,
				["Size"] = UDim2.fromScale(1, 1)
			}, {
				["UIPadding"] = v_u_4.createElement("UIPadding", {
					["PaddingLeft"] = UDim.new(0, v_u_2.MicroProfilerFormatting.OptionTextPadding)
				})
			})
		}
		table.insert(v8, v11)
	end
	return v_u_4.createElement(v_u_3, {
		["Title"] = "Recently captured MicroProfiler dumps",
		["LayoutOrder"] = nil,
		["Sections"] = nil,
		["LayoutOrder"] = p7.props.LayoutOrder,
		["Sections"] = {
			{
				["Name"] = "RecentlyCapturedDumps",
				["Rows"] = nil,
				["Rows"] = v8
			}
		}
	})
end
return v5.connect(function(p12, _) -- name: mapStateToProps
	return {
		["RecentDumpPaths"] = p12.MicroProfiler.recentDumpPaths
	}
end, nil)(v6)