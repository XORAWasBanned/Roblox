-- Path: CoreGui.RobloxGui.Modules.FTUX.Components.Slideshow.Stepper
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v_u_3 = require(v1.Packages.LuauPolyfill)
return function(p4) -- name: Stepper
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v_u_5 = p4.numberOfSteps
	local v6 = p4.layoutOrder
	local v_u_7 = p4.numberActivated
	local v8 = {}
	for v9 = 1, v_u_5 do
		v8[v9] = v9
	end
	return v_u_2.createElement("Frame", {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Position"] = nil,
		["LayoutOrder"] = nil,
		["Size"] = UDim2.new(0.9, 0, 0.12, 0),
		["Position"] = UDim2.new(0, 0, 0, 0),
		["LayoutOrder"] = v6
	}, v_u_2.createElement("UIListLayout", {
		["Padding"] = UDim.new(0, 10),
		["FillDirection"] = Enum.FillDirection.Horizontal,
		["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
		["VerticalAlignment"] = Enum.VerticalAlignment.Center,
		["SortOrder"] = Enum.SortOrder.LayoutOrder
	}), (v_u_3.Array.map(v8, function(_, p10)
		-- upvalues: (ref) v_u_2, (copy) v_u_7, (copy) v_u_5
		return v_u_2.createElement("Frame", {
			["LayoutOrder"] = p10,
			["BackgroundTransparency"] = p10 <= v_u_7 and 0 or 0.7,
			["Size"] = UDim2.new(1 / v_u_5, 0, 0.5, 0),
			["Position"] = UDim2.new(0, 0, 0, 0),
			["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		}, { v_u_2.createElement("UICorner", {
				["CornerRadius"] = UDim.new(0.5, 0)
			}) })
	end)))
end