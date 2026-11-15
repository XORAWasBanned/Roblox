-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.ScriptProfiler.ProfilerFunctionsView
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
require(script.Parent.ProfilerDataFormatV2)
local v3 = require(script.Parent.ProfilerUtil)
local v_u_4 = v3.getDurations
local v_u_5 = v3.formatSessionLength
local v_u_6 = v3.getPluginFlag
local v7 = script.Parent.Parent.Parent.Components
local v_u_8 = require(v7.HeaderButton)
local v_u_9 = require(script.Parent.ProfilerFunctionViewEntry)
local v_u_10 = require(script.Parent.Parent.Parent.Constants)
local v_u_11 = v_u_10.GeneralFormatting.LineWidth
local v_u_12 = v_u_10.GeneralFormatting.LineColor
local v_u_13 = v_u_10.GeneralFormatting.HeaderFrameHeight
local _ = v_u_10.GeneralFormatting.EntryFrameHeight
local _ = v_u_10.GeneralFormatting.NoResultSearchStr
local v_u_14 = v_u_10.ScriptProfilerFormatting.HeaderNames
local v_u_15 = v_u_10.ScriptProfilerFormatting.ValueCellWidth
local v_u_16 = v_u_10.ScriptProfilerFormatting.CellPadding
local v_u_17 = v_u_10.ScriptProfilerFormatting.ValuePadding
local v18 = v_u_2.PureComponent:extend("ProfilerView")
function v18.renderChildren(p19) -- name: renderChildren
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_2, (copy) v_u_9
	local v20 = p19.props.data
	local v21 = v20.Version == 2
	assert(v21)
	local v22 = v_u_4(v20, 0)
	local v23 = p19.props.searchFilter
	local v24 = p19.props.showPlugins
	local v25 = p19.props.showGC
	local v26 = p19.props.gcFunctionOffsets
	local v27 = (p19.props.average <= 0 or not p19.props.sessionLength) and 1 or p19.props.sessionLength / 1000 / p19.props.average
	local v28 = {}
	for v29, v30 in ipairs(v20.Functions) do
		if #v23 > 0 and not v23[v29] or not v24 and v_u_6(v20, v30) then
			continue
		end
		local v31 = v_u_2.createElement
		local v32 = v_u_9
		local v33 = {
			["layoutOrder"] = (v22 - v30.TotalDuration) * 1000000,
			["data"] = v20,
			["functionId"] = v29,
			["nodeName"] = v30.Name,
			["average"] = v27
		}
		local v34
		if v25 then
			v34 = nil
		else
			v34 = v26[v29]
		end
		v33.gcOffset = v34
		local v35
		if p19.props.showAsPercentages then
			v35 = v22 / 100
		else
			v35 = nil
		end
		v33.percentageRatio = v35
		v28[v29] = v31(v32, v33)
	end
	return v28
end
function v18.render(p36) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_10, (copy) v_u_5, (copy) v_u_13, (copy) v_u_8, (copy) v_u_15, (copy) v_u_17, (copy) v_u_16, (copy) v_u_12, (copy) v_u_14, (copy) v_u_11
	local v37 = p36.props.layoutOrder
	local v38 = p36.props.size
	local v39 = nil
	if p36.props.profiling and not p36.props.data then
		v39 = v_u_2.createElement("TextLabel", {
			["Size"] = nil,
			["Position"] = nil,
			["Text"] = "Press Stop to Finish Profiling",
			["TextColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = nil,
			["Size"] = UDim2.new(1, 0, 1, 0),
			["Position"] = UDim2.new(0, 0, 0, 0),
			["TextColor3"] = v_u_10.Color.Text,
			["LayoutOrder"] = v37
		})
	elseif not p36.props.data then
		v39 = v_u_2.createElement("TextLabel", {
			["Size"] = nil,
			["Position"] = nil,
			["Text"] = "Start Profiling to View Data",
			["TextColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = nil,
			["Size"] = UDim2.new(1, 0, 1, 0),
			["Position"] = UDim2.new(0, 0, 0, 0),
			["TextColor3"] = v_u_10.Color.Text,
			["LayoutOrder"] = v37
		})
	end
	local v40 = v_u_5(p36.props.sessionLength)
	if v40 then
		v40 = "Session Duration: " .. v40
	end
	local v41 = v_u_2.createElement
	local v42 = {
		["SessionInfo"] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 0, v_u_13)
		}, {
			["Name"] = v_u_2.createElement(v_u_8, {
				["text"] = v40 or "Session Info",
				["size"] = UDim2.new(1 - v_u_15 * 2, -v_u_17 - v_u_16, 0, v_u_13),
				["pos"] = UDim2.new(0, v_u_16, 0, 0)
			}),
			["TopHorizontal"] = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = UDim2.new(1, 0, 0, 1),
				["BackgroundColor3"] = v_u_12
			})
		}),
		["Header"] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Position"] = nil,
			["Size"] = UDim2.new(1, 0, 0, v_u_13),
			["Position"] = UDim2.new(0, 0, 0, v_u_13)
		}, {
			["Name"] = v_u_2.createElement(v_u_8, {
				["text"] = v_u_14[1],
				["size"] = UDim2.new(1 - v_u_15 * 2, -v_u_17 - v_u_16, 0, v_u_13),
				["pos"] = UDim2.new(0, v_u_16, 0, 0),
				["sortfunction"] = p36.onSortChanged
			}),
			["Inclusive"] = v_u_2.createElement(v_u_8, {
				["text"] = v_u_14[2],
				["size"] = UDim2.new(v_u_15, -v_u_16, 0, v_u_13),
				["pos"] = UDim2.new(1 - v_u_15 * 1, v_u_17, 0, 0),
				["sortfunction"] = p36.onSortChanged
			}),
			["TopHorizontal"] = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = UDim2.new(1, 0, 0, 1),
				["BackgroundColor3"] = v_u_12
			}),
			["LowerHorizontal"] = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["Position"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = UDim2.new(1, 0, 0, v_u_11),
				["Position"] = UDim2.new(0, 0, 1, 0),
				["BackgroundColor3"] = v_u_12
			}),
			["Vertical1"] = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["Position"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = UDim2.new(0, v_u_11, 1, 0),
				["Position"] = UDim2.new(1 - v_u_15, 0, 0, 0),
				["BackgroundColor3"] = v_u_12
			})
		}),
		["Entries"] = v_u_2.createElement("ScrollingFrame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["VerticalScrollBarInset"] = nil,
			["ScrollBarThickness"] = 5,
			["CanvasSize"] = nil,
			["AutomaticCanvasSize"] = nil,
			["Size"] = UDim2.new(1, 0, 1, -v_u_13 * 2),
			["Position"] = UDim2.new(0, 0, 0, v_u_13 * 2),
			["VerticalScrollBarInset"] = Enum.ScrollBarInset.None,
			["CanvasSize"] = UDim2.fromScale(0, 0),
			["AutomaticCanvasSize"] = Enum.AutomaticSize.Y
		}, {
			["Layout"] = v_u_2.createElement("UIListLayout", {
				["FillDirection"] = Enum.FillDirection.Vertical,
				["SortOrder"] = Enum.SortOrder.LayoutOrder
			}),
			["Children"] = v39 or v_u_2.createFragment(p36:renderChildren())
		})
	}
	return v41("Frame", {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = v38,
		["LayoutOrder"] = v37
	}, v42)
end
return v18