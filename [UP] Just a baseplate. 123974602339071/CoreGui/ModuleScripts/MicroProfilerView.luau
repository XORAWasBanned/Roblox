-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.MicroProfiler.MicroProfilerView
local v1 = game:GetService("CorePackages")
local v_u_2 = require(script.Parent.Parent.Parent.Immutable)
local v_u_3 = require(v1.Packages.Roact)
local v_u_4 = require(script.Parent.LocalActionsView)
local v_u_5 = require(script.Parent.RecentlyCapturedDumpsView)
local v_u_6 = require(script.Parent.RecordAndDumpView)
local v_u_7 = v_u_3.Component:extend("Column")
local v8 = v_u_3.Component:extend("MicroProfilerView")
function v_u_7.render(p9) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_2
	local v10 = p9.props[v_u_3.Children]
	local v11 = v_u_3.createElement
	local v12 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = UDim2.new(0, 0, 1, 0),
		["LayoutOrder"] = p9.props.LayoutOrder
	}
	local v13 = v_u_2.JoinDictionaries
	local v14 = {
		["UIListLayout"] = v_u_3.createElement("UIListLayout", {
			["Padding"] = UDim.new(0, 12),
			["FillDirection"] = Enum.FillDirection.Vertical,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top
		})
	}
	return v11("Frame", v12, v13(v14, v10))
end
function v8.render(p15) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_4, (copy) v_u_6, (copy) v_u_5
	local v16 = v_u_3.createElement
	local v17 = {
		["Size"] = p15.props.Size,
		["BackgroundTransparency"] = p15.props.BackgroundTransparency,
		["LayoutOrder"] = p15.props.LayoutOrder
	}
	local v18 = {
		["UIListLayout"] = v_u_3.createElement("UIListLayout", {
			["Padding"] = UDim.new(0, 8),
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["HorizontalFlex"] = Enum.UIFlexAlignment.Fill,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top,
			["VerticalFlex"] = Enum.UIFlexAlignment.Fill
		}),
		["UIPadding"] = v_u_3.createElement("UIPadding", {
			["PaddingTop"] = UDim.new(0, 0),
			["PaddingBottom"] = UDim.new(0, 0),
			["PaddingLeft"] = UDim.new(0, 8),
			["PaddingRight"] = UDim.new(0, 8)
		}),
		["LeftColumn"] = v_u_3.createElement(v_u_7, {
			["LayoutOrder"] = 1
		}, {
			["LocalActionsView"] = v_u_3.createElement(v_u_4, {
				["LayoutOrder"] = 1
			}),
			["RecordAndDumpView"] = v_u_3.createElement(v_u_6, {
				["LayoutOrder"] = 2
			})
		}),
		["RightColumn"] = v_u_3.createElement(v_u_7, {
			["LayoutOrder"] = 2
		}, {
			["RecentlyCapturedDumpsView"] = v_u_3.createElement(v_u_5)
		})
	}
	return v16("Frame", v17, v18)
end
return v8