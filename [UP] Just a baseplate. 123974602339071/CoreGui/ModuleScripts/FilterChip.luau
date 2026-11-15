-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.FilterChip
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v_u_3 = require(script.Parent.Parent.Constants)
local v_u_4 = {
	["on"] = {
		["background"] = Color3.fromRGB(14, 26, 14),
		["border"] = Color3.fromRGB(32, 64, 32),
		["text"] = Color3.fromRGB(130, 220, 130)
	},
	["off"] = {
		["background"] = Color3.fromRGB(18, 18, 18),
		["border"] = Color3.fromRGB(40, 40, 40),
		["text"] = Color3.fromRGB(150, 150, 150)
	}
}
local v_u_5 = UDim.new(0, 9)
local v_u_6 = UDim.new(0, 8)
return function(p7) -- name: FilterChip
	-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_3, (copy) v_u_5, (copy) v_u_6
	local v8 = p7.isOn and v_u_4.on or v_u_4.off
	local v9 = v_u_2.createElement
	local v10 = {
		["Text"] = p7.name,
		["AutomaticSize"] = Enum.AutomaticSize.X,
		["Size"] = UDim2.new(0, 0, 0, 18),
		["LayoutOrder"] = p7.layoutOrder,
		["Font"] = v_u_3.Font.MainWindow,
		["TextSize"] = v_u_3.DefaultFontSize.MainWindow + -3,
		["TextColor3"] = v8.text,
		["BackgroundColor3"] = v8.background,
		["AutoButtonColor"] = false,
		[v_u_2.Event.Activated] = p7.onActivated
	}
	local v11 = {}
	local v12 = {
		["CornerRadius"] = v_u_5
	}
	v11.Corner = v_u_2.createElement("UICorner", v12)
	v11.Stroke = v_u_2.createElement("UIStroke", {
		["Color"] = nil,
		["Thickness"] = 1,
		["Color"] = v8.border
	})
	local v13 = {
		["PaddingLeft"] = v_u_6,
		["PaddingRight"] = v_u_6
	}
	v11.Padding = v_u_2.createElement("UIPadding", v13)
	return v9("TextButton", v10, v11)
end