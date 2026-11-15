-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components._Checkbox
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("TextService")
local v_u_3 = require(v1.Packages.Roact)
local v_u_4 = require(script.Parent.Parent.Constants)
local v_u_5 = v_u_4.UtilityBarFormatting.CheckboxInnerPadding
local v6 = v_u_3.Component:extend("Checkbox")
function v6.render(p7) -- name: render
	-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_3, (copy) v_u_5
	local v8 = p7.props.checkboxHeight
	local v9 = p7.props.frameHeight
	local v10 = p7.props.layoutOrder
	local v_u_11 = p7.props.name
	local v12 = p7.props.font
	local v13 = p7.props.fontSize
	local v_u_14 = p7.props.isSelected
	local v15 = p7.props.selectedColor
	local v16 = p7.props.unselectedColor
	local v_u_17 = p7.props.onCheckboxClicked
	local v18, v19
	if v_u_14 then
		v18 = v_u_4.Image.Check
		v19 = 0
	else
		v15 = v16
		v19 = 1
		v18 = ""
	end
	local v20 = v_u_2:GetTextSize(v_u_11, v13, v12, Vector2.new(0, v9)).X
	local v21 = v_u_3.createElement
	local v22 = {
		["Size"] = UDim2.new(0, v8 + v20 + v_u_5 * 2, 0, v9),
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = v10,
		[v_u_3.Event.Activated] = function(_)
			-- upvalues: (copy) v_u_17, (copy) v_u_11, (copy) v_u_14
			v_u_17(v_u_11, not v_u_14)
		end
	}
	local v23 = {
		["Icon"] = v_u_3.createElement("ImageLabel", {
			["Image"] = nil,
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 0,
			["BorderColor3"] = nil,
			["BorderSizePixel"] = nil,
			["Image"] = v18,
			["Size"] = UDim2.new(0, v8, 0, v8),
			["Position"] = UDim2.new(0, 0, 0.5, -v8 / 2),
			["BackgroundColor3"] = v15,
			["BorderColor3"] = v_u_4.Color.Text,
			["BorderSizePixel"] = v19
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
			["Text"] = v_u_11,
			["TextColor3"] = v_u_4.Color.Text,
			["TextXAlignment"] = Enum.TextXAlignment.Left,
			["Font"] = v12,
			["TextSize"] = v13,
			["Size"] = UDim2.new(1, -v9, 1, 0),
			["Position"] = UDim2.new(0, v8 + v_u_5, 0, 0)
		})
	}
	return v21("ImageButton", v22, v23)
end
return v6