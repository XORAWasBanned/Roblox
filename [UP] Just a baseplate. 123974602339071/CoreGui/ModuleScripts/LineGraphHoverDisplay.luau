-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.LineGraphHoverDisplay
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(script.Parent.Parent.Constants)
local v_u_4 = v3.Color.HoverGreen
local v_u_5 = v3.GeneralFormatting.LineWidth
local v_u_6 = v3.Graph.TextPadding
local v_u_7 = v3.Graph.InnerPaddingY
return function(p8)
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_4, (copy) v_u_6, (copy) v_u_7
	local v9 = p8.hoverLineX
	local v10 = p8.hoverLineY
	local v11 = p8.hoverValX
	local v12 = p8.hoverValY
	local v13 = p8.stringFormatX
	local v14 = p8.stringFormatY
	local v15 = v_u_2.createElement
	local v16 = "Frame"
	local v17 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 1, 0)
	}
	local v18 = {
		["hoverLine"] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(0, v_u_5, 1, 0),
			["Position"] = UDim2.new(0, v9, 0, 0),
			["BackgroundColor3"] = v_u_4
		}),
		["HoverHorizontal"] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(0, v9 + v_u_6, 0, v_u_5),
			["Position"] = UDim2.new(0, -v_u_6, 1 - v_u_7, -v10),
			["BackgroundColor3"] = v_u_4
		})
	}
	local v19 = v_u_2.createElement
	local v20 = "TextLabel"
	local v21 = {
		["Text"] = nil,
		["TextColor3"] = nil,
		["TextXAlignment"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 1
	}
	if v14 then
		v12 = v14(v12) or v12
	end
	v21.Text = v12
	v21.TextColor3 = v_u_4
	v21.TextXAlignment = Enum.TextXAlignment.Right
	v21.Position = UDim2.new(0, -v_u_6 - 2, 1 - v_u_7, -v10)
	v18.HoverTextY = v19(v20, v21)
	local v22 = v_u_2.createElement
	local v23 = "TextLabel"
	local v24 = {
		["Text"] = nil,
		["TextColor3"] = nil,
		["TextXAlignment"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 1
	}
	if v13 then
		v11 = v13(v11) or v11
	end
	v24.Text = v11
	v24.TextColor3 = v_u_4
	v24.TextXAlignment = Enum.TextXAlignment.Center
	v24.Position = UDim2.new(0, v9, 1, v_u_6)
	v18.HoverTextX = v22(v23, v24)
	return v15(v16, v17, v18)
end