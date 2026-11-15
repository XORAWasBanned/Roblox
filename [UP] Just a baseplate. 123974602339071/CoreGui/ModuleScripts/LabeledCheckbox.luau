-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.LabeledCheckbox
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("TextService")
local v_u_3 = require(v1.Packages.Roact)
local v_u_4 = require(script.Parent.Parent.Constants)
local v_u_5 = require(script.Parent.Checkbox)
local v_u_6 = v_u_4.UtilityBarFormatting.CheckboxInnerPadding
local v7 = v_u_3.Component:extend("LabeledCheckbox")
function v7.render(p8) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_6, (copy) v_u_5, (copy) v_u_4
	local v9 = p8.props.checkboxHeight
	local v10 = p8.props.frameHeight
	local v11 = p8.props.layoutOrder
	local v12 = p8.props.name
	local v13 = p8.props.font
	local v14 = p8.props.fontSize
	local v15 = p8.props.isSelected
	local v16 = p8.props.selectedColor
	local v17 = p8.props.unselectedColor
	local v18 = p8.props.onCheckboxClicked
	local v19 = v_u_2:GetTextSize(v12, v14, v13, Vector2.new(0, v10)).X
	local v20 = v_u_3.createElement
	local v21 = {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = UDim2.new(0, v9 + v19 + v_u_6 * 2, 0, v10),
		["LayoutOrder"] = v11
	}
	local v22 = {
		["Checkbox"] = v_u_3.createElement(v_u_5, {
			["Name"] = v12,
			["IsSelected"] = v15,
			["SelectedColor"] = v16,
			["UnselectedColor"] = v17,
			["Size"] = UDim2.new(0, v9, 0, v9),
			["Position"] = UDim2.new(0, 0, 0.5, -v9 / 2),
			["OnSelectedStateChanged"] = v18
		}),
		["Text"] = v_u_3.createElement("TextLabel", {
			["Text"] = nil,
			["TextColor3"] = nil,
			["TextXAlignment"] = nil,
			["Font"] = nil,
			["TextSize"] = nil,
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["Text"] = v12,
			["TextColor3"] = v_u_4.Color.Text,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["Font"] = v13,
			["TextSize"] = v14,
			["Size"] = UDim2.new(1, -v10, 1, 0),
			["Position"] = UDim2.new(0, v9 + v_u_6, 0, 0)
		})
	}
	return v20("Frame", v21, v22)
end
return v7