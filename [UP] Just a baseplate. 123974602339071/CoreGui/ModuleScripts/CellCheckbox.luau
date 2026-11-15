-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.CellCheckbox
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(script.Parent.Parent.Constants)
local v_u_4 = require(script.Parent.Checkbox)
local _ = v3.DefaultFontSize.MainWindow
local _ = v3.Color.Text
local _ = v3.Font.MainWindow
local _ = v3.Font.MainWindowBold
local v_u_5 = v3.UtilityBarFormatting.CheckboxHeight
local _ = v3.UtilityBarFormatting.CheckboxInnerPadding
return function(p6) -- name: CellCheckbox
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_5
	local v7 = p6.isSelected
	local v8 = p6.size
	local v9 = p6.pos
	local v10 = p6.LayoutOrder
	local v11 = v_u_2.createElement
	local v12 = {
		["Checkbox"] = v_u_2.createElement(v_u_4, {
			["Name"] = p6.name,
			["IsSelected"] = v7,
			["Size"] = UDim2.new(0, v_u_5, 0, v_u_5),
			["Position"] = UDim2.new(0, 0, 0.5, -v_u_5 / 2),
			["OnSelectedStateChanged"] = p6.OnCheckboxClicked
		})
	}
	return v11("Frame", {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = v8,
		["Position"] = v9,
		["LayoutOrder"] = v10
	}, v12)
end