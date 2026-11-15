-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.MicroProfiler.MicroProfilerPanel
local v1 = game:GetService("CorePackages")
local v_u_2 = require(script.Parent.Parent.BoxButton)
local v_u_3 = require(script.Parent.Parent.Parent.Constants)
local v_u_4 = require(script.Parent.Parent.Parent.Immutable)
local v_u_5 = require(v1.Packages.Roact)
local v6 = v_u_5.Component:extend("MicroProfilerPanel")
function v6.createTabSelector(p_u_7, p8) -- name: createTabSelector
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_2
	local v9 = p8.Size
	local v10 = p8.Position or UDim2.new(0, 0, 0, 0)
	local v11 = p8.ButtonSize
	local v12 = p8.LayoutOrder
	local function v15(p13, p14) -- name: createHighlight
		-- upvalues: (copy) p_u_7, (ref) v_u_5, (ref) v_u_3
		if p_u_7.state.CurrentSection == p13 then
			return v_u_5.createElement("Frame", {
				["Size"] = nil,
				["Position"] = nil,
				["BorderSizePixel"] = 0,
				["BackgroundColor3"] = nil,
				["ZIndex"] = 10,
				["Size"] = UDim2.new(0, v_u_3.MicroProfilerFormatting.TabButtonWidth, 0, v_u_3.MicroProfilerFormatting.TabButtonPad),
				["Position"] = UDim2.new(0, v_u_3.MicroProfilerFormatting.TabButtonWidth * (p14 - 1), 0, v_u_3.MicroProfilerFormatting.TabsHeight - v_u_3.MicroProfilerFormatting.TabButtonPad),
				["BackgroundColor3"] = v_u_3.Color.HighlightBlue
			})
		else
			return nil
		end
	end
	local v16 = {}
	for v17, v_u_18 in p_u_7.props.Sections do
		v16[("Button_%*"):format((string.format("%02d", v17)))] = v_u_5.createElement(v_u_2, {
			["text"] = v_u_18.Name,
			["size"] = v11,
			["pos"] = UDim2.new(0, (v17 - 1) * v11.X.Offset, 0, 0),
			["onClicked"] = function() -- name: onClicked
				-- upvalues: (copy) p_u_7, (copy) v_u_18
				p_u_7:setState({
					["CurrentSection"] = v_u_18.Name
				})
			end
		})
		v16[("ButtonHighlight_%*"):format((string.format("%02d", v17)))] = v15(v_u_18.Name, v17)
	end
	return v_u_5.createElement("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = v9,
		["Position"] = v10,
		["LayoutOrder"] = v12
	}, v16)
end
function v6.init(p19) -- name: init
	local v20 = p19.props.Sections[1] ~= nil
	assert(v20, "MicroProfilerPanel requires at least one section.")
	p19.state = {
		["CurrentSection"] = p19.props.Sections[1].Name
	}
end
function v6.render(p21) -- name: render
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_4
	local v22 = p21.props.Sections[1] ~= nil
	assert(v22, "MicroProfilerPanel requires at least one section.")
	local v23 = p21.props.Sections
	local v24 = {}
	for _, v25 in v23 do
		v24[v25.Name] = {}
		for v26, v27 in v25.Rows do
			v24[v25.Name][("Row_%*"):format((string.format("%02d", v26)))] = v_u_5.createElement("Frame", {
				["Size"] = nil,
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = nil,
				["Size"] = UDim2.new(1, 0, 0, v_u_3.MicroProfilerFormatting.OptionRowHeight),
				["LayoutOrder"] = v26 * 2
			}, v27)
			if v26 >= #v25.Rows then
				continue
			end
			v24[v25.Name][("HorizontalLine_%*"):format((string.format("%02d", v26)))] = v_u_5.createElement("Frame", {
				["Size"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["LayoutOrder"] = nil,
				["Size"] = UDim2.new(1, 0, 0, 1),
				["BackgroundColor3"] = Color3.new(1, 1, 1),
				["LayoutOrder"] = v26 * 2 + 1
			})
		end
	end
	local v28 = v_u_5.createElement
	local v29 = "Frame"
	local v30 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["AutomaticSize"] = nil,
		["Size"] = UDim2.new(1, 0, 0, 0),
		["LayoutOrder"] = p21.props.LayoutOrder,
		["AutomaticSize"] = Enum.AutomaticSize.Y
	}
	local v31 = {
		["UIListLayout"] = v_u_5.createElement("UIListLayout", {
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top
		}),
		["Title"] = v_u_5.createElement("TextLabel", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["Text"] = nil,
			["TextXAlignment"] = nil,
			["Font"] = nil,
			["TextSize"] = nil,
			["TextColor3"] = nil,
			["LayoutOrder"] = 1,
			["Size"] = UDim2.new(1, 0, 0, v_u_3.MicroProfilerFormatting.PanelTitleHeight),
			["Text"] = p21.props.Title,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["Font"] = v_u_3.Font.MainWindowBold,
			["TextSize"] = v_u_3.MicroProfilerFormatting.TextSizePanelTitle,
			["TextColor3"] = Color3.new(1, 1, 1)
		})
	}
	local v32
	if #v23 > 1 then
		v32 = p21:createTabSelector({
			["Size"] = nil,
			["Position"] = nil,
			["LayoutOrder"] = 2,
			["ButtonSize"] = nil,
			["Size"] = UDim2.new(1, 0, 0, v_u_3.MicroProfilerFormatting.TabsHeight),
			["Position"] = UDim2.new(0, 0, 0, 0),
			["ButtonSize"] = UDim2.new(0, v_u_3.MicroProfilerFormatting.TabButtonWidth, 1, 0)
		})
	else
		v32 = nil
	end
	v31.Tabs = v32
	v31[("Table_%*"):format(p21.state.CurrentSection)] = v_u_5.createElement("Frame", {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 3,
		["AutomaticSize"] = nil,
		["Size"] = UDim2.new(1, 0, 0, 0),
		["AutomaticSize"] = Enum.AutomaticSize.Y
	}, v_u_4.JoinDictionaries({
		["UIListLayout"] = v_u_5.createElement("UIListLayout", {
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top
		}),
		["UIStroke"] = v_u_5.createElement("UIStroke", {
			["Color"] = nil,
			["Thickness"] = 1,
			["BorderStrokePosition"] = nil,
			["Color"] = Color3.new(1, 1, 1),
			["BorderStrokePosition"] = Enum.BorderStrokePosition.Inner
		})
	}, v24[p21.state.CurrentSection]))
	return v28(v29, v30, v31)
end
return v6