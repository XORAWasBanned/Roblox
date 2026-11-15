-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.Network.NetworkChartEntry
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(script.Parent.Parent.Parent.Constants)
local v_u_4 = v3.NetworkFormatting.EntryFrameHeight
local v_u_5 = v3.GeneralFormatting.LineWidth
local v_u_6 = v3.GeneralFormatting.LineColor
local v_u_7 = v3.NetworkFormatting.ResponseStrHeight
local v8 = v3.NetworkFormatting.ResponseWidthRatio
local v_u_9 = (1 - v8) / 2
local v_u_10 = (1 - v8) / 4
local v11 = script.Parent.Parent.Parent.Components
local v_u_12 = require(v11.CellLabel)
local v_u_13 = require(v11.HeaderButton)
local v_u_14 = require(v11.BannerButton)
return function(p15)
	-- upvalues: (copy) v_u_2, (copy) v_u_12, (copy) v_u_6, (copy) v_u_5, (copy) v_u_4, (copy) v_u_14, (copy) v_u_9, (copy) v_u_13, (copy) v_u_7, (copy) v_u_10
	local v16 = p15.size
	local v17 = p15.entry
	local v18 = p15.entryCellSize
	local v19 = p15.cellOffset
	local v20 = p15.verticalOffsets
	local v21 = p15.layoutOrder
	local v22 = p15.showResponse
	local v23 = p15.responseBodyHeight
	local v24 = p15.onButtonPress
	local v25 = {
		["Num"] = v_u_2.createElement(v_u_12, {
			["text"] = v17.Num,
			["size"] = v18[1],
			["pos"] = v19[1]
		}),
		["Method"] = v_u_2.createElement(v_u_12, {
			["text"] = v17.Method,
			["size"] = v18[2],
			["pos"] = v19[2]
		}),
		["Status"] = v_u_2.createElement(v_u_12, {
			["text"] = v17.Status,
			["size"] = v18[3],
			["pos"] = v19[3]
		}),
		["Time"] = v_u_2.createElement(v_u_12, {
			["text"] = string.format("%.3f", v17.Time),
			["size"] = v18[4],
			["pos"] = v19[4]
		}),
		["RequestType"] = v_u_2.createElement(v_u_12, {
			["text"] = v17.RequestType,
			["size"] = v18[5],
			["pos"] = v19[5]
		}),
		["Url"] = v_u_2.createElement(v_u_12, {
			["text"] = v17.Url,
			["size"] = v18[6],
			["pos"] = v19[6]
		}),
		["LowerHorizontalLine"] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(1, 0, 0, 1),
			["BackgroundColor3"] = v_u_6
		})
	}
	for v26 = 2, #v20 do
		v25[string.format("VerticalLine_%d", v26)] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(0, v_u_5, 0, v_u_4),
			["Position"] = v20[v26],
			["BackgroundColor3"] = v_u_6
		})
	end
	local v27 = v_u_2.createElement
	local v28 = "Frame"
	local v29 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = v16,
		["LayoutOrder"] = v21
	}
	local v30 = {
		["Button"] = v_u_2.createElement(v_u_14, {
			["size"] = UDim2.new(1, 0, 0, v_u_4),
			["pos"] = UDim2.new(),
			["isExpanded"] = v22,
			["onButtonPress"] = v24
		}, v25)
	}
	if v22 then
		local v31 = v_u_2.createElement
		local v32 = {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 0, v23),
			["Position"] = UDim2.new(v_u_9, 0, 0, v_u_4)
		}
		local v33 = {
			["Text"] = v_u_2.createElement(v_u_13, {
				["text"] = "Response Body:",
				["size"] = nil,
				["pos"] = nil,
				["size"] = UDim2.new(1, 0, 0, v_u_7),
				["pos"] = UDim2.new(-v_u_10, 0, 0, 0)
			}),
			["ResponseBody"] = v_u_2.createElement(v_u_12, {
				["text"] = v17.Response,
				["size"] = UDim2.new(0.8, 0, 1, -v_u_7),
				["pos"] = UDim2.new(0, 0, 0, v_u_7)
			})
		}
		v22 = v31("Frame", v32, v33)
	end
	v30.Response = v22
	return v27(v28, v29, v30)
end