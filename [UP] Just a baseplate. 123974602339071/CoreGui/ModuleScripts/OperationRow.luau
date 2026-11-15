-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.OperationRow
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v_u_3 = require(script.Parent.Parent.Constants)
local v_u_4 = UDim.new(0, 3)
local v_u_5 = {
	["snt"] = {
		["background"] = Color3.fromRGB(16, 32, 16),
		["text"] = Color3.fromRGB(120, 220, 110)
	},
	["srv"] = {
		["background"] = Color3.fromRGB(16, 30, 42),
		["text"] = Color3.fromRGB(110, 185, 240)
	},
	["op"] = {
		["background"] = Color3.fromRGB(28, 22, 44),
		["text"] = Color3.fromRGB(180, 150, 240)
	}
}
return function(p6) -- name: OperationRow
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_3, (copy) v_u_4
	local v7 = v_u_5[p6.tag]
	local v8 = v_u_2.createElement
	local v9 = {
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 1, 0),
		["LayoutOrder"] = p6.layoutOrder
	}
	local v10 = {
		["Layout"] = v_u_2.createElement("UIListLayout", {
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["VerticalAlignment"] = Enum.VerticalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["Padding"] = UDim.new(0, 6)
		}),
		["Timestamp"] = v_u_2.createElement("TextLabel", {
			["Text"] = nil,
			["Size"] = nil,
			["LayoutOrder"] = 1,
			["Font"] = nil,
			["TextSize"] = nil,
			["TextColor3"] = nil,
			["TextXAlignment"] = nil,
			["BackgroundTransparency"] = 1,
			["Text"] = p6.timestampText,
			["Size"] = UDim2.new(0, 66, 1, 0),
			["Font"] = v_u_3.Font.MainWindow,
			["TextSize"] = v_u_3.DefaultFontSize.MainWindow + -2,
			["TextColor3"] = v_u_3.Color.BorderGray,
			["TextXAlignment"] = Enum.TextXAlignment.Left
		})
	}
	local v11 = v_u_2.createElement
	local v12 = {
		["Size"] = nil,
		["LayoutOrder"] = 2,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.new(0, 30, 0, 16),
		["BackgroundColor3"] = v7.background
	}
	local v13 = {}
	local v14 = {
		["CornerRadius"] = v_u_4
	}
	v13.Corner = v_u_2.createElement("UICorner", v14)
	v13.Label = v_u_2.createElement("TextLabel", {
		["Text"] = nil,
		["Size"] = nil,
		["Font"] = nil,
		["TextSize"] = nil,
		["TextColor3"] = nil,
		["TextXAlignment"] = nil,
		["BackgroundTransparency"] = 1,
		["Text"] = p6.tag,
		["Size"] = UDim2.new(1, 0, 1, 0),
		["Font"] = v_u_3.Font.MainWindow,
		["TextSize"] = v_u_3.DefaultFontSize.MainWindow + -3,
		["TextColor3"] = v7.text,
		["TextXAlignment"] = Enum.TextXAlignment.Center
	})
	v10.Tag = v11("Frame", v12, v13)
	v10.Name = v_u_2.createElement("TextLabel", {
		["Text"] = nil,
		["Size"] = nil,
		["LayoutOrder"] = 3,
		["Font"] = nil,
		["TextSize"] = nil,
		["TextColor3"] = nil,
		["TextXAlignment"] = nil,
		["TextTruncate"] = nil,
		["BackgroundTransparency"] = 1,
		["Text"] = p6.name,
		["Size"] = UDim2.new(1, -108, 1, 0),
		["Font"] = v_u_3.Font.MainWindow,
		["TextSize"] = v_u_3.DefaultFontSize.MainWindow,
		["TextColor3"] = v_u_3.Color.Text,
		["TextXAlignment"] = Enum.TextXAlignment.Left,
		["TextTruncate"] = Enum.TextTruncate.AtEnd
	})
	return v8("Frame", v9, v10)
end