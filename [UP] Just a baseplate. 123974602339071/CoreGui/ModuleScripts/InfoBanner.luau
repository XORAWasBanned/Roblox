-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.InfoBanner
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v_u_3 = require(script.Parent.CellLabel)
local v_u_4 = require(script.Parent.Parent.Constants)
return function(p5) -- name: InfoBanner
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_3
	local v6 = v_u_2.createElement
	local v7 = {
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["BackgroundColor3"] = nil,
		["BorderSizePixel"] = 0,
		["Size"] = UDim2.new(1, 0, 0, 20),
		["LayoutOrder"] = p5.layoutOrder,
		["BackgroundColor3"] = v_u_4.Color.TextBoxGray
	}
	local v8 = {
		["Accent"] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["BackgroundColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(0, 2, 1, 0),
			["BackgroundColor3"] = v_u_4.Color.HighlightBlue
		}),
		["Label"] = v_u_2.createElement(v_u_3, {
			["text"] = p5.text,
			["size"] = UDim2.new(1, -10, 1, 0),
			["pos"] = UDim2.new(0, 10, 0, 0)
		})
	}
	return v6("Frame", v7, v8)
end