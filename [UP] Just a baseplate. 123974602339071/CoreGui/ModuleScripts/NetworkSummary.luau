-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.Network.NetworkSummary
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(script.Parent.Parent.Parent.Constants)
local v_u_4 = v3.NetworkFormatting.SummaryHeaderNames
local v5 = v3.NetworkFormatting.SummaryCellWidths
local v_u_6 = v3.NetworkFormatting.HeaderFrameHeight
local v_u_7 = v3.NetworkFormatting.EntryFrameHeight
local v_u_8 = v3.GeneralFormatting.LineWidth
local v_u_9 = v3.GeneralFormatting.LineColor
local v10 = v3.NetworkFormatting.CellPadding
local v_u_11 = v3.Color.Text
local v_u_12 = require(script.Parent.Parent.Parent.Components.CellLabel)
local v_u_13 = require(script.Parent.Parent.Parent.Components.HeaderButton)
local v14 = 0
for _, v15 in pairs(v5) do
	v14 = v14 + v15
end
local v16 = -v14
local v_u_17 = {}
local v_u_18 = {}
local v19 = {}
local v20 = UDim2.new
table.insert(v_u_17, v20(0, v10, 0, 0))
local v21 = UDim2.new
local v22 = -v14 - v10
table.insert(v_u_18, v21(1, v22, 0, v_u_6))
local v23 = UDim2.new
local v24 = -v14 - v10
table.insert(v19, v23(1, v24, 0, v_u_7))
for _, v25 in ipairs(v5) do
	local v26 = UDim2.new
	local v27 = v16 + v10
	table.insert(v_u_17, v26(1, v27, 0, 0))
	local v28 = UDim2.new
	local v29 = v25 - v10
	table.insert(v_u_18, v28(0, v29, 0, v_u_6))
	local v30 = UDim2.new
	local v31 = v25 - v10
	table.insert(v19, v30(0, v31, 0, v_u_7))
	v16 = v16 + v25
end
local v_u_32 = {}
for v33, v34 in ipairs(v_u_17) do
	v_u_32[v33] = UDim2.new(v34.X.Scale, v34.X.Offset - v10, v34.Y.Scale, v34.Y.Offset)
end
local v35 = v_u_2.Component:extend("NetworkSummary")
function v35.render(p36) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_8, (copy) v_u_9, (copy) v_u_32, (copy) v_u_6, (copy) v_u_4, (copy) v_u_13, (copy) v_u_18, (copy) v_u_17, (copy) v_u_12, (copy) v_u_7, (copy) v_u_11
	local v37 = p36.props.width
	local v38 = p36.props.httpSummaryTable or {}
	local v39 = p36.props.layoutOrder
	local v40 = {
		["UIListLayout"] = v_u_2.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		})
	}
	local v41 = {
		["UpperHorizontalLine"] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(1, 0, 0, v_u_8),
			["BackgroundColor3"] = v_u_9
		}),
		["LowerHorizontalLine"] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(1, 0, 0, v_u_8),
			["Position"] = UDim2.new(0, 0, 1, 0),
			["BackgroundColor3"] = v_u_9
		})
	}
	for v42 = 2, #v_u_32 do
		v41[string.format("VerticalLine_%d", v42)] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(0, v_u_8, 0, v_u_6),
			["Position"] = v_u_32[v42],
			["BackgroundColor3"] = v_u_9
		})
	end
	for v43, v44 in ipairs(v_u_4) do
		v41[v44] = v_u_2.createElement(v_u_13, {
			["text"] = v44,
			["size"] = v_u_18[v43],
			["pos"] = v_u_17[v43]
		})
	end
	v40.Header = v_u_2.createElement("Frame", {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 1,
		["Size"] = UDim2.new(0, v37, 0, v_u_6)
	}, v41)
	local v45 = 0
	for _, v46 in pairs(v38) do
		v45 = v45 + 1
		local v47 = {
			["RequestType"] = v_u_2.createElement(v_u_12, {
				["text"] = v46.RequestType,
				["size"] = v_u_18[1],
				["pos"] = v_u_17[1]
			}),
			["RequestCount"] = v_u_2.createElement(v_u_12, {
				["text"] = v46.RequestCount,
				["size"] = v_u_18[2],
				["pos"] = v_u_17[2]
			}),
			["FailedCount"] = v_u_2.createElement(v_u_12, {
				["text"] = v46.FailedCount,
				["size"] = v_u_18[3],
				["pos"] = v_u_17[3]
			}),
			["AverageTime"] = v_u_2.createElement(v_u_12, {
				["text"] = string.format("%.3f", v46.AverageTime),
				["size"] = v_u_18[4],
				["pos"] = v_u_17[4]
			}),
			["MinTime"] = v_u_2.createElement(v_u_12, {
				["text"] = string.format("%.3f", v46.MinTime),
				["size"] = v_u_18[5],
				["pos"] = v_u_17[5]
			}),
			["MaxTime"] = v_u_2.createElement(v_u_12, {
				["text"] = string.format("%.3f", v46.MaxTime),
				["size"] = v_u_18[6],
				["pos"] = v_u_17[6]
			}),
			["LowerHorizontalLine"] = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["Position"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = UDim2.new(1, 0, 0, v_u_8),
				["Position"] = UDim2.new(0, 0, 1, 0),
				["BackgroundColor3"] = v_u_9
			})
		}
		for v48 = 2, #v_u_32 do
			v47[string.format("VerticalLine_%d", v48)] = v_u_2.createElement("Frame", {
				["Size"] = nil,
				["Position"] = nil,
				["BackgroundColor3"] = nil,
				["BorderSizePixel"] = 0,
				["Size"] = UDim2.new(0, v_u_8, 1, 0),
				["Position"] = v_u_32[v48],
				["BackgroundColor3"] = v_u_9
			})
		end
		v40[v46.RequestType] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = nil,
			["Size"] = UDim2.new(0, v37, 0, v_u_7),
			["LayoutOrder"] = v45 + 1
		}, v47)
	end
	if v45 == 0 then
		v40.Padding = v_u_2.createElement("TextLabel", {
			["Size"] = nil,
			["Text"] = "No Summary Data Found",
			["TextColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["LayoutOrder"] = 2,
			["Size"] = UDim2.new(0, v37, 0, v_u_7),
			["TextColor3"] = v_u_11
		})
		v45 = 1
	end
	local v49 = v45 * v_u_7 + v_u_6
	return v_u_2.createElement("ScrollingFrame", {
		["Size"] = nil,
		["ScrollingEnabled"] = false,
		["ScrollBarThickness"] = 0,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = UDim2.new(1, 0, 0, v49),
		["LayoutOrder"] = v39
	}, v40)
end
return v35